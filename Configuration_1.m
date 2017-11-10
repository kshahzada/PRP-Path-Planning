%%
% *No Obstacle Avoidance*

%% Define/Create Start, Finish, & Obstacles

%Path Start (XYZ)
path_start = [5 5 5];

%Path End (XYZ)
path_end = [-5 -5 -5];

%Define spherical obstacles with radius (r), and centres at obs_locs
%(XYZ)
r = 1;
[sphere_x, sphere_y, sphere_z] = sphere();
obs_locs = [
    -1 1.001 -1;
    2 2.001 2;
    -2.001 -2 -2;
];
%% Path Plan
path = [path_start; path_end];

%% Plot Path and Obstacles
figure
plot3(path(:,1), path(:,2), path(:,3));
hold on
grid on
for i = 1:size(obs_locs,1)
surf(sphere_x*r + obs_locs(i,1), sphere_y*r + obs_locs(i,2), sphere_z*r + obs_locs(i,3))
end