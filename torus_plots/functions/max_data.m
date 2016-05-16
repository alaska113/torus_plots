function [ radial_max_data,nl2current,nl2currentradius ] = max_data(data,nl2data,rad,lng,vec_on)
v = -lng;%Initilizer for index counting
b = 0;%Initilizer for index counting
for i = 1:rad;
    v = v + lng + 1; %Index counting
    b = b + lng + 1; %Index counting
    radial_bin = data(v:b,:); %Selects current radial bin
    
    
    nl2current(:,1,i) = nl2data(v:b,2); %Selects current nl2 values in radial bin
    nl2currentradius(:,1,i) = nl2data(v:b,3); %Selects current nl2 radius in radial bin
    
    first = radial_bin(1,2);
    last = radial_bin(lng+1,2);
    
    radial_max_n = max(radial_bin(1:lng-1,2));
    radial_min_n = min(radial_bin(1:lng-1,2));
    
    %Finds maximum and minimum values
    if max(radial_bin(:,2)) == first && last
        radial_max = radial_bin(1,2);
        radial_max_row = 1;
    else
        radial_max = max(radial_bin(:,2));
        radial_min = min(radial_bin(:,2));
        radial_max_row = find(radial_bin(:,2) == radial_max);
    end
    if size(radial_max_row) >= [2, 1]
        radial_max_row = radial_max_row(1,1);
    end
    radial_max_data(i,:) = radial_bin(radial_max_row,:);
    
end



end

