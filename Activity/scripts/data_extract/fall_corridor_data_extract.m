falls_list = [10,3;11,1;12,1;13,1;14,1;15,1;16,1;17,2;18,1;19,1;20,3;21,1;22,3;23,1;24,1;25,2;26,1;27,1;34,4;35,1;36,1;37,1;38,2;39,3;43,1;44,1;45,2;46,1;47,1;48,1;49,1;50,1;51,1];
label_corridor_cha = ...
   ['bendpick   ';'bendpick   ';'bendpick   ';'empty      ';...
    'empty      ';'empty      ';'jump       ';'jump       ';...
    'jump       ';'losebalance';'losebalance';'losebalance';...
    'losebalance';'losebalance';'losebalance';'losebalance';...
    'losebalance';'losebalance';'loseconsc  ';'loseconsc  ';...
    'loseconsc  ';'loseconsc  ';'loseconsc  ';'loseconsc  ';...
    'loseconsc  ';'loseconsc  ';'loseconsc  ';'sitchair   ';...
    'sitchair   ';'sitchair   ';'sitfloor   ';'sitfloor   ';...
    'sitfoor    ';'slip       ';'slip       ';'slip       ';...
    'slip       ';'slip       ';'slip       ';'standchair ';...
    'standchair ';'standchair ';'trip       ';'trip       ';...
    'trip       ';'trip       ';'trip       ';'trip       ';...
    'trip       ';'trip       ';'trip       ';'walk       ';...
    'walk       ';'walk       '];
% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_corridor_num =[2;2;2;2;
    2;2;2;2;
    2;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;2;
    2;2;2;2;
    2;6;6;6;
    6;6;6;2;
    2;2;6;6;
    6;6;6;6;
    6;6;6;2;
    2;2];
label_num = label_corridor_num;
label_cell = cellstr(label_corridor_cha);

corridor_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/*.mat'));
corridor_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/*.dat'));

% empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor11.mat')
% empty_ant2 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor12.mat')
% empty_ant3 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor13.mat')
empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/empty_corridor11.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/empty_corridor12.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/empty_corridor13.mat'));

sample_size = 10000;
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(corridor_mat_files)/3);

for i = 1:3:length(corridor_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/') corridor_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/') corridor_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/corridor1/') corridor_mat_files(i+2).name])

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