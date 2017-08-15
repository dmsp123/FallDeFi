falls_list = [7,1;8,2;9,2;10,3;11,2;12,2;13,3;14,1;15,1;16,1;17,1;18,2;19,1;20,2;21,2;22,1;23,1;24,3;25,1;26,1;27,1;28,1;29,1;30,1;31,3;32,4;33,3;34,1;35,1;36,1;37,1];
label_bedrooms_cha = ...
 ['bendpick16';'bendpick17';'bendpick18';'bendpick19';
  'bendpick20';'empty1    ';'fall10    ';'fall11    ';
  'fall12    ';'fall13    ';'fall14    ';'fall15    ';
  'fall1     ';'fall2     ';'fall31    ';'fall32    ';
  'fall33    ';'fall34    ';'fall35    ';'fall36    ';
  'fall37    ';'fall38    ';'fall39    ';'fall3     ';
  'fall40    ';'fall41    ';'fall42    ';'fall43    ';
  'fall44    ';'fall45    ';'fall4     ';'fall5     ';
  'fall6     ';'fall7     ';'fall8     ';'fall9     ';
  'jump56    ';'jump57    ';'jump58    ';'jump59    ';
  'jump60    ';'sitch46   ';'sitch47   ';'sitch49   ';
  'sitch51   ';'sitch53   ';'sitch55   ';'sitfl21   ';
  'sitfl23   ';'sitfl27   ';'sitfl28   ';'sitfl29   ';
  'stndch46  ';'stndch48  ';'stndch50  ';'stndch52  ';
  'stndch54  ';'stndfl22  ';'stndfl24  ';'stndfl25  ';
  'stndfl26  ';'stndfl30  ';'walk61    ';'walk62    ';
  'walk63    ';'walk64    ';'walk65    '];
% |walk 1|stand 2|sit 3|jump 4|no event 5|fall 6|bendpick 7|
label_bedrooms_num =...
   [2;2;2;2;
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
    2;2;2;2;
    2;2;2];

label_num  = label_bedrooms_num;
label_cell = cellstr(label_bedrooms_cha);

bedrooms_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/*.mat'));

empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/empty1_bedroom21.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/empty1_bedroom22.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/empty1_bedroom23.mat'));
sample_size = 10000;
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(bedrooms_mat_files)/3);

for i = 1:3:length(bedrooms_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/') bedrooms_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/') bedrooms_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms2/') bedrooms_mat_files(i+2).name])
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