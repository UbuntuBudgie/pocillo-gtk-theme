foreach theme: themes
  openbox_dir = join_paths(theme['dir'], 'openbox-3')

  install_subdir(
    'openbox-3' + theme['color'],
    strip_directory: true,
    install_dir: openbox_dir,
  )
endforeach
