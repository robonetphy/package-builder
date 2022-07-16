sub_num=1
add_num=1

SUB_FOLDER=sub_num
ADD_FOLDER=add_num

# ifeq ($(LIBSO), 1)
# endif


MYDIR = .
install:$(MYDIR)/*
	@for a in $^; do \
      if [ "$$a" =  ${SUB_FOLDER} ]; then \
		if [ ${${SUB_FOLDER}} = 1 ]; then \
			echo "Installing the ${SUB_FOLDER}." ; \
			mkdir -p $(MYDIR)/${SUB_FOLDER}/build; \
			cd $(MYDIR)/${SUB_FOLDER}/build; \
			cmake ..; \
			make install; \
	  		cd ../..; \
		fi \
	  fi; \
      if [ "$$a" =  ${ADD_FOLDER} ]; then \
		if [ ${${ADD_FOLDER}} = 1 ]; then \
			echo "Installing the ${ADD_FOLDER}." ; \
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
			echo "Uninstalling the ${SUB_FOLDER}." ; \
			cd $(MYDIR)/${SUB_FOLDER}/build; \
			make uninstall; \
			rm -rfv $(MYDIR)/${SUB_FOLDER}/build; \
	  		cd ../..; \
		fi \
	  fi; \
      if [ "$$a" =  ${ADD_FOLDER} ]; then \
		if [ ${${ADD_FOLDER}} = 1 ]; then \
			echo "Uninstalling the ${ADD_FOLDER}." ; \
			cd $(MYDIR)/${ADD_FOLDER}/build; \
			make uninstall; \
			rm -rfv $(MYDIR)/${ADD_FOLDER}/build; \
	  		cd ../..; \
		fi \
	  fi; \
	  ldconfig; \
	  done