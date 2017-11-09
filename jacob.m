function [J] = jacob(d1,q2,d3) %#ok<INUSL>
J = [
    0       cos(q2)*d3      -sin(q2);
    0       -sin(q2)*d3     cos(q2);
    1       0               0;
    0       0               0;
    0       0               0;
    0       1               0;
    ];
end

