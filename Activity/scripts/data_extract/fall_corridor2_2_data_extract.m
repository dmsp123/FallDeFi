falls_list = [18,1;19,1;20,2;33,1;34,2;35,2;36,3;37,1;38,1;39,1;40,1;41,1];
label_corridor_22_cha = {'empty_21';'random2_23';'random3_21';'random3_22';
    'random3_23';'sitch1_21';'sitch2_21';'sitch3_21';
    'sitfl1_21';'sitfl1_22';'sitfl1_23';'sitfl2_21';
    'sitfl2_22';'sitfl2_23';'sitfl3_21';'sitfl3_22';
    'sitfl3_23';'slip1_21';'slip2_21';'slip3_21';
    'stndch1_21';'stndch2_21';'stndch3_21';'stndfl1_21';
    'stndfl1_22';'stndfl1_23';'stndfl2_21';'stndfl2_22';
    'stndfl2_23';'stndfl3_21';'stndfl3_22';'stndfl3_23';
    'trb1_21';'trb2_21';'trb3_21';'trf1_21';'trf2_21';
    'trf3_21';'trl1_21';'trl2_21';'trl3_21';'walk_21';
    'walk_22';'walk_23';'walk_24';'walk_25';'walk_26';
    'walk_27';'walk_28';'walk_29'};
label_corridor_num  = [2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;6;6;6;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    6;6;6;6;6;
    6;6;6;6;2;
    2;2;2;2;2;
    2;2;2;];

label_num = label_corridor_num;
label_cell = cellstr(label_corridor_22_cha);

corridor_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/*.mat'));
corridor_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/*.dat'));
 
% empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor11.mat')
% empty_ant2 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor12.mat')
% empty_ant3 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor13.mat')
empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/empty_corridor211.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/empty_corridor212.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/empty_corridor213.mat'));

sample_size     = 10000;
normalize_index = 10000;
N               = NET.createArray('System.Double[][]',length(corridor_mat_files)/3);

for i = 1:3:length(corridor_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/') corridor_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/') corridor_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_2/') corridor_mat_files(i+2).name])

empty_occu_concat_RX1 = horzcat(empty_ant1.ant1, ant1);
empty_occu_concat_RX2 = horzcat(empty_ant2.ant2, ant2);
empty_occu_concat_RX3 = horzcat(empty_ant3.ant3, ant3);

[~,~,~,amp_RX12_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
occu_amp_RX12_centered = amp_RX12_centered(:,10001:20000);
N(i-(i-1)*2/3) = occu_amp_RX12_centered;
% clear walk_LoS_interp1 walk_LoS_interp2 walk_LoS_interp3 walk_amp_RX123_centered
end
fall_cell_array = cell(N);
clear N ant1 ant2 ant3 empty_ant1 empty_ant2 empty_ant3 empty_occu_concat_RX1 empty_occu_concat_RX2 empty_occu_concat_RX3 amp_RX12_centered occu_amp_RX12_centered;