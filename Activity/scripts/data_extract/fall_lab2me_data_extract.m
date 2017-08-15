label_lab2_cha = {'empty';'fallme11';'fallme12';'fallme13';'fallme14';'fallme15';'fallme21';'fallme22';'fallme23';'fallme24';'fallme25';'fallme31';'fallme32';'fallme33';'fallme34';'fallme35';'fallme41';'fallme42';'fallme43';'fallme44';'fallme45';'fallme51';'fallme52';'fallme53';'fallme54';'fallme55';'jump1';'jump2';'jump3';'jump4';'random1';'random2';'sitch3';'sitch4';'stndch1';'stndch2';'stndch3';'stndch4';'walk1';'walk2';'walk3';'walk4'};
label_lab2_num = [2;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2];
    
lab2_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/me/*'));

label_num  = label_lab2_num;
label_cell = cellstr(label_lab2_cha);


mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/me/*.mat'));
lab2me_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/me/*.dat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/me/empty1_Lab21.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/me/empty1_Lab22.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/me/empty1_Lab23.mat'));

sample_size = 10000;
normalize_index = 10000;
fall_cell_array= cell(length(mat_files)/3,1);
for i = 1:3:length(mat_files)
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\lab2\me\' mat_files(i).name])
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\lab2\me\' mat_files(i+1).name])
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\lab2\me\' mat_files(i+2).name])

empty_occu_concat_RX1 = horzcat(empty_ant1.ant1, ant1);
empty_occu_concat_RX2 = horzcat(empty_ant2.ant2, ant2);
empty_occu_concat_RX3 = horzcat(empty_ant3.ant3, ant3);

[~,~,~,amp_RX12_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
occu_amp_RX12_centered = amp_RX12_centered(:,10001:20000);
fall_cell_array{i-(i-1)*2/3} = occu_amp_RX12_centered;
end
 clear  ant1 ant2 ant3 empty_ant1 empty_ant2 empty_ant3 empty_occu_concat_RX1 empty_occu_concat_RX2 empty_occu_concat_RX3 amp_RX12_centered occu_amp_RX12_centered;