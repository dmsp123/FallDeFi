cv_folds=10;

% n           = size(feature_mat,1);
% ordering    = randperm(n);
% feature_mat = feature_mat(ordering, :)
   
% hype_opt = true;
%  used_feat = 1:13;

%% across rooms rtfall
hype_opt = true;
% used_feat = 1:14;

% end_val=169;bestc=8192;bestg=.02;
% feature_mat = [ feature_mat_lab2_rtfall_smote; feature_mat_kitchen1_rtfall_smote; feature_mat_kitchen2_rtfall_smote];
% acc:53.0201  f1 score:59.3023, precision:54.2553, recall:65.3846
% fpr:60.5634  275

% feature_mat = [ feature_mat_lab2_rtfall_smote; feature_mat_bedroom1_rtfall_smote; feature_mat_bedroom2_rtfall2_smote];
% acc:49.7942  f1 score:45.045, precision:55.5556, recall:37.8788
% fpr:36.036 243

% feature_mat = [ feature_mat_lab2_rtfall_smote; feature_mat_bathroom1_rtfall_smote; feature_mat_bathroom2_rtfall_smote];
% acc:46.8553  f1 score:52.3944, precision:42.8571, recall:67.3913 fpr:68.8889  348

% feature_mat = [ feature_mat_lab2_rtfall_smote; feature_mat_corridor1_rtfall_smote; feature_mat_corridor2_rtfall_smote];
% acc:55.4455  f1 score:69.7987, precision:55.3191, recall:94.5455
% fpr:91.3043  303

%% same room rtfall
% end_val  = 147;
% feature_mat = [feature_mat_kitchen1_rtfall_smote;feature_mat_kitchen2_rtfall_smote];
% bestc=128; bestg=1;
% 72.7273  f1 score:71.7949, precision:68.8525, recall:75 fpr:29.2308 147
% 56.2914  f1 score:67.3267, precision:56.6667, recall:82.9268, fpr:75.3623
%  128
% 

% end_val=156;
% feature_mat = [ feature_mat_bedroom2_rtfall_smote; feature_mat_bedroom1_rtfall_smote];%bestc=5.5;bestg=2;
% bestc=6; bestg=.05;
% 60.8974  f1 score:69.6517, precision:63.0631, recall:77.7778 fpr:65.1515
% 156
%63.4615  f1 score:75.1092, precision:60.1399, recall:100, fpr:81.4286 87


% end_val=163;
% feature_mat = [ feature_mat_bathroom2_rtfall_smote; feature_mat_bathroom1_rtfall_smote];bestc=64;bestg=2;
% acc:67.1756  f1 score:69.0647, precision:64.8649, recall:73.8462
% fpr:39.3939  185
% acc:54.8387  f1 score:48.5294, precision:42.3077, recall:56.8966,
% fpr:46.3918  163

%  end_val = 111;
% end_val = 192; feature_mat = [ feature_mat_corridor2_rtfall_smote; feature_mat_corridor1_rtfall_smote;];bestc=4096; bestg=10.9;
%acc:63.964  f1 score:63.6364, precision:79.5455, recall:53.0303, fpr:20
%111
% acc:41.6667  f1 score:16.4179, precision:31.4286, recall:11.1111,
% fpr:25.8065 192

% max_f1_score=0;
% max_accuracy=0;
% for bestc= 1:10
%     for  bestg=1:10
        
        % feature_mat = [feature_mat_bedroom1_rtfall_smote; feature_mat_bedroom2_rtfall_smote];
        % feature_mat = [feature_mat_bathroom1_rtfall_smote; feature_mat_bathroom2_rtfall_smote];
        % feature_mat = [feature_mat_corridor1_rtfall_smote; feature_mat_corridor2_rtfall_smote];
        
        %% across rooms falldefi
