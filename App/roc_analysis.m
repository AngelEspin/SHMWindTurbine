function [TPR,FPR,ROC_AUC] = roc_analysis(c_actual,dam_stat)

n = numel(c_actual);
C = unique(c_actual);
thr = sort(dam_stat);

FPR = zeros(n,1);
TPR = zeros(n,1);

for i=1:n
    
    FPR(i) = sum( dam_stat( c_actual==C(1) ) > thr(i) ) / sum( c_actual==C(1) );
    TPR(i) = sum( dam_stat( c_actual~=C(1) ) > thr(i) ) / sum( c_actual~=C(1) );

end

ROC_AUC = -trapz(FPR,TPR);