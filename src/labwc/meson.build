labwc_icons = get_option('labwc_icons')

foreach theme: themes
  labwc_dir = join_paths(theme['dir'], 'labwc')

  if labwc_icons == 'papirus'
    labwc_theme_dir = 'labwc-papirus' + theme['color']
  else
    labwc_theme_dir = 'labwc' + theme['color']
  endif

  install_subdir(
    labwc_theme_dir,
    strip_directory: true,
    install_dir: labwc_dir,
  )
endforeach