%          bestc=16384 ;  bestg = .08 ;%end_val=178;
%         feature_mat = [ feature_mat_lab2_smote;
%         feature_mat_kitchen1_smote; feature_mat_kitchen2_smote]; 357
%          used_feat=[ 8   11    12    13 ];%    3     4     6     8     9];
        % acc:81.5085  f1 score:82.243, precision:77.533, recall:87.5622, fpr:24.2857
        
%          end_val = 178; feature_mat=[ feature_mat_lab2_smote;   feature_mat_bedroom1_smote; feature_mat_bedroom2_smote]; 
%          used_feat=[  8   11  12  13 ];%    2     3     4     8];
        %  acc:78.6624  f1 score:77.4411, precision:79.8611, recall:75.1634
        %  fpr:18.0124 314
        
%           end_val = 178; feature_mat=[feature_mat_lab2_smote;  feature_mat_bathroom1_smote; feature_mat_bathroom2_smote];
%          used_feat=[  8   11   12    13 ];%    1     2     9]
        % acc:77.591  f1 score:76.4706, precision:76.4706, recall:76.4706
        % fpr:21.3904  357
%          hype_opt = false;  

%          end_val = 178; feature_mat=[feature_mat_lab2_smote;  feature_mat_corridor1_smote; feature_mat_corridor2_smote];
%          used_feat=[  8   11   12  13];%    1     2     3    10]
        % acc:82.9431  f1 score:84.8665, precision:82.659, recall:87.1951
        % fpr:22.2222 299
                                         
                                         
    % 1. Start to max freq time/max freq to end time
    % 2. Power burst curve area above threshold/area below threshold
    % 3. Extreme frequency
    % 4. (Extreme) Torso frequency
    % 5. Std torso frequency
    % 6. Extreme frequency/Extreme torso frequency-
    % 7. Std extreme frequency
    % 8. Event duration (from PBC)
    % 9. Mean torso frequency
    % 10. Mean extreme frequency
    % 11. Spectral entropy (10 to max freq)
    % 12. Spectral entropy (1 to 10)
    % 13. Fractal dimension                                 
        % 3 6 8 9 11 12 13 = kitchen, bed
        % 2 4 5 9 11 12 = corr, bath  
        
        %% same room falldefi different people
%   hype_opt = false;     
%   used_feat = 1:4;%2:13;bestc=512;bestg=8;%acc:71.1864  f1 score:62.7737, precision:72.8814, recall:55.1282)
%   end_val = 59;  feature_mat = [ feature_mat_lab2me;feature_mat_lab2other];%bestc=16384 ;  %bestg = .0625 ;
%   bestc=64;bestg=1.6;
%   acc:85.7143  f1 score:82.6087, precision:86.3636, recall:79.1667, fpr:9.375
%   bestc=16;bestg=1;
%   acc:83.9286  f1 score:80.8511, precision:76, recall:86.3636, fpr:17.6471

%         hype_opt = false;     
%   used_feat = 1:4;%2:13;bestc=512;bestg=8;%acc:71.1864  f1 score:62.7737, precision:72.8814, recall:55.1282)
%     feature_mat = [ feature_mat_kitchenother;feature_mat_kitchenme];%bestc=16384 ;  %bestg = .0625 ;
%  bestc=4000;bestg=.0313; acc:77.451  f1 score:74.7253, precision:85, recall:66.6667, fpr:11.7647 end_val = 65;
% end_val = 46;  bestc=16000;bestg=.125; acc:78.0556  f1 score:74.7604, precision:87.9699, recall:65, fpr:8.88889


hype_opt = false;
%% different rooms different persons
%    end_val = 59;  feature_mat = [ feature_mat_lab2me;feature_mat_smote_kitchenother];%bestc=16384 ;  
% bestc=64;bestg=1.6;  %acc:75.817  f1 score:74.9153, precision:77.8169,
% recall:72.2222, fpr:20.5882 70
% end_val = 70;  feature_mat = [ feature_mat_smote_kitchenother;feature_mat_lab2me];bestc=16384 ;bestg=.5
% acc:75.7059  f1 score:74.7709, precision:77.7637, recall:72, fpr:20.5882


