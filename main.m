%% Hallucination-susceptible Hopfield Network

%Nicholas Mikolajewicz
%For questions: Nicholas.mikolajewicz@mail.mcgill.ca

%everything is set up so that you can run and receive results similar to those seen in term paper.

%parameters that you can play with (values used in paper are in brackets):
%N -> size of network (15)
%time -> length of simulation (500)
%trials -> number of repeats (each uses randomly generated patterns) (50)
%SNR_norm -> noise in healthy network (10)
%SNR_path -> noise in schizophrenic network (1)
%PerceptionThreshold -> Overlap between network state and stored pattern to be considered successful pattern recal (1)
%bias -> can introduce bias to initial state like in normal hopfield network (0)

clear all;
close all;

global N % total number of nodes
global n %number of stored patterns
global time % time over which network will run
global figurePause %toggle for realtime visualization of network evolution
global go % toggle for energy landscape visualization (computationally heavy)
global trials % number of trials 

N = 15; % size of network, number of nodes
n = floor(N/(4*(log10(N)))); %optimal number of stored patterns %
time = 500; %number of iterations 
trials = 50; %number of trials

scale_norm = 1; %normal weighting
scale_path =1; %pathological weighting
SNR_norm = 10; %Adjust SNR for healthy network HERE
SNR_path = 1; % Adjust SNR for schizophrenia network HERE
AllStates_norm = []; %do not change
AllStates_path = []; % do not change
ActFun_norm = 0; %Offset activation function (change threshold of activation)
ActFun_path = 0;
stateMag_norm = 1; % scaling facor for binary states, do not change
stateMag_path = 1;
bias = 0;
PerceptionThreshold = 1; %overlap required between current state and stored pattern to be consider "perceived"

%toggle options
showHeat = 0; %0 or 1, option to illustrate heat map of associations
figurePause = 0; %0 or 1, show real-time evolution of network energy
go = 1; %0 or 1, compute energy landscapes...computationally heavy

%% 

for i = 1:trials
    display([num2str(100*i/trials) '% Complete']);
     close all; %comment out to see figures from each trial
[w, r, pat] = GenNetwork(bias); % generate hopefield network and initialize
w_norm = w; w_path = w;
seeWeights(w_norm);

if go ==1
    AllStates_norm = EnergyLandscape(w_norm, stateMag_norm); % generate the energy landscape of the network
    AllStates_path = EnergyLandscape(w_path, stateMag_path);   
    seeEnergyDistribution (AllStates_norm, AllStates_path);
end

[e_norm, active_norm, AD_norm, perception_norm, ToP, unqActive_norm, unqA_norm, conv_norm] = Visualize(r, SNR_norm, pat, AllStates_norm, w_norm,scale_norm,showHeat, ActFun_norm, stateMag_norm, PerceptionThreshold);
[e_path, active_path, AD_path, perception_path, ToP1, unqActive_path, unqA_path, conv_path] = Visualize(r, SNR_path, pat, AllStates_path, w_path, scale_path,showHeat, ActFun_path, stateMag_path, PerceptionThreshold);

seeNetworkActivity(active_norm, active_path);
% seeAssociationStengths(AD_norm, AD_path);
seeEnergyDisplacement(e_norm, e_path);

Conv_n(:,i) = conv_norm;
Conv_p(:,i) = conv_path;

percep_current_norm(:,i) = perception_norm(:,end);
percep_current_path(:,i) = perception_path(:,end);
NetworkActivity(1,i) = mean(active_norm(5:end)); NetworkActivity(2,i) = mean(active_path(5:end));
NetworkActivity(3,i) = std(active_norm(5:end)); NetworkActivity(4,i) = std(active_path(5:end));
NetworkActivity(5,i) = mean(active_path(5:end) ./ active_norm(5:end)); NetworkActivity(6,i) = std(active_path(5:end) ./ active_norm(5:end));
unqActive(1,i) = unqActive_norm; unqActive(2,i) = unqActive_path; 
end 

if N<21
nodeActivity(w_norm, w_path, unqA_norm, unqA_path);
end 
showResults(NetworkActivity,unqActive, Conv_n, Conv_p );
