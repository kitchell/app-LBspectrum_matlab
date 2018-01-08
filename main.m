function [out] = main()

switch getenv('ENV')
    case 'IUHPC'
        disp('loading paths (HPC)')
        addpath(genpath('/N/u/brlife/git/jsonlab'))
    case 'VM'
        disp('loading paths (VM)')
        addpath(genpath('/usr/local/jsonlab'))
end



config = loadjson('config.json');


filelist = dir([config.surfaces '/*.vtk']);
for file = 2:size(filelist)
    [evecs, evals] = laplace_beltrami_spectrum([config.surfaces '/' filelist(file).name],config.spectrum_size);
    eval_json.(filelist(file).name(1:end-4)) = evals(:)';
    evecs_json.(filelist(file).name(1:end-4)) = evecs;
end


savejson('', eval_json, 'spectrum.json');
%savejson('', evecs_json, 'eigenvectors.json');

end
