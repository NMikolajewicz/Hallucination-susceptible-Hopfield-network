
function [w, r, pat] = GenNetwork(bias)

%bias is used to simulate active recal. let bias = 0 to observe behaviour
%at resting state

global N
global n

pat=2*floor(2*rand(N,n))-1; % Create random binary pattern - 500 node network, 10 pattern vectors generated, binary values: 1 or -1
w=(pat*pat')/n; % Hebbian learning, each node is interconnected (500x500), each connection defined by a weight.
for i = 1:length(pat);
    w(i,i) = 0; % no self connections
end

r=(2*rand(N,1)-1)+(bias*pat(:,1)); % Initialize network (random state, no bias)

return