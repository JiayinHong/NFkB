tspan = [0 3000];
y0 = [0.001, 0.001, 18, 0.23, 0.76];
paramD = setParameter(1);
input = 'periodical';   % choose from 'sustained' or 'periodical'

[t,y]=ode23tb(@(t,y) ModelD(t,y,paramD,input),tspan,y0);

switch input
    case 'sustained'
        TNF = repmat(paramD.TNF,[length(t),1]);
    case 'periodical'
        loadGlobal
        TNF = paramD.TNF * (sin(omega * t + phi) + 1);
end

figure; set(gcf,'position', [360 267 798 431]); plot(t,5*y(:,1),'LineWidth',1.5)
hold on; plot(t,TNF,'c','LineWidth',1.5)
set(gca,'FontSize',14)
legend({'5X NF${\kappa}$B','TNF${\alpha}$'},'Interpreter','latex')