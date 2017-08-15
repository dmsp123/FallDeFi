%Fall data extract from .dat  interpolate and save as .mat

sample_size = 2000
%% Amplitude extraction
TX_ant =1;

    data_file = [ 'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_nld.dat'; 'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_ldn.dat';  'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s53.dat';'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s52.dat';'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s51.dat';'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s43.dat'; 'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s41.dat'; 'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s33.dat' ;'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s32.dat' ;'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s31.dat' ;'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s23.dat' ;'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s21.dat' ;'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s12.dat' ;'project/PCA_kPCA/data/PR_lab2/PRL_nLoS_s11.dat' ; ] ; values = 59774; 
    values = [59774; 59847; 59952; 57914; 59833; 59967; 59772; 59968; 59824; 59199; 59970; 59902; 59823; 59950;  ] 
    scene_ = ['nLoSdyn ';'LoSdyn  ';'static53';'static52';'static51';'static43';'static41';'static33';'static32';'static31';'static23';'static21';'static12';'static11';];


data_file = '/Activity/data/fall_detection/walk_LoS.dat'   ;values = 9996;
for i = 1:2
    TX_ant = i;
    [walk_LoS_interp1((i-1)*30+1:i*30,:), walk_LoS_interp2((i-1)*30+1:i*30,:),walk_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
% figure
% plot(walk_amp_interp1(1,:))
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk_1.mat','walk_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk_2.mat','walk_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk_3.mat','walk_LoS_interp3')

data_file = '/Activity/data/fall_detection/walk2_LoS.dat'   ;values = 9996;
for i = 1:2
    TX_ant = i;
    [walk2_LoS_interp1((i-1)*30+1:i*30,:), walk2_LoS_interp2((i-1)*30+1:i*30,:),walk2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk2_1.mat','walk2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk2_2.mat','walk2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk2_3.mat','walk2_LoS_interp3')

data_file = '/Activity/data/fall_detection/standfloor_LoS.dat'   ;values = 9996;
for i = 1:2
    TX_ant = i;
    [standfloor_LoS_interp1((i-1)*30+1:i*30,:), standfloor_LoS_interp2((i-1)*30+1:i*30,:),standfloor_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor_1.mat','standfloor_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor_2.mat','standfloor_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor_3.mat','standfloor_LoS_interp3')

data_file = '/Activity/data/fall_detection/standfloor2_LoS.dat'   ;values = 9996;
for i = 1:2
    TX_ant = i;
    [standfloor2_LoS_interp1((i-1)*30+1:i*30,:), standfloor2_LoS_interp2((i-1)*30+1:i*30,:),standfloor2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor2_1.mat','standfloor2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor2_2.mat','standfloor2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor2_3.mat','standfloor2_LoS_interp3')

% figure
% plot(standfloor2_LoS_interp1(1,:))

data_file = '/Activity/data/fall_detection/standchair_LoS.dat'   ;values = 9996;
for i = 1:2
    TX_ant = i;
    [standchair_LoS_interp1((i-1)*30+1:i*30,:), standchair_LoS_interp2((i-1)*30+1:i*30,:),standchair_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair_1.mat','standchair_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair_2.mat','standchair_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair_3.mat','standchair_LoS_interp3')

data_file = '/Activity/data/fall_detection/standchair2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [standchair2_LoS_interp1((i-1)*30+1:i*30,:), standchair2_LoS_interp2((i-1)*30+1:i*30,:),standchair2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair2_1.mat','standchair2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair2_2.mat','standchair2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair2_3.mat','standchair2_LoS_interp3')

data_file = '/Activity/data/fall_detection/sitfloor_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [sitfloor_LoS_interp1((i-1)*30+1:i*30,:), sitfloor_LoS_interp2((i-1)*30+1:i*30,:),sitfloor_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor_1.mat','sitfloor_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor_2.mat','sitfloor_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor_3.mat','sitfloor_LoS_interp3')

data_file = '/Activity/data/fall_detection/sitfloor2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [sitfloor2_LoS_interp1((i-1)*30+1:i*30,:), sitfloor2_LoS_interp2((i-1)*30+1:i*30,:),sitfloor2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor2_1.mat','sitfloor2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor2_2.mat','sitfloor2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor2_3.mat','sitfloor2_LoS_interp3')

% figure
% plot(sitfloor2_LoS_interp1(1,:))
data_file = '/Activity/data/fall_detection/sitchair_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [sitchair_LoS_interp1((i-1)*30+1:i*30,:), sitchair_LoS_interp2((i-1)*30+1:i*30,:),sitchair_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair_1.mat','sitchair_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair_2.mat','sitchair_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair_3.mat','sitchair_LoS_interp3')

data_file = '/Activity/data/fall_detection/sitchair2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [sitchair2_LoS_interp1((i-1)*30+1:i*30,:), sitchair2_LoS_interp2((i-1)*30+1:i*30,:),sitchair2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair2_1.mat','sitchair2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair2_2.mat','sitchair2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair2_3.mat','sitchair2_LoS_interp3')

