function [d1, q2, d3] = ikin(x,y,z)
d1 = z;
d3 = (x^2+y^2)^0.5; %resstrict d3 to always be positive
s2 = y/d3;
c2 = x/d3;
q2 = atan2(s2,c2);
end

