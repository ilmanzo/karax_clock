# Package
version       = "0.1.0"
author        = "Andrea Manzini"
description   = "A demo"
license       = "MIT"
srcDir        = "src"
bin           = @["index"]

# Dependencies
requires "nim >= 1.6.6"
requires "karax#head"

task deps, "Install dependencies":
  exec "nimble install -y karax"

task make, "[re]compile the code":
  exec "nim js -d:danger -d:release -o:index.js src/index.nim "

