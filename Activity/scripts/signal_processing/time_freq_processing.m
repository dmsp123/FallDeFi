% fname = 'C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\Figures\STFT_binary';
% fname = 'C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\Figures\Kitchen';
fname = 'C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\Figures\Corridor\corridor2\corridor2_2';
% fname = 'C:\Users\R00119847\Documents\MATLAB\csi_tool_matlab\Activity\Figures\Bedrooms';

tx_rate      = 1000;
PBC_freq_min = 20;
PBC_freq_max = 250;
% PBC_fall_freq_thr = 15;
% event_thr     = 200;
% fall_like_thr = 1000;
% max_PBC       = 2e3;
% max_PBC       = 3.5e5;


feature_mat = zeros(length(stft_cell_array)*2,12);
% feature_mat = zeros(50,12);
% %
% for i =1:20%length(fall_cell_array)
%     stft_mat = stft_cell_array{i};
% %     figure
% %     histogram(reshape(log10(stft_mat(1:end,:)),[],1),1000)
% %     filename = ['hist_full' label_cell{i} int2str(i)];
% %     %         saveas(gca, fullfile(fname, filename), 'png');
% %     line([noise_line noise_line],[1 3e4])%2e4
% %     line([noise_line/2 noise_line/2],[1 3e4])%2e4
% %     line([noise_line/4 noise_line/4],[1 3e4])%2e4
% %
%     noise_line=.5971;
% %     figure
% %     histogram(reshape(log10(stft_mat(250:end,:)),[],1),1000)
% %     filename = ['hist_noise' label_cell{i} int2str(i)];
% %     %         saveas(gca, fullfile(fname, filename), 'png');
% %     line([noise_line noise_line],[1 3e4])%2e4
% %     line([noise_line/2 noise_line/2],[1 3e4])%2e4
% %     line([noise_line/4 noise_line/4],[1 3e4])%2e4
% %
%     pd=fitdist(reshape(log10(stft_mat(200:end,:)),[],1),'normal');
%     sigmas(i)=pd.sigma;
%     means(i)=pd.mu;

% x=-3:0.1:3;
%     PDF=pdf(pd,x); %PDF is a vector of y values: it's our fit
%
%     %Now overlay the fit
%     PDF=PDF/max(PDF); %normalise
%     %scale to y axis
%     y=ylim;
%     PDF=PDF*y(2);
%
%     hold on
%     plot(x,PDF,'g-','LineWidth',2)
%     hold off
%
% end
N = 1;%corridor2 3.5;corridor1 4 bedroom 3; lab: 4 kitchen:4
% bkg_noise_thrind        = zeros(1,length(stft_cell_array));%kitchen:54
bkg_noise_thrind        = zeros(1,fall_cell_array_size);
for i = 1:fall_cell_array_size
    stft_mat            = stft_cell_array{i};
    pd                  = fitdist(reshape(real(log10(stft_mat(250:end,:))),[],1),'normal');
    bkg_noise_thrind(i) = 10^(pd.mu + N*pd.sigma);
end
bkg_noise_thr = median(bkg_noise_thrind);% 126.4003%median(bkg_noise_thrind)%corridor amp126.4003; 

for i = 1 : fall_cell_array_size
    
    
    stft_mat = stft_cell_array{i};
    %     %
    h = figure;
    %  h=surf((stft_mat),'edgecolor','none');
    set(h, 'Visible', 'on');
    surf((stft_mat),'edgecolor','none');
    colormap(jet)
    axis([0 10000 0 250])
%      caxis([60,5000])
    %
    filename = ['raw_' label_cell{i} int2str(i)];
%      saveas(h, fullfile(fname, filename), 'png');
     
    %% remove clutter and noise
    stft_mat_uncl = stft_mat;
    stft_mat_uncl(stft_mat_uncl < bkg_noise_thr) = 0;
    
    h=figure;set(h, 'Visible', 'on');
    surf((stft_mat_uncl),'edgecolor','none')
    colormap(jet)
    axis([0 10000 0 60])
    caxis([60,5000])
    filename = ['stft_mat_uncl' label_cell{i} int2str(i)];
%     saveas(h, fullfile(fname, filename), 'png');
    
    %% Binary image
    stft_mat_uncl_bin = stft_mat_uncl;
    stft_mat_uncl_bin(stft_mat_uncl_bin > bkg_noise_thr-1) = 1;
%     h=figure;     set(h, 'Visible', 'on');
    
