SHELL = /bin/bash
COLOR_VARIANTS = '' '-dark' '-light'
SIZE_VARIANTS = '' '-slim'
SASSC_OPT=-M -t expanded
BASE_DIR=/usr/share/themes
REPODIR=$(CURDIR)
SRCDIR=$(REPODIR)/src
GNOMEVER=3.26
OLDESTGTK=3.22

all: sass assets

#install-gnome-shell:
#	cp -v /usr/share/themes/Pocillo/gnome-shell/pocillo.css /usr/share/gnome-shell/theme

assets: recolor
	@echo "** Generating the Assets..."

	cd ./src/gtk-3.0/gtk-common/ && find . -type f -name *.png -exec rm -v '{}' + > /dev/null
	cd ./src/gtk-2.0/ && find . -type f -name *.png -exec rm -v '{}' + > /dev/null
	cd ./src/gtk-3.0/gtk-common/ && ./render-assets.sh > /dev/null
	cd ./src/gtk-2.0/ && ./render-assets.sh > /dev/null

clean:
	-rm -rf ./src/gtk-2.0/assets/*.png
	-rm -rf ./src/gtk-2.0/assets-dark/*.png
	-rm -rf ./src/gtk-3.0/gtk-common/assets/*.png
	-rm -rf ./src/gtk-3.0/**/*.css
	#-rm -rf ./src/gnome-shell/**/*.css

uninstall:
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-dark
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-light
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-light-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-dark-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-slim
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-dark-slim
	-rm -rf $(DESTDIR)/usr/share/themes/Pocillo-light-slim

install:
	@echo "** Installing the theme..."

	# Setup
	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    export themedir=$(DESTDIR)$(BASE_DIR)/Pocillo$$color$$size; \
	    install -d $$themedir; \
#	    cp -ur COPYING $$themedir; \
	    cp -ur src/index$$color$$size.theme $$themedir/index.theme; \
	  done; \
	done

	# Install GTK2 Theme
	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    export themedir=$(DESTDIR)$(BASE_DIR)/Pocillo$$color$$size; \
	    install -d $$themedir/gtk-2.0; \
	    cd $(SRCDIR)/gtk-2.0; \
	    cp -ur \
	      apps.rc \
	      hacks.rc \
	      main.rc \
	      xfce-notify.rc \
	      panel.rc \
	      menubar-toolbar \
	      $$themedir/gtk-2.0; \
	    if [ "$$color" != '-dark' ]; then \
	      cp -ur \
	        assets \
	        $$themedir/gtk-2.0; \
	    else \
	      cp -ur \
	       assets-dark \
	       $$themedir/gtk-2.0/assets; \
	    fi; \
	    cp -ur \
	      gtkrc$$color \
	      $$themedir/gtk-2.0/gtkrc; \
	  done; \
	done

	# Install GTK3 Theme
	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    export themedir=$(DESTDIR)$(BASE_DIR)/Pocillo$$color$$size; \
	    install -d $$themedir/gtk-common; \
	    ln -s $$themedir/gtk-$(OLDESTGTK)/ $$themedir/gtk-3.0; \
	    cd $(SRCDIR)/gtk-3.0/gtk-common; \
	    cp -ur \
	      assets \
	      $$themedir/gtk-common; \
	    for version in '$(OLDESTGTK)'; do \
	      install -d $$themedir/gtk-$$version; \
	      cd $(SRCDIR)/gtk-3.0/$$version; \
	      cp -ur \
	        assets \
	        $$themedir/gtk-$$version; \
	      cp -ur \
	        gtk$$color$$size.css \
	        $$themedir/gtk-$$version/gtk.css; \
	      if [ "$$color" != '-dark' ]; then \
	        cp -ur \
	          gtk-dark$$size.css \
	          $$themedir/gtk-$$version/gtk-dark.css; \
	      fi; \
	    done; \
	  done; \
	done

	# Install Plank Theme
	for color in $(COLOR_VARIANTS); do \
		for size in $(SIZE_VARIANTS); do \
			export themedir=$(DESTDIR)$(BASE_DIR)/Pocillo$$color$$size; \
			install -d $$themedir/plank; \
			cd $(SRCDIR)/plank; \
			cp -ur \
				dock.theme \
				$$themedir/plank; \
		done; \
	done

	@echo
	@echo Done.

assets-gtk2:


assets-gtk3:


recolor:
	@echo "** Matching Colors"

	cd ./src/gtk-3.0/gtk-common/ && ./recolor-assets.sh > /dev/null
#	cd ./src/gtk-2.0/ && ./recolor-assets.sh > /dev/null

sass: gtk2 gtk3
	@echo "** Generating the CSS..."


gtk2: recolor
	@echo "** Generating GTK2..."

	#cd ./src/gtk-2.0 && ./recolor-assets.sh

gtk3:
	@echo "** Generating GTK3..."

	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    for version in '$(OLDESTGTK)'; do \
	      sassc $(SASSC_OPT) src/gtk-3.0/$$version/gtk$$color$$size.{scss,css}; \
	    done; \
	  done; \
	done

#gnome-shell:
#	@echo "** Generating GNOME Shell..."

#	for color in $(COLOR_VARIANTS); do \
#	  for size in $(SIZE_VARIANTS); do \
#	    # Skip gnome-shell 3.20 and 3.22 \
#	    for version in '3.24' '3.26'; do \
#	      sassc $(SASSC_OPT) src/gnome-shell/$$version/gnome-shell$$color$$size.{scss,css}; \
#	      sassc $(SASSC_OPT) src/gnome-shell/$$version/extensions/workspaces-to-dock/workspaces-to-dock.{scss,css}; \
#	      sassc $(SASSC_OPT) src/gnome-shell/$$version/pad-osd.{scss,css}; \
#	    done; \
#	  done; \
#	done

.PHONY: all install uninstall gtk3 gtk2 sass recolor assets-gtk3 assets-gtk2 clean
