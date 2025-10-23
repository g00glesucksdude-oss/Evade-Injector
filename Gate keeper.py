import time
import random

# 🎭 Emoji digit set mapped to 0–9
CJK_DIGITS = ['(', ')', '^', '$', '%', '@', '!', '#', '&', '*']
CJK_MAP = {str(i): CJK_DIGITS[i] for i in range(10)}

def letter_to_number(letter):
    return f"{ord(letter.upper()) - 64:02d}"

def caesar_shift_digits(digits, shift):
    return ''.join(str((int(d) + shift) % 10) for d in digits)

def digits_to_cjk(digits):
    return ''.join(CJK_MAP[d] for d in digits)

def encode_number(num, shift):
    digits = str(num)
    shifted = caesar_shift_digits(digits, shift)
    return digits_to_cjk(shifted)

def encode_keyword(keyword, shift):
    numeric = ''.join(letter_to_number(c) for c in keyword if c.isalpha())
    shifted = caesar_shift_digits(numeric, shift)
    return digits_to_cjk(shifted)

def generate_key(keyword, redeem_duration_seconds, expire_after_seconds):
    shift = random.randint(1, 9)
    now = int(time.time())

    valid_from = now
    valid_until = now + redeem_duration_seconds
    expire_at  = now + expire_after_seconds
    nonce = random.randint(100000, 999999)

    valid_from_cjk = encode_number(valid_from, shift)
    valid_until_cjk = encode_number(valid_until, shift)
    expire_at_cjk = encode_number(expire_at, shift)
    nonce_cjk = encode_number(nonce, shift)
    keyword_cjk = encode_keyword(keyword, shift)

    return f"{valid_from_cjk}_{valid_until_cjk}_{expire_at_cjk}_{nonce_cjk}_{keyword_cjk}:{shift}"

def main():
    print("🔐 Gatekeeper Key Generator")
    while True:
        keyword = input("🔑 Keyword for script routing (e.g., evadeavoidanceofnx): ").strip()
        try:
            redeem_duration = int(input("⏳ How many seconds the key is redeemable for: ").strip())
            expire_after    = int(input("💣 How many seconds until shutdown flag triggers: ").strip())
        except ValueError:
            print("❌ Invalid input. Use integers only.")
            continue

        key = generate_key(keyword, redeem_duration, expire_after)
        print(f"\n✅ Generated Key:\n{key}\n")

        again = input("Generate another? (y/n): ").strip().lower()
        if again != 'y':
            break

if __name__ == "__main__":
    main()
