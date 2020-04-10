from-svg = radiance-along-ray.eps three-point-form.eps path-annotated-1.eps
svg-to-eps = ./svg-to-eps.sh
the-light-transport-equation.pdf: the-light-transport-equation.tex $(from-svg)
	latexmk -xelatex the-light-transport-equation.tex

radiance-along-ray.eps: radiance-along-ray.svg
	$(svg-to-eps) radiance-along-ray.svg

three-point-form.eps: three-point-form.svg
	$(svg-to-eps) three-point-form.svg

path-annotated-1.eps: path-annotated-1.svg
	$(svg-to-eps) path-annotated-1.svg

clean:
	latexmk -C;\
	rm radiance-along-ray.eps three-point-form.eps path-annotated-1.eps
