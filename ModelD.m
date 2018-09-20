function dy = ModelD(t,y,paramD,input)

% unwrap the parameters
knin = 	 paramD.knin;
klin =   paramD.klin;
kt =     paramD.kt;
ktl =    paramD.ktl;
KI =     paramD.KI;
KN =     paramD.KN;
gamma =  paramD.gamma;
alpha =  paramD.alpha;
Ntot =   paramD.Ntot;
ka =     paramD.ka;
ki =     paramD.ki;
kp =     paramD.kp;
KA20 =   paramD.KA20;
IKKtot = paramD.IKKtot;
A20 =    paramD.A20;
% #####################

switch input
    case 'sustained'
        TNF = paramD.TNF;
    case 'periodical'
        loadGlobal
        TNF = paramD.TNF * (sin(omega * t + phi) + 1);
end

dy=zeros(5,1);
% #####################
% y(1): Nn - nuclear NFkB concentration
% y(2): Im - IkB mRNA
% y(3): I - cytoplasmic IkB protein
% y(4): IKKa - active IkB kinase which phosphorylates IkB and resulting its
%              degradation
% y(5): IKKi - inactive IkB kinase
% #####################

dy(1) = knin*(Ntot-y(1))*KI/(KI+y(3)) - klin*y(3)*y(1)/(KN+y(1));
dy(2) = kt*y(1)^2 - gamma*y(2);
dy(3) = ktl*y(2) - alpha*y(4)*(Ntot-y(1))*y(3)/(KI+y(3));
dy(4) = ka*TNF*(IKKtot-y(4)-y(5)) - ki*y(4);
dy(5) = ki*y(4) - kp*y(5)*KA20/(KA20+A20*TNF);

end