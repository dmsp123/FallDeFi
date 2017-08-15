
label_kitchen_cha = ...
  {'bendpick56_kitchen2.dat';'bendpick57_kitchen2.dat';'bendpick58_kitchen2.dat';'bendpick59_kitchen2.dat';'bendpick60_kitchen2.dat';'empty_kitchen2.dat';'fall21_kitchen2.dat';'fall22_kitchen2.dat';'fall23_kitchen2.dat';'fall24_kitchen2.dat';'fall25_kitchen2.dat';'fall26_kitchen2.dat';'fall27_kitchen2.dat';'fall28_kitchen2.dat';'fall29_kitchen2.dat';'fall30_kitchen2.dat';'sitfl31_kitchen2.dat';'sitfl33_kitchen2.dat';'sitfl35_kitchen2.dat';'stndfl32_kitchen2.dat';'stndfl34_kitchen2.dat';'stndfl36_kitchen2.dat'};
% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_kitchen_num = [2;2;2;2;2;2;6;6;6;6;6;6;6;6;6;6;6;6;2;2;2;2];

label_num = label_kitchen_num;
label_cell = cellstr(label_kitchen_cha);
kitchen_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/*.mat'));
kitchen_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/*.dat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/empty_kitchen21.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/empty_kitchen22.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/empty_kitchen23.mat'));
sample_size = 10000
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(kitchen_mat_files)/3);

for i = 1:3:length(kitchen_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/') kitchen_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/') kitchen_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/other/') kitchen_mat_files(i+2).name])
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