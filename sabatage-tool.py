#AI version https://copilot.microsoft.com/shares/jqksgS6GWVqfdPwQXriMV
import os
import re

user_input = input("Enter sabotage name (e.g. errorcode404): ").strip()
kill_switch_name = "shutdownflag_" + user_input

def generate_self_destruct_block(flag: str) -> str:
    return f"""-- 🔥 Self-destruct block
if getgenv()['{flag}'] then
    local _ = loadstring("💥")() -- runtime syntax bomb
    error("Gatekeeper triggered: module self-destructed")
end\n"""

def generate_gui_sabotage_block(flag: str) -> str:
    return f"""-- 🎭 GUI sabotage block
if getgenv()['{flag}'] then
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") then
            v.Text = "🔥 EXPIRED 🔥"
            v.TextColor3 = Color3.fromRGB(255, 0, 0)
            v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
            v.Image = ""
        elseif v:IsA("Frame") or v:IsA("ScrollingFrame") then
            v.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end
    end
    error("Gatekeeper: GUI sabotage triggered")
end\n"""

def generate_safe_wrappers_block(flag: str) -> str:
    # safe wrappers: block runtime code execution when kill-switch active, otherwise forward to originals
    return f"""-- 🛡️ Safe runtime-eval wrappers
local function __gsafe_loadstring(s)
    if getgenv()['{flag}'] then error('Gatekeeper: runtime-eval blocked') end
    return loadstring(s)
end

local function __gsafe_load(f)
    if getgenv()['{flag}'] then error('Gatekeeper: runtime-eval blocked') end
    return load(f)
end

local function __gsafe_loadfile(path)
    if getgenv()['{flag}'] then error('Gatekeeper: runtime-eval blocked') end
    return loadfile(path)
end

local function __gsafe_require(mod)
    if getgenv()['{flag}'] then error('Gatekeeper: require blocked') end
    return require(mod)
end\n"""

def inject_runtime_brake_and_rewrites(lines: list[str], kill_switch_name: str) -> list[str]:
    brake_line = f"if getgenv()['{kill_switch_name}'] then error('Gatekeeper: sabotage triggered') end\n"
    output = []
    skip_next = False

    sabotage_patterns = [
        r"^\s*(while|for|repeat|function\s|do|if|elseif|else|coroutine\.create|spawn|task\.spawn)",
        r"^\s*\w+\.Connect\(function",  # inline anonymous
        r"^\s*\w+:Connect\(function",
        r"^\s*UserInputService\.(InputBegan|InputEnded|InputChanged)",
        r"^\s*(MouseButton1Click|Activated)",
        r"^\s*for\s+.+in\s+pairs",
        r"^\s*for\s+.+in\s+ipairs",
        r"^\s*__index\s*=",
        r"^\s*__newindex\s*=",
        # GUI property writes, remote calls, runservice and scheduler triggers
        r":\s*(FireServer|FireClient|Fire|FireAllClients|InvokeServer|InvokeClient)\s*\(",
        r"RunService:(BindToRenderStep|BindToRenderStep|UnbindFromRenderStep|Heartbeat|Stepped|RenderStepped)",
        r"\bBindToRenderStep\b",
        r"\bHeartbeat\b",
        r"\bStepped\b",
        r"\bRenderStepped\b",
        r"\bDelay\s*\(",
        r"\bspawn\s*\(",
        r"\btick\b",
        r"\bwait\s*\(",
    ]

    combined_pattern = re.compile("|".join(sabotage_patterns))

    # detection patterns for runtime-eval calls to rewrite
    loadstring_pattern = re.compile(r"\bloadstring\s*\(")
    load_pattern = re.compile(r"\bload\s*\(")
    loadfile_pattern = re.compile(r"\bloadfile\s*\(")
    require_pattern = re.compile(r"\brequire\s*\(")

    for i, line in enumerate(lines):
        if "-- 🔒 sabotage injected" in line:
            print("🔒 Already sabotaged. Skipping injection.")
            return lines

    for i, line in enumerate(lines):
        stripped = line.strip()

        # if the line matches a sabotage target, inject a brake before it
        if combined_pattern.search(line):
            output.append(line)
            indent = line[:len(line) - len(line.lstrip())]
            output.append(indent + brake_line)
            skip_next = True
            continue

        # rewrite runtime-eval calls to wrappers so they are blocked when flag set
        new_line = line
        # careful ordering: replace loadfile first to avoid accidental overlaps
        if loadfile_pattern.search(new_line):
            new_line = loadfile_pattern.sub("__gsafe_loadfile(", new_line)
        if loadstring_pattern.search(new_line):
            new_line = loadstring_pattern.sub("__gsafe_loadstring(", new_line)
        # replace plain load( with __gsafe_load( but avoid replacing when it's part of something else (best-effort)
        if load_pattern.search(new_line):
            # avoid replacing occurrences we already changed (loadstring -> __gsafe_loadstring)
            new_line = load_pattern.sub("__gsafe_load(", new_line)
        if require_pattern.search(new_line):
            new_line = require_pattern.sub("__gsafe_require(", new_line)

        # GUI property writes: optional extra guard injection directly before assignment lines
        # match common property writes like "obj.Text = ..." or "frame.Visible = ..."
        if re.match(r"^\s*[\w\.:_]+\s*\.\s*(Text|Visible|Parent|Image|BackgroundColor3|TextColor3)\s*=", line):
            output.append(line)
            indent = line[:len(line) - len(line.lstrip())]
            output.append(indent + brake_line)
            continue

        # otherwise append the (possibly rewritten) line
        output.append(new_line)

    return output

def wrap_module_return(lines: list[str], kill_switch_name: str) -> list[str]:
    for i, line in enumerate(lines):
        if line.strip().startswith("return {") or line.strip().startswith("return"):
            # inject a guard before the return
            lines[i] = f"""if getgenv()['{kill_switch_name}'] then error('Gatekeeper: return sabotage triggered') end\n""" + line
            break
    return lines

def process_file(file_path: str, kill_switch_name: str):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            lines = f.readlines()

        sabotaged_lines = inject_runtime_brake_and_rewrites(lines, kill_switch_name)
        sabotaged_lines = wrap_module_return(sabotaged_lines, kill_switch_name)

        # insert markers, wrappers, GUI sabotage and self-destruct at the top
        header = []
        header.append("-- 🔒 sabotage injected\n")
        header.append(generate_safe_wrappers_block(kill_switch_name))
        header.append(generate_gui_sabotage_block(kill_switch_name))
        header.append(generate_self_destruct_block(kill_switch_name))

        final_lines = header + sabotaged_lines

        with open(file_path, "w", encoding="utf-8") as f:
            f.writelines(final_lines)

        print(f"✅ SabotageInjector++ v2 deployed using flag: {kill_switch_name}")
        print(f"📄 File updated: {file_path}")
    except Exception as e:
        print(f"⚠️ Error: {e}")

folder = os.getcwd()
lua_files = [f for f in os.listdir(folder) if f.endswith(".lua")]

if not lua_files:
    print("❌ No Lua files found in this folder.")
else:
    latest = max(lua_files, key=lambda f: os.path.getmtime(os.path.join(folder, f)))
    process_file(os.path.join(folder, latest), kill_switch_name)
