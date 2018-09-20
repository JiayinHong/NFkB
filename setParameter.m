function paramD=setParameter(param_set_i)

paramD = struct();

switch param_set_i
    case 1  % identical as Heltberg's paper
        paramD.knin = 5.4;
        paramD.klin = 0.018;
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
end

end