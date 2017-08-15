falls_list = [7,2;8,1;9,1;10,1;11,1;12,1;13,1;14,1;15,1;16,3;17,1;18,2;19,1;20,1;21,2;22,3;23,1;24,1;25,1;26,1;27,1;28,2;29,1;30,1;31,1;32,1;33,1;34,1;35,1;36,1];
label_kitchen_cha = ...
  ['bendpick56';'bendpick57';'bendpick58';'bendpick59';
   'bendpick60';'empty     ';'fall21    ';'fall22    ';
   'fall23    ';'fall24    ';'fall25    ';'fall26    ';
   'fall27    ';'fall28    ';'fall29    ';'fall30    ';
   'fallme10  ';'fallme11  ';'fallme12  ';'fallme13  ';
   'fallme14  ';'fallme15  ';'fallme16  ';'fallme17  ';
   'fallme18  ';'fallme19  ';'fallme1   ';'fallme20  ';
   'fallme2   ';'fallme3   ';'fallme4   ';'fallme5   ';
   'fallme6   ';'fallme7   ';'fallme8   ';'fallme9   ';
   'jump41    ';'jump42    ';'jump43    ';'jump44    ';
   'jump45    ';'jump46    ';'jump47    ';'jump48    ';
   'jump49    ';'jump50    ';'sitch37   ';'sitch39   ';
   'sitch40   ';'sitfl31   ';'sitfl33   ';'sitfl35   ';
   'stndch38  ';'stndfl32  ';'stndfl34  ';'stndfl36  ';
   'walk51    ';'walk52    ';'walk53    ';'walk54    ';
   'walk55    '];
% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_kitchen_num = [2;2;2;2;
    2;2;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2];

label_num = label_kitchen_num;
label_cell = cellstr(label_kitchen_cha);
kitchen_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/*.mat'));
kitchen_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/*.dat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/empty_kitchen21.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/empty_kitchen22.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/empty_kitchen23.mat'));
sample_size = 10000;
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(kitchen_mat_files)/3);

for i = 1:3:length(kitchen_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/') kitchen_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/') kitchen_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/kitchen2/') kitchen_mat_files(i+2).name])
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