import os
import re

# 🧨 Ask for sabotage name and prefix it
user_input = input("Enter sabotage name (e.g. errorcode404): ").strip()
kill_switch_name = "shutdownflag_" + user_input

def inject_runtime_brake(lines: list[str], kill_switch_name: str) -> list[str]:
    brake_line = f"if getgenv()['{kill_switch_name}'] then return end\n"
    output = []
    skip_next = False

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Detect loop/function/listener start
        if re.match(r"^(while|for|repeat|function\s|\w+\.Connect|\w+:Connect|coroutine\.create|spawn|task\.spawn)", stripped):
            output.append(line)
            indent = line[:len(line) - len(line.lstrip())]
            output.append(indent + brake_line)
            skip_next = True
        elif skip_next and stripped == "":
            output.append(line)
            skip_next = False
        else:
            output.append(line)

    return output

def process_file(file_path: str, kill_switch_name: str):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            lines = f.readlines()

        sabotaged_lines = inject_runtime_brake(lines, kill_switch_name)

        with open(file_path, "w", encoding="utf-8") as f:
            f.writelines(sabotaged_lines)

        print(f"✅ Injected runtime sabotage using flag: {kill_switch_name}")
        print(f"📄 File updated: {file_path}")
    except Exception as e:
        print(f"⚠️ Error: {e}")

# 🔍 Find most recent Lua file
folder = os.getcwd()
lua_files = [f for f in os.listdir(folder) if f.endswith(".lua")]

if not lua_files:
    print("❌ No Lua files found in this folder.")
else:
    latest = max(lua_files, key=lambda f: os.path.getmtime(os.path.join(folder, f)))
    process_file(os.path.join(folder, latest), kill_switch_name)
