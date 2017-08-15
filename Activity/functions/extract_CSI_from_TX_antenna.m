
%No. of extracted CSI values are equal to the input value

function [RX_1_ant_sq, RX_2_ant_sq, RX_3_ant_sq] = extract_CSI_from_TX_antenna(TX_ant, data_file, values)


    csi_trace = read_bf_file(data_file);
    k = [-28,-26,-24,-22,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,-1,1,3,5,7,9,11,13,15,17,19,21,23,25,27,28];

%RX_antenna_1 = ones(2,30, size(csi_trace,1));
%RX_antenna_2 = ones(2,30, size(csi_trace,1));
%x = linspace(1, size(csi_trace,1),size(csi_trace,1));
    csi_entry = csi_trace{2};
    csi = get_scaled_csi(csi_entry);
     fprintf('no. of CSI values: %d\n',size(csi_trace,1));
%CHeck the no
%x=1;
   if size(csi,1)==1 % 1 TX antenna
%         if x==1
   % RX_antenna_1 = ones(1,30, size(csi_trace,1));
   % RX_antenna_2 = ones(1,30, size(csi_trace,1));
        RX_antenna_1 = zeros(1, 30, size(csi_trace,1));
        RX_antenna_2 = zeros(1, 30, size(csi_trace,1));
        RX_antenna_3 = zeros(1, 30, size(csi_trace,1));

     %    for i = 1:size(csi_trace,1)
        for i = 1:size(csi_trace,1) 
            csi_entry = csi_trace{i};
            csi = get_scaled_csi(csi_entry);
            RX_antenna_1(:,:,i ) = squeeze(csi(1, 1,:));%receive antenna 1, TX 1 and 2
            RX_antenna_2(:,:,i ) = squeeze(csi(1, 2,:));%receive antenna 2, TX 1 and 2
            RX_antenna_3(:,:,i ) = squeeze(csi(1, 3,:));
        end
    elseif size(csi,1)==2 % 2 TX antennas
      % RX_antenna_1 = ones(2,30, size(csi_trace,1));
   % RX_antenna_2 = ones(2,30, size(csi_trace,1));
        RX_antenna_1 = zeros(2,30, size(csi_trace,1));
        RX_antenna_2 = zeros(2,30, size(csi_trace,1));
        RX_antenna_3 = zeros(2,30, size(csi_trace,1));
        
     %   for i = 1:size(csi_trace,1)
        for i = 1:size(csi_trace,1)
            csi_entry = csi_trace{i};
            csi = get_scaled_csi(csi_entry);
            RX_antenna_1(:,:,i ) = squeeze(csi(:,1,:));%%receive antenna 1, TX 1 and 2
            RX_antenna_2(:,:,i ) = squeeze(csi(:,2,:));%%receive antenna 2, TX 1 and 2
            RX_antenna_3(:,:,i ) = squeeze(csi(:,3,:));%%receive antenna 3, TX 1 and 2
        end
    elseif size(csi,1)==3 % 3 TX antennas
     % RX_antenna_1 = ones(3,30, size(csi_trace,1));
   % RX_antenna_2 = ones(3,30, size(csi_trace,1));
        RX_antenna_1 = zeros(3,30, size(csi_trace,1));
        RX_antenna_2 = zeros(3,30, size(csi_trace,1));
        RX_antenna_3 = zeros(3,30, size(csi_trace,1));
        
   %     csi_trace_struct_array = cell2mat(csi_trace);
        
     %   for i = 1:size(csi_trace,1)
        for i = 1:size(csi_trace,1)
            csi_entry = csi_trace{i};
            csi = get_scaled_csi(csi_entry);
            RX_antenna_1(:,:,i ) = squeeze(csi(:,1,:));%% receive antenna 1, TX 1, 2, 3
            RX_antenna_2(:,:,i ) = squeeze(csi(:,2,:));%% receive antenna 2, TX 1, 2, 3
            RX_antenna_3(:,:,i ) = squeeze(csi(:,3,:));%% receive antenna 3, TX 1, 2, 3
        end
    end

