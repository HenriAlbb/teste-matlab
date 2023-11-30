function angulos = AngulosDeEuler(m)

b = atan2d(-m(3,1), sqrt(m(1,1)^2 + m(2,1)^2));

if b == 90
    a = 0;
    g = atan2d(m(1,2), m(2,2));  
elseif b == -90
    a = 0;
    g = -atan2d(m(1,2), m(2,2));
else
    a = atan2d(m(2,1)/cosd(b), m(1,1)/cosd(b));
    g = atan2d(m(3,2)/cosd(b), m(3, 3)/cosd(b));
end


angulos = [a , b, g];

end

