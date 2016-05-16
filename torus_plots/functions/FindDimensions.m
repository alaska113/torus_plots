function [lng,rad] = FindDimensions(strtpath)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
do_script = importdata(strcat(strtpath,'/do'));

lng_line = char(do_script(3,1));
lng = str2num(lng_line(5:6));

rad_line = char(do_script(4,1));
rad = str2num(rad_line(5:6));

end

