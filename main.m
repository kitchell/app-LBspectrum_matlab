function [out] = main()
% 
% switch getenv('ENV')
%     case 'IUHPC'
%         disp('loading paths (HPC)')
%         addpath(genpath('/N/u/brlife/git/jsonlab'))
%         addpath(genpath('/N/u/brlife/git/geom3d'))
%     case 'VM'
%         disp('loading paths (VM)')
%         addpath(genpath('/usr/local/jsonlab'))
% end



config = loadjson('config.json');


filelist = dir([config.surfaces '/*.vtk']);
for file = 1:size(filelist)
    sprintf(filelist(file).name)
    [evecs, evals, error] = laplace_beltrami_spectrum([config.surfaces '/' filelist(file).name],config.spectrum_size);
    if error == 0
        filename = strrep(filelist(file).name(1:end-4),'-', '_');
        filename = strrep(filename,'.', '_');
        eval_json.(filename) = evals(:)';
        evecs_struct.(filename) = evecs;
    else
       sprintf(filelist(file).name, ' is too small') 
    end
end


savejson('', eval_json, 'spectrum.json');
%savejson('', evecs_json, 'eigenvectors.json');
if config.save_eigenvectors
    save('eigenvectors.mat', 'evecs_struct', '-v7.3')
end
%h5create('eigenvectors.h5', '/eigenvectors', size(evecs_struct))
%h5write('eigenvectors.h5', '/eigenvectors', evecs_struct)
%save 'eigenvectors.mat' evecs_struct
end
