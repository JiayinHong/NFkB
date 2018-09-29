function dy = Model_Alpha(t,y,paramD,input)

% unwrap the parameters
kNin = 	  paramD.kNin;
kIin =    paramD.kIin;
kt =      paramD.kt;
ktl =     paramD.ktl;
KI =      paramD.KI;
KN =      paramD.KN;
Kmig =    paramD.Kmig;
gammaR =  paramD.gammaR;
gammaP =  paramD.gammaP;
alpha =   paramD.alpha;
Ntot =    paramD.Ntot;
ka =      paramD.ka;
ki =      paramD.ki;
IKKtot =  paramD.IKKtot;
a0 =      paramD.a0;
a =       paramD.a;
ethanol = paramD.ethanol;
% #####################

switch input
    case 'sustained'    % constant stimulus level
        TNF = paramD.TNF;
    case 'sine'         % sinusoidal wave
        loadGlobal
        TNF = paramD.TNF * (sin(omega * t + phi) + 1);
    case 'square'       % square wave as experimental set-up
end

dy=zeros(5,1);
% #####################
% y(1): Nn(RelA) - nuclear NFkB concentration
% y(2): Im - IkB mRNA
% y(3): I - cytoplasmic IkB protein
% y(4): IKKa(Fus3) - active IkB kinase which phosphorylates IkB and resulting its
%              degradation
% y(5): Mig1 - transcriptional inhibit IkB
% #####################

dy(1) = kNin*(Ntot-y(1))*KI/(KI+y(3)) - kIin*y(3)*y(1)/(KN+y(1));
dy(2) = kt*y(1)^2 * Kmig/(Kmig+y(5)) - gammaR*y(2);
dy(3) = ktl*y(2) - alpha*y(4)*(Ntot-y(1))*y(3)/(KI+y(3));
dy(4) = ka*TNF*(IKKtot-y(4)) - ki*y(4);
dy(5) = a0 + a*ethanol - gammaP*y(5);

end