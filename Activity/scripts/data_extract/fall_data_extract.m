label_lab_cha =  ['walk      '; 'walk      '; 'stand     ';...
    'standfloor'; 'standchair'; 'standchair'; 'sitfloor  ';...
    'sitfloor  '; 'sitchair  '; 'sitchair  '; 'walk      ';...
    'walk      '; 'jump      '; 'empty     '; 'empty     ';...
    'trip      '; 'trip      '; 'trip      '; 'trip      ';...
    'trip      '; 'trip      '; 'slip      '; 'slip      '];

%walk 1,  stand 2, sit 3, jump 4, no event 5, fall 6
label_cell = cellstr(label_lab_cha);
label_lab_num = ...
   [2;2;2;
    2;2;2;2;
    2;2;2;2;
    2;2;2;2;
    6;6;6;6;
    6;6;6;6];
label_num = label_lab_num;
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\walk2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\trip2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standfloor2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\standchair2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\slip2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitfloor2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\sitchair2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\run2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\rightlat2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\leftlat2_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\jump_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\jump_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\jump_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty_1.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty2_3.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty2_2.mat')
load('C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\data\fall_detection\LoS\empty2_1.mat')
% figure
% plot(slip2_LoS_interp1(1,:))

%% 
% Convert a .NET array of System.Double objects into a cell array.
% https://uk.mathworks.com/help/matlab/ref/cell.html#inputarg_sz1szN
% N = NET.createArray('System.Double[]',2);
% N(1) = [13 7 30];
% N(2) = 42;
% D = cell(N)
%%

%  1. FIRST LOAD THE FALL MATRICES 
%  2. NEXT RUN THE FOLLOWING CODE

