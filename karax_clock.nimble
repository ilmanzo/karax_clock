# Package
version       = "0.1.5"
author        = "Andrea Manzini"
description   = "A Karax demo"
license       = "MIT"
srcDir        = "src"
binDir        = "docs"
bin           = @["index"]
backend       = "js"

# Dependencies
requires "nim >= 1.6.6"
requires "karax#head"

#TODO: can we pass flags to nimble build ?

task make, "[re]compile the code":
  exec "nim js -d:danger -d:release -o:docs/index.js src/index.nim "

