falls_list = [7,2;8,3;9,3;10,2;11,3;12,2;13,1;14,1;15,2;16,1;17,1;18,2;19,1;20,3;21,1;22,1;23,2;24,1;25,2;26,1;27,1;28,1;29,3;30,2;31,2;32,1;33,3;34,3;35,1;36,1];
label_bathroom_cha ={'bendpick31';'bendpick32';'bendpick33';'bendpick34';
    'bendpick35';'empty';'fall10';'fall11';'fall12';
    'fall13';'fall14';'fall15';'fall16';
    'fall17';'fall18';'fall19';'fall1';
    'fall20';'fall21';'fall22';'fall23';
    'fall24';'fall25';'fall26';'fall27';
    'fall28';'fall29';'fall2';'fall30';
    'fall3';'fall4';'fall5';'fall6';
    'fall7';'fall8';'fall9';'jump41';
    'jump42';'jump43';'jump44';'jump45';
    'sitch46';'sitch48';'sitch50';'sitch52';
    'sitch54';'sitfl56';'sitfl58';'sitfl60';
    'sitfl62';'sitfl64';'standch47';'standch49';
    'standch51';'standch53';'standch55';'standfl57';
    'standfl59';'standfl61';'standfl63';'standfl65';
    'walk35';'walk37';'walk38';'walk39';'walk40'};
label_cell = cellstr(label_bathroom_cha);
label_num = [2;2;2;2;
    2;2;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;6;
    6;6;6;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;2];

bathroom_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/*.mat'));
bathroom_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/*.dat'));

% empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor11.mat')
% empty_ant2 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor12.mat')
% empty_ant3 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor13.mat')
empty_ant1 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/empty_bathroom1.mat'));
empty_ant2 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/empty_bathroom2.mat'));
empty_ant3 = load(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/empty_bathroom3.mat'));

sample_size = 10000;
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(bathroom_mat_files)/3);

for i = 1:3:length(bathroom_mat_files)
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/') bathroom_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/') bathroom_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/') bathroom_mat_files(i+2).name])

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