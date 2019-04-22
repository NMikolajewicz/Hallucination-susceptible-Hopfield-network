function seeNetworkActivity(active_norm, active_path)

%illustrate number of active nodes (neurons) at each time point

global time 

figure;
plot ([1:time], active_norm); hold on; 
plot ([1:time], active_path);

title ('Network Activtiy'); ylabel('Number of Active Neurons'); xlabel('Time');
legend (['Normal Activity, ' num2str(mean(active_norm)) ' neurons' ], ['Pathological Activity, ' num2str(mean(active_path)) ' neurons' ]);