%     surf(stft_mat_uncl_bin,'edgecolor','none')
%     colormap(jet)
%     axis([0 10000 0 100])
%     filename = ['binary_' label_cell{i} int2str(i)];
%     saveas(gca, fullfile(fname, filename), 'png');
    
    
    %% Morphological dialation to close image
    se = strel('disk',1);
    closeBW = imclose(stft_mat_uncl_bin,se);
    
%     h=figure;        set(h, 'Visible', 'off');
%     surf(closeBW,'edgecolor','none')
%     colormap(jet)
%     axis([0 10000 0 200])
%     filename = ['dilate_' label_cell{i} int2str(i)];
% %     saveas(gca, fullfile(fname, filename), 'png');
    %
    
    %%  binary image remove outliers
    
    [L, num] = bwlabel(closeBW, 8);
%  figure; surf(L,'edgecolor','none')
    count_pixels_per_obj = sum(bsxfun(@eq,L(:),1:num));
    [~,ind] = max(count_pixels_per_obj);
    if(~isempty(ind))
        L = +(L==ind);
        
        %%// Display the images
        %
%         h=figure;        set(h, 'Visible', 'off');
%         surf(L,'edgecolor','none')
%         colormap(jet)
%         axis([0 10000 0 200])
%         filename = ['no_outl_' label_cell{i} int2str(i)];
%         saveas(gca, fullfile(fname, filename), 'png');
        
        
        %% spectrogram without outliers
        stft_mat_nooutl = L.*stft_mat;
        h = figure(6); set(h, 'Visible', 'on');
        h1 = surf((stft_mat_nooutl),'edgecolor','none');
        colormap(jet)
        axis([0 10000 0 100])
        caxis([60,5000])
        
        z_max = max(max(get(h1,'Zdata')));
        
        %% specify boundary of the spectrogram
        B = bwboundaries(L);
        h = figure(6); set(h, 'Visible', 'off');
        hold on
        for k = 1:length(B)
            boundary = B{k};
            plot3(boundary(:,2), boundary(:,1),repmat(z_max,[1,length(boundary(:,1))]), '.k', 'LineWidth', 1)
        end
        
        %% Torso frequency of the spectrogram using percentile method
        %         [~, r] = max( L==0, [], 1 );
        [rowIdx,colIdx] = find(L);
        %# with accumarray take the maximum column index for every row
        clear r;
        r = accumarray(colIdx,rowIdx,[],@max)' ;
        index_torso = zeros(1,length(r));
        for ii = 1:length(r)
            %    [c index(ii)] = min( abs(log10(cumsum(stft_mat_uncl(min(r):r(ii),ii))) - log10(sum(stft_mat_uncl(min(r):r(ii),ii))/2)));
            if r(ii)~=500
                [c, index_torso(ii)] = min(abs( cumsum((stft_mat_nooutl(1:r(ii)+1,ii))) - sum((stft_mat_nooutl(1:r(ii)+1,ii)))/2));
                %       [c index(ii)] = min( abs((cumsum(stft_mat_uncl(1:r(ii),ii))) - sum(stft_mat_uncl(1:r(ii),ii))/2));
            else
                [c, index_torso(ii)] = min(abs( cumsum((stft_mat_nooutl(1:r(ii),ii))) - sum((stft_mat_nooutl(1:r(ii),ii)))/2));
                
            end
        end
        
        
        %% Torso frequency line
        h=figure(6);
        set(h, 'Visible', 'off');
        hold on
        plot3(1:size(r,2),index_torso,repmat(z_max,[1,size(r,2)]), 'color','g', 'linewidth',1, 'linestyle','-')
        
        index_leg = zeros(1,length(r));
        for ii = 1:size(r,2)
            %            [c index(ii)] = min( abs(log10(cumsum(stft_mat_uncl(min(r):r(ii),ii))) - log10(sum(stft_mat_uncl(min(r):r(ii),ii))/2)));
            if r(ii)~=500
                
                [c, index_leg(ii)] = min(abs( cumsum((stft_mat_nooutl(1:r(ii)+1,ii))) - sum((stft_mat_nooutl(1:r(ii)+1,ii)))*.95));
                %               [c index(ii)] = min( abs((cumsum(stft_mat_uncl(1:r(ii),ii))) - sum(stft_mat_uncl(1:r(ii),ii))/2));
            else
                [c, index_leg(ii)] = min(abs( cumsum((stft_mat_nooutl(1:r(ii),ii))) - sum((stft_mat_nooutl(1:r(ii),ii)))*.95));
                
            end
        end
        
        
        
        %         plot3(1:size(r,2),index_leg,repmat(z_max,[1,size(r,2)]), 'color','g', 'linewidth',2, 'linestyle',':')
        %
        %% Power burst curve to identify the start and end of an event
        
        event_thr =  bkg_noise_thr*(PBC_freq_max-PBC_freq_min);
        PBC = sum(stft_mat_nooutl(PBC_freq_min:PBC_freq_max,:));%15
        h2=figure; set(h2, 'Visible', 'on');plot(PBC);
