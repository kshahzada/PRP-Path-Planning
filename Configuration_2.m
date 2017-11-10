%%
% *No Obstacle Avoidance*

%% Define/Create Start, Finish, & Obstacles
clear all %#ok<*CLALL>
close all
%Path Start (XYZ)
path_start = [0 5 6];

%Path End (XYZ)
path_end = [5 0 1];

%Define spherical obstacles with radius (r), and centres at obs_locs
%(XYZ)
r = 1;
[sphere_x, sphere_y, sphere_z] = sphere();
obs_locs = [
    -1 1.001 -1;
    2 2.001 2;
    3.9 4 5;
    ];
%% Path Plan
cur_q = ikin(path_start);
end_q = ikin(path_end);

cur_pos = fkin(cur_q);
end_pos = fkin(end_q);

path = squeeze(cur_pos(3,1:3,4));

for k = 1:1000
%while norm(path_end-cur_pos(3,1:3,4),2)>0.01
    t = zeros(1,3);
    %calculate torques per joint
    for i = 1:size(cur_pos,1)
        %add attraction to goal
        cur_t = (jacob(cur_q,i)'*calcAtt(squeeze(cur_pos(i,:,:)),squeeze(end_pos(i,:,:)), 1))';
        t = t + cur_t;
        
        %
        for j = 1:size(obs_locs,1)
           cur_t = (jacob(cur_q,i)'*calcRep(squeeze(cur_pos(i,:,:)),obs_locs(i,:),1,r))';
           t = t + cur_t;
        end
    end
    step = 0.01*t/norm(t,2);
    cur_q = cur_q + step;
    cur_pos = fkin(cur_q);
    
    path = vertcat(path, squeeze(cur_pos(3,1:3,4)));
    squeeze(cur_pos(3,1:3,4));
end



%% Plot Path and Obstacles
figure
plot3(path(:,1), path(:,2), path(:,3));
hold on
grid on
for i = 1:size(obs_locs,1)
    surf(sphere_x*r + obs_locs(i,1), sphere_y*r + obs_locs(i,2), sphere_z*r + obs_locs(i,3))
end