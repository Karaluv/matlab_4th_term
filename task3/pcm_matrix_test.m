% Define the positions and types of atoms in a water molecule
XYZ = [0.000  0.000  0.117;
       0.000  0.757 -0.469;
       0.000 -0.757 -0.469];
types = {'O', 'H', 'H'};

% Generate and visualize the molecule surface
[P, F, S, N, C] = my_surf(XYZ, types);


M = pcm_matrix(P, N, S)