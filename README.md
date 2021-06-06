# Pocillo GTK Theme

Pocillo is a [Material Design](https://material.io) theme for the Budgie Desktop.

It supports GTK 2, GTK 3, GTK 4, Budgie, LightDM, Chrome theming.

## Previews

![widget-factory](images/widget-factory.png?raw=true)
![widget-factory-dark](images/widget-factory-dark.png?raw=true)

## Features

Supports **ripple animations** for GTK 3 and 4:

![ripple](images/ripple.gif?raw=true)

**3 color variants** and **2 size variants** are available:

**Pocillo** | **standard** | **slim**
:-: | :-: | :-:
**standard** | ![Materia][1] | ![Materia-compact][2]
**dark** | ![Materia-dark][3] | ![Materia-dark-compact][4]
**light** | ![Materia-light][5] | ![Materia-light-compact][6]

[1]: images/Materia.png?raw=true
[2]: images/Materia-compact.png?raw=true
[3]: images/Materia-dark.png?raw=true
[4]: images/Materia-dark-compact.png?raw=true
[5]: images/Materia-light.png?raw=true
[6]: images/Materia-light-compact.png?raw=true

## Supported Toolkits and Desktops

- GTK 2
- GTK 3 `>=3.20`
- GTK 4 `>=4.0`
- Budgie `>=10.5`

### Manual Installation

See [`INSTALL.md`](INSTALL.md) for details.

## Recommendations

### Font

- Use a font family including **Medium** weight (e.g. [Roboto](https://github.com/google/roboto) or [M+](https://mplus-fonts.osdn.jp)) to properly display the theme.
- Set the font size to `9.75` (= 13px at 96dpi) or `10.5` (= 14px at 96dpi).

### Chrome Extensions

To improve the appearance of Chrome, you can install the Chrome extensions as follows:

1. Open the `/usr/share/themes/Pocillo<-variant>/chrome` folder in your file manager.
2. Drag and drop the `.crx` files into the Chrome's Extensions page (`chrome://extensions`).

## Contributing

If you find bugs or have suggestions, please report it to the [issue tracker](https://github.com/ubuntubudgie/pocillo-gtk-theme/issues). Any contribution would be much appreciated.

Todo list can be found at [`TODO.md`](TODO.md).

## Related Projects

- Pocillo GTK Theme is a modified version of https://github.com/nana-4/materia-theme
- [**Materia KDE**](https://github.com/PapirusDevelopmentTeam/materia-kde) by @PapirusDevelopmentTeam
- [**Materia VSCode Theme**](https://marketplace.visualstudio.com/items?itemName=m-thorsen.vscode-materia) by @m-thorsen
- [**Materia Kolorizer**](https://github.com/DarthWound/materia-kolorizer) by @DarthWound
- [**oomox theme designer**](https://github.com/themix-project/oomox) by @themix-project

## License

Pocillo is distributed under the terms of the GNU General Public License, version 2 or later. See the [`COPYING`](COPYING) file for details.

## Acknowledgments

- Pocillo is based on https://github.com/nana-4/materia-theme
- Materia is based on [Adwaita](HACKING.md#upstream-theme-sources) by GNOME.
- Design and specifications are based on Google's [Material Design](https://material.io).
- The included symbolic icons are based on [Material Design icons](https://github.com/google/material-design-icons) by Google.
- The Chrome scrollbar extension was forked from [Adwaita-chrome-scrollbar](https://github.com/gnome-integration-team/chrome-gnome-scrollbar) by GNOME Integration Team.
- Yauhen Kirylau (@actionless) who is oomox author polished scripts and supported Materia with [oomox](https://github.com/themix-project/oomox).
- @n3oxmind who helped improve the installation Materia script.
- The Meson code is heavily influenced by @monday15's [lounge-gtk-theme](https://github.com/monday15/lounge-gtk-theme).

Also thank you to all contributors and upstream developers.
