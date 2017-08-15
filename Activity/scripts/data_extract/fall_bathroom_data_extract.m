falls_list = [7,1; 8,1;9,1;10,1;11,1;12,2;13,1;14,2;15,1;16,1;17,2;18,1;19,1;20,1;21,1;22,1;23,1;24,2;25,2;26,1;27,1;28,3;29,2;30,5;31,2;32,4;33,1;34,2;35,2;36,1;37,4;38,1;39,1;40,3;41,1;42,4;43,2;44,1;45,3;46,3];
label_bathroom_cha ={'bendpick71';'bendpick72';'bendpick73';'bendpick74';...
    'bendpick75';'empty';'fall10';'fall11';...
    'fall12';'fall13';'fall14';'fall15';...
    'fall16';'fall17';'fall18';'fall19';...
    'fall1';'fall20';'fall21';'fall22';...
    'fall23';'fall24';'fall25';'fall26';...
    'fall27';'fall28';'fall29';'fall2';...
    'fall30';'fall31';'fall32';'fall33';...
    'fall34';'fall35';'fall36';'fall37';...
    'fall38';'fall39';'fall3';'fall40';...
    'fall4';'fall5';'fall6';'fall7';...
    'fall8';'fall9';'jump61';'jump62';...
    'jump63';'jump64';'jump65';'jump66';...
    'jump67';'jump68';'jump69';'jump70';...
    'sitch76';'sitch78';'sitch80';'sitfloor41';...
    'sitfloor43';'sitfloor45';'sitfloor47';'sitfloor49';...
    'stndch77';'stndch79';'stndfloor42';'stndfloor44';...
    'stndfloor46';'stndfloor48';'stndfloor50';'walk51';'walk52'};
label_cell = cellstr(label_bathroom_cha);
label_num = [2;2;2;2;2;2;
    6;6;6;6;6;6;
    6;6;6;6;6;6;
    6;6;6;6;6;6;
    6;6;6;6;6;6;
    6;6;6;6;6;6;
    6;6;6;6;6;6;
    6;6;6;6;2;2;
    2;2;2;2;2;2;
    2;2;2;2;2;2;
    2;2;2;2;2;2;
    2;2;2;2;2;2;2;];

bathroom_mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/*.mat'));
bathroom_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/*.dat'));

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
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/') bathroom_mat_files(i).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/') bathroom_mat_files(i+1).name])
load([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/') bathroom_mat_files(i+2).name])

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