function t=linktrans(a,b,c,d)

syms alph an theta dn
alph = a; % dhparam(1);
an = b; % dhparam(2);
dn = c ;% dhparam(3);
theta = d; % dhparam(4);
sa = sin(alph); ca = cos(alph);
st = sin(theta); ct = cos(theta) ;

t = [	ct	-st	0	an; ...
    st*ca	ct*ca	-sa	-sa*dn; ...
    st*sa	ct*sa	ca	ca*dn; ...
    0	0	0	1];


end