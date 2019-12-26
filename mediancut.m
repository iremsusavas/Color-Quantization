function final=mediancut(file, n_colours)
	im= imread(file);
	final= MC(im, n_colours);
end

