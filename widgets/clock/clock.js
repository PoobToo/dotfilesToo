const WINDOW_NAME = "applauncher"

const date = Variable("", {
  poll: [1000, 'date "+%H:%M:%S"'],
})

export function Clock() {
  return Widget.Button({
    onSecondaryClick: () => { App.openWindow(WINDOW_NAME) },
    onClicked: () => { App.closeWindow(WINDOW_NAME) },
    class_name: "clock",
    label: date.bind(),
  })
}

const test = Widget.Window({
  name: WINDOW_NAME,
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

App.config({
  windows: [test]
})
