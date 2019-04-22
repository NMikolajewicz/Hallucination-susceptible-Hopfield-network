function w = scaleWeights(w, scale);

s  = scale; 
% minweight = min(min(min(w)));
% w = w+(abs(minweight))+1;
% w = (w.^(s));
% center = mean(mean(w));
% w = w-center;
w = zscore(w)*s;


