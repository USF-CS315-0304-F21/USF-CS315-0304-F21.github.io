HTML_TARGETS = sidebar.html content.html timeline.html

MD_TARGETS = timeline.html

TOML_DEPS = $(wildcard timeline/*.toml)

%.html: %.md
	python3 markdown_wrap.py $< > $@

%.md: %.mustache $(TOML_DEPS)
	python3 mustache_wrap.py $< > $@
 
all: $(MD_TARGETS) $(HTML_TARGETS)

clean:
	rm -rf $(MD_TARGETS) $(HTML_TARGETS)
