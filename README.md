# Pocillo GTK Theme

GTK+3.22 based theme that has Material Design elements and styled
using the Arc colour palette.

The theme exists with light, darker and dark styling together with
slim styled or standard title-bars.

The theme has been developed primarily for the Budgie Desktop.

Contributions are welcome for all desktop environments


## Public License

- GPLv2.0 or above
- SVG files are licensed under CC BY-SA 4.0


## Required Components:

GTK+3.22.x

 - Gtk+-3.0             >= 3.22.0
 - Gtk+-2.0             >= 2.24.30
 - gtk2-engines-pixbuf  >= 2.24.30
 - gtk2-engines-murrine >= 0.98.1


## Supported Desktop Environments

  - Budgie Desktop >= 10.4


## Installation

Install the following packages using your package management system:

    inkscape, optipng, gtk2-engines-pixbuf, gtk2-engines-murrine, git, libsass0, sassc

Remove previous versions first:

    sudo rm -rf /usr/share/themes/Pocillo*

Download and install Pocillo theme:

    git clone https://github.com/ubuntubudgie/pocillo-gtk-theme
    cd pocillo-gtk-theme
    make
    sudo make install


## Development

 After cloning run a full make to generate all CSS files:

    make all

 For editing GTK+3, edit the .scss files and compile:

    make gtk3

 Install:

    sudo make install

 Alternatively - if just editing GTK+3 you can compile, install and apply the theme by running

    ./apply


## Special Thanks to

Pocillo has been created from [Pop GTK theme](https://github.com/pop-os/gtk-theme) which itself is developed from [Materia GTK theme](https://github.com/nana-4/materia-theme); it inherits GNOME and XFCE styling elements from those projects.

- [nana-4](https://github.com/nana-4), the developer of [Materia GTK theme]()
- [System76](https://system76.com) for the [Pop GTK theme](https://github.com/pop-os/gtk-theme)
