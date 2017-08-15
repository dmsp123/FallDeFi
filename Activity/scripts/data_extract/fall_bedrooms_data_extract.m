falls_list = [11,3;12,3;13,1;14,4;15,1;16,1;17,1;18,2;19,2;20,1;21,3;22,1;23,1;24,1;41,4;42,2;43,3;44,1;45,1;46,3;47,2];
label_bedrooms_cha = ...
  ['bendpick   ';'bendpick   ';'bendpick   ';'empty      ';...
   'empty      ';'empty      ';'jump       ';'jump       ';...
   'jump       ';'jump       ';'losebalance';'losebalance';...
   'losebalance';'losebalance';'losebalance';'losebalance';...
   'loseconsc  ';'loseconsc  ';'loseconsc  ';'loseconsc  ';...
   'loseconsc  ';'loseconsc  ';'loseconsc  ';'loseconsc  ';...
   'sit        ';'sit        ';'sit        ';'sit        ';...
   'sit        ';'sit        ';'sit        ';'sit        ';...
   'stand      ';'stand      ';'stand      ';'stand      ';...
   'stand      ';'stand      ';'stand      ';'stand      ';...
   'trip       ';'trip       ';'trip       ';'trip       ';...
   'trip       ';'trip       ';'trip       ';'walk       ';...
   'walk       ';'walk       '];
% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_bedrooms_num =...
   [2;2;2;2;
    2;2;2;2;
    2;2;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    6;6;6;6;
    6;6;6;2;
    2;2];

label_num  = label_bedrooms_num;
label_cell = cellstr(label_bedrooms_cha);

bedrooms_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/*.mat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/empty_bedroom11.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/empty_bedroom12.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/empty_bedroom13.mat'));
sample_size = 10000;
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(bedrooms_mat_files)/3);

for i = 1:3:length(bedrooms_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/') bedrooms_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/') bedrooms_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/') bedrooms_mat_files(i+2).name])
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