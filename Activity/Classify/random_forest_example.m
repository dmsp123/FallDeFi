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

nTrees = 25;
train_en = true;
end_val = 178;
randomize=true;
%%
% feature_mat = [ feature_mat_lab2_smote; feature_mat_kitchen1_smote; feature_mat_kitchen2_smote];
% acc:86.8347  f1 score:87.5332, precision:84.1837, recall:91.1602)
% 
% end_val = 178; feature_mat=[ feature_mat_lab2_smote; feature_mat_bedroom1_smote; feature_mat_bedroom2_smote];
% acc:81.2325  f1 score:83.7772, precision:75.8772, recall:93.5135)

% end_val = 178; feature_mat=[feature_mat_lab2_smote;  feature_mat_bathroom1_smote; feature_mat_bathroom2_smote];
% acc:74.7899  f1 score:71.3376, precision:77.7778, recall:65.8824)
% end_val = 178; feature_mat=[feature_mat_lab2_smote;  feature_mat_corridor1_smote; feature_mat_corridor2_smote];
% acc:86.2876  f1 score:87.9765, precision:84.7458, recall:91.4634)



% 3 6 8 9 11 12 13 = kitchen, bed
% 2 4 5 9 11 12 = corr, bath
%% same room faldefi
%         end_val = 180;  feature_mat = [ feature_mat_kitchen2_smote;feature_mat_kitchen1_smote];
% acc:79.661  f1 score:77.5, precision:75.6098, recall:79.4872)

%         end_val = 181; feature_mat=[ feature_mat_bedroom2_smote;feature_mat_bedroom1_smote;];
% acc:81.9549  f1 score:80.9524, precision:80.9524, recall:80.9524)

%         end_val = 185; feature_mat=[ feature_mat_bathroom2_smote; feature_mat_bathroom1_smote; ];
% acc:75  f1 score:74.2515, precision:71.2644, recall:77.5)

%         end_val = 175; feature_mat=[  feature_mat_corridor2_smote;feature_mat_corridor1_smote; ];
% acc:78.2258  f1 score:80.5755, precision:76.7123, recall:84.8485)

%% same room same data
% feature_mat = feature_mat_kitchen2_smote;%(:,[1:13 16 ]);
% acc:83.6364  f1 score:84.7458, precision:80.6452, recall:89.2857)
% feature_mat = feature_mat_kitchen1_smote;%(:,[1:13 16 ]);
% acc:87.037  f1 score:84.4444, precision:76, recall:95)

% feature_mat = feature_mat_corridor2_smote;%(:,[1:13 16 ]);
% acc:83.0189  f1 score:85.7143, precision:77.1429, recall:96.4286)
% feature_mat = feature_mat_corridor1_smote;%(:,[1:13 16 ]);
% acc:78.9474  f1 score:80.9524, precision:80.9524, recall:80.9524)

% feature_mat = feature_mat_bedroom2_smote;%(:,[1:13 16 ]); acc:83.6364  f1
% acc:89.0909  f1 score:90.625, precision:87.8788, recall:93.5484)
% feature_mat =feature_mat_bedroom1_smote;%(:,[1:13 16 ]); acc:87.2727  f1
% acc:85  f1 score:85, precision:85, recall:85)

% feature_mat = feature_mat_bathroom2_smote;%(:,[1:13 16 ]);
% acc:78.5714  f1 score:82.8571, precision:70.7317, recall:100)
% feature_mat = feature_mat_bathroom1_smote;%(:,[1:13 16 ]);
% acc:84.6154  f1 score:84.6154, precision:75.8621, recall:95.6522)

%  feature_mat= feature_mat_lab2_smote;
% acc:88.8889  f1 score:91.1765, precision:83.7838, recall:100)

%%

feature_mat( ~any(feature_mat,2), : ) = [];
feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
feature_mat((feature_mat(:,end)==2),end)     = 0;
feature_mat((feature_mat(:,end)==6),end)     = 1;

%% randomize
if(randomize)
    n = size(feature_mat,1);
    ordering = randperm(n);
    feature_mat = feature_mat(ordering, :);
end


feature_mat1                                = feature_mat(:,1:end-1);%only features
label_num_                                  = feature_mat(:,end);    %class labels
ind                                         = any(feature_mat1,2);
label_num1                                  = label_num_;
label_num_(ind == 0 & label_num1 ~= 1)      = 2;
label_num_(ind == 0 & label_num1 == 1)      = [];
feature_mat1(ind == 0 & label_num1 == 1,:)  = [];
label_num1                                  = label_num_;

labels                  = label_num1;
data = feature_mat1(:,[ 8  12 13]);
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

% figure
% surf(norm_featmat)
% How many trees do you want in the forest?

% Train the TreeBagger (Decision Forest).
% if (train_en)
B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification');
% end
% Given a new individual WITH the features and WITHOUT the class label,
% what should the class label be?
predictedClass =zeros(length(testLabel),2);
for i= 1:length(testLabel)
    
    % newData1            = testData;%norm_featmat(i,:);
    predChar1           = B.predict(testData(i,:));
    predictedClass(i,:) = [str2double(predChar1) testLabel(i)];
    
end

accuracy  = length(find(predictedClass(:,2)== predictedClass(:,1)))*100/length(predictedClass(:,1));

TPs       = length(find(predictedClass(:,1)==1 & predictedClass(:,2)==1));
TNs       = length(find(predictedClass(:,1)==0 & predictedClass(:,2)==0));
FPs       = length(find(predictedClass(:,2)==0 & predictedClass(:,1)==1));
FNs       = length(find(predictedClass(:,2)==1 & predictedClass(:,1)==0));

% precision: out of all the examples the classifier labeled as positive, what fraction were correct?
% recall   : out of all the positive examples there were, what fraction  did the classifier pick up?

precision = TPs*100/(TPs + FPs);
recall    = TPs*100/(TPs + FNs);

% accuracy = (TPs+TNs)/(TPs+FNs+TNs+FPs)
%fall_like_event_detection = (length(label_num))*100/length(ind)%
f1_score  = 2*precision*recall/(precision + recall);
fprintf('acc:%g  f1 score:%g, precision:%g, recall:%g)\n', accuracy, f1_score, precision, recall);

% 76.6938 77.4869 89.1566 68.5185
% 78.0488 78.5146 91.3580 68.8372
% 70.7317 67.6647 95.7627 52.3148
% 75.6098 66.2835 98.8571 79.3578






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
