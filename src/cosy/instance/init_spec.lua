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

  it ("should work for dev branch", function ()
    local instance = Instance.create {
      branch      = "dev",
      mode        = "development",
      num_workers = 1,
      auth0       = {
        domain        = assert (os.getenv "AUTH0_DOMAIN"),
        client_id     = assert (os.getenv "AUTH0_ID"    ),
        client_secret = assert (os.getenv "AUTH0_SECRET"),
        api_token     = assert (os.getenv "AUTH0_TOKEN" ),
      },
      docker      = {
        username = assert (os.getenv "DOCKER_USER"  ),
        api_key  = assert (os.getenv "DOCKER_SECRET"),
      },
    }
    local server = instance.server
    instance:delete ()
    assert.is_truthy (server)
  end)

end)
