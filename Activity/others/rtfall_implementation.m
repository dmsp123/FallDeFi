 N     = NET.createArray('System.Double[][]',length(fall_cell_array));
Nph   = NET.createArray('System.Double[][]',length(fall_phcell_array));
DNph  = NET.createArray('System.Double[][]',length(fall_phcell_array));

hfc   = 10;
lfc   = 5;
fs    = 100;
order = 10;
[b,a] = butter(order, [lfc hfc]/(fs/2));

noisy_sig          = zeros(1,10000);
downs_noisy_sig    = zeros(1,1000);
downs_denoised_sig = zeros(1,1000);
downs_noisy_sig_amp= zeros(1,1000);
for i = 1:length(fall_phcell_array)
    noisy_sig_     = fall_phcell_array{i};
    noisy_sig      = noisy_sig_(:,1:10000);

    noisy_sig_amp_ = fall_cell_array{i};
    noisy_sig_amp  = noisy_sig_amp_(:,1:10000);

    for ii = 1 : 30
        downs_noisy_sig(ii,:)     = downsample(noisy_sig(ii,:),10);% downsample by 10 times
        downs_noisy_sig_amp(ii,:) = downsample(noisy_sig_amp(ii,:),10);% downsample by 10 times
        downs_denoised_sig(ii,:)  = filter(b,a,downs_noisy_sig(ii,:));
    end
    Nph(i)  = downs_noisy_sig;
    DNph(i) = downs_denoised_sig;
    N(i)    = downs_noisy_sig_amp;
end
downs_phfall_cell_array    = cell(Nph);
downs_fall_cell_array      = cell(N);
downsden_phfall_cell_array = cell(DNph);
clear Nph DNph N
%%
% noisy_sig = fall_cell_array{1};
% for i =1:30
% empdowns_noisy_sig(i,:) = downsample(noisy_sig(i,:),10);
% end

