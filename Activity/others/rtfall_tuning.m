denoise_thresh = 0.02;
noisy_thresh   = .1;
acc_f1score    = 0; 

for M = 11 : 30
    noisy_thresh = M/100;
    rtfall_implementation;
    feature_mat( ~any(feature_mat,2), : ) = [];
    feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];

    svm_example
    if(accuracy*f1_score > acc_f1score)
        
        acc_f1score   = accuracy*f1_score
        max_acc       = accuracy
        max_f1score   = f1_score
        opt_noise_thr = noisy_thresh;

   end
end
noisy_thresh = opt_noise_thr;
% for M = opt_noise_thr*1000-9 : opt_noise_thr*1000+10
%     noisy_thresh = M/100;
%     rtfall_implementation;
%     feature_mat( ~any(feature_mat,2), : ) = [];
%     feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
% 
%     random_forest_example
%     if(accuracy*f1_score > acc_f1score)
%         
%         acc_f1score = accuracy*f1_score
%         max_acc     = accuracy
%         max_f1score = f1_score
%         opt_noise_thr   = noisy_thresh;
% 
%    end
% end

acc_f1score=0
for M = 10:20
    denoise_thresh = M/100;
    rtfall_implementation;
    feature_mat( ~any(feature_mat,2), : ) = [];
    feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];

    svm_example
    if(accuracy*f1_score > acc_f1score)
        
        acc_f1score = accuracy*f1_score
        max_acc     = accuracy
        max_f1score = f1_score
        opt_denoise_thr = denoise_thresh

   end
end

% for M = opt_noise_thr2*100-10 : opt_noise_thr2*100+10
%     denoise_thresh = M/100;
%     rtfall_implementation;
%     feature_mat( ~any(feature_mat,2), : ) = [];
%     feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
% 
%     random_forest_example
%     if(accuracy*f1_score > acc_f1score)
%         
%         acc_f1score = accuracy*f1_score
%         max_acc     = accuracy
%         max_f1score = f1_score
%         opt_noise_thr2   = denoise_thresh;
% 
%    end
% end