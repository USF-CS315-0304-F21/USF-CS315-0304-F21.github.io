HTML_TARGETS = sidebar.html content.html timeline.html
MD_TARGETS = timeline.md

TOML_DEPS = $(wildcard timeline/*.toml)
COURSE_DIR = cs221

%.html: %.md
	python3 markdown_wrap.py $< > $@

%.md: %.mustache $(TOML_DEPS)
	python3 mustache_wrap.py $< > $@
 
all: $(MD_TARGETS) $(COURSE_DIR) $(HTML_TARGETS)

$(COURSE_DIR):
	mkdir -p $(COURSE_DIR)

deploy:
	cp -u *.html $(COURSE_DIR)
	cp -u *.css $(COURSE_DIR)
	cp -u *.png $(COURSE_DIR)
	rsync -avzh $(COURSE_DIR) phpeterson@stargate.cs.usfca.edu:public_html

clean:
	rm -rf $(MD_TARGETS) $(HTML_TARGETS) $(COURSE_DIR)
