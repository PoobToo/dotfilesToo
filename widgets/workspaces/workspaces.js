//Workspaces Widget (mostly complete)
const hyprland = await Service.import("hyprland")

export function Workspaces() {
  return Widget.EventBox({
    class_name: "workspaces",
    child: Widget.Box({
      children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
        attribute: i,
        label: `${i}`,
        onClicked: () => hyprland.messageAsync(`dispatch workspace ${i}`),
        class_name: hyprland.active.workspace.bind("id").as(id => `${id === i ? "focused" : ""}`),
      })),

      setup: self => self.hook(hyprland, () => self.children.forEach(btn => {
        btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute);
      })),
    }),
  })
}


