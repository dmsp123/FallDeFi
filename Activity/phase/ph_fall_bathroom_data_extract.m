mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/phase/*.mat'));
% ph_empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\phase\ph_empty_corridor11.mat')

% mat_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bedrooms/phase/*.mat'));
% ph_empty_ant1 = load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor1\phase\ph_empty_corridor11.mat')


sample_size = 10000;
normalize_index = 10000;
N = NET.createArray('System.Double[][]',length(mat_files));

for i = 1:length(mat_files)
load(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\bathroom2\phase\' mat_files(i).name])
% empty_occu_concat_RX1 = horzcat(ph_empty_ant1.phant12, phant12);

% figure
% plot(phant12(1,:))

% [amp_RX12_centered,~,~,~,~] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX1,empty_occu_concat_RX1, sample_size, normalize_index);
% occu_amp_RX12_centered = amp_RX12_centered(:,10001:20000);

% figure
% plot(occu_amp_RX12_centered(1,:))
% N(i) = occu_amp_RX12_centered;
N(i) = phant12;
end
fall_phcell_array = cell(N);
clear N ant1 ant2 ant3 empty_ant1 empty_ant2 empty_ant3 empty_occu_concat_RX1 empty_occu_concat_RX2 empty_occu_concat_RX3 amp_RX12_centered occu_amp_RX12_centered;

test = fall_phcell_array{8};
figure
plot(test(1,:))