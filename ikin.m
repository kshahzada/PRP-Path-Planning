function [q] = ikin(pos)
x = pos(1);
y = pos(2);
z = pos(3);

d1 = z;
d3 = (x^2+y^2)^0.5; %restrict d3 to always be positive
s2 = -x/d3;
c2 = y/d3;
q2 = atan2(s2,c2);
q=[d1,q2,d3];

end

