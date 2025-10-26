-- LocalScript

-- Section A
local function A()
    print("Running Script A")
    -- paste your Script A logic here
end

-- Section B
local function B()
    print("Running Script B")
    -- paste your Script B logic here
end

-- Section C
local function C()
    print("Running Script C")
    -- paste your Script C logic here
end

-- Launch all three concurrently
task.spawn(A)
task.spawn(B)
task.spawn(C)

-- Optional: sequential execution
-- A(); B(); C()

-- Optional: conditional toggles
local runA, runB, runC = true, true, true
if runA then task.spawn(A) end
if runB then task.spawn(B) end
if runC then task.spawn(C) end

-- Optional: simple error-wrap per section
local function safeRun(fn, name)
    local ok, err = pcall(fn)
    if not ok then
        warn(("Section %s failed: %s"):format(name, tostring(err)))
    end
end

-- Example: safe concurrent runs
task.spawn(function() safeRun(A, "A") end)
task.spawn(function() safeRun(B, "B") end)
task.spawn(function() safeRun(C, "C") end)
