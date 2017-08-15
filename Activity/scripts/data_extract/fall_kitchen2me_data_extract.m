label_kitchen_cha = ...
  {'empty_kitchen2.dat';'fallme10_kitchen2.dat';'fallme11_kitchen2.dat';'fallme12_kitchen2.dat';'fallme13_kitchen2.dat';'fallme14_kitchen2.dat';'fallme15_kitchen2.dat';'fallme16_kitchen2.dat';'fallme17_kitchen2.dat';'fallme18_kitchen2.dat';'fallme19_kitchen2.dat';'fallme1_kitchen2.dat';'fallme20_kitchen2.dat';'fallme2_kitchen2.dat';'fallme3_kitchen2.dat';'fallme4_kitchen2.dat';'fallme5_kitchen2.dat';'fallme6_kitchen2.dat';'fallme7_kitchen2.dat';'fallme8_kitchen2.dat';'fallme9_kitchen2.dat';'jump41_kitchen2.dat';'jump42_kitchen2.dat';'jump43_kitchen2.dat';'jump44_kitchen2.dat';'jump45_kitchen2.dat';'jump46_kitchen2.dat';'jump47_kitchen2.dat';'jump48_kitchen2.dat';'jump49_kitchen2.dat';'jump50_kitchen2.dat';'sitch37_kitchen2.dat';'sitch39_kitchen2.dat';'sitch40_kitchen2.dat';'stndch38_kitchen2.dat';'walk51_kitchen2.dat';'walk52_kitchen2.dat';'walk53_kitchen2.dat';'walk54_kitchen2.dat';'walk55_kitchen2.dat'};% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_kitchen_num = [2;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2];

label_num = label_kitchen_num;
label_cell = cellstr(label_kitchen_cha);
kitchen_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/*.mat'));
kitchen_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/*.dat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/empty_kitchen21.mat'))
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/empty_kitchen22.mat'))
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/empty_kitchen23.mat'))
sample_size = 10000
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(kitchen_mat_files)/3);

for i = 1:3:length(kitchen_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/') kitchen_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/') kitchen_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/me/') kitchen_mat_files(i+2).name])
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