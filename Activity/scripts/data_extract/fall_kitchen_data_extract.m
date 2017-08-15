falls_list = [41,2;42,2;43,2;44,3;45,1;46,1;47,1;48,1;49,1;50,1;51,1;52,1;53,2;54,1;55,2;56,1;57,1;58,1;59,1;60,2;61,3;62,1;63,1;64,1;65,1;66,2;67,2;68,2;69,1;70,2;71,1;72,1;73,1;77,2;78,1;79,1;80,1;81,1;82,1];

label_kitchen_cha = ...
   ['sitchair   ';'sitchair   ';'sitfloor   ';'sitfloor   ';...
    'standchair ';'standchair ';'standfloor ';'standfloor ';...
    'sitchair   ';'sitfloor   ';'standchair ';'standchair ';...
    'standfloor ';'standfloor ';'sitchair   ';'sitchair   ';...
    'sitchair   ';'sitfloor   ';'sitfloor   ';'standchair ';...
    'standchair ';'standfloor ';'standfloor ';'bendpick   ';...
    'bendpick   ';'bendpick   ';'bendpick   ';'bendpick   ';...
    'bendpick   ';'empty      ';'empty      ';'walk       ';...
    'walk       ';'walk       ';'jump       ';'jump       ';...
    'jump       ';'jump       ';'jump       ';'jump       ';...
    'losebalance';'losebalance';'losebalance';'losebalance';...
    'losebalance';'losebalance';'losebalance';'losebalance';...
    'losebalance';'losebalance';'losebalance';'losebalance';...
    'losebalance';'losebalance';'losebalance';'losebalance';...
    'loseconsc  ';'loseconsc  ';'loseconsc  ';'loseconsc  ';...
    'loseconsc  ';'loseconsc  ';'loseconsc  ';'loseconsc  ';...
    'loseconsc  ';'loseconsc  ';'loseconsc  ';'loseconsc  ';...
    'slip       ';'slip       ';'slip       ';'slip       ';...
    'slip       ';'walk       ';'walk       ';'walk       ';...
    'trip       ';'trip       ';'trip       ';'trip       ';...
    'trip       ';'trip       '];
% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_kitchen_num = [2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;2;2;2;
    6;6;6;6;
    6;6];
label_num = label_kitchen_num;
label_cell = cellstr(label_kitchen_cha);
kitchen_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/*.mat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/empty_kitchen11.mat'))
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/empty_kitchen12.mat'))
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/empty_kitchen13.mat'))
sample_size = 10000
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(kitchen_mat_files)/3);

for i = 1:3:length(kitchen_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/') kitchen_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/') kitchen_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen/') kitchen_mat_files(i+2).name])
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