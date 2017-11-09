function [endPosition] = fkin(d1,q2,d3)
endPosition=[
    cos(q2)     0       -sin(q2)    -sin(q2)*d3;
    sin(q2)     0       cos(q2)     cos(q2)*d3;
    0           -1      0           d1;
    0           0       0           1;
    ];
end

