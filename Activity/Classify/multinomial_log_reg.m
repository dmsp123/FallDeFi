
          

% feature_mat= feature_mat_lab2_smote;
% acc:81.4815  f1 score:84.7368, precision:82.1429, recall:87.5
% feature_mat = feature_mat_kitchen2_smote;%(:,[1:13 16 ]);
% acc:65.4545  f1 score:68.1081 precision:64.2857 recall:72.4138
% feature_mat = feature_mat_kitchen1_smote;%(:,[1:13 16 ]);
% acc:64.8148  f1 score:61.0256, precision:58.6207, recall:63.6364
% feature_mat = feature_mat_corridor2_smote;%(:,[1:13 16 ]);
% acc:81.1321  f1 score:83.8095, precision:80, recall:88
% feature_mat = feature_mat_corridor1_smote;%(:,[1:13 16 ]);
% acc:76.3158  f1 score:78.961, precision:72.7273, recall:86.3636
% feature_mat = feature_mat_bedroom2_smote;%(:,[1:13 16 ]);
% acc:74.5455  f1 score:76, precision:73.0769, recall:79.1667
% feature_mat = feature_mat_bedroom1_smote;%(:,[1:13 16 ]);
% acc:75  f1 score:75.4717, precision:71.4286, recall:80
% feature_mat = feature_mat_bathroom2_smote;%(:,[1:13 16 ]);
% acc:67.8571  f1 score:67.2538, precision:65.625, recall:68.9655
% feature_mat = feature_mat_bathroom1_smote;%(:,[1:13 16 ]);
% acc:59.6154  f1 score:55.8739, precision:57.6923, recall:54.1667

f1score_vec=zeros(1,10000);
acc_vec=zeros(1,10000);
recall_vec=zeros(1,10000);
precision_vec=zeros(1,10000);

for j=1:10000

feature_mat( ~any(feature_mat,2), : ) = [];
feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
feature_mat((feature_mat(:,end)==0),end)     = 2;
feature_mat((feature_mat(:,end)==1),end)     = 1;

%% randomize
n = size(feature_mat,1);
ordering = randperm(n);
feature_mat = feature_mat(ordering, :);



feature_mat1                                = feature_mat(:,1:end-1);%only features
label_num_                                  = feature_mat(:,end);    %class labels
ind                                         = any(feature_mat1,2);
label_num1                                  = label_num_;
label_num_(ind == 0 & label_num1 ~= 1)      = 2;
label_num_(ind == 0 & label_num1 == 1)      = [];
feature_mat1(ind == 0 & label_num1 == 1,:)  = [];
label_num1                                  = label_num_;

labels                  = label_num1;
data = feature_mat1(:,[8 12 13]);
% data                    = feature_mat1(:,2:end);%my
%  values

norm_featmat = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));

end_val = floor(size(norm_featmat,1)*.7);
trainData    = norm_featmat(1:end_val,:);
trainLabel   = labels(1:end_val);
testData     = norm_featmat(end_val+1:end,:);
testLabel    = labels(end_val+1:end);

features     = trainData;
classLabels  = trainLabel;%labels(1:2:end,:);




[B,dev,stats] = mnrfit(trainData,trainLabel);
% x = [6.2, 3.7, 5.8, 0.2];
pihat = mnrval(B,testData);
[m,predictedClass] = max(pihat,[],2);
predictedClass(:,2)=testLabel;
% length(find(predictedClass(:,2)==predictedClass(:,1)))*100/length(i(:,1))


accuracy  = length(find(predictedClass(:,2)== predictedClass(:,1)))*100/length(predictedClass(:,1));

TPs       = length(find(predictedClass(:,1)==1 & predictedClass(:,2)==1));
TNs       = length(find(predictedClass(:,1)==2 & predictedClass(:,2)==2));
FPs       = length(find(predictedClass(:,2)==2 & predictedClass(:,1)==1));
FNs       = length(find(predictedClass(:,2)==1 & predictedClass(:,1)==2));

% precision: out of all the examples the classifier labeled as positive, what fraction were correct?
% recall   : out of all the positive examples there were, what fraction  did the classifier pick up?

precision = TPs*100/(TPs + FPs);
recall    = TPs*100/(TPs + FNs);

% accuracy = (TPs+TNs)/(TPs+FNs+TNs+FPs)
%fall_like_event_detection = (length(label_num))*100/length(ind)%
f1_score  = 2*precision*recall/(precision + recall);

% fprintf('acc:%g  f1 score:%g, precision:%g, recall:%g\n', accuracy, f1_score,precision, recall);

   
    f1score_vec(j)=f1_score;
    acc_vec(j)=accuracy;
    recall_vec(j)=recall;
    precision_vec(j)=precision;
  
end        
        
median(recall_vec)
median(precision_vec)
median(acc_vec)

median_f1score=2*median(recall_vec)*median(precision_vec)/(median(recall_vec)+median(precision_vec));
fprintf('acc:%g  f1 score:%g, precision:%g, recall:%g\n', median(acc_vec), median_f1score, median(precision_vec), median(recall_vec));