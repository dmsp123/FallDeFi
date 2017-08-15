falls_list = [6,2;7,3;8,1;9,2;10,3;11,2;12,2;13,3;14,1;15,1;16,1;17,1;18,1;19,1;20,3;21,2;22,1;23,1;24,1;25,1;26,2;27,1;28,1;29,1;30,1;31,1;32,1;33,1;34,1;35,1;36,1;37,1;38,1;39,1;40,1;41,1;42,1;43,1;44,1;45,1;46,1;47,1;48,1;49,1;50,1;51,2;52,1;53,1;54,2];
label_lab2_cha = {'bendpick1';'bendpick2';'bendpick3';
    'bendpick4';'empty1';'fall12';
    'fall13';'fall14';'fall15';
    'fall1' ;'fall21';'fall22';
    'fall23';'fall24';'fall25';
    'fall26';'fall31';'fall32';
    'fall33';'fall41';'fall42';
    'fall43';'fall44';'fall45';
    'fall51';'fall52';'fall53';
    'fall54';'fall55';'fallme11';
    'fallme12';'fallme13';'fallme14';
    'fallme15';'fallme21';'fallme22';
    'fallme23';'fallme24';'fallme25';
    'fallme31';'fallme32';'fallme33';
    'fallme34';'fallme35';'fallme41';
    'fallme42';'fallme43';'fallme44';
    'fallme45';'fallme51';'fallme52';
    'fallme53';'fallme54';'fallme55';
    'jump1';'jump2';'jump3';'jump4';
    'random1';'random2';'random3';
    'random4';'random5';'random6';
    'sitch1';'sitch2';'sitch3';
    'sitch4';'sitfl1';'sitfl2';
    'sitfl3';'sitfl4';'stndch1';
    'stndch2';'stndch3';'stndch4';
    'stndfl1';'stndfl2';'stndfl3';
    'stndfl4';'walk1';'walk2';'walk3';'walk4'};
label_lab2_num = [2;2;2;2;2;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2];
label_num  = label_lab2_num;
label_cell = cellstr(label_lab2_cha);


mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/*.mat'));
corridor_dat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/lab2/*.dat'));

% empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor11.mat')
% empty_ant2 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor12.mat')
% empty_ant3 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\empty_corridor13.mat')
empty_ant1 = load(fullfile(pwd,'\csi_tool_matlab\Activity\data\fall_detection\lab2\empty1_lab21.mat'));
empty_ant1 = load(fullfile(pwd,'\csi_tool_matlab\Activity\data\fall_detection\lab2\empty1_lab22.mat'));
empty_ant1 = load(fullfile(pwd,'\csi_tool_matlab\Activity\data\fall_detection\lab2\empty1_lab23.mat'));


sample_size = 10000;
normalize_index = 10000;
% N = NET.createArray('System.Double[][]',length(mat_files)/3);
fall_cell_array= cell(length(mat_files)/3,1);
for i = 1:3:length(mat_files)
load([fullfile(pwd,'\csi_tool_matlab\Activity\data\fall_detection\lab2\') mat_files(i).name])
load([fullfile(pwd,'\csi_tool_matlab\Activity\data\fall_detection\lab2\') mat_files(i+1).name])
load([fullfile(pwd,'\csi_tool_matlab\Activity\data\fall_detection\lab2\') mat_files(i+2).name])

empty_occu_concat_RX1 = horzcat(empty_ant1.ant1, ant1);
empty_occu_concat_RX2 = horzcat(empty_ant2.ant2, ant2);
empty_occu_concat_RX3 = horzcat(empty_ant3.ant3, ant3);

[~,~,~,amp_RX12_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
occu_amp_RX12_centered = amp_RX12_centered(:,10001:20000);
fall_cell_array{i-(i-1)*2/3} = occu_amp_RX12_centered;
% clear walk_LoS_interp1 walk_LoS_interp2 walk_LoS_interp3 walk_amp_RX123_centered
end
% fall_cell_array = cell(N);
 clear  ant1 ant2 ant3 empty_ant1 empty_ant2 empty_ant3 empty_occu_concat_RX1 empty_occu_concat_RX2 empty_occu_concat_RX3 amp_RX12_centered occu_amp_RX12_centered;