function seeAssociationStengths(AD_norm, AD_path)
%illustrate distribution of associations throughout entire time lapse

figure;
histogram(AD_norm, 'Normalization', 'Probability', 'BinWidth', 0.1); hold on
histogram(AD_path, 'Normalization', 'Probability', 'BinWidth', 0.1);
title('Pattern Retrieval at Rest');
legend('Normal Pattern Retrieval', 'Pathological Pattern Retrieval');
xlabel('Overlap with Stored Pattern');
ylabel('Frequency');
