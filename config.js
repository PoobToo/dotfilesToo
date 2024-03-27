import { Workspaces } from './widgets/workspaces/workspaces.js'
import { Clock } from './widgets/clock/clock.js'

// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [
      Clock(),
    ],
  })
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [
      Workspaces(),
    ],
  })
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
    ],
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  })
}

function test() {
  return Widget.Window({
    name: 'test',
    anchor: ['bottom', 'left'],
    child: Widget.Box({
      spacing: 10,
      child:
        Widget.Label({
          label: 'some text to show',
          justification: 'left',
        }),
    }),
  })
}

App.config({
  style: "./style.css",
  windows: [
    Bar(),
    // you can call it, for each monitor
    // Bar(0),
    // Bar(1)
  ],
})

export { }
