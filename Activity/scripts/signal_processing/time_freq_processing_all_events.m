
m            = 0;
fall_dur_ext = .5;
PBC_freq_min = 5;
PBC_freq_max = 25;
% PBC_fall_freq_thr = 15;
% event_thr     = 200;
% fall_like_thr = 1000;
% max_PBC       = 2e3;
% max_PBC       = 3.5e5;


feature_mat = zeros(length(stft_cell_array)*2,7);
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



%lab2 tuning: 99% N=3.8
N=4.3;% 800 -4.2  600 -4.2 400 -4.2 200
%kitchen2 3%corridor2 2_1 1.5 2_2 2 % noisy bathroom1,2 N =4; bedrooms1,2 3.5
%;%corridor2 4, 374.4958;corridor1 3.3 bedroom1 (574.1374) 3.1;bedroom2=4.3; lab:
% 4, lab2: 4.3 kitchen:3.64 kitchen2: 4.2, bathroom: 4.9, bathroom2: 5.3 3PCs4.3
% bkg_noise_thrind        = zeros(1,length(stft_cell_array));%kitchen:54

bkg_noise_thrind        = zeros(1,fall_cell_array_size);
for i = 1 : fall_cell_array_size                          
    stft_mat            = stft_cell_array{i};         
    pd                  = fitdist(reshape(real(log10(stft_mat(200:end,:))),[],1),'normal');
    bkg_noise_thrind(i) = 10^(pd.mu + N*pd.sigma);
end 
bkg_noise_thr =  200;% median(bkg_noise_thrind)% 126.4003%median(bkg_noise_thrind)%corridor amp126.4003;
    
for i = 1 : fall_cell_array_size
    
    stft_mat = stft_cell_array{i};
    
%     h = figure;
%     %  h=surf((stft_mat),'edgecolor','none');
%     set(h, 'Visible', 'on');
%     surf(imresize(stft_mat,[500 1000]),'edgecolor','none');
%     colormap(jet)
%     axis([0 1000 0 110])
    %     set(s,'EdgeColor','interp');
    %   caxis([60,5000])
    %
    %     filename = ['raw_' label_cell{i} int2str(i)];
    %     saveas(h, fullfile(fname, filename), 'png');
    %     saveas(h, fullfile(fname, filename), 'fig');
    
    %% remove clutter and noise
    stft_mat_uncl = stft_mat;
    stft_mat_uncl(stft_mat_uncl < bkg_noise_thr) = 0;
    %                                                             
    % kitchen 47:lose balance, lose conscious 57, slip:69, trip:79
                                                                  
%     h=figure;set(h, 'Visible', 'on');   
%     resized_surf_uncl=imresize(stft_mat_uncl,[500 1000]);
%     s=surf(resized_surf_uncl,'edgecolor','none');
%     colormap(jet)                                                 
%     axis([0 1000 0 110]); caxis([10,1000])
    %     set(s,'EdgeColor','interp');
    
    %     caxis([60,5000])
    %     filename = ['stft_mat_uncl' label_cell{i} int2str(i)];
    %     saveas(h, fullfile(fname, filename), 'png');
    %     saveas(h, fullfile(fname, filename), 'fig');
    
      
    %% Binary image
      stft_mat_uncl_bin = stft_mat_uncl;
    stft_mat_uncl_bin(stft_mat_uncl_bin > bkg_noise_thr-1) = 1;
    %     h=figure;     set(h, 'Visible', 'on');
    %
    %     surf(imresize(stft_mat_uncl_bin,[500 1000]),'edgecolor','none')
    % %     colormap gray
    %     axis([0 1000 0 110])
    %         filename = ['binary_' label_cell{i} int2str(i)];
    %         saveas(gca, fullfile(fname, filename), 'png');
    %         saveas(gca, fullfile(fname, filename), 'fig');
    
    
    %% Morphological dialation to close image
    %     se = strel('disk',2);
    %     closeBW = imclose(stft_mat_uncl_bin,se);
    %
    %         h=figure;        set(h, 'Visible', 'on');
    %         surf(closeBW,'edgecolor','none')
    %         colormap(gray)
    %         axis([0 10000 0 110])
    % %         filename = ['dilate_' label_cell{i} int2str(i)];
    % %        saveas(gca, fullfile(fname, filename), 'png');
    % %        saveas(gca, fullfile(fname, filename), 'fig');
    %    

    
    %%  binary image remove outliers
    
    [L, num] = bwlabel(stft_mat_uncl_bin, 8);
    %       figure; surf(L,'edgecolor','none')
    count_pixels_per_obj = sum(bsxfun(@eq,L(:),1:num));
    [~,ind] = max(count_pixels_per_obj);
    if(~isempty(ind))
        L = +(L==ind);
        
        %%// Display the images
        %         %
        %         h=figure;        set(h, 'Visible', 'on');
        %         surf(imresize(L,[500 1000]),'edgecolor','none')
        %         colormap(hot)
        %         axis([0 1000 0 110])
        %         filename = ['no_outl_' label_cell{i} int2str(i)];
        %                 saveas(gca, fullfile(fname, filename), 'png');
        %                 saveas(gca, fullfile(fname, filename), 'fig');
        
        
        %% spectrogram without outliers
        stft_mat_nooutl = L.*stft_mat;
        %
        h = figure(6); set(h, 'Visible', 'on');
        h1 = surf((stft_mat_nooutl),'edgecolor','none');
        colormap(jet)
        axis([0 10000 0 110])
        caxis([0,2000])
        z_max = max(max(get(h1,'Zdata')));
        
        %% specify boundary of the spectrogram
        B = bwboundaries(L);
        
        %         for k = 1:length(B)
        %             boundary = B{k};
        %             plot3(boundary(:,2), boundary(:,1),repmat(z_max,[1,length(boundary(:,1))]), ':b', 'LineWidth', 2)
        %         end
        
        %% Extreme frequency of the spectrogram
        %         [~, r] = max( L==0, [], 1 );
        [rowIdx,colIdx] = find(L);
        %# with accumarray take the maximum column index for every row
        clear r;
        r = accumarray(colIdx,rowIdx,[],@max)' ;
        figure(6); hold on
        %         plot(1:10000,r, 'linestyle',':','color', [240,240,240]/250, 'linewidth',2)
        plot3(1:size(r,2),r,repmat(z_max,[1,size(r,2)]), 'color',[50,50,50]/250, 'linewidth',2, 'linestyle',':')
        
        
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
        set(h, 'Visible', 'on');
        hold on
        plot3(1:size(r,2),index_torso,repmat(z_max,[1,size(r,2)]), 'color',[180,180,180]/250, 'linewidth',2, 'linestyle',':')
