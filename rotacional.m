function m = rotacional(a, b, g)



m1 = [cosd(a) -sind(a) 0; sind(a) cosd(a) 0; 0 0 1];
m2 = [cosd(b) 0 sind(b); 0 1 0; -sind(b) 0 cosd(b)];
m3 = [1 0 0; 0 cosd(g) -sind(g); 0 sind(g) cosd(g)];


m = m1*m2*m3;

%m = [(cosd(a)*cosd(b)) (cosd(a)*sind(b)*sind(g) - sind(a)*cosd(g)) (cosd(a)*sind(b)*cosd(g) + sind(a)*sind(g))]

end

