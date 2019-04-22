% ilustrate Guassian White noise

close all; clear all; 


for i = 1:100
    SNR (i,1) = 0;
    SNR (i,2) = 0;
    SNR (i,3) = 0;
    SNR(i,2) = awgn(SNR (i,2), 10);
    SNR(i,3) = awgn(SNR (i,3),1);
end
plot (SNR(:,1)); hold on; plot (SNR(:,2));  plot (SNR(:,3));
legend('Original Signal', 'SNR = 10', 'SNR = 1');
xlabel ('Time');
ylabel ('Signal');