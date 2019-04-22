function seeWeights(varargin )

figure;
n = nargin;
maxcolor = max(max(max(varargin{:})));
mincolor = min(min(min(varargin{:})));
for i = 1:n
    subplot(1,n, i);
    imagesc(varargin{i});
    col = colorbar; caxis([mincolor maxcolor]);
    if i == 1
        title('Normal Weights');
    else
        title('Pathological Weights');
    end
    xlabel('Node i'); ylabel('Node j');
    ylabel(col, 'Weight');
end

