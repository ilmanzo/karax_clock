#a simple clock component
import karax/[karax, karaxdsl, vdom]
import std/times
# source for the Clock component

import std/dom
import sugar

type
  KClock* = ref object of VComponent
    currentTime: DateTime
    offset: TimeInterval
    timer: TimeOut
    prefix: string

# return a VNode with the html rendered for the component
proc render(c: VComponent): VNode =
  let self = KClock(c)
  buildHtml(tdiv):
    let value = format(self.currentTime+self.offset, "HH:mm:ss")
    p:
      text "Local Time " & self.prefix & " => " & value

# update the clock value and re-triggers a timer
proc update(self: KClock) =
  self.currentTime = now()
  self.timer = setTimeout( () => self.update, 100)
  markDirty(self) # need to be re-rendered
  redraw()

# create, initialize and return a new Clock object
proc new*(T: type KClock, tzoffset = 0): KClock =
  let self = newComponent(KClock, render)
  self.currentTime = now()
  self.offset = initTimeInterval(hours = tzoffset)
  self.timer = setTimeout(() => self.update, 100)
  self.prefix = if tzoffset >= 0: "+" else: ""
  self.prefix.add $tzoffset
  return self



