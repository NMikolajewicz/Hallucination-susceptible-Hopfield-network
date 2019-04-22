function seeEnergyDisplacement(e_norm,e_path )

[enet_norm, edif_norm] = energySteps(e_norm);
[enet_path, edif_path] = energySteps(e_path);
figure; 
% subplot(211);
% 
% [acount,abin] = hist (edif_path,10); 

histogram(edif_norm,'BinWidth',2, 'Normalization', 'Probability'); hold on;
histogram (edif_path,'BinWidth',2,  'Normalization', 'Probability'); 
title('Distribution of Energy Steps');
xlabel('Energy Step'); ylabel('Frequency');
legend('Normal Energy Steps', 'Pathological Energy Steps');
xlim([-3*std(edif_path) 3*std(edif_path) ]);

ncd = cumsum(edif_norm);
pcd = cumsum(edif_path);

ncda = cumsum(abs(edif_norm));
pcda = cumsum(abs(edif_path));

% figure;
% subplot(211); %energy change with each iteration
% plot(ncd); hold on; plot(pcd);
% legend(['Normal Energy, ' num2str(enet_norm)], ['Pathological Energy' num2str(enet_path)]);
% xlabel('Iteration'); ylabel ('Energy Change');


% subplot(212);
% plot(ncda); hold on; plot(pcda);
% legend('Normal Energy' , 'Pathological Energy');
% xlabel('Iteration'); ylabel ('Cumulative Energy Change'); 
% title('Cumulative Energy Change');
