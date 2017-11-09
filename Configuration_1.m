
r = 4;
[sphere_x, sphere_y, sphere_z] = sphere();
obs_locs = [
    1 1 1;
    10 5 8;
    -10 -7 -2;
];

path=[1 1 1;
      -10, -10, -10];

figure
plot3(path(:,1), path(:,2), path(:,3));
hold on
grid on
for i = 1:size(obs_locs,1)
surf(sphere_x*r + obs_locs(i,1), sphere_y*r + obs_locs(i,2), sphere_z*r + obs_locs(i,3))
end