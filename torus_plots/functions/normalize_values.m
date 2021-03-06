function [norm_values] = normalize_values(data,lng,rad)
%function [norm_values] = normalize_values(data,lng,rad)
c = -lng;   %Initilization for counter
v = 0;  %Initilization for counter
norm_values = zeros(1,(rad*lng+1)); %Preallocation or normalized data array.
%norm_values2 = zeros(1,(rad*lng+1));
for i = 1:rad
    c = c + lng +1; %Counter jumps to beginning of next radial bin
    v = v +lng +1;  %Counter jumps to end of next radial bin
s_data = data(c:v,:);   %Selects current radial bin
%s_data2 = data2(c:v,:);
for j = 1:lng+1
%norm_values(c+j-1) = (((s_data(j,2) - min(s_data(:,2)))./((max(s_data(:,2))) - min(s_data(:,2))))); %Creates normalized values on 0-1 scale.
%norm_values2(c+j-1) = (((s_data2(j,2) - min(s_data2(:,2)))./((max(s_data2(:,2))) - min(s_data2(:,2))).*2)-1);
%norm_values(c+j-1) = (((s_data(j,2) - min(s_data(:,2)))./((max(s_data(:,2))) - min(s_data(:,2))).*2)-1);
norm_values(c+j-1) = (s_data(j,2) - min(s_data(:,2)))./((max(s_data(:,2))) - min(s_data(:,2))); %Creates normalized values on 0-1 scale.


end
end
%norm_values = norm_values.*norm_values2;
%norm_values = ((norm_values.*(;
norm_values = rot90(norm_values,-1);    %Rotates the data set in order for torus_plots to read.
size(norm_values)
end

