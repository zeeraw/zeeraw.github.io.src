SHELL=/bin/bash
TIMESTAMP=$(date +%s)

DOMAIN_NAME="vall.in"
THEME="pickles"

GIT_PUBLIC="git@github.com:zeeraw/zeeraw.github.io.git"

OUTPUT_DIR="./public"

develop:
	hugo server -t $(THEME) -D --bind=0.0.0.0

build:
	hugo -t $(THEME)

publish:
	@echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
	@hugo -t $(THEME)

	@echo $(DOMAIN_NAME) > $(OUTPUT_DIR)/CNAME

	@cd $(OUTPUT_DIR);\
		git add -A
	@cd $(OUTPUT_DIR);\
		git commit -m "Publishing site `date`"
	@cd $(OUTPUT_DIR);\
		git push -f origin master
