function [folder,nl2folder] = folders(file,property,species)
strtpath = strcat('/Users/khan113/36x24r/',file, '/2D_Model-master/plots/data');
addpath('/Users/khan113/Documents/MATLAB/torus_plots/functions/');
addpath(strcat('/Users/khan113/36x24r/',file, '/2D_Model-master/plots/data'));
addpath(strcat(strtpath,'/', species, '/', property));
addpath(strcat(strtpath,'/','elec','/', 'NL2_/'));
folder = dir(strcat(strtpath,'/', species, '/', property, '/', property, species, '*_3D.dat'));
addpath(strcat(strtpath, 'elec','/', 'NL2_','/'));
nl2folder = dir(strcat(strtpath,'/', 'elec','/', 'NL2_','/', '*_3D.dat'));
end

