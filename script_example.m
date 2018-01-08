% [V,F] = readOBJ('sphere5.obj');
% k = 50;
% L = cotmatrix(V,F); % some implementation may put L = 0.5*cotmatrix(V,F); this just scales ED by 0.5 and does not really matter.
% M = massmatrix(V,F,'barycentric');
% [EV,ED] = eigs(L,M,k,'sm');
% ED = - ED; % minus sign is needed since cotmatrix() gives a negative definite matrix.

[V,F] = read_vtk('Callosum_Forceps_Major_surf_decpt5.vtk');
k = 800;
L = cotmatrix(V',F'); % some implementation may put L = 0.5*cotmatrix(V,F); this just scales ED by 0.5 and does not really matter.
M = massmatrix(V',F','barycentric');
[EV,ED] = eigs(L,M,k,'sm');
ED = - ED; % minus sign is needed since cotmatrix() gives a negative definite matrix.

