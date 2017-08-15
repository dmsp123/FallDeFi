empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor\phase\ph_empty_corridor11.mat')
empty_ant2 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor\phase\ph_empty_corridor12.mat')
empty_ant3 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor\phase\ph_empty_corridor13.mat')
sample_size = 10000
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(corridor_mat_files)/3);

for i = 1:3:length(corridor_mat_files)
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor\phase\' corridor_mat_files(i).name])
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor\phase\' corridor_mat_files(i+1).name])
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor\phase\' corridor_mat_files(i+2).name])
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