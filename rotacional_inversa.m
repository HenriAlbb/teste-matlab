function angulos = rotacionalInversa(m)

b = atan2d(-m(3,1), sqrt(m(1,1)^2 + m(2,1)^2));

if b == 90
    a = 0;
    g = atan2d(m(1,2), m(2,2));
    r = 0;
    erro = 2;

    aT = a;
    gT = g;
    
    for j = gT:1:360
       i = 1;
       aT = aT + i;
       gT = gT + i;
       rAtual = cosd(aT)*sind(b)*sind(gT) - sind(aT)*cosd(gT);
       erroAtual = abs(abs(m(1,2)) - abs(rAtual));
       disp(aT);
       disp(gT);
       disp(rAtual);

       if (erroAtual <= erro)
        erro = rAtual;
        a = aT;
        g = gT;
       end
    end
    disp(erro);
    disp(r)
elseif b == -90
    a = 0;
    g = -atan2d(m(1,2), m(2,2));
else
    a = atan2d(m(2,1)/cosd(b), m(1,1)/cosd(b));
    g = atan2d(m(3,2)/cosd(b), m(3, 3)/cosd(b));
end


angulos = [a , b, g];

end

