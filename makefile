from-svg = build/radiance-along-ray.eps build/three-point-form.eps build/path-annotated-1.eps
svg-to-eps = ./svg-to-eps.sh

the-light-transport-equation.pdf: the-light-transport-equation.tex $(from-svg)
	cd build; latexmk -xelatex -quiet ../the-light-transport-equation.tex

build/radiance-along-ray.eps: build/. radiance-along-ray.svg
	$(svg-to-eps) radiance-along-ray.svg build/radiance-along-ray.eps

build/three-point-form.eps: three-point-form.svg
	$(svg-to-eps) three-point-form.svg build/three-point-form.eps

build/path-annotated-1.eps: path-annotated-1.svg
	$(svg-to-eps) path-annotated-1.svg build/path-annotated-1.eps

build/.: 
	mkdir -p build

watch:
	while true; do\
		make;\
		inotifywait -qre close_write .; \
	done

.PHONY: clean

clean:
	-rm -r build

