%Fall data extract from .dat  interpolate and save as .mat

% sample_size = 2000
%% Amplitude extraction
clear all

TX_ant = 1;
corridor_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom2/phase/*.dat'));

for i = 1:length(corridor_files)
file_name = corridor_files(i).name;
data_file = ['/Activity/data/fall_detection/bathroom2/phase/' file_name];  
% name_ant1 = [file_name(1:end-4) int2str(1) '.mat'];
% name_ant2 = [file_name(1:end-4) int2str(2) '.mat'];
% name_ant3 = [file_name(1:end-4) int2str(3) '.mat'];
name_phant12 = ['ph_' file_name(1:end-4) int2str(1) '.mat'];

% [ant1, ant2, ant3] = extract_amp_interp(TX_ant, data_file);
[phant12] = extract_phase_interp(TX_ant, data_file,10000);

% save(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor2\' name_ant1 ], 'ant1')
% save(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor2\' name_ant2 ], 'ant2')
% save(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\corridor2\' name_ant3 ], 'ant3')
save(['C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\bathroom2\phase\' name_phant12 ], 'phant12')

end
clear all