import hashlib
import random
import time

# Stylish alphabet with lots of symbols
ALPHABET = "!@#$%^&*()_+=-[]{}<>?/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

# Permanent digit→symbol mapping
DIGITS = "0123456789"
SYMS   = "!@#$%^&*()"
D2S = {d: s for d, s in zip(DIGITS, SYMS)}
S2D = {s: d for d, s in zip(DIGITS, SYMS)}

def symbolize_digits(text: str) -> str:
    """Always convert digits to symbols."""
    return "".join(D2S.get(ch, ch) for ch in text)

def desymbolize_digits(text: str) -> str:
    """Always convert symbols back to digits."""
    return "".join(S2D.get(ch, ch) for ch in text)

def build_map(passphrase: str):
    """Build deterministic cluster map from passphrase."""
    seed = int.from_bytes(hashlib.sha256(passphrase.encode()).digest()[:8], "big")
    rng = random.Random(seed)

    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*() "
    mapping = {}
    for ch in chars:
        clusters = []
        for _ in range(3):  # 3 stylish clusters per character
            cluster_len = rng.randint(5, 7)
            cluster = ''.join(rng.choice(ALPHABET) for _ in range(cluster_len))
            clusters.append(cluster)
        mapping[ch] = clusters
    return mapping

def reverse_map(mapping):
    rev = {}
    for ch, clusters in mapping.items():
        for c in clusters:
            rev[c] = ch
    return rev

def checksum(payload: str) -> str:
    s = sum(ALPHABET.index(c) for c in payload if c in ALPHABET)
    return str(s % 10)

def encode_message(message: str, passphrase: str) -> str:
    # Always symbolize digits before encoding
    message = symbolize_digits(message)

    mapping = build_map(passphrase)
    clusters = []
    for ch in message:
        if ch not in mapping:
            raise ValueError(f"Unsupported character: {ch}")
        clusters.append(random.choice(mapping[ch]))
    body = "_".join(clusters)
    nonce = f"{int(time.time())}-{random.randrange(10**6):06d}"
    return f"{nonce}_{body}:{checksum(body)}"

def decode_message(token: str, passphrase: str):
    try:
        head, chk = token.rsplit(":", 1)
        nonce, body = head.split("_", 1)
    except ValueError:
        return False, "Format error"

    if chk != checksum(body):
        return False, "Checksum mismatch"

    mapping = build_map(passphrase)
    rev = reverse_map(mapping)

    clusters = body.split("_")
    decoded_chars = []
    for c in clusters:
        if c not in rev:
            return False, f"Unknown cluster: {c}"
        decoded_chars.append(rev[c])

    plaintext = "".join(decoded_chars)
    # Always desymbolize back to digits
    plaintext = desymbolize_digits(plaintext)
    return True, plaintext

# --- Interactive menu ---
def menu():
    print("Stylish Cluster Obfuscation (permanent digit→symbol mapping)")
    passphrase = None

    while True:
        print("\nOptions:")
        print("1) Set/Change passphrase")
        print("2) Encode message (stylish)")
        print("3) Decode message (stylish)")
        print("4) Exit")
        choice = input("Choose (1/2/3/4): ").strip()

        if choice == "1":
            passphrase = input("Enter shared passphrase: ").strip()
            print("Passphrase set.")
        elif choice == "2":
            if not passphrase:
                print("Set a passphrase first (option 1).")
                continue
            msg = input("Enter plaintext: ")
            token = encode_message(msg, passphrase)
            print(f"\nStylish Obfuscated:\n{token}")
        elif choice == "3":
            if not passphrase:
                print("Set a passphrase first (option 1).")
                continue
            token = input("Paste obfuscated message: ").strip()
            ok, out = decode_message(token, passphrase)
            if ok:
                print(f"\nDecoded:\n{out}")
            else:
                print(f"\nDecryption unsuccessful: {out}")
        elif choice == "4":
            print("Goodbye.")
            break
        else:
            print("Invalid choice.")

if __name__ == "__main__":
    menu()
