function [e_net, e_dif]=energySteps(energy_trajectory)

e = energy_trajectory;
e_dif = e(2:end) - e(1:end-1);
e_net = sum(e_dif);
% e_disp = (abs(e_dif));

% histogram (e_dif);