%     feature_mat = [feature_mat_lab2other;feature_mat_smote_kitchenme];%bestc=16384 ;  %bestg = .0625 ; 85
%   end_val = 56; bestc=16;bestg=20;%acc:72.7778  f1 score:72, precision:74.1176, recall:70, fpr:24.4444
% end_val = 85; bestc=64;bestg=6;
% 74.1503   73.3166   75.7883   71.0036

%% different rooms same person
% end_val = 85;feature_mat = [feature_mat_smote_kitchenme;feature_mat_lab2me];
% acc:85.1765  f1 score:85.5835, precision:83.2962, recall:88, fpr:17.6471
% 59
% end_val = 59;feature_mat =
% [feature_mat_lab2me;feature_mat_smote_kitchenme]; 85
% acc:84.3056  f1 score:83.1595, precision:89.7106, recall:77.5, fpr:8.88889
%  84.6624   84.1527   87.0825   81.802
 
%% same room different persons
%    end_val = 59;  feature_mat = [ feature_mat_lab2me;feature_mat_lab2other];
% bestc=64;bestg=1.6;acc:84.8958  f1 score:83.9779, precision:89.4118, recall:79.1667, fpr:9.375
% bestc=512;bestg=.5;end_val = 56;  feature_mat = [ feature_mat_lab2other;feature_mat_lab2me];
% acc:81.1765  f1 score:80.9524, precision:81.9277, recall:80, fpr:17.6471

%  feature_mat = [feature_mat_smote_kitchenme; feature_mat_smote_kitchenother];
% end_val = 85;% acc:72.9575  f1 score:71.9729, precision:74.6924, recall:69.4444, fpr:23.5294
% end_val = 70; feature_mat = [feature_mat_smote_kitchenother; feature_mat_smote_kitchenme];
% bestc=64;bestg=32;%  acc:87.9167  f1 score:87.2247, precision:92.5234, recall:82.5, fpr:6.66667
% 81.9390   81.2265   84.9398   77.8776

%% same room same person
% feature_mat=feature_mat_lab2other;neighbours=3;bestc =2 ; bestg = 8;
% acc:82.3529  f1 score:81.6327, precision:83.3333, recall:80, fpr:11.1111 

% feature_mat=feature_mat_lab2me;bestc =32768 ; bestg = 0.1250;
% acc:88.8889  f1 score:86.5979, precision:85.7143, recall:87.5, fpr:11.1111 

% feature_mat=feature_mat_smote_kitchenme;bestc =32768 ;bestg = 64;
% acc:84.6154  f1 score:86.9565, precision:83.3333, recall:90.9091, fpr:15.3846 

% feature_mat=feature_mat_smote_kitchenother;bestc =8 ; bestg = 16;
% acc:85.7143  f1 score:86.747, precision:81.8182, recall:92.3077, fpr:21.4286 me person
% 85.3649   85.7196   83.4608   88.2641

%% same room faldefi             
%          hype_opt = false;     
%          used_feat = 2:13;bestc=512;bestg=8;%acc:71.1864  f1 score:62.7737, precision:72.8814, recall:55.1282)
%          end_val = 180;  feature_mat = [ feature_mat_kitchen2_smote;feature_mat_kitchen1_smote];bestc=16384 ;  bestg = .0625 ;
%          acc:81.9209  f1 score:82.0225, precision:73, recall:93.5897,   fpr:27.2727 177
%          acc:83.3333  f1 score:83.871, precision:81.25, recall:86.6667,  fpr:20  180   
%          end_val = 177;

% used_feat=[ 8 11 12 13];%3 6 9   
                 
%         end_val = 133; feature_mat=[ feature_mat_bedroom2_smote;feature_mat_bedroom1_smote;];
%         used_feat=[ 8 11 12  13 ]; %3 6 9
%         acc:82.7068  f1 score:83.9161, precision:75, recall:95.2381,
%         fpr:28.5714 133
%         acc:74.5856  f1 score:76.2887, precision:71.1538, recall:82.2222,
%         fpr:32.967 181
%         bestc=128; bestg=.0025;            
                     
