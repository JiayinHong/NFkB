plot_option = 'clear';  % choose from 'shade','std','cv','clear'

load('period60.mat')
t = time .* 60; % time in minutes
TNFonly_per60 = plot_helper(scZBZ274_period60_alphafactor);
ethanolPlus_per60 = plot_helper(scZBZ274_period60_alphafactor_ethanol);

load('period30.mat')
TNFonly_per30 = plot_helper(scZBZ274_period30_alphafactor);
ethanolPlus_per30 = plot_helper(scZBZ274_period30_alphafactor_ethanol);

config = [TNFonly_per60, ethanolPlus_per60, TNFonly_per30, ethanolPlus_per30];
configNames = {'TNFonly_per60', 'ethanolPlus_per60', 'TNFonly_per30', 'ethanolPlus_per30'};


figure; set(gcf,'position', [247 166 1000 532])
for i=1:length(config)
    subplot(2,2,i)
    switch plot_option
        case 'shade'    % show shaded error bar
            shadedErrorBar(t,config(i).transposedValue,{@mean,@std}...
                ,'lineprops',{'-bo','MarkerFaceColor','g'});
            
        case 'std'  % show standard deviation
            errorbar(t,config(i).mean,config(i).std,'-s'...
                ,'MarkerSize',6,'MarkerEdgeColor','red','MarkerFaceColor','red')
            
        case 'cv'   % show coefficient of variation
            errorbar(t,config(i).mean,config(i).cv,'-s'...
                ,'MarkerSize',6,'MarkerEdgeColor','red','MarkerFaceColor','red')
            
        case 'clear'    % only show the mean
            plot(t,config(i).mean,'LineWidth',1.5)
    end
    grid on; title(changeunderscore(configNames{i}))
    xlim([-5 370]); xticks(0:60:t(end)); xlabel('time (min)'); ylabel('nuclear NF{\kappa}B')
    set(gca,'FontSize',14)
end
linkaxes

function res = plot_helper(raw)
res.transposedValue = (raw ./ (1+raw))';
res.mean = mean(res.transposedValue,1);
res.std = std(res.transposedValue,1);
res.cv = res.std ./ res.mean;
end