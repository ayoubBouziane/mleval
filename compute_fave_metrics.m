function perf = compute_fave_metrics(y, yhat, yscore)
% COMPUTE_FAVE_METRICS(y, yhat, yscore) Convenience function to calculate
% our favorite performance metrics.
% 
% INPUT
%   y       true labels (Assumes positive class is +1)
%   yhat    predicted labels
%   yscore  decision values (probabilities, SVM output, etc.)
%
% RETURNS
%   perf.a      accuracy
%   perf.f1     F1 sore
%   perf.p      precision
%   perf.r      recall
%   perf.mcc    matthews correlation coefficient
%   perf.auroc  area under ROC
%   perf.auprc  area under P/R curve
%   perf.gm     geometric mean of precision, recall 
%
% NOTE: assumes labels are numeric, where 1 is positive class and
% negative class is ~= 1.
%
% Author: Dave Kale (dkale@usc.edu)


perf.a = accuracy(y, yhat);
[ perf.f1, perf.p, perf.r ] = fscore(y, yhat);
perf.mcc = mcc(y, yhat);
[ perf.auroc, ~, ~ ] = auroc(y, yscore);
[ perf.auprc ] = auprc(y, yscore);
[ perf.gmean, ~, ~ ] = gmean_pr(y, yhat);

% perf.s = sprintf(' Acc=%5.5g  Prec=%5.5g   Rec=%5.5g    F1=%5.5g    GM=%5.5g   MCC=%5.5g  AUROC=%5.5g  AUPRC=%5.5g', perf.a, perf.p, perf.r, perf.f1, perf.gmean, perf.mcc, perf.auroc, perf.auprc);