sample_size = 10000
normalize_index = 10000;
N = NET.createArray('System.Double[][]',23);
empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,walk_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,walk_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,walk_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
walk_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(1) = walk_amp_RX123_centered;
clear walk_LoS_interp1 walk_LoS_interp2 walk_LoS_interp3 walk_amp_RX123_centered
% figure
% plot(walk_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,walk2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,walk2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,walk2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
walk2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(2) = walk2_amp_RX123_centered;

clear walk2_LoS_interp1 walk2_LoS_interp2 walk2_LoS_interp3 walk2_amp_RX123_centered
% figure
% plot(walk2_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,standfloor_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,standfloor_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,standfloor_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
standfloor_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(3) = standfloor_amp_RX123_centered;

clear standfloor_LoS_interp1 standfloor_LoS_interp2 standfloor_LoS_interp3 standfloor_amp_RX123_centered
% figure
% plot(standfloor_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,standfloor2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,standfloor2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,standfloor2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
standfloor2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(4) = standfloor2_amp_RX123_centered;

clear standfloor2_LoS_interp1 standfloor2_LoS_interp2 standfloor2_LoS_interp3 standfloor2_amp_RX123_centered
% figure
% plot(standfloor2_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,standchair_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,standchair_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,standchair_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
standchair_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(5) = standchair_amp_RX123_centered;

clear standchair_LoS_interp1 standchair_LoS_interp2 standchair_LoS_interp3 standchair_amp_RX123_centered
% figure
% plot(standchair_amp_RX123_centered(1,:))




empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,standchair2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,standchair2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,standchair2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
standchair2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(6) = standchair2_amp_RX123_centered;

clear standchair2_LoS_interp1 standchair2_LoS_interp2 standchair2_LoS_interp3 standchair2_amp_RX123_centered
% figure
% plot(standchair2_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,sitfloor_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,sitfloor_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,sitfloor_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
sitfloor_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(7) = sitfloor_amp_RX123_centered;

clear sitfloor_LoS_interp1 sitfloor_LoS_interp2 sitfloor_LoS_interp3 sitfloor_amp_RX123_centered
% figure
% plot(sitfloor_amp_RX123_centered(1,:))
% 
empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,sitfloor2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,sitfloor2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,sitfloor2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
sitfloor2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(8) = sitfloor2_amp_RX123_centered;

clear sitfloor2_LoS_interp1 sitfloor2_LoS_interp2 sitfloor2_LoS_interp3 sitfloor2_amp_RX123_centered
% figure
% plot(sitfloor2_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,sitchair_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,sitchair_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,sitchair_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
sitchair_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(9) = sitchair_amp_RX123_centered;

clear sitchair_LoS_interp1 sitchair_LoS_interp2 sitchair_LoS_interp3 sitchair_amp_RX123_centered
% figure
% plot(sitchair_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,sitchair2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,sitchair2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,sitchair2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
sitchair2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(10) = sitchair2_amp_RX123_centered;

clear sitchair2_LoS_interp1 sitchair2_LoS_interp2 sitchair2_LoS_interp3 sitchair2_amp_RX123_centered
% figure
% plot(sitchair2_amp_RX123_centered(1,:))
% surf(sitchair2_amp_RX123_centered, 'edgecolor','none')

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,run_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,run_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,run_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
run_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(11) = run_amp_RX123_centered;

clear run_LoS_interp1 run_LoS_interp2 run_LoS_interp3 run_amp_RX123_centered
% figure
% plot(run_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,run2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,run2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,run2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
run2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(12) = run2_amp_RX123_centered;

clear run2_LoS_interp1 run2_LoS_interp2 run2_LoS_interp3 run2_amp_RX123_centered
% figure
% plot(run2_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,jump_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,jump_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,jump_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
jump_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(13) = jump_amp_RX123_centered;

clear jump_LoS_interp1 jump_LoS_interp2 jump_LoS_interp3 jump_amp_RX123_centered
% figure
% plot(jump_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,empty_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,empty_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,empty_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
empty_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(14) = empty_amp_RX123_centered;

clear empty_amp_RX123_centered %empty_LoS_interp1 empty_LoS_interp2 empty_LoS_interp3
% figure
% plot(empty_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,empty2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,empty2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,empty2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
empty2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(15) = empty2_amp_RX123_centered;

clear empty2_LoS_interp1 empty2_LoS_interp2 empty2_LoS_interp3 empty2_amp_RX123_centered
% figure
% plot(empty2_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,rightlat_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,rightlat_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,rightlat_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
rightlat_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(16) = rightlat_amp_RX123_centered;

clear rightlat_LoS_interp1 rightlat_LoS_interp2 rightlat_LoS_interp3 rightlat_amp_RX123_centered
% figure
% plot(rightlat_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,rightlat2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,rightlat2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,rightlat2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
rightlat2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(17) = rightlat2_amp_RX123_centered;

clear rightlat2_LoS_interp1 rightlat2_LoS_interp2 rightlat2_LoS_interp3 rightlat2_amp_RX123_centered
% figure
% plot(rightlat2_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,leftlat_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,leftlat_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,leftlat_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
leftlat_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(18) = leftlat_amp_RX123_centered;

clear leftlat_LoS_interp1 leftlat_LoS_interp2 leftlat_LoS_interp3 leftlat_amp_RX123_centered
% figure
% plot(leftlat_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,leftlat2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,leftlat2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,leftlat2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
leftlat2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(19) = leftlat2_amp_RX123_centered;

clear leftlat2_LoS_interp1 leftlat2_LoS_interp2 leftlat2_LoS_interp3 leftlat2_amp_RX123_centered
% figure
% plot(leftlat2_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,trip_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,trip_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,trip_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
trip_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(20) = trip_amp_RX123_centered;

clear trip_LoS_interp1 trip_LoS_interp2 trip_LoS_interp3 trip_amp_RX123_centered
% figure
% plot(trip_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,trip2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,trip2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,trip2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
trip2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(21) = trip2_amp_RX123_centered;

clear trip2_LoS_interp1 trip2_LoS_interp2 trip2_LoS_interp3 trip2_amp_RX123_centered
% figure
% plot(trip2_amp_RX123_centered(1,:))

empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,slip_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,slip_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,slip_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
slip_amp_RX123_centered = amp_RX123_centered(:,10001:20000);
N(22) = slip_amp_RX123_centered;

clear slip_LoS_interp1 slip_LoS_interp2 slip_LoS_interp3 slip_amp_RX123_centered
% figure
% plot(slip_amp_RX123_centered(1,:))


empty_occu_concat_RX1 = horzcat(empty_LoS_interp1,slip2_LoS_interp1);
empty_occu_concat_RX2 = horzcat(empty_LoS_interp1,slip2_LoS_interp2);
empty_occu_concat_RX3 = horzcat(empty_LoS_interp1,slip2_LoS_interp3);
[ amp_RX123_centered] = center_data(empty_occu_concat_RX1,empty_occu_concat_RX2,empty_occu_concat_RX3, sample_size, normalize_index);
slip2_amp_RX123_centered = amp_RX123_centered(:,10001:20000);

N(23) = slip2_amp_RX123_centered;
fall_cell_array = cell(N);

clear empty_LoS_interp1 empty_LoS_interp2 empty_LoS_interp3
clear slip2_LoS_interp1 slip2_LoS_interp2 slip2_LoS_interp3 slip2_amp_RX123_centered amp_RX123_centered
clear empty_occu_concat_RX1 empty_occu_concat_RX2 empty_occu_concat_RX3
clear N
% 
% figure
% plot(jump_amp_RX123_centered(1,:))
% 
% figure
% surf(jump_amp_RX123_centered, 'EdgeColor', 'none')