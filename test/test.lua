local supertable = {}

supertable.__index     = supertable;
supertable.__newindex  = function () error "This is a readonly table." end
supertable.__usedindex = supertable.__newindex

local test = { }

local cats   = {}
local active = ".nocat"

function test.category(name)
    active = name

    if not cats[active] then
        cats[active] = {}
    end
end

function test.method(name, f, ...)
    local cat = cats[active]
    table.insert(cat, {
        ["name"] = name,
        ["f"] = f,
        ["args"] = { ... }
    })
end

function test.run()
    print("Running tests, please wait...");

    local success, fail, total = 0, 0, 0

    for cname, cat in pairs(cats) do
        local numM = #cat
        if cname == '.nocat' then
            cname = "Uncategorized"
        end
        print ("[ "..cname.." ("..tostring(numM)..") ]")

        for i, m in ipairs(cat) do
            total = total + 1

            local r = {pcall(m.f, unpack(m.args))}
            local s = r[1]
            table.remove(r, 1)

            if s then
                print("  [("..i.."/"..numM..")] "..m.name..": success!")
                for j, rval in pairs(r) do
                    print("    "..j..": "..tostring(rval))
                end
                success = success + 1
            else
                print("  [("..i.."/"..numM..")] "..m.name..": fail!")
                local msg = r[2]
                if msg then
                    print("    reason: "..msg)
                end

                fail = fail + 1
            end
        end
    end

    print ("Ran "..total.." tests. "..fail.." failed and "..success.." succeeded.")

    if (fail ~= 0) then
        os.exit(1)
    else
        os.exit(0)
    end
end

return test;