data_file = '/Activity/data/fall_detection/run_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [run_LoS_interp1((i-1)*30+1:i*30,:), run_LoS_interp2((i-1)*30+1:i*30,:),run_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run_1.mat','run_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run_2.mat','run_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run_3.mat','run_LoS_interp3')

data_file = '/Activity/data/fall_detection/run2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [run2_LoS_interp1((i-1)*30+1:i*30,:), run2_LoS_interp2((i-1)*30+1:i*30,:),run2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run2_1.mat','run2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run2_2.mat','run2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run2_3.mat','run2_LoS_interp3')

data_file = '/Activity/data/fall_detection/jump_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [jump_LoS_interp1((i-1)*30+1:i*30,:), jump_LoS_interp2((i-1)*30+1:i*30,:),jump_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\jump_1.mat','jump_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\jump_2.mat','jump_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\jump_3.mat','jump_LoS_interp3')

data_file = '/Activity/data/fall_detection/empty_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [empty_LoS_interp1((i-1)*30+1:i*30,:), empty_LoS_interp2((i-1)*30+1:i*30,:),empty_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty_1.mat','empty_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty_2.mat','empty_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty_3.mat','empty_LoS_interp3')

data_file = '/Activity/data/fall_detection/empty_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [empty2_LoS_interp1((i-1)*30+1:i*30,:), empty2_LoS_interp2((i-1)*30+1:i*30,:),empty2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty2_1.mat','empty2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty2_2.mat','empty2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty2_3.mat','empty2_LoS_interp3')


data_file = '/Activity/data/fall_detection/rightlat_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [rightlat_LoS_interp1((i-1)*30+1:i*30,:), rightlat_LoS_interp2((i-1)*30+1:i*30,:),rightlat_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat_1.mat','rightlat_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat_2.mat','rightlat_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat_3.mat','rightlat_LoS_interp3')

% figure
% plot(rightlat_LoS_interp1(1,:))
data_file = '/Activity/data/fall_detection/rightlat2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [rightlat2_LoS_interp1((i-1)*30+1:i*30,:), rightlat2_LoS_interp2((i-1)*30+1:i*30,:),rightlat2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat2_1.mat','rightlat2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat2_2.mat','rightlat2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat2_3.mat','rightlat2_LoS_interp3')

data_file = '/Activity/data/fall_detection/leftlat_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [leftlat_LoS_interp1((i-1)*30+1:i*30,:), leftlat_LoS_interp2((i-1)*30+1:i*30,:),leftlat_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat_1.mat','leftlat_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat_2.mat','leftlat_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat_3.mat','leftlat_LoS_interp3')

data_file = '/Activity/data/fall_detection/leftlat2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [leftlat2_LoS_interp1((i-1)*30+1:i*30,:), leftlat2_LoS_interp2((i-1)*30+1:i*30,:),leftlat2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat2_1.mat','leftlat2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat2_2.mat','leftlat2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat2_3.mat','leftlat2_LoS_interp3')

data_file = '/Activity/data/fall_detection/trip_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [trip_LoS_interp1((i-1)*30+1:i*30,:), trip_LoS_interp2((i-1)*30+1:i*30,:),trip_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip_1.mat','trip_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip_2.mat','trip_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip_3.mat','trip_LoS_interp3')

% figure
% plot(trip_LoS_interp1(1,:))
data_file = '/Activity/data/fall_detection/trip2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [trip2_LoS_interp1((i-1)*30+1:i*30,:), trip2_LoS_interp2((i-1)*30+1:i*30,:),trip2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip2_1.mat','trip2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip2_2.mat','trip2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip2_3.mat','trip2_LoS_interp3')

data_file = '/Activity/data/fall_detection/slip_LoS.dat'   ;values = 9996;
% figure
% plot(trip2_LoS_interp1(1,:))
for i = 1:2
    TX_ant = i;
    [slip_LoS_interp1((i-1)*30+1:i*30,:), slip_LoS_interp2((i-1)*30+1:i*30,:),slip_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip_1.mat','slip_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip_2.mat','slip_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip_3.mat','slip_LoS_interp3')

% figure
% plot(slip_LoS_interp1(1,:))

data_file = '/Activity/data/fall_detection/slip2_LoS.dat'   ;values = 9996;

for i = 1:2
    TX_ant = i;
    [slip2_LoS_interp1((i-1)*30+1:i*30,:), slip2_LoS_interp2((i-1)*30+1:i*30,:),slip2_LoS_interp3((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip2_1.mat','slip2_LoS_interp1')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip2_2.mat','slip2_LoS_interp2')
save('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip2_3.mat','slip2_LoS_interp3')
