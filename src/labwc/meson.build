foreach theme: themes
  labwc_dir = join_paths(theme['dir'], 'labwc')

  install_subdir(
    'labwc' + theme['color'],
    strip_directory: true,
    install_dir: labwc_dir,
  )
endforeach
