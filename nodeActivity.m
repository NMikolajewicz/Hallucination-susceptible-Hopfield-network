function nodeActivity(w_norm, w_path, r_norm, r_path)

global N
k = 1:length(r_norm);
[B,XY] = bucky;

Normal_activity = 100*sum(r_norm)/N;
Path_activity = 100*sum(r_path)/N;


k = 1:length(r_norm);

temp = [];
for i = 1:length(r_norm)
    for j = 1:length(r_norm)
        if r_norm(i) == 1 & r_norm(j) ==1;
            temp = [temp; i j  1];
        else 
            temp = [temp; i j 0];
        end
    end
end

D = sparse(temp(:,1),temp(:,2),temp(:,3));

figure;
subplot(121);
gplot(w_norm,XY(k,:),'-*'); hold on;
gplot(D,XY(k,:),'r')
set(gca,'XTick', []); set(gca,'YTick', []);
title(['Normal Connectivity, ' num2str(Normal_activity) '% Active']); 
legend('All Possible Connections', 'Active Connections', 'Orientation', 'horizontal', 'Location', 'south');

temp = [];
for i = 1:length(r_path)
    for j = 1:length(r_path)
        if r_path(i) == 1 & r_path(j) ==1;
            temp = [temp; i j  1];
        else 
            temp = [temp; i j 0];
        end
    end
end

C = sparse(temp(:,1),temp(:,2),temp(:,3));

subplot(122);
gplot(w_path,XY(k,:),'-*'); hold on;
gplot(C,XY(k,:),'r')
set(gca,'XTick', []); set(gca,'YTick', []);
title(['Pathological Connectivity, ' num2str(Path_activity) '% Active']); 
legend('All Possible Connections', 'Active Connections', 'Orientation', 'horizontal', 'Location', 'south');


