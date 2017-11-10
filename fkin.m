function [endPosition] = fkin(q)
d1 = q(1);
q2 = q(2);
d3 = q(3);

endPosition(1,:,:)=[
    1           0       0           0;
    0           1       0           0;
    0           0       1           d1;
    0           0       0           1;
    ];
endPosition(2,:,:)=[
    cos(q2)     0       -sin(q2)    0;
    sin(q2)     0       cos(q2)     0;
    0           -1      0           d1;
    0           0       0           1;
    ];
endPosition(3,:,:)=[
    cos(q2)     0       -sin(q2)    -sin(q2)*d3;
    sin(q2)     0       cos(q2)     cos(q2)*d3;
    0           -1      0           d1;
    0           0       0           1;
    ];
end