RX_1_ant_sq = squeeze(RX_antenna_1(TX_ant,:,:));% TX 1, RX 1
RX_2_ant_sq = squeeze(RX_antenna_2(TX_ant,:,:));% TX 1, RX 2
RX_3_ant_sq = squeeze(RX_antenna_3(TX_ant,:,:));
%y = angle(RX_11_ant_sq.' .* conj(RX_12_ant_sq).');
%RX1_angle = angle(RX_1_ant_sq);
%RX2_angle = angle(RX_2_ant_sq);
end
%%%%%%%%%%%%%%%%%%
%% RX antenna 1 %%
%%%%%%%%%%%%%%%%%%
% 
% figure%% 1 Phase plot for 5000 packets for 1 subcarrier
% scatter(linspace(1, 1000,1000),squeeze(RX1_angle(1, 1:1000)), '.b')
% ax =gca;
% hold on
% %plot(squeeze(RX1_angle(1, 1:5000)), '--g')
% hold off
% str = sprintf('TX %d, RX %d phase',1, 1);
% title(str);
% ax.YTick = [-1*pi, -0.5*pi, 0, 0.5*pi, 1*pi];
% ax.YTickLabel = {'-1\pi','-0.5\pi','0','0.5\pi','1\pi'};
% xlabel('Packet Number');
% ylabel('Phase (rad)');
% 
% figure %% 2 Phase and amplitude in polar plot for 5000 packets for 1 subcarrier
% polar(RX1_angle(1, 1:1000),db(abs(RX_1_ant_sq(1,1:1000))),'.r');
% 
% figure %% 3 Amplitude plot for 5000 packets for 1 subcarrier
% scatter(linspace(1, 1000,1000), db(abs(RX_1_ant_sq(1,1:1000))), '.b');
% str = sprintf('TX %d, RX %d amplitude', 1, 1);
% title(str);
% xlabel('Packet Number');
% ylabel('Amplitude (dBm)');
% 
% 
% %%%%%%%%%%%%%%%%%%
% %% RX antenna 2 %%
% %%%%%%%%%%%%%%%%%%
% %RX2_angle = angle(RX_2_ant_sq);
% 
% figure %% 4 Phase plot for 5000 packets for 1 subcarrier
% hold on
% scatter(linspace(1, 1000,1000),squeeze(RX2_angle(1, 1:1000)), '.b');
% plot(squeeze(RX2_angle(1, 1:1000)), ':r');
% %plot(squeeze(RX2_angle(1, 1:5000)), '--g');
% hold off
% ax = gca;
% str = sprintf('TX %d, RX %d phase',1, 2);
% title(str);
% ax.YTick = [-1*pi, -0.5*pi, 0, 0.5*pi, 1*pi];
% ax.YTickLabel = {'-1\pi','-0.5\pi','0','0.5\pi','1\pi'};
% xlabel('Packet Number');
% ylabel('Phase (rad)');
% 
% figure %% 5 Phase and amplitude in polar plot for 5000 packets for 1 subcarrier
% polar(RX1_angle(1, 1:1000),db(abs(RX_2_ant_sq(1,1:1000))), '.r');
% 
% figure  %% 6 Amplitude plot for 5000 packets for 1 subcarrier
% scatter(linspace(1, 1000,1000), db(abs(RX_2_ant_sq(1,1:1000))), '.b');
% str = sprintf('TX %d, RX %d amplitude', 1, 2);
% title(str);
% xlabel('Packet Number');
% ylabel('Amplitude (dBm)');
% 
% 
% 
% figure % 7 
% %h = surf(linspace(1, 50,50), k, db(abs(RX_1_ant_sq(:,1:50))));
% h = surf(linspace(1, 100,100), k, abs(RX_1_ant_sq(:,1:100)));
% set(h, 'edgecolor','none');
% %shading flat
% colormap(jet)
% str = sprintf('TX %d, RX %d Amplitude',2, 1);
% title(str);
% ylabel('Subcarrier index');
% zlabel('Amplitude (dBm)');
% xlabel('Packet No.');
% 
% figure % 8 
% %h = surf(linspace(1, 50,50), k, db(abs(RX_1_ant_sq(:,1:50))));
% h = surf(linspace(1, 100,100), k, abs(RX_2_ant_sq(:,1:100)));
% set(h, 'edgecolor','none');
% %shading flat
% colormap(jet)
% str = sprintf('TX %d, RX %d Amplitude',2, 2);
% title(str);
% ylabel('Subcarrier index');
% zlabel('Amplitude (dBm)');
% xlabel('Packet No.');
% figure(13)

%plot(k, abs(RX_1_ant_sq(:,100)));

% figure
% hold on
% for l = 1:100   
% plot( k, RX1_angle(:, l))
% end
% hold off
% 
% figure
% hold on
% for l = 1:100
% plot( k, RX2_angle(:, l))
% end
% hold off
% 
%     figure % 9 
% h = surf(linspace(1, 100,100), k, RX1_angle(:, 1:100));
%     
%     set(h, 'edgecolor','none');
% %shading flat
%     colormap(jet)
%     str = sprintf('TX %d, RX %d Phase',2, 1);
%     title(str);
%     ylabel('Subcarrier index');
%     zlabel('Phase (rad)');
%     xlabel('Packet No.');
% 
%     figure % 10
%     h = surf(linspace(1, 100,100), k, RX2_angle(:, 1:100));
%     %h = scatter3(linspace(1, 100,100), k, RX2_angle(:, 1:100));
%     set(h, 'edgecolor','none');
%     %shading flat
%     colormap(jet)
%     str = sprintf('TX %d, RX %d Phase',2, 2);
%     title(str);
%     ylabel('Subcarrier index');
%     zlabel('Phase (rad)');
%     xlabel('Packet No.');
% 
% 
% figure  % 11
% for m=1:100
%  scatter(k, RX1_angle(:, m));
%  scatter(k, RX2_angle(:, m));
% end
% 
% %db(abs(squeeze(csi).'
% % mean_RX_1 = mean(db(abs(RX_antenna_1)),3);
% % mean_RX_2 = mean(db(abs(RX_antenna_2)),3);
% % figure
% % plot(mean_RX_1'); 
% % figure(2)
% % plot(mean_RX_2'); 