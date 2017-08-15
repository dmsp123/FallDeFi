% Since TreeBagger uses randomness we will get different results each
% time we run this.
% This makes sure we get the same results every time we run the code.

% rng default

% Here we create some training data.
% The rows&lt; represent the samples or individuals.
% The first two columns represent the individual's features.
% The last column represents the class label (what we want to predict)
% trainData = [ ...
%     [6,  300,  1];
%     [3,  300,  0];
%     [8,  300,  1];
%     [11, 2000, 0];
%     [3,  100,  0];
%     [6,  1000, 0];
%     ];

% label_bedrooms_num1 = label_lab_num;%label_bedrooms_num;
% label_bedrooms_num1(label_bedrooms_num1~=7) = 1;

end_val = 115;
feature_mat = [feature_mat_lab2_final ; feature_mat_corridor1_final ; feature_mat_corr2_final];
%   feature_mat = [ feature_mat_corridor1_final ; feature_mat_corr2_final];

        end_val = 181; feature_mat=[ feature_mat_bedroom2_smote;feature_mat_bedroom1_smote;];%bestc=8192 ;  bestg = .00005
      used_feat=[ 8  12  13 ]; %3 6 9 


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

ind_feat= [12:32 1:9];
used_feat = [10 11];
f1_score_prev =0
% for j=1:30    
    % data             = feature_mat1(:,[1 3 8 10 11  13  23:26 28:32 ]);%1 6  11 15 16 17 19 21 22    ]);%10 -40 7-54 3- 55 8-58 4- 61 5-62 6-0 1-0 9-0 11-0 12-0 13-0
    data = feature_mat1(:, [used_feat]);
%     data               = feature_mat1(:,[10 11 12 13]);%1 6  11 15 16 17 19 21 22    ]);%10 -40 7-54 3- 55 8-58 4- 61 5-62 6-0 1-0 9-0 11-0 12-0 13-0
    
    
    
    norm_featmat = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));
    
    trainData    = norm_featmat(1:end_val,:);
    trainLabel   = labels(1:end_val);
    testData     = norm_featmat(end_val+1:end,:);
    testLabel    = labels(end_val+1:end);
    
    
    % trainData    = norm_featmat(1:2:end,:);
    features     = trainData;
    classLabels  = trainLabel;%labels(1:2:end,:);
    
    % figure
    % surf(norm_featmat)
    % How many trees do you want in the forest?
    nTrees = 100;
    
    % Train the TreeBagger (Decision Forest).
    B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification');
    
    % Given a new individual WITH the features and WITHOUT the class label,
    % what should the class label be?
    for i= 1:length(testLabel)
        
        % newData1            = testData;%norm_featmat(i,:);
        predChar1           = B.predict(testData(i,:));
        predictedClass(i,:) = [str2double(predChar1) testLabel(i)];
        
    end
    
    accuracy = length(find(predictedClass(:,2)== predictedClass(:,1)))*100/length(predictedClass(:,1));
    
    TPs = length(find(predictedClass(:,1)==1 & predictedClass(:,2)==1));
    TNs = length(find(predictedClass(:,1)==0 & predictedClass(:,2)==0));
    FPs = length(find(predictedClass(:,2)==0 & predictedClass(:,1)==1));
    FNs = length(find(predictedClass(:,2)==1 & predictedClass(:,1)==0));
    
    % precision: out of all the examples the classifier labeled as positive, what fraction were correct?
    % recall   : out of all the positive examples there were, what fraction  did the classifier pick up?
    
    precision = TPs*100/(TPs + FPs)
    recall    = TPs*100/(TPs + FNs)
    
    % accuracy = (TPs+TNs)/(TPs+FNs+TNs+FPs)
    %fall_like_event_detection = (length(label_num))*100/length(ind)%
    f1_score  = 2*precision*recall/(precision + recall)
    
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

%%  FallDeFi        accuracy     precision       recall     f1_score   samples
%%  bathroom1 :      90.4762       76.9231     100           86.9565       132
%   bathroom2 :      95.2381      100           77.7778      87.5000       125
%%  bedrooms  :      97.6190      100           85.7143      92.3077        82
%   bedrooms2 :      97.6190       88.8889     100           94.1176       121
%%  corridor 1:      85.7143       85.7143      75           80             91
%   corridor 2:      90.4762      100           62.5000      76.9231       140
%%  kitchen1  :      88.0952       90           69.2308      78.2609       138
%   kitchen2  :      94.8718       87.5000      87.5000      87.5000       120
%%  lab2      :      94.8718       92.8571      92.8571      92.8571       129
%%  overall          92.68         91.19        83.17        85.99
%%
%   overall_acc=(.787234*47 + .839286*56 + .890244*82 + .913043*23)*100/(47+56+82+23);
%   overall_prec = (.66666*47  + .925926*56 + .857143*82 +.100*23)*100/(47+56+82+23) ;
%   overall_recall=(.889*47    + .78125*56  + .923077*82 + .75*23)*100/(47+56+82+23) ;
%   overall_f1score = 2*overall_prec*overall_recall/(overall_prec+overall_recall)    ;
