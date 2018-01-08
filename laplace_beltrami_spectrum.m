function [evecs evals] = laplace_beltrami_spectrum(surf_filename, k)



[V,F] = read_vtk(surf_filename);
% k = 50;
V = normalize_by_SA(V, F);
L = cotmatrix(V,F'); % some implementation may put L = 0.5*cotmatrix(V,F); this just scales ED by 0.5 and does not really matter.
M = massmatrix(V,F','barycentric');
[EV,ED] = eigs(L,M,k,'sm');
ED = - ED; % minus sign is needed since cotmatrix() gives a negative definite matrix.

evals = diag(ED);
evecs = EV;
end
