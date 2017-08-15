%Fall data extract from .dat  interpolate and save as .mat

% sample_size = 2000
%% Amplitude extraction
TX_ant = 1;
bathroom_files = dir(fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/*.dat'));

for i = 1:length(bathroom_files)
file_name = bathroom_files(i).name;
data_file = ['/Activity/data/fall_detection/bathroom/' file_name];  
name_ant1 = [file_name(1:end-4) int2str(1) '.mat'];
name_ant2 = [file_name(1:end-4) int2str(2) '.mat'];
name_ant3 = [file_name(1:end-4) int2str(3) '.mat'];

[ant1, ant2, ant3] = extract_amp_interp(TX_ant, data_file,10000);
save([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/') name_ant1 ], 'ant1')
save([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/') name_ant2 ], 'ant2')
save([fullfile(pwd,'csi_tool_matlab/Activity/data/fall_detection/bathroom/') name_ant3 ], 'ant3')
end
%
clear ant1 ant2 ant3 name_ant1 name_ant2 name_ant3 data_file file_name bathroom_files