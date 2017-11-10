function [J] = jacob(q,i)
d1 = q(1); %#ok<NASGU>
q2 = q(2);
d3 = q(3);
if i==2
    i=1;
end
Jac = [
    0       -cos(q2)*d3      -sin(q2);
    0       -sin(q2)*d3     cos(q2);
    1       0               0;
    0       0               0;
    0       0               0;
    0       1               0;
    ];
J = padarray(Jac(1:3,1:i),[0 3-i], 0, 'post');

end

