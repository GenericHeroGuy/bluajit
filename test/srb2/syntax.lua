
local a, b = 0,0

local c_comment = {
    /* This is a C comment */
    // This is a C++ comment.
}

local bitops = {
    ~a,     -- not a
    a & b,  -- a and b
    a | b,  -- a or b
    a ^^ b, -- a xor b
}


local function psuedo_index()
    local a, b, c = 1, 1, 2
    for i = 1, 10 do
        a, b, c = $2, $3, $1 + $2
    end
end

local function continue_expr()
    for i=1,10 do
        continue
    end
end

local function break_expr()
    while true do
        while true do
            break 2
        end
    end
end

local anon_function = do end

local string_interpolate = "3.\$14\92"
local string_unicode = "\x20\u0020"
