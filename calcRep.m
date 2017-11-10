function [F_rep] = calcRep(cur_Pos, obs_Pos, n, r)
%Define Parameters
p0 = 1;

%calculate vector between force and goal
dist_vector = cur_Pos(1:3,4)-obs_Pos';
dist_unit_vec = dist_vector/norm(dist_vector,2);
dist_vector = dist_vector - r*dist_unit_vec; %subtract r to align distance to the surface of the sphere
dist_mag = norm(dist_vector, 2);

%calculate force
if dist_mag > p0
    F_rep = zeros(3,1);
else
    F_rep = n*(dist_mag^-1-p0^-1)*dist_mag^-2*dist_unit_vec;
end
end

