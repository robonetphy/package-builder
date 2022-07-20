sub_num=1
add_num=1

SUB_FOLDER=sub_num
ADD_FOLDER=add_num


MYDIR = .
install:$(MYDIR)/*
	@for a in $^; do \
      if [ "$$a" =  ${SUB_FOLDER} ]; then \
		if [ ${${SUB_FOLDER}} = 1 ]; then \
			echo "\033[1;33m Installing the ${SUB_FOLDER}.\033[0m" ; \
			mkdir -p $(MYDIR)/${SUB_FOLDER}/build; \
			cd $(MYDIR)/${SUB_FOLDER}/build; \
			cmake ..; \
			make install; \
	  		cd ../..; \
		fi \
	  fi; \
      if [ "$$a" =  ${ADD_FOLDER} ]; then \
		if [ ${${ADD_FOLDER}} = 1 ]; then \
			echo "\033[1;33m Installing the ${ADD_FOLDER}.\033[0m" ; \
			mkdir -p $(MYDIR)/${ADD_FOLDER}/build; \
			cd $(MYDIR)/${ADD_FOLDER}/build; \
	  		cmake ..; \
			make install; \
	  		cd ../..; \
		fi \
	  fi; \
	  ldconfig; \
	  done

uninstall:$(MYDIR)/*
	@for a in $^; do \
      if [ "$$a" =  ${SUB_FOLDER} ]; then \
		if [ ${${SUB_FOLDER}} = 1 ]; then \
			echo "\033[1;31 Uninstalling the ${SUB_FOLDER}.\033[0m" ; \
			cd $(MYDIR)/${SUB_FOLDER}/build; \
			make uninstall; \
			rm -rfv $(MYDIR)/${SUB_FOLDER}/build; \
	  		cd ../..; \
		fi \
	  fi; \
      if [ "$$a" =  ${ADD_FOLDER} ]; then \
		if [ ${${ADD_FOLDER}} = 1 ]; then \
			echo "\033[1;31 Uninstalling the ${ADD_FOLDER}.\033[0m" ; \
			cd $(MYDIR)/${ADD_FOLDER}/build; \
			make uninstall; \
			rm -rfv $(MYDIR)/${ADD_FOLDER}/build; \
	  		cd ../..; \
		fi \
	  fi; \
	  ldconfig; \
	  done