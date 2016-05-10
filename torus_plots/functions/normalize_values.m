function [norm_values] = normalize_values(data,lng,rad)
c = -lng;
v = 0;
d = -1;
for i = 1:rad
    d = d+1;
    c = c + lng +1;
    v = v +lng +1;
s_data = data(c:v,:);
for j = 1:lng+1
norm_values(c+j-1) = (s_data(j,2) - min(s_data(:,2)))./((max(s_data(:,2))) - min(s_data(:,2)));
end

end
norm_values = rot90(norm_values,-1);
end

