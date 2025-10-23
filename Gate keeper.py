# Gatekeeper Key Generator with Random Caesar, Nonce, Redeem Delay, Validity Duration
import random

# CJK digit set mapped to 0–9
# ['龉', '齾', '鱻', '𪚥', '𩸽', '𪜀', '𪚧', '𪚿', '𪛇', '𪛉']
CJK_DIGITS = ['(',')','^','$','%','@','!','#','&','*']
CJK_MAP = {str(i): CJK_DIGITS[i] for i in range(10)}

def letter_to_number(letter):
    val = ord(letter.upper()) - 64
    return f"{val:02d}"

def caesar_shift_digits(digits, shift):
    shifted = [(int(d) + shift) % 10 for d in digits]
    return ''.join(str(d) for d in shifted)

def digits_to_cjk(digits):
    return ''.join(CJK_MAP[d] for d in digits)

def generate_key(keyword, redeem_delay, validity_duration):
    # Random Caesar shift
    shift = random.randint(1, 9)

    # Keyword → numeric → Caesar → CJK
    numeric = ''.join(letter_to_number(c) for c in keyword if c.isalpha())
    shifted_keyword = caesar_shift_digits(numeric, shift)
    symbol_keyword = digits_to_cjk(shifted_keyword)

    # Redeem delay and validity duration
    redeem_digits = caesar_shift_digits(str(redeem_delay), shift)
    validity_digits = caesar_shift_digits(str(validity_duration), shift)

    redeem_cjk = digits_to_cjk(redeem_digits)
    validity_cjk = digits_to_cjk(validity_digits)

    # Nonce: random 3-digit number
    nonce_raw = str(random.randint(100, 999))
    nonce_digits = caesar_shift_digits(nonce_raw, shift)
    nonce_cjk = digits_to_cjk(nonce_digits)

    # Final format
    return f"{redeem_cjk}_{validity_cjk}_{nonce_cjk}_{symbol_keyword}:{shift}"

def main():
    print("🔐 Gatekeeper Key Generator")
    while True:
        keyword = input("Enter keyword (e.g., gatekeeper): ").strip()
        try:
            redeem_delay = int(input("Enter redeem delay in seconds (e.g., 10): ").strip())
            validity_duration = int(input("Enter validity duration in seconds (e.g., 30): ").strip())
        except ValueError:
            print("❌ All inputs must be integers.")
            continue

        key = generate_key(keyword, redeem_delay, validity_duration)
        print(f"\n✅ Generated Key: {key}\n")

        again = input("Generate another? (y/n): ").strip().lower()
        if again != 'y':
            break

if __name__ == "__main__":
    main()
