function [norm_values] = normalize_values(data,lng,rad)
c = -lng;   %Initilization for counter
v = 0;  %Initilization for counter
norm_values = zeros(1,(rad*lng+1)); %Preallocation or normalized data array.
for i = 1:rad
    c = c + lng +1; %Counter jumps to beginning of next radial bin
    v = v +lng +1;  %Counter jumps to end of next radial bin
s_data = data(c:v,:);   %Selects current radial bin
for j = 1:lng+1
norm_values(c+j-1) = (s_data(j,2) - min(s_data(:,2)))./((max(s_data(:,2))) - min(s_data(:,2))); %Creates normalized values on 0-1 scale.
end

end
norm_values = rot90(norm_values,-1);    %Rotates the data set in order for torus_plots to read.
end