%         end_val = 172; feature_mat=[  feature_mat_bathroom1_smote; feature_mat_bathroom2_smote];bestc=1 ;  bestg = .25 ;
%         acc:82.7027  f1 score:84.7619, precision:74.1667, recall:98.8889, fpr:32.6316 172
%         acc:80  
% f1 score:82.4645, precision:70.1613, recall:100, fpr:37.7551 185
% bestc=1; bestg=1;

%         end_val = 124; feature_mat=[  feature_mat_corridor1_smote;feature_mat_corridor2_smote; ];
%         used_feat = 2:13;bestc=16;bestg=1;%acc:81.4516  f1 score:83.6879,
%         precision:78.6667, recall:89.3939) 
%       acc:85.7143  f1 score:87.1795, precision:85, recall:89.4737, fpr:18.75 124
%       acc:78.2857  f1 score:80.2083, precision:81.9149, recall:78.5714, fpr:22.0779
%       fpr:46.7532 175
%  bestc=4096;bestg=1;
         
%        cv_folds=5;
%         hype_opt = false;
%        end_val = 177;used_feat = 2:13;bestc=8;bestg=4; %acc:87.2222  f1 score:86.8571, precision:89.4118, recall:84.4444
%         feature_mat = [ feature_mat_kitchen1_smote;feature_mat_kitchen2_smote];
%                  used_feat=[ 8 11 12 13  ];%3 6 9   
%       bestc=16384; bestg=.0625

        

        
        zeros_length = length(feature_mat((feature_mat(:,end)==0),end))
        ones_length  = length(feature_mat((feature_mat(:,end)==1),end))
        
        
        
        
        feature_mat( ~any(feature_mat,2), : )       = [];
        feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
        feature_mat((feature_mat(:,end)==2),end)     = 0
        feature_mat((feature_mat(:,end)==6),end)     = 1
        
        
        feature_mat1                                = feature_mat(:,1:end-1);
        label_num_                                  = feature_mat(:,end    );
        ind                                         = any(feature_mat1,2   );
        label_num1                                  = label_num_;
        label_num_(ind == 0 & label_num1 ~= 1)      = 0;
        label_num_(ind == 0 & label_num1 == 1)      = [];
        feature_mat1(ind == 0 & label_num1 == 1,:)  = [];
        labels                                      = label_num_;
        
        % -1. Power burst curve area above threshold/area below
        % threshold
        % 2. Extreme frequency
        % -3. (Extreme) Torso frequency
        % 4. Std torso frequency
        % 5. Extreme frequency/Extreme torso frequency
        % 6. Std extreme frequency
        % 7. Event duration (from PBC)
        % -8. Mean torso frequency
        %9. Mean extreme frequency
        %-10. Spectral entropy (10-30)
        %-11. Spectral entropy (1-10)
        %12. Fractal dimension
        %-13. Spectral entropy (10-20)
        %14. Spectral entropy (20-30)
        %15. Spectral entropy (30-max freq)
        %16. Spectral entropy (1-5)
        %17. Spectral entropy (5-10)
        %18. Spectral entropy (10-15)
        %19. Spectral entropy (15-20)
        %20. Spectral entrapy (20-25)
        %21. Spectral entrapy (25-30)
        %22. Max relative power (10-30)
        %-23. Max relative power (1-10)
        %-24. Max relative power (10-20)
        %-25. Max relative power (20-30)
        %-26. Max relative power (30-max)
        %27.  Max relative power (1-5)
        %-28. Max relative power (5-10)
        %-29. Max relative power (10-15)
        %-30. Max relative power (15-20)
        %-31. Max relative power (20-25)
        %-32. Max relative power (25-30)
        
        % ind_feat= [ 12:13 1:10];
        % used_feat = 11 ;
        % f1_score_prev =0;
        %  for j=1:13
        data = feature_mat1(:,[ used_feat]);
        
        %FallDeFi 3 6 8 9 11 12 13
        % 4 2 5 9 11 12
        % data                                      = feature_mat1(:,[   10 11  12 13  ]);%1 6  11 15 16 17 19 21 22    ]);%10 -40 7-54 3- 55 8-58 4- 61 5-62 6-0 1-0 9-0 11-0 12-0 13-0
        
        
        norm_featmat = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));
        norm_featmat(isnan(norm_featmat)) = 1 ;
        
        % end_val = floor(size(norm_featmat,1)*.7);
        %
        % trainData    = norm_featmat(1:end_val,:);
        % trainLabel   = labels(1:end_val);
        % % trainData    = norm_featmat(2:2:end,:);
        % % trainLabel   = labels(2:2:end);
        % testData     = norm_featmat(end_val+1:end,:);
        % testLabel    = labels(end_val+1:end);
        
        trainData    = norm_featmat(1:end_val,:);
        trainLabel   = labels(1:end_val);
        testData     = norm_featmat(end_val+1:end,:);
        testLabel    = labels(end_val+1:end);
        
        if(hype_opt)
            bestcv = 0;
            for log2c   = -5:1:15,
                for log2g = -5:1:15,
                    cmd = ['-q -c ', num2str(2^(log2c)), ' -g ', num2str(2^(log2g))];
                    cv = get_cv_ac(trainLabel, trainData, cmd, cv_folds);
                    if (cv >= bestcv),
                        bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
                    end
                    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
                end
            end
             
            %
