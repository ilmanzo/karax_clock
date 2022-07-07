import karax / [kbase, vdom, kdom, karax, karaxdsl, jstrutils]
import kclock

var
  clocks: seq[KClock] # keep a list of clocks
  offset: kstring     # value entered in the input box

proc render(): VNode =
  buildHtml(tdiv):
    h2:
      label(`for` = "offset"):
        text "Please enter Timezone offset (-12 .. +12)"
      input(type = "number", id = "offset"):
        proc oninput(ev: Event; n: VNode) =
          offset = n.value
    button:
      text "Add a new Clock"
      proc onclick(ev: Event; n: VNode) =
        let tzofs = parseInt(offset)
        if tzofs >= -12 and tzofs <= 12:
          clocks.add(KClock.new(tzofs))
    button:
      text "Remove last Clock"
      proc onclick(ev: Event; n: VNode) =
        discard clocks.pop()
    for clock in clocks:
      h1:
        clock

setRenderer render










