## Installation from source

### Dependencies

Pocillo requires the following build and runtime dependencies:

#### Build dependencies

- `meson` >= 0.47.0
- `dart-sass` >= 1.23.0 (or `npm` if the former is not found)

#### Runtime dependencies

- `gnome-themes-extra` (or `gnome-themes-standard` for older distributions)
- Murrine engine — The package name depends on the distro:
  - `gtk-engine-murrine` on Arch Linux
  - `gtk-murrine-engine` on Fedora
  - `gtk2-engine-murrine` on openSUSE
  - `gtk2-engines-murrine` on Debian, Ubuntu, etc.

### Steps to install

1. Clone the repository and move into the project directory in terminal:

```sh
git clone https://github.com/ubuntubudgie/pocillo-gtk-theme
cd pocillo-gtk-theme
```

2. Configure the project using Meson (you can optionally set build options [as below](#build-options)):

```sh
meson _build
```

3. Build and install it using Meson:

```sh
meson install -C _build
```

### Build options

Option | Default Value | Description
--- | --- | ---
`prefix` | `/usr` | Installation prefix
`colors` | `default,light,dark` | List of color variants to build
`sizes` | `default,compact` | List of size variants to build
`gtk4_version` | n/a (auto) | Build GTK 4 theme for specific version

Build options can be set at the configuration time, for example:

```sh
meson _build -Dprefix="$HOME/.local" -Dcolors=default,dark -Dsizes=slim
```

> Note: If you are a package maintainer, you should always set `gtk4_version` in your package script based on the `gtk4` package versions in your distribution. Otherwise, the corresponding themes may be built for wrong version.

## Uninstallation

Delete the installed directories:

```sh
sudo rm -rf /usr/share/themes/Pocillo{,-dark,-light}{,-slim}
```