%                         axis([0 10000 0 max_PBC])
        line([1 10000],[event_thr event_thr])%2e4
        filename = ['PBC_' label_cell{i} int2str(i)];
        saveas(h2, fullfile(fname, filename), 'png');
        
        if (event_thr < max(PBC))
            %
            %     saveas(gca, fullfile(fname, filename), 'fig');
            [~, val_up_ind] = find(diff(PBC > event_thr) > 0);
            
            if(PBC(1) > event_thr)
                first_ind = 1;
                val_up_ind = [first_ind, val_up_ind];
            end
            val_down_ind = find(diff(PBC > event_thr) < 0);
            if(PBC(end) > event_thr)
                last_ind = size(PBC,2);
                val_down_ind = [ val_down_ind, last_ind];
            end
            
            
            
            
            %    [row, col]=find((stft_mat_nooutl(max_freq(I),val_up_ind(I):val_down_ind(I))));
            %     nzmax = max(stft_mat_nooutl(stft_mat_nooutl ~= 0));
            val_up_ind_   =   val_up_ind;
            val_down_ind_ = val_down_ind;
            j = 1;
            while (j < length(val_up_ind_))
                if((val_up_ind_(j + 1) - val_down_ind_(j)) < tx_rate/2)
                    val_up_ind_(j+1) = [];
                    val_down_ind_(j) = [];
                    j = j - 1;
                end
                j = j + 1;
            end
            
            val_up_ind   = val_up_ind_;
            val_down_ind = val_down_ind_;
            
            max_freq  = zeros(1,length(val_up_ind));
            mean_freq = zeros(1,length(val_up_ind));
            clear row
            for iii = 1 : length(val_up_ind)
                [row, ~] = find(stft_mat_nooutl(:,val_up_ind(iii):val_down_ind(iii)));
                max_freq(iii) =  max(row);
            end
            [~, I]     = max((val_down_ind - val_up_ind).*max_freq);
            
            
            event_mat = stft_mat_nooutl(:,val_up_ind(I):val_down_ind(I));
            event_mat( ~any(event_mat,2), : ) = [];
            dur_med_max_freq = median(find(event_mat(size(event_mat,1),:)));
            event_int    = [val_up_ind(I) val_down_ind(I)];
            
            index_ext = zeros(1,event_int(2)-event_int(1));
            for ii=1:event_int(2)-event_int(1)+1
                %    [c index(ii)] = min( abs(log10(cumsum(stft_mat_uncl(min(r):r(ii),ii))) - log10(sum(stft_mat_uncl(min(r):r(ii),ii))/2)));
                [c, index_ext(ii)] = min(abs( cumsum((stft_mat_nooutl(1:r(ii)+1,ii))) - sum((stft_mat_nooutl(1:r(ii)+1,ii)))));
                %       [c index(ii)] = min( abs((cumsum(stft_mat_uncl(1:r(ii),ii))) - sum(stft_mat_uncl(1:r(ii),ii))/2));
            end            %% Features
            % 1. Start to max freq time/max freq to end time
            % 2. Power burst curve area above threshold/area below
            % threshold
            % 3. Extreme frequency
            % 4. (Extreme) Torso frequency
            % 5. Extreme frequency/Extreme torso frequency
            % 6. Std torso frequency
            % 7. Std extreme frequency
            % 8. Event duration (from PBC)
            % 9. Mean torso frequency
            %10. Mean extreme frequency
            %11. Spectral entropy (10 to max freq)
            dim_val=BoxCountfracDim(L(:,event_int(1):event_int(2)));
           spectral_entropy = entropy(stft_mat_nooutl(10:30,event_int(1):event_int(2)));
            feature_mat(i,:) = [dur_med_max_freq/ (event_int(2)-event_int(1)-dur_med_max_freq),...
                sum(PBC(event_int(1):event_int(2)))/(event_int(2)-event_int(1))/event_thr,...
                max_freq(I),...
                max(index_torso(event_int(1):event_int(2))),...
                std(index_torso(event_int(1):event_int(2))),...
                max_freq(I)/max(index_torso(event_int(1):event_int(2))),...
                std(index_ext),...
                (event_int(2)-event_int(1)),...
                mean(index_torso(event_int(1):event_int(2))),...
                mean(index_ext),...
                spectral_entropy, dim_val];
            
            %%
            %             PBC_fall = sum(stft_mat_nooutl(PBC_fall_freq_thr:200,:));%15
            %             if (fall_like_thr < max(PBC_fall(val_up_ind(I):val_down_ind(I))))
            %                                 hold on
            %                                 plot(PBC_fall)
            %                                 %         axis([0 10000 0 max_PBC])
            %                                 line([1 10000],[fall_like_thr fall_like_thr])%2e4
            %                                 filename = ['PBC_' label_cell{i} int2str(i)];
            % %                                 saveas(gca, fullfile(fname, filename), 'png');
            % %                         saveas(gca, fullfile(fname, filename), 'fig');
            %                 val_up_ind_fall = find(diff(PBC_fall > fall_like_thr) > 0);
            %
            %                 if(PBC_fall(1) > fall_like_thr)
            %                     first_ind_fall = 1;
            %                     val_up_ind_fall = [first_ind, val_up_ind_fall];
            %                 end
            %                 val_down_ind_fall = find(diff(PBC_fall > fall_like_thr) < 0);
            %                 if(PBC_fall(end) > fall_like_thr)
            %                     last_ind_fall = size(PBC_fall,2);
            %                     val_down_ind_fall = [ val_down_ind_fall, last_ind_fall];
            %                 end
            %
            %
            %                 fall_max_freq = zeros(1,length(val_up_ind_fall));
            %                 fall_mean_freq = zeros(1,length(val_up_ind_fall));
            %                 for iii=1:length(val_up_ind_fall)
            %                     [row, ~] = find(stft_mat_nooutl(:,val_up_ind_fall(iii):val_down_ind_fall(iii)));
            %                     fall_max_freq(iii) =  max(row);
            %                 end
            %
            %                 [~, I_fall]     = max((val_down_ind_fall - val_up_ind_fall).*fall_max_freq);
            %                 %    [row, col]=find((stft_mat_nooutl(max_freq(I),val_up_ind(I):val_down_ind(I))));
            %                 %     nzmax = max(stft_mat_nooutl(stft_mat_nooutl ~= 0));
            %
            %                 event_mat_fall = stft_mat_nooutl(:,val_up_ind_fall(I_fall):val_down_ind_fall(I_fall));
            %                 event_mat_fall( ~any(event_mat_fall,2), : ) = [];
            %                 dur_med_max_fall_freq = median(find(event_mat_fall(size(event_mat_fall,1),:)));
            %                 event_int_fall    = [val_up_ind_fall(I_fall) val_down_ind_fall(I_fall)];
            %
            
            %             feature_mat(i,:)= [dur_med_max_fall_freq, event_int_fall(2)-event_int_fall(1)-dur_med_max_fall_freq, sum(PBC(event_int_fall(1):event_int_fall(2)))/(event_int_fall(2)-event_int_fall(1))/fall_like_thr,fall_max_freq(I_fall), max(index_torso(event_int_fall(1):event_int_fall(2))), std(index_torso(event_int_fall(1):event_int_fall(2)))];
            %
            %             figure(6); plot3(repmat(event_int_fall(1),[1,100]),1:100,repmat(z_max,[1,100]),'color','r', 'linewidth',3, 'linestyle','--');
            %             figure(6); plot3(repmat(event_int_fall(2),[1,100]),1:100,repmat(z_max,[1,100]),'color','r', 'linewidth',3, 'linestyle','--');
            %
            %             end
            
            %     figure; surf((stft_mat_nooutl(:,event_int(1):event_int(2))), 'edgecolor','none')
            % %     figure; surf((stft_mat_uncl(:,event_int(1):event_int(2))), 'edgecolor','none')
            %
            %     colormap(jet)
            %     axis([0 event_int(2)-event_int(1) 0 200])
            %     filename = ['event_' label_cell{i} int2str(i)];
            %     saveas(gca, fullfile(fname, filename), 'png');
            
            %% event lines
            h = figure(6);set(h, 'Visible', 'off'); plot3(repmat(event_int(1),[1,100]),1:100,repmat(z_max,[1,100]),'color','r', 'linewidth',2, 'linestyle',':');
            h = figure(6); set(h, 'Visible', 'off');
            plot3(repmat(event_int(2),[1,100]),1:100,repmat(z_max,[1,100]),'color','r', 'linewidth',2, 'linestyle',':');
            
            filename = ['full_' label_cell{i} int2str(i)];
            saveas(h, fullfile(fname, filename), 'png');
            
        end
    end
    %     pause(1)
    close all
end
%
% figure
% histogram(PBC)
% h=histfit(PBC);
%mean(PBC)+ .25*std(PBC)


% for i = 1:23
%     figure(i)
% hold on
% line([1 10000],[4000 4000])
% end