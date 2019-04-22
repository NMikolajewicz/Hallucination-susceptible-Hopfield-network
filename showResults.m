function showResults(NetworkActivity,unqActive, Conv_n, Conv_p)
% prints some results (mainly network activity)
%plot pattern convergence outcomes to evaluate hallucinatory behaviour
global N
global n
global trials

display(' ' );
display(['Network Size: ' num2str(N)]); 
display(['Stored Patterns: ' num2str(n)]);
display(' ' );
display([ num2str((100/N)*mean(NetworkActivity(1,:))) '% +- ' num2str((100/N)*mean(NetworkActivity(3,:))) '% active neurons at any given time in normal network']);
display([ num2str((100/N)*mean(NetworkActivity(2,:))) '% +- ' num2str((100/N)*mean(NetworkActivity(4,:))) '% active neurons at any given time in pathological network']);
display(' ' );
% display([ num2str(mean(NetworkActivity(5,:))) ' +- ' num2str(mean(NetworkActivity(6,:))) ' pathological:normal neuron activation ratio']);
% display(' ' );
display([ num2str(mean(unqActive(1,:))) '% +- ' num2str(std(unqActive(1,:))) '% of neurons involved in normal network']);
display([ num2str(mean(unqActive(2,:))) '% +- ' num2str(std(unqActive(2,:))) '% of neurons involved in pathological network']);

%% plot some results

NAmean(1,:) = (100/N)*mean(NetworkActivity(1,:)); NAmean(2,:)  = (100/N)*mean(NetworkActivity(2,:));
NAstd(1,:) = (100/N)*mean(NetworkActivity(3,:)); NAstd(2,:) = (100/N)*mean(NetworkActivity(4,:));
uAmean(1,:) = mean(unqActive(1,:)); uAmean(2,:) = mean(unqActive(2,:));
uAstd(1,:) = std(unqActive(1,:)); uAstd(2,:) = std(unqActive(2,:));

figure;

subplot(121);
bar(NAmean); hold on;
errorbar(NAmean, NAstd, '.'); ylim ([0 110]);
set(gca,'XTickLabel',{'Normal', 'Pathological'});
ylabel('Active neurons at any given time in network (%)');
title ('Mean Neuronal Involvement');
subplot(122); 
bar(uAmean); hold on;
errorbar(uAmean, uAstd, '.'); ylim ([0 110]);
set(gca,'XTickLabel',{'Normal', 'Pathological'});
ylabel('Neuron involved in network (%)');
title ('Total Neuronal Involvement');

Conv(1,:) = 100*sum(Conv_n')/trials;
Conv(2,:) = 100*sum(Conv_p')/trials;

hallp = zeros(4,1);
halln = zeros(4,1);

for i = 1:trials
    if sum(Conv_p(:, i)) == 0 
        hallp(1) = hallp(1) + 1;
    elseif sum(Conv_p(:, i)) == 1
        hallp(2) = hallp(2) + 1;
    elseif sum(Conv_p(:, i)) == 2
        hallp(3) = hallp(3) + 1;
    elseif sum(Conv_p(:,i)) > 2
        hallp(4) = hallp(3) + 1;
    end
end

for i = 1:trials
    if sum(Conv_n(:, i)) == 0 
        halln(1) = halln(1) + 1;
    elseif sum(Conv_n(:, i)) == 1
        halln(2) = halln(2) + 1;
    elseif sum(Conv_n(:, i)) ==2
        halln(3) = halln(3) + 1;
            elseif sum(Conv_n(:,i)) > 2
        halln(4) = halln(3) + 1;
    end
end

hallp = 100*hallp/trials
halln = 100*halln/trials


figure;
for i = 1:4
        hall(i,:) = [halln(i) hallp(i)];
end

% hall(1,:) = halln;
% hall(2,:) = hallp;
bar(hall);
set(gca,'XTickLabel',{'no convergence', '1 pattern', '2 patterns', '>2 patterns'});
legend('Normal', 'Pathological');
title(['Pattern Convergence of Network, ' num2str(trials) ' trials']);
ylabel('Proportion of Instances (%)');