%               for log2g = bestg-10:1:bestg+10,
%                 cmd = ['-q -c ', num2str(2^(log2c)), ' -g ', num2str(2^(log2g))];
%                 for i=1:10
%               cv = get_cv_ac(trainLabel, trainData, cmd, 5);
%                 if (cv >= bestcv),
%                   bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
%                 end
%                 end
%                 fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
%               end
        end
        
        param_str = ['-c ' num2str(bestc)  ' ' '-g ' num2str(bestg)];
        
%         model = svmtrain(trainLabel, trainData, param_str);
           model = svmtrain(trainLabel, trainData, param_str);
        
        % Use the test data for label prediction
        [predicted_labels] = svmpredict(testLabel, testData, model);
        inside_indices = find(predicted_labels > 0);
        
        accuracy  = length(find(predicted_labels== testLabel(:,1)))*100/length(testLabel);

        TPs = length(find(predicted_labels==1 & testLabel==1));
        TNs = length(find(predicted_labels==0 & testLabel==0));
        FPs = length(find(testLabel==0 & predicted_labels==1));
        FNs = length(find(testLabel==1 & predicted_labels==0));
        accuracy  = 50*(TPs/(TPs+FNs) + TNs/(TNs+FPs));% length(find(predicted_labels== testLabel(:,1)))*100/length(testLabel);

        % precision: out of all the examples the classifier labeled as positive, what fraction were correct?
        % recall   : out of all the positive examples there were, what fraction  did the classifier pick up?
        
        precision = TPs/(TPs+FNs)*100/(TPs/(TPs+FNs) + FPs/(FPs+TNs));
        recall    = TPs*100/(TPs + FNs);
       fpr       = FPs*100/(FPs + TNs);

        f1_score  = 2*precision*recall/(precision + recall);
        fprintf('acc:%g  f1 score:%g, precision:%g, recall:%g, fpr:%g\n', accuracy, f1_score, precision, recall,fpr)
        %
        
%         if max_f1_score*max_accuracy < f1_score*accuracy
%             max_f1_score=f1_score
%             max_accuracy = accuracy
%             bestc1=bestc
%             bestg1=bestg
%         end
%     end
% end

%     if f1_score<f1_score_prev
%        used_feat = select_feat;
%
%     else
%         f1_score_prev=f1_score;
%         select_feat = used_feat;
%     end
%     used_feat =  [used_feat ind_feat(j)]
%
% end
