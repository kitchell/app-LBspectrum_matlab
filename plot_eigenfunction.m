function [out] = plot_eigenfunction(V, F, evnum)
clf
figure
p=patch('Vertices', V, 'Faces', F', 'FaceVertexCData', EV(:,evnum), 'LineStyle', 'none');
p.FaceColor='interp';
colorbar
end