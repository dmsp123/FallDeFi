%  feature_mat= feature_mat_lab2_smote;
% acc:75.9259  f1 score:80.9087, precision:71.0526, recall:93.9394


% feature_mat = feature_mat_kitchen2_smote;
% acc:78.1818  f1 score:81.6635, precision:72.7273, recall:93.1034
% feature_mat = feature_mat_kitchen1_smote;
% acc:79.6296  f1 score:80.0366, precision:73.0769, recall:88.4615

% feature_mat = feature_mat_corridor2_smote;
% acc:71.6981  f1 score:79.4535, precision:67.5, recall:96.5517
% feature_mat = feature_mat_corridor1_smote;
% acc:81.5789  f1 score:82.5493, precision:80.9524, recall:84.2105

% feature_mat = feature_mat_bedroom2_smote;
% acc:76.3636  f1 score:79.5522, precision:69.4444, recall:93.1034

% feature_mat = feature_mat_bedroom1_smote;
% acc:80  f1 score:81.2214, precision:73.6842, recall:90.4762

% feature_mat = feature_mat_bathroom2_smote;
% acc:76.7857  f1 score:81.9672, precision:69.4444, recall:100

% feature_mat = feature_mat_bathroom1_smote;
% acc:75  f1 score:76.0959, precision:67.6471, recall:86.9565


f1score_vec=zeros(1,10000);
acc_vec=zeros(1,10000);
recall_vec=zeros(1,10000);
precision_vec=zeros(1,10000);

for j=1:10000
n = size(feature_mat,1);
ordering = randperm(n);
feature_mat = feature_mat(ordering, :);


feature_mat( ~any(feature_mat,2), : ) = [];
feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
feature_mat((feature_mat(:,end)==2),end)     = 0;
feature_mat((feature_mat(:,end)==6),end)     = 1;

feature_mat1                                = feature_mat(:,1:end-1);%only features
label_num_                                  = feature_mat(:,end);    %class labels
ind                                         = any(feature_mat1,2);
label_num1                                  = label_num_;
label_num_(ind == 0 & label_num1 ~= 6)      = 2;
label_num_(ind == 0 & label_num1 == 6)      = [];
feature_mat1(ind == 0 & label_num1 == 6,:)  = [];
label_num1                                  = label_num_;

labels                  = label_num1;
data = feature_mat1(:,[8  12 13]);
% data                    = feature_mat1(:,2:end);%my
%  values

norm_featmat = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));




end_val = floor(size(norm_featmat,1)*.7);

trainData    = norm_featmat(1:end_val,:);
trainLabel   = labels(1:end_val);
% trainData    = norm_featmat(2:2:end,:);
% trainLabel   = labels(2:2:end);
testData     = norm_featmat(end_val+1:end,:);
testLabel    = labels(end_val+1:end);



O1 = fitNaiveBayes(trainData,trainLabel);
C1 = O1.predict(testData);
cMat1 = confusionmat(testLabel,C1);

accuracy = 100*(cMat1(1,1)+cMat1(2,2))/sum(sum(cMat1));

TPs = cMat1(2,2);
TNs = cMat1(1,1);
FPs = cMat1(1,2);
FNs = cMat1(2,1);
        
precision = TPs*100/(TPs + FPs);
recall    = TPs*100/(TPs + FNs);

f1_score  = 2*precision*recall/(precision + recall)    ;
% fprintf('acc:%g  f1 score:%g, precision:%g, recall:%g)\n', accuracy, f1_score, precision, recall)
       
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
   
