function [ theta, v_theta, v_mag, radius ] = vecplot_ind(theta, v_theta, v_mag, radius)
count = 0;
for ang = 0:pi:pi
    count = count+1;
    k(:,count) = theta(:) == ang;
end
ind = k(:,1) + k(:,2);
iang = find(ind == 1);
theta = theta(iang);
v_theta = v_theta(iang);
v_mag = v_mag(iang);
radius = radius(iang);
%radius = reshape
end

