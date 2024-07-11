import fabric
from fabric.widgets import (
    Box,
    Label,
    CenterBox,
    SystemTray,
    WaylandWindow as Window,
)

from fabric.utils import (
    FormattedString,
    set_stylesheet_from_file,
    get_relative_path,
)


class Bar(Window):
    def __init__(self):
        super().__init__(
            layer="top",
            anchor="left top bottom",
            margin="10px 10px -2px 10px",
            exclusive=True,
            visible=False,
            all_visible=False,
        )

        self.center_box = CenterBox(name="main-bar")

        self.system_tray = SystemTray(name="system-tray")
        self.center_box.add_end(self.system_tray)
        self.add(self.center_box)
        self.show_all()


def apply_style():
    return set_stylesheet_from_file(get_relative_path("bar.css"))


if __name__ == "__main__":
    bar = Bar()

    apply_style()
    fabric.start()
