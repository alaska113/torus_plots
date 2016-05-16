function [folder,nl2folder] = folders(property,species,strtpath,f_path)
folder = dir(strcat(strtpath,'/plots/data/', species, '/', property, '/', property, species, '*_3D.dat'));  %Selects current file in model data.
nl2folder = dir(strcat(strtpath,'/plots/data/', 'elec','/', 'NL2_','/', '*_3D.dat'));   %Selects current flux tube content data for transport calculation.
end