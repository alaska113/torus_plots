function [rad_velocity, vaz_vel] = calculateTransport(nl2, r, file, rad, lng)
RJ = 71492; %Radius of Jupiter in km
inputsdata = importdata(strcat('/Users/khan113/Documents/', file, '/2D_Model-master/inputs.dat'));
dllos = char(inputsdata(9,1));
dllas = char(inputsdata(10,1));
dllo = str2num(dllos(1:6));
dlla = str2num(dllas(1:3));
for j = 2:rad
    for i = 1:lng+1
        vaz_vel(i,j) = -3.0 + abs(r(i,1,j)-6.8);
        if vaz_vel(i,j) > 0
            vaz_vel(i,j) = 0;
        end
        dll = (dllo)*((r(i,1,j)/6.0)^(dlla));
        stuff(i,j) = (dll/((r(i,1,j))^2)*((nl2(i,1,j)-nl2(i,1,j-1))/(r(i,1,j)-r(i,1,j-1))));
        if j > 1
            transport(i,j) = ((-nl2(i,1,j))/(r(i,1,j)^2))*(r(i,1,j)-r(i,1,j-1))/(stuff(i,j));
            rad_velocity(i,j) = (((r(i,1,j) - r(i,1,j-1))*RJ)/transport(i,j));
        end
    end
end
end