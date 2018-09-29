function paramD=setParameter(param_set_i)

paramD = struct();

switch param_set_i
    case 1  % for Model_Mogens
        % identical as Heltberg's paper
        paramD.kNin = 5.4;
        paramD.kIin = 0.018;
        paramD.kt = 1.03;
        paramD.ktl = 0.24;
        paramD.KI = 0.035;
        paramD.KN = 0.029;
        paramD.gamma = 0.018;
        paramD.alpha = 1.05;
        paramD.Ntot = 1.0;
        paramD.ka = 0.24;
        paramD.ki = 0.18;
        paramD.kp = 0.036;
        paramD.KA20 = 0.0018;
        paramD.IKKtot = 2.0;
        paramD.A20 = 0.0026;
        paramD.TNF = 0.5;
        
    case 2  % for Model_Alpha
        paramD.kNin = 5.4;
        paramD.kIin = 0.018;
        paramD.kt = 1.03;
        paramD.ktl = 0.24;
        paramD.KI = 0.035;
        paramD.KN = 0.029;
        paramD.Kmig = 4;        % to get a wider dynamic range
        paramD.gammaR = 0.018;
        paramD.gammaP = 0.015;  % half-life is 1.2 fold or so of mRNA
        paramD.alpha = 1.05;
        paramD.Ntot = 1.0;
        paramD.ka = 0.24;
        paramD.ki = 0.18;
        paramD.IKKtot = 2.0;
        paramD.a0 = 0.03;
        paramD.a = 0.18;
        paramD.TNF = 0.5;
        paramD.ethanol = 0;
end

end