function [AllStates] = EnergyLandscape(w, stateMag)
global N 
global n 

binary = [-1, 1];

for i = 1:N;
    array{1,i} = binary;
end

states = allcomb(array{:});

for i = 1:(2^N);
    E(i) = NetEnergy(w, states(i,:), N, stateMag);
end
AllStates = E;