%
% test =downsden_fall_cell_array{1};
%
% figure
% plot(test(1,:))
% % figure
% % freqz(b,a)
% denoised_sig = filter(b,a,empdowns_noisy_sig(1,:));
%
% denoised_var      = movingvar(denoised_sig',200);
% noisy_var         = movingvar(empdowns_noisy_sig(1,:)',200);
% noisy_var_mean    = mean(sqrt(noisy_var));
% denoised_var_mean = mean(sqrt(denoised_var));
% noisy_var_var     = sqrt(var(sqrt(noisy_var)));
% denoised_var_var  = sqrt(var(sqrt(denoised_var)));
%
%
% n=6
% figure
% hold on
% plot(denoised_var, 'r')
% plot(noisy_var, 'b')
% line([1 length(noisy_var)],[noisy_var_mean + n*noisy_var_var noisy_var_mean + n*noisy_var_var],'color', 'b' )
% line([1 length(denoised_var)],[denoised_var_mean + n*denoised_var_var denoised_var_mean + n*denoised_var_var],'color','r')
%
%
% mu_plus_sigma_noisy = noisy_var_mean + n*noisy_var_var;
% mu_plus_sigma_dn = denoised_var_mean + n*denoised_var_var;
%
%
%
%
%
% % figure
% % plot(downs_noisy_sig(1,:))
% % figure
% % plot(noisy_sig(1,:))
%
%
%
% % figure
% % freqz(b,a)
% figure
% hold on
% for i=1:10
%     denoised_sig = downsden_fall_cell_array{i};
%     plot((i-1)*1000+1:i*1000, denoised_sig(12,:))
% end
%
%
%
%
%
%
% figure
% plot(diff(denoised_sig(200:400))/h)
%%
feature_mat = zeros(2*length(downs_phfall_cell_array),17);
m=0;

for i=1:length(downs_phfall_cell_array)
    downs_noisy_sig    = downs_phfall_cell_array{i}    ;
    denoised_sig       = downsden_phfall_cell_array{i} ;
    downs_noisy_sig_amp= downs_fall_cell_array{i};
    %
    
    fs=100; nfft = 100;noverlap=63;window=64;
    % stft_netcell_array  = NET.createArray('System.Double[][]',length(downs_fall_cell_array));
    for ii = 1:length(fall_phcell_array)
        %     denoised_sig=downsden_fall_cell_array{5};
        %     test=denoised_sig(1,:);
        test  = downs_phfall_cell_array{i}';
        %     sum_S = 0;
        %     for ii   = num_PCs(i)
        [S,F,T] = spectrogram(test(:,1),window,noverlap,nfft,fs);%/std(test(ii,:),0,2)
        %         sum_S   = abs(S);
        %     end
        interp_spectro = imresize( abs(S),[50 1000]);
        
        %     stft_netcell_array(i) = B;
    end
    % stft_cell_array = cell(stft_netcell_array);
    
    
    
    
    
    
    %     figure
    %     plot(denoised_sig(1,:))
    %     hold on
    %     plot(downs_noisy_sig(1,:))
    %
    denoised_var      = sqrt(movingvar(denoised_sig(1,:)',100))';
    noisy_var         = sqrt(movingvar(downs_noisy_sig(1,:)',100))';
    %bathroom1
%     noisy_thresh =.15; denoise_thresh = .07;
    %bathroom2
    noisy_thresh =.5; denoise_thresh = .2;

    %corridor1 : 
%     noisy_thresh = .18; denoise_thresh = .01;
%    corridor2:
%     noisy_thresh = .06; denoise_thresh = .01;

%     bedroom1  : 
%      noisy_thresh = .16  ; denoise_thresh = .03;
%     bedroom2  : 
%      noisy_thresh=.16; denoise_thresh=.1;
%     kitchen  :
%        noisy_thresh = .25;  denoise_thresh = .1;
%     kitchen2
%        denoise_thresh = .12;
%        noisy_thresh   = .13;
%     lab      : 
%      noisy_thresh = .8,  denoise_thresh = .4
%     lab2
%      noisy_thresh = .15; denoise_thresh =.05;
%   
    
    figure
    hold on
    plot(denoised_var(1,:))
    % subplot(2,1,2)
    plot(noisy_var(1,:))
%     
    line([1 1000],[denoise_thresh denoise_thresh], 'color','b')
    line([1 1000],[noisy_thresh noisy_thresh],'color','r')
% %     title(label_cell{i})
    
    clear val_up_ind val_down_ind val_up_ind_ val_down_ind_
    %% noisy up and down index
    [~, val_up_ind] = find(diff(noisy_var > noisy_thresh) > 0);
    if(noisy_var(1) > noisy_thresh)
        first_ind = 1;
        val_up_ind = [first_ind, val_up_ind];
    end
    
    val_down_ind = find(diff(noisy_var > noisy_thresh) < 0);
    if(noisy_var(end) > noisy_thresh)
        last_ind = size(noisy_var,2);
        val_down_ind = [ val_down_ind, last_ind];
    end
        

    val_up_ind_   = val_up_ind;
    val_down_ind_ = val_down_ind;
    j = 1;
    tx_rate =100;
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
    
    clear row;
    for iii = 1 : length(val_up_ind)
        [row, ~] = find(noisy_var(val_up_ind(iii):val_down_ind(iii)));
        max_freq(iii) =  max(row);
    end
    [~, I]     = max((val_down_ind - val_up_ind).*max_freq);
    
    
    %% denoised value up and down index
    [~, val_up_inddn] = find(diff(denoised_var > denoise_thresh) > 0);
    if(denoised_var(1) > denoise_thresh)
        first_ind = 1;
        val_up_inddn = [first_ind, val_up_inddn];
    end
    [~,val_down_inddn] = find(diff(denoised_var > denoise_thresh) < 0);
    if(denoised_var(end) > denoise_thresh)
        last_inddn = size(noisy_var,2);
        val_down_inddn = [ val_down_inddn, last_inddn];
    end
    
    val_up_inddn_   = val_up_inddn;
    val_down_inddn_ = val_down_inddn;
    j = 1;
    tx_rate = 100;
    while (j < length(val_up_inddn_))
        if((val_up_inddn_(j + 1) - val_down_inddn_(j)) < tx_rate/2)
            val_up_inddn_(j+1) = [];
            val_down_inddn_(j) = [];
            j = j - 1;
        end
        j = j + 1;
    end
    
    val_up_inddn   = val_up_inddn_;
    val_down_inddn = val_down_inddn_;
    
    %8 PDR
    if(~isempty(val_down_ind - val_up_ind))
        for iv = 1 : length(val_down_ind - val_up_ind)
            m = m + 1;
            
            
            %% features
            if val_down_ind(iv)>300
                %1. normalized standard deviation
                std_event          = std(downs_noisy_sig(val_down_ind(iv)-300:val_down_ind(iv)))  ;
                std_event_amp      = std(downs_noisy_sig_amp(val_down_ind(iv)-300:val_down_ind(iv)))  ;
                %2. median absolute deviation
                mad_event          = mad(downs_noisy_sig(val_down_ind(iv)-300:val_down_ind(iv)),1);%1 for median, 0 for mean
                mad_event_amp      = mad(downs_noisy_sig_amp(val_down_ind(iv)-300:val_down_ind(iv)),1);%1 for median, 0 for mean
                %3. offset of signal strength
                ss_offset          = abs(mean(downs_noisy_sig(val_down_ind(iv)-300:val_down_ind(iv))));
                ss_offset_amp      = abs(mean(downs_noisy_sig_amp(val_down_ind(iv)-300:val_down_ind(iv))));
                %4. Interquartile range
                IQ_range           = iqr(downs_noisy_sig(val_down_ind(iv)-300:val_down_ind(iv)));
                IQ_range_amp       = iqr(downs_noisy_sig_amp(val_down_ind(iv)-300:val_down_ind(iv)));
                %5. signal entropy
                [sig_entrpy,~,~,~]     = entropy_ts(downs_noisy_sig(val_down_ind(iv)-300:val_down_ind(iv)));
                [sig_entrpy_amp,~,~,~] = entropy_ts(downs_noisy_sig_amp(val_down_ind(iv)-300:val_down_ind(iv)));
                %6. velocity of signal change
                h                  = 100;
                v_sig_change       = mean(abs(diff(downs_noisy_sig(val_down_ind(iv)-300:val_down_ind(iv)))/h));
                v_sig_change_amp   = mean(abs(diff(downs_noisy_sig_amp(val_down_ind(iv)-300:val_down_ind(iv)))/h));

            else
                %1. normalized standard deviation
                std_event          = std(downs_noisy_sig(1:val_down_ind(iv)))  ;
                std_event_amp      = std(downs_noisy_sig_amp(1:val_down_ind(iv)))  ;

                %2. median absolute deviation
                mad_event          = mad(downs_noisy_sig(1:val_down_ind(iv)),1);%1 for median, 0 for mean
                mad_event_amp      = mad(downs_noisy_sig_amp(1:val_down_ind(iv)),1);%1 for median, 0 for mean
                %3. offset of signal strength
                ss_offset          = abs(mean(downs_noisy_sig(1:val_down_ind(iv))));
                ss_offset_amp          = abs(mean(downs_noisy_sig_amp(1:val_down_ind(iv))));
                %4. Interquartile range
                IQ_range           = iqr(downs_noisy_sig(1:val_down_ind(iv)));
                IQ_range_amp       = iqr(downs_noisy_sig_amp(1:val_down_ind(iv)));
                %5. signal entropy
                [sig_entrpy,~,~,~] = entropy_ts(downs_noisy_sig(1:val_down_ind(iv)));
                [sig_entrpy_amp,~,~,~] = entropy_ts(downs_noisy_sig_amp(1:val_down_ind(iv)));
                %6. velocity of signal change
                h                  = 100;
                v_sig_change       = mean(abs(diff(downs_noisy_sig(1:val_down_ind(iv)))/h));
                v_sig_change_amp   = mean(abs(diff(downs_noisy_sig_amp(1:val_down_ind(iv)))/h));
            end
            %8. PDR
            end_diff = length(downs_noisy_sig(1,:)) - val_down_ind(iv);
            start_diff = val_down_ind(iv) - 1;
            if (end_diff < 100 )
                pdr =  sum(sum( interp_spectro(:,val_down_ind(iv)-100:val_down_ind(iv)),1))-...
                    sum(sum( interp_spectro(:,val_down_ind(iv):val_down_ind(iv)+end_diff),1))/...
                    sum(sum( interp_spectro(:,val_down_ind(iv)-100:val_down_ind(iv)),1));
            elseif (start_diff < 100)
                pdr =  sum(sum( interp_spectro(:,val_down_ind(iv)-start_diff:val_down_ind(iv)),1))-...
                    sum(sum( interp_spectro(:,val_down_ind(iv):val_down_ind(iv)+100),1))/...
                    sum(sum( interp_spectro(:,val_down_ind(iv)-start_diff:val_down_ind(iv)),1));
            else
                pdr =  sum(sum( interp_spectro(:,val_down_ind(iv)-100:val_down_ind(iv)),1))-...
                    sum(sum( interp_spectro(:,val_down_ind(iv):val_down_ind(iv)+100),1))/...
                    sum(sum( interp_spectro(:,val_down_ind(iv)-100:val_down_ind(iv)),1));
            end
            %7. time lag
            if(~isempty(val_down_inddn))
                [~, ind]       = min(abs(val_down_inddn - val_down_ind(iv)));
                time_lag = abs(val_down_inddn(ind)  - val_down_ind(iv));
            else
                time_lag = abs(0  - val_down_ind(iv));
            end
            feature_mat(m,:) = [std_event,std_event_amp, mad_event,mad_event_amp, ss_offset,ss_offset_amp ...
                IQ_range,IQ_range_amp, sig_entrpy,sig_entrpy_amp, v_sig_change,v_sig_change_amp, time_lag, pdr,...
                label_num(i), i, 2];
            
            if(label_num(i)==6)
                if iv == I
                    feature_mat(m,end-2) = 6;
                    feature_mat(m,end)   = 6;
                else
                    feature_mat(m,end-2) = 2;
                end
            end
        end
    else
        m=m+1;
        feature_mat(m,[end-2,end-1,end]) = [2,i, label_num(i)];
    end
end











%    [row, col]=find((stft_mat_nooutl(max_freq(I),val_up_ind(I):val_down_ind(I))));
%     nzmax = max(stft_mat_nooutl(stft_mat_nooutl ~= 0));



% downs_fall_cell_array
% downsden_fall_cell_array
% fs=100; nfft = 100;noverlap=63;window=64;
% stft_netcell_array  = NET.createArray('System.Double[][]',length(downs_fall_cell_array));
% for i = 1:length(fall_cell_array)
%     %     denoised_sig=downsden_fall_cell_array{5};
%     %     test=denoised_sig(1,:);
%     test  = downs_fall_cell_array{i}';
%     %     sum_S = 0;
%     %     for ii   = num_PCs(i)
%     [S,F,T] = spectrogram(test(:,1),window,noverlap,nfft,fs);%/std(test(ii,:),0,2)
%     %         sum_S   = abs(S);
%     %     end
%     B = imresize( abs(S),[50 1000]);
%
%     stft_netcell_array(i) = B;
% end
% stft_cell_array = cell(stft_netcell_array);
% clear stft_netcell_array sum_S dnPCA_cell_array S test T fall_cell_array

% figure
% surf((abs(stft_cell_array{20})),'edgecolor','none')
% colormap(jet)
% axis([0 1000 0 100])
% 
