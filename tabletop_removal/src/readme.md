Where I left off
===============

Current state of the art is doing calls to the table segmenter, and taking the resulting clusters directly.
The z coordinate is stripped from the clusters, and the result is put into an image with little modification.
I need to consider using tf to do a proper conversion between reference frames.

I tried converting the PC2 data directly from the output into PC data so that I could determine the min and max
y coordinates.  Unfortunately, I lost this code, but it didn't seem to work anyways.
