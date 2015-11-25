function[] = torus_plots(species, property, type, file, specified_day, vec_on)
close all
format long
restoredefaultpath
species_save = species;
property_save = property;
lng = 18;
rad = 16;
radial_max_data = zeros(rad,3);
strtpath = strcat('/Users/khan113/Documents/',file, '/2D_Model-master/plots/data/');
filename = strcat(species, property, 'map.avi');
video_folder = strcat('/Users/khan113/Documents/',file,'/', filename);
writerObj = VideoWriter(video_folder);
writerObj.FrameRate = 10;
addpath(strcat('/Users/khan113/Documents/',file, '/2D_Model-master/'));
addpath(strcat(strtpath, species, '/', property));
folder = dir(strcat(strtpath, species, '/', property, '/', property, species, '*_3D.dat'));
addpath(strcat(strtpath, 'elec','/', 'NL2_','/'));
nl2folder = dir(strcat(strtpath, 'elec','/', 'NL2_','/', '*_3D.dat'));

if type == 'plt'
    endday=30;
else
    endday = length(folder);
end


open(writerObj);
%for day = length(folder)-endday+1:length(folder)
for day = specified_day
    day
    if type == 'plt'
        disp(strcat('Day', '-', num2str(day), ' plotted'));
        c = -rad;
        v = 0;
        
        data = load(folder(day).name);
        for bin = 1:rad;
            c = c + lng + 1;
            v = v + lng +1;
            
            
            new_data = data(c:v,:);
            new_data(lng+1,1) = 360;
            theta = new_data(:,1);
            value = new_data(:,2);
            radius = new_data(1,3);
            h(bin) = subplot(rad/2,2,bin);
            plot(theta,value);
            colormap(jet(day));
            title(strcat('L = ', num2str(radius)));
            axis([0 360 (min(data(c:v,2))-((max(data(c:v,2))-min(data(c:v,2)))/2)) (max(data(c:v,2))+((max(data(c:v,2))-min(data(c:v,2)))/2))]);
            %axis([0 360 (min(value)-(min(value)/2)) (max(value)+(max(value)/2))]);
            hold on
        end
    else
        species = species_save;
        property = property_save;
        v = -lng;
        b = 0;
        g = 1;
        h = lng;
        data = load(folder(day).name);
        nl2data = load(nl2folder(day).name);
        nl2current = zeros(lng+1,1,rad);
        for i = 1:rad;
            v = v + lng + 1;
            b = b + lng + 1;
            %g = g + lng +1;
            %h = h + lng + 1;
            radial_bin = data(v:b,:);
            nl2current(:,1,i) = nl2data(v:b,2);
            nl2currentradius(:,1,i) = nl2data(v:b,3);
            first = radial_bin(1,2);
            last = radial_bin(9,2);
            if max(radial_bin(:,2)) == first && last
                radial_max = radial_bin(1,2);
                radial_max_row = 1;
            else
                radial_max = max(radial_bin(:,2));
                radial_max_row = find(radial_bin(:,2) == radial_max);
            end
            if size(radial_max_row) >= [2, 1]
                radial_max_row = radial_max_row(1,1);
            end
            radial_max_data(i,:) = radial_bin(radial_max_row,:);
        end
        
        
        
        theta = data(:,1)*(pi/180);
        ratio = data(:,2);
        radius = data(:,3);
        dimension = size(theta);
        lin = linspace(min(ratio), max(ratio), 5);
        radial_dimension = dimension(1,1)/2;
        % x = radius*cos(theta);
        % y = radius*sin(theta);
        [rad_velocity, vaz_vel] = calculateTransport(nl2current, nl2currentradius, file, rad, lng);
        [x,y,c] = pol2cart(theta, radius, ratio);
        X = reshape(x,radial_dimension,2);
        Y = reshape(y,radial_dimension,2);
        C = reshape(c,radial_dimension,2);
        clf
        d = log10(C);
        mn = min(d(:));
        rng = max(d(:));
        d = 1+63*(d-mn)/rng; %Self Scaled Data
        u = pcolor(X,Y,log10(C));
   
        set(gca,'YDir', 'reverse')
        set(gcf, 'Position', [350, 150, 730, 650]);
        shading interp
        hold on
        hC = colorbar; 
        colormap(jet(100))
        %L = [min(ratio) max(ratio)];
        %set(hC,'YTicklabel',L);
        L = logspace(0,ceil(log(max(ratio))),ceil(log(max(ratio)))+1);
        %l = 1+63*(log10(L)-mn)/rng; % Tick mark positions
        %if property == 'TEMP'
        %    set(hC, 'YTicklabel', lin)
        %else
        %   set(hC,'Ytick',0:1:log(max(ratio)),'YTicklabel',L);
        %end
        hold on
        
        
        h = polar((radial_max_data(:,1)*(pi/180)),radial_max_data(:,3), '.');
        set(h,'markersize', 25);
        set(h, 'color', 'w');
        daylabel = strcat('Day');
        
        
        %    TeXString = texlabel(daylabel); %DAY LABEL
        %   text(-1,0,TeXString); %DAY LABEL
        
        
        TeXString_90 = texlabel('90');
        a90 = text((5*cos(pi/2))-0.5,(5*sin(pi/2)),TeXString_90);
        a90.FontSize = 20;
        
        TeXString_180 = texlabel('180');
        a180 = text((5*cos(pi)),(5*sin(pi)),TeXString_180);
        a180.FontSize = 30;
        
        TeXString_270 = texlabel('270');
        y = text((5*cos((3*pi)/2))-0.7,(5*sin((3*pi)/2)),TeXString_270);
        species_array = {'sp','s2p','s3p','op','o2p','elec'};
        species_rename_array = {'S+','S++','S+++','O+','O++','electron'};
        y.FontSize = 30;
        %for s =1:6
        %   species_i = char(species_array(s));
        %  species_i
        % size(species_i)
        %if char(species) == species_i
        %   species = species_rename_array(s);
        %else
        %   species = species;
        %end
        %end
        
        if species == 'sp'
            species = 'S+';
        end
        
        TeXString_species = texlabel(species);
        h=text(-10,-9.5,TeXString_species);
        h.FontSize = 100;
        
        %if property == 'INTS'
        %    property = 'Intensity';
        %end
        %if property == 'NL2_'
        %    property = '';
        %end
        %if property == 'TEMP'
        %    property = 'Temperature';
        %end
        
        if property == 'DENS'
            property = 'Density';
        end
        %if property == 'MIXR'
        %    property = 'MixingRatio';
        %end
        
        TeXString_property = texlabel(property);
        p=text(5,-9.5,TeXString_property);
        p.FontSize = 30;
        
        %line = [min(radius):((max(radius))-(min(radius)))/rad:max(radius), 0];
        linetheta = 0;
        lineradius = min(radius):max(radius);
        [xline, yline] = pol2cart(linetheta, lineradius);
        plot(xline,yline, 'k')
        
        TexString_sr = texlabel(strcat('L =',num2str(min(radius))));
        u = text(min(xline)-2,min(yline), TexString_sr);
        u.FontSize = 15;
        %        daynumlabel = num2str(day-1);
        %       TeXString_num = texlabel(daynumlabel);
        %      text(0.5,0,TeXString_num)
        drawnow
        if vec_on == 1
        vectorfield(rad,lng,theta,radius,rad_velocity,vaz_vel, file);
        end
        
        frame = getframe;
        writeVideo(writerObj, frame);
        % end
        % end
    end
end
close(writerObj);
hold off