svg = $(wildcard *.svg)
tex = $(wildcard *.tex)
eps-from-svg = $(patsubst %.svg,build/%.eps,$(svg))
pdf = $(patsubst %.tex,build/%.pdf,$(tex))

$(pdf): build/%.pdf: %.tex $(eps-from-svg) build/.build
	cd build; xelatex ../$<

$(eps-from-svg): build/%.eps: %.svg build/.build
	inkscape $< -E $@ --export-ignore-filters --export-ps-level=3

build/.build: 
	mkdir -p build; touch build/.build

watch:
	while true; do\
		make;\
		inotifywait -qre close_write .; \
	done

.PHONY: clean

clean:
	-rm -r build
