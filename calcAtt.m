function [F_Att] = calcAtt(cur_Pos, goal_Pos, z)
%Define Parameters
d = 1;

%calculate vector between force and goal
dist_vector = cur_Pos(1:3,4)-goal_Pos(1:3,4);
dist_mag = norm(dist_vector, 2);

%calculate force
if dist_mag <= d
    F_Att = -z*dist_vector;
else 
    F_Att = -d*z*dist_vector/dist_mag;
end
end

