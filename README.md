# Pocillo GTK Theme
----


GTK+3.22 based theme that has Material design elements and styled
using the Arc colour palette.

The theme exists with light, darker and dark styling together with
slim styled or standard title-bars.

The theme has been developed primarily for the Budgie Desktop.
Forked from Pop GTK Theme which itself is forked from Materia,
it inherits GNOME and XFCE styling elements.

Contributions are welcome for all desktop environments

# Public License

GPL-2+
SVG files are licensed under CC BY-SA 4.0

# Required Components:
----

GTK+3.22.x

 - Gtk+-3.0             >= 3.22.0
 - Gtk+-2.0             >= 2.24.30
 - gtk2-engines-pixbuf  >= 2.24.30
 - gtk2-engines-murrine >= 0.98.1
 
# Supported Desktop Environments
----
 
  - Budgie Desktop >= 10.4
  
# Installation
----

Install the following packages using your package management system:

 inkscape, optipng, gtk2-engines-pixbuf, gtk2-engines-murrine, git, libsass0, sassc
 
Remove previous versions first:

    sudo rm -rf /usr/share/themes/Pocillo*
 
    git clone https://github.com/ubuntubudgie/pocillo-gtk-theme
    cd pocillo-gtk-theme
    make
    sudo make install
    
# Development

 For GTK+3 changes, edit the .scss files and compile:
 
    make gtk3
    
 Install:
 
    sudo make install

# Special Thanks to
----

Nan-4, the developer of Materia and Pop OS for the pop-gtk-theme
