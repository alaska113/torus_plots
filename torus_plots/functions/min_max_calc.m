function [ min_value, max_value ] = min_max_calc(specified_day,lng,rad,folder)

for day = specified_day
        c = -lng;
        v = 0;
        data = load(folder(day).name);
        for bin = 1:rad;
            c = c + lng + 1;
            v = v + lng +1;
            new_data = data(c:v,:);
            new_data(lng+1,1) = 360;
            theta = new_data(:,1);
            value = new_data(:,2);
            min_value(day,bin) = min(value(bin));
        max_value(day,bin) = max(value(bin));
        end
        
end

end

