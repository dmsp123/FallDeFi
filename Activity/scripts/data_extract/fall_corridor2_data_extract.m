falls_list = [12,1;13,2;23,1;24,2;25,1;26,2;27,2;28,1;29,4;30,1;31,1;32,1;33,2;34,1;35,2;36,1;37,2;38,1;39,1;40,1;41,1];
label_corridor_21_cha = {'bendpick1_21';'bendpick1_22';'bendpick1_23';'bendpick2_11';
    'bendpick2_12';'bendpick2_13';'bendpick3_22';'bendpick3_23';
    'empty_21';'empty_22';'empty_23';'fall1_21';
    'fall2_11';'jump1_21';'jump1_22';'jump1_23';
    'jump2_11';'jump2_12';'jump2_13';'jump3_21';
    'jump3_22';'jump3_23';'lbb1_21';'lbb2_11';
    'lbb3_21';'lbf1_21';'lbf2_11';'lbf3_21';
    'lbf_21';'lbl1_21';'lbl2_11';'lbl3_21';
    'lcb1_21';'lcb2_11';'lcb3_21';'lcf1_21';
    'lcf2_11';'lcf3_21';'lcl1_21';'lcl2_11';
    'lcl3_21';'noevent_21';'noevent_22';'noevent_23';
    'noevent_24';'random1_22';'random1_23';'random2_11';'random2_12'}


label_corridor_num = [2;2;2;2;
    2;2;2;2;
    2;2;2;6;
    6;2;2;2;
    2;2;2;2;
    2;2;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;2;2;2;
    2;2;2;2;2;];
label_num = label_corridor_num;
label_cell = cellstr(label_corridor_21_cha);

corridor_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/*.mat'));
corridor_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/*.dat'));
 
empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/empty_corridor211.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/empty_corridor212.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/empty_corridor213.mat'));

sample_size     = 10000;
normalize_index = 10000;
N               = NET.createArray('System.Double[][]',length(corridor_mat_files)/3);

for i = 1:3:length(corridor_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/') corridor_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/') corridor_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor2_1/') corridor_mat_files(i+2).name])

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