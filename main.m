function [out] = main()

switch getenv('ENV')
    case 'IUHPC'
        disp('loading paths (HPC)')
        addpath(genpath('/N/u/brlife/git/jsonlab'))
        addpath(genpath('/N/u/brlife/git/geom3d'))
    case 'VM'
        disp('loading paths (VM)')
        addpath(genpath('/usr/local/jsonlab'))
end



config = loadjson('config.json');


filelist = dir([config.surfaces '/*.vtk']);
for file = 1:size(filelist)
    sprintf(filelist(file).name)
    [evecs, evals] = laplace_beltrami_spectrum([config.surfaces '/' filelist(file).name],config.spectrum_size);
    eval_json.(filelist(file).name(1:end-4)) = evals(:)';
    evecs_struct.(filelist(file).name(1:end-4)) = evecs;
end


savejson('', eval_json, 'spectrum.json');
%savejson('', evecs_json, 'eigenvectors.json');
h5create('eigenvectors.h5', '/eigenvectors', size(evecs_struct)
h5write('eigenvectors.h5', '/eigenvectors', evecs_struct)
%save 'eigenvectors.mat' evecs_struct
end
