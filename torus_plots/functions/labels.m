function [] = labels(species, property, day )

%Adds labels for azimuth, species, property, units, and day. Consider
%redoing for effiency. 

    TeXString_90 = texlabel('90');
    a90 = text((5*cos(pi/2))-0.5,(11*sin(pi/2)),TeXString_90);
    a90.FontSize = 20;
    
    TeXString_180 = texlabel('180');
    a180 = text((11.7*cos(pi)),(5*sin(pi)),TeXString_180);
    a180.FontSize = 20;
    
    TeXString_270 = texlabel('270');
    y = text((5*cos((3*pi)/2))-0.7,(11*sin((3*pi)/2)),TeXString_270);
    
    y.FontSize = 20;
    if length(char(species)) == 2
        
        if char(species) == 'sp'
            species = 'S^{+}';
        else if char(species) == 'op'
                species = 'O^{+}';
            end
        end
    end
    if length(char(species)) == 3
        
        if char(species) == 's3p'
            species = 'S^{3+}';
        else if char(species) == 's2p'
                species = 'S^{2+}';
            else if char(species) == 'o2p'
                    species = 'O^{2+}';
                end
            end
        end
    end
    if length(char(species)) == 4
        char(species) == 'elec';
        species = 'Electron';
        
        TeXString_species = texlabel(species);
        h=text(-9,-9.5,TeXString_species);
        h.FontSize = 20;
        
    else
        TeXString_species = texlabel(species);
        h=text(-10,-9.5,TeXString_species);
        h.FontSize = 20;
    end
    if property == 'NL2_'
        property = 'NL^{2}';
        units = 'Flux-Tube Content';
        
    else if property == 'DENS'
            property = 'Density';
            units = '(cm^{-3})';
            
        else if property == 'TEMP'
                property = 'Temperature';
                units = '(eV)';
                
            else if property == 'MIXR'
                    property = 'Mixing Ratio';
                    units = '';
                    
                else if property == 'INTS'
                        property = 'Intensity';
                        units = '(cm^{-3}/eV)';
                        
                    else if property == 'MIXR'
                            property = 'MixingRatio';
                        end
                    end
                end
            end
        end
    end
    
    % ADD TEXT FOR UNITS
    TeXString_units = texlabel(units);
    p=text(6.5,-8.5,TeXString_units);
    p.FontSize = 20;
   
    TeXString_day = texlabel(strcat('Day_',num2str(day)));
    p=text(-10,10,TeXString_day);
    p.FontSize = 20;
    
    TeXString_property = texlabel(property);
    p=text(5,-9.5,TeXString_property);
    p.FontSize = 20;
    
   
end
