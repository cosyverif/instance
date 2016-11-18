package = "cosy-instance-env"
version = "master-1"
source  = {
  url    = "git+https://github.com/cosyverif/instance.git",
  branch = "master",
}

description = {
  summary    = "CosyVerif: instance (dev dependencies)",
  detailed   = [[
    Development dependencies for cosy-instance.
  ]],
  homepage   = "http://www.cosyverif.org/",
  license    = "MIT/X11",
  maintainer = "Alban Linard <alban@linard.fr>",
}

dependencies = {
  "lua >= 5.1",
  "busted",
  "cluacov",
  "luacheck",
  "luacov",
  "luacov-coveralls",
}

build = {
  type    = "builtin",
  modules = {},
}
