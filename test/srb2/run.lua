require "srb2.syntax"    -- Make sure all syntax is valid.

local test = require "test"

test.category "Bitwise Operators"

test.method("NOT", function ()
    local a = 0xaa55
    local b = ~a
    assert(b == 0x55aa)
end)

test.method("AND", function ()
    local a = 0xFF
    local b = 0x55
    local c = a & b
    assert(c == 0x55)
end)

test.method("OR", function ()
    local a = 0xAA
    local b = 0x55
    local c = a | b
    assert(c == 0xFF)
end)

test.method("XOR", function ()
    local a = 0xFF
    local b = 0x55
    local c = a ^^ b
    assert (c == 0xaa)
    c = a ^^ b
    assert (c == 0xFF)
end)

test.category "Strings"

test.method("Interoplate", function ()
    for k,v in pairs(table) do
        k = tostring(k)
        v = tostring(v)
        local a = "k=\$k\\tv=\$v\"
        local b = "k="..k.."\tv="..v

        assert(a == b)
    end
end)

test.method("HexChar", function ()
    assert("\x20" == " ")
end)

test.method("UnicodeChar", function ()
    assert("\u0020" == " ")
end)

test.run()