local Json = require "cjson"
Json.encode_empty_table = Json.encode_empty_table or function () end

local oldprint = print
_G.print = function (...)
  oldprint (...)
  io.stdout:flush ()
end

local assert   = require "luassert"
local Instance = require "cosy.instance"

describe ("instance", function ()

  it ("should work", function ()
    local instance = Instance.create ()
    local server   = instance.server
    instance:delete ()
    assert.is_truthy (server)
  end)

end)
