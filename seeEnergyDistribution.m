function seeEnergyDistribution(nonscaled_weight, varargin )

%illustrates Energy landscape and landscape energy distribution

w = nonscaled_weight; 
figure; 
n = nargin; %number of variable inputs
  subplot(211); plot (w);
    title('Energy Landscape'); ylabel('Network Energy'); xlabel('State');
    xlim([ 0  length(w)/2]); %since energy landscape is symmetric, display only half
    hold on;
    subplot(212); 
    histogram(w, 'Normalization', 'Probability', 'BinWidth', 10); %display frequency distribution of al possible energy states
    title('Landscape Energy Distribution'); ylabel('Frequency'); xlabel('Network Energy');
    hold on; 

% for i = 1:n-1
%     subplot(211); plot (varargin{i});
%     title('Energy Landscape'); ylabel('Network Energy'); xlabel('State');
%     xlim([ 0  length(w)/2]); legend ('Normal Weighting', 'Pathological Weighting');
%     hold on;
%     subplot(212); 
%     histogram(varargin{i}, 'Normalization', 'Probability', 'BinWidth', 10); legend ('Normal Weighting', 'Pathological Weighting');
%     title('Landscape Energy Distribution'); ylabel('Frequency'); xlabel('Network Energy');
%     hold on; 
% end
hold off;