%         %
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
        
        %         h2=figure; set(h2, 'Visible', 'on');plot(PBC, 'linewidth',2);
        %         %                         axis([0 10000 0 max_PBC])
        %         line([1 10000],[event_thr event_thr], 'color', 'k','LineStyle',':','linewidth',2)%2e4
        %         filename = ['PBC_' label_cell{i} int2str(i)];
        %         saveas(h2, fullfile(fname, filename), 'png');
        %         saveas(h2, fullfile(fname, filename), 'fig');
        
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
                if((val_up_ind_(j + 1) - val_down_ind_(j)) < fall_dur_ext*1000)
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
            
            for iv = 1 : length(val_down_ind - val_up_ind)
                m = m + 1;
                event_mat = stft_mat_nooutl(:,val_up_ind(iv):val_down_ind(iv));
                event_mat( ~any(event_mat,2), : ) = [];
                dur_med_max_freq = median(find(event_mat(size(event_mat,1),:)));
                
                event_int    = [val_up_ind(iv) val_down_ind(iv)];
                index_ext = zeros(1,event_int(2)-event_int(1));
                for ii=1:event_int(2)-event_int(1)+1
                    %    [c index(ii)] = min( abs(log10(cumsum(stft_mat_uncl(min(r):r(ii),ii))) - log10(sum(stft_mat_uncl(min(r):r(ii),ii))/2)));
                    [c, index_ext(ii)] = min(abs( cumsum((stft_mat_nooutl(1:r(ii),ii))) - sum((stft_mat_nooutl(1:r(ii),ii)))));
                    %       [c index(ii)] = min( abs((cumsum(stft_mat_uncl(1:r(ii),ii))) - sum(stft_mat_uncl(1:r(ii),ii))/2));
                end
                   
                %% Features
                % 1. Start to max freq time/max freq to end time
                % 2. Power burst curve area above threshold/area below
                % threshold
                % 3. Extreme frequency
                % 4. (Extreme) Torso frequency
                % 5. Std torso frequency
                % 6. Extreme frequency/Extreme torso frequency
                % 7. Std extreme frequency
                % 8. Event duration (from PBC)
                % 9. Mean torso frequency
                %10. Mean extreme frequency
                %11. Spectral entropy (10-30)
                %12. Spectral entropy (1-10)
                %13. Fractal dimension
                %14. Spectral entropy (10-20)
                %15. Spectral entropy (20-30)
                %16. Spectral entropy (30-max freq)
                %17. Spectral entropy (1-5)
                %18. Spectral entropy (5-10)
                %19. Spectral entropy (10-15)
                %20. Spectral entropy (15-20)
                %21. Spectral entrapy (20-25)
                %22. Spectral entrapy (25-30)
                %23. Max relative power (10-30)
                %24. Max relative power (1-10)
                %25. Max relative power (10-20)
                %26. Max relative power (20-30)
                %27. Max relative power (30-max)
                %28. Max relative power (1-5)
                %29. Max relative power (5-10)
                %30. Max relative power (10-15)
                %31. Max relative power (15-20)
                %32. Max relative power (20-25)
                %33. Max relative power (25-30)
                
                
                dim_val              = BoxCountfracDim(L(:,event_int(1):event_int(2)));
                spectral_entropy1030 = entropy(stft_mat_nooutl(11:30,event_int(1):event_int(2)));
                spectral_entropy110  = entropy(stft_mat_nooutl(1:10,event_int(1):event_int(2)));
                spectral_entropy1020 = entropy(stft_mat_nooutl(11:20,event_int(1):event_int(2)));
                spectral_entropy2030 = entropy(stft_mat_nooutl(21:30,event_int(1):event_int(2)));
                
                if(max_freq(iv) > 30)
                    spectral_entropy30max = entropy(stft_mat_nooutl(31:max_freq(iv),event_int(1):event_int(2)));
                else
                    spectral_entropy30max = 0;
                end
                
                spectral_entropy15   = entropy(stft_mat_nooutl(1:5,event_int(1):event_int(2)));
                spectral_entropy510  = entropy(stft_mat_nooutl(6:10,event_int(1):event_int(2)));
                spectral_entropy1015 = entropy(stft_mat_nooutl(11:15,event_int(1):event_int(2)));
                spectral_entropy1520 = entropy(stft_mat_nooutl(16:20,event_int(1):event_int(2)));
                spectral_entropy2025 = entropy(stft_mat_nooutl(21:25,event_int(1):event_int(2)));
                spectral_entropy2530 = entropy(stft_mat_nooutl(26:30,event_int(1):event_int(2)));
                
                max_rel_power15     = max(max(stft_mat_nooutl(1:6,event_int(1):event_int(2))));
                max_rel_power1030   = max(max(stft_mat_nooutl(11:30,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power110    = max(max(stft_mat_nooutl(1:10,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power1020   = max(max(stft_mat_nooutl(11:20,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power2030   = max(max(stft_mat_nooutl(21:30,event_int(1):event_int(2))))/max_rel_power15;
                
                if(max_freq(iv) > 30)
                    max_rel_power30max  = max(max(stft_mat_nooutl(31:max_freq(iv),event_int(1):event_int(2))))/max_rel_power15;
                else
                    max_rel_power30max=0;
                end
                
                max_rel_power510   = max(max(stft_mat_nooutl(6:10,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power1015  = max(max(stft_mat_nooutl(11:15,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power1520  = max(max(stft_mat_nooutl(16:20,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power2025  = max(max(stft_mat_nooutl(21:25,event_int(1):event_int(2))))/max_rel_power15;
                max_rel_power2530  = max(max(stft_mat_nooutl(26:30,event_int(1):event_int(2))))/max_rel_power15;
                %sum(PBC(event_int(1):event_int(2)))/(event_int(2)-event_int(1))/event_thr,...
                    %max_freq(iv),...
                    %max(index_torso(event_int(1):event_int(2))),...
                    %std(index_torso(event_int(1):event_int(2))),...
                    %max_freq(iv)/max(index_torso(event_int(1):event_int(2))),...
                    %std(index_ext),...
                    %mean(index_torso(event_int(1):event_int(2))),...
                    %mean(index_ext),...
                    % spectral_entropy1020,spectral_entropy2030,spectral_entropy30max,spectral_entropy15,spectral_entropy510,spectral_entropy1015,spectral_entropy1520,spectral_entropy2025,spectral_entropy2530,...
                    %max_rel_power1030,max_rel_power110,max_rel_power1020,max_rel_power2030,max_rel_power30max...
                   % max_rel_power15,max_rel_power510,max_rel_power1015,max_rel_power1520,max_rel_power2025,max_rel_power2530,...

                feature_mat(m,:) = [ (event_int(2)-event_int(1)),spectral_entropy1030,spectral_entropy110,dim_val,label_num(i),i,2];
                
                %% event lines
                h = figure(6);set(h, 'Visible', 'on'); plot3(repmat(event_int(1),[1,109]),1:109,repmat(z_max,[1,109]),'color','r', 'linewidth',.5, 'linestyle','-');
                h = figure(6); set(h, 'Visible', 'on');
                plot3(repmat(event_int(2),[1,109]),1:109,repmat(z_max,[1,109]),'color','r', 'linewidth',.5, 'linestyle','-');
                
                %             filename = ['full_' label_cell{i} int2str(i)];
                %             saveas(h, fullfile(fname, filename), 'png');
                %             saveas(h, fullfile(fname, filename), 'fig');
                
                
                if(label_num(i)==6)
                    if iv==I
                        feature_mat(m,end-2) = 6;
                        feature_mat(m,end)   = 6;
                    else
                        feature_mat(m,end-2) = 2;
                    end 
                end     
            end         
        end         
    else
        m=m+1;
        feature_mat(m,[end-2,end-1,end]) = [2,i, label_num(i)];
    end
    close all
end
                                                 
feature_mat( ~any(feature_mat,2), : )       = [];
feature_mat( ~any(feature_mat(:,1:end-3),2)&feature_mat(:,end)==2, : ) = [];
feature_mat((feature_mat(:,end)==2),end)     = 0;
feature_mat((feature_mat(:,end)==6),end)     = 1;
 
 