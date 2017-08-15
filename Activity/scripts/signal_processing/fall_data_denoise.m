%  1. FIRST LOAD THE MATRICES of fall detection in LoS folder
%  2. NEXT RUN THE CODE IN fall_data_extract.m file FROM LINE 266
downs_fall_cell_array= cell(length(fall_cell_array),1);

sample_rate = 1000;
downs_noisy_sig_amp= zeros(30,sample_rate*10);
for i = 1:length(fall_cell_array)

    noisy_sig_amp = fall_cell_array{i}';
% test=resample(denoised_sig_amp(:,1),1000,10000)
% figure 
% plot(test)
% figure 
% plot(denoised_sig_amp(:,1))
    for ii = 1 : 30
        downs_noisy_sig_amp(ii,:) = resample(noisy_sig_amp(:,ii),sample_rate*10,10000)';% downsample by 10 times
    end
    downs_fall_cell_array{i}    = downs_noisy_sig_amp;
end
% downs_fall_cell_array      = cell(N);


%% FALL DATA DENOISE
%fall_cell_array
% denoised_netcell_array = NET.createArray('System.Double[][]',length(fall_cell_array));
denoised_sig_cellarray= cell(length(fall_cell_array),1);

% figure
% noisy_sig = fall_cell_array{1};
% test=noisy_sig(1,:);
% plot(noisy_sig(1,:))
% [C,L] = wavedec(noisy_sig(1,:),6,'haar');
% X = waverec(C,L,'haar');
% % figure 
% % plot(X)
% 
% r = corrcoef(noisy_sig(1,:),X)

%  noisy_sig=noisy_sig(1,:)
% % subplot(2,1,1)
% 
% plot(noisy_sig(1,:))
% title('Noisy SC1')


% hfc = 10;

% denoised_sig = zeros(size(fall_cell_array{1}));
scal = 'sln';%'mln''one'  Use model assuming standard Gaussian white noise.

%fall_cell_array
for i = 1:length(downs_fall_cell_array)
    noisy_sig = downs_fall_cell_array{i};
    for j = 1:30
%         denoised_sig(j,:) = wden(noisy_sig(j,:),'sqtwolog','s',scal,5,'db3');
        denoised_sig(j,:) = wden(noisy_sig(j,:),'sqtwolog','s',scal,10,'sym3');

    end
%     figure;hold on;
%     plot(noisy_sig(1,:),'r.')
%     plot(denoised_sig(1,:),'k-');
    denoised_sig_cellarray{i}= denoised_sig;
end
% denoised_sig_cellarray = cell(denoised_netcell_array);

denoised_sig =denoised_sig_cellarray{27};
noisy_sig    =fall_cell_array{27};
% corrcoef(denoised_sig(1,:),noisy_sig(1,:))
figure
plot(denoised_sig(30 ,:)','k')
figure
plot(noisy_sig(30,:)','k')


noisy_sig = downs_fall_cell_array{3};
figure
plot(noisy_sig([1 15 30],:)')
% clear  denoised_sig noisy_sig
% 
% 
% figure
% hold on
% denoised_sig=denoised_sig_cellarray{32};
% % subplot(1,2,1)
% plot(denoised_sig(1,:),'-')
% plot(denoised_sig(15,:),'-')
% plot(denoised_sig(30,:),'-')
% 
% 
% noisy_sig=fall_cell_array{32};
% figure
% plot(noisy_sig(1,:))
% 
% 
% corrcoef(denoised_sig(1,:),noisy_sig(1,:))
% 
% figure
% s=surf(denoised_sig);
% colormap(jet)
% % brighten(.2)
% axis([0 10000 0 30])
% % caxis([0,3000])
% set(s,'EdgeColor','interp');
% set(s,'FaceAlpha',0.1);
% 
% % surf(denoised_sig,'edgecolor','none')
% % subplot(1,2,2)
% figure
% plot(noisy_sig(1,:),'-')
% 
% y = [-28,-26,-24,-22,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,-1,1,3,5,7,9,11,13,15,17,19,21,23,25,27,28];
%  y = [-28,-1,28];
% 
% x = 1:10000;
% xMat = repmat(x', 1, numel(y)); %// For plot3
% 
% %// Define y values
% yMat = repmat(y, numel(x), 1); %//For plot3
% 
% figure
%  set(gcf,'renderer','painters');
%  set(gcf,'renderer','opengl');
%  
% plot3(xMat,yMat,[denoised_sig(1,:)' denoised_sig(15,:)' denoised_sig(30,:)'])









% for i =1:30
% %    noisy_sig = fall_cell_array{i};
% % subplot(2,1,2)
% 
% plot(denoised_sig(i,:))
% 
% title('denoised SC1')
% end

% 
% for i=1:10
% figure
% noisy_sig = fall_cell_array{i};
% subplot(2,1,1)
% plot(noisy_sig(1,:))
% title('Noisy SC1')
% 
% denoised_sig=denoised_sig_cellarray{i};
% subplot(2,1,2)
% plot(denoised_sig(1,:))
% title('denoised SC1')
% end

% 
% noisy = fall_cell_array{23};
% noisy = noisy(1,1:9216)
% noisy_sig = fall_cell_array{14};
% %load noisbloc;
% L = 5;
% scal = 'sln';%'mln';%one,sln
% %swc = swt(noisbloc,L,'db1');
% % Make a copy of the wavelet transform coefficients. Determine the Donoho-Johnstone universal threshold based on the detail coefficients for each scale. Using the 'mln' option, wthrmngr returns a 1-by-L vector with each element of the vector equal to the universal threshold for the corresponding scale.
% swc1 = swt(noisy_sig(:,1:9216),L, 'db4');
% ThreshML = wthrmngr('sw1ddenoLVL','heursure',swc1,scal);
% % Use the universal thresholds to implement hard thresholding. The thresholds are applied in a scale-dependent manner.
% denoised_netcell_array = NET.createArray('System.Double[][]',23);
% 
% for i = 1:23
%     noisy_sig_mat = fall_cell_array{i};
%    % for ii =1:60
%    noisy_sig_vec = reshape(noisy_sig_mat(:,1:9216)',[1,552960]);
%    
%         swc = swt(noisy_sig_vec,L, 'db10');
%         swcnew = swc;
%         for jj = 1:L
%             swcnew(jj,:) = wthresh(swc(jj,:),'h',ThreshML(jj));
%         end
%         noisblock_denoised = iswt(swcnew,'db10');
%         
%       %  figure ; plot(noisy_sig_vec(1,:))
%  %   end
%     denoised_netcell_array(i)= reshape(noisblock_denoised,[9216,60]);
% end
% % Invert the stationary wavelet transform on the thresholded coefficients, swcnew. Plot the original signal and the denoised signal for comparison.
% denoised_sig_cellarray = cell(denoised_netcell_array);
% clear denoised_netcell_array
% 
% figure
% % plot(noisbloc); hold on;
%  test = denoised_sig_cellarray{7};
%  subplot(2,1,1)
% plot(test(:,7),'r');
% test1  = fall_cell_array{7};
%  subplot(2,1,2)
% plot(test1(7,:),'b');




% Butterworth
% hfc = 100;
% lfc = 0;
% fs = 1000;
% order = 10;
% 
% [b,a] = butter(order, hfc/(fs/2));
% figure
% freqz(b,a)
% 
% noisy_sig = D{7};
% %dataIn = randn(1000,1);
% dataOut = filter(b,a,noisy_sig(5,:));
% figure
% plot(dataOut)

% %% PCA
% options.KernelType = 'Linear'; %'PolyPlus';%'Polynomial';%  'Gaussian';%
% options.ReducedDim = 60;
% sample_size = 2000;
% dsc = denoised_sig_cellarray{5};
% % subplot(2,1,2)
% % figure
% % plot(dsc(1,:),'.')
% % title('Denoised SC1')
% 
% PC2_activities = NET.createArray('System.Double[][]',23);
% eig_vec_mat = zeros(2000,5);
% for j=1:23
%     nsc = D{j};
%     dsc = denoised_sig_cellarray{j};
% 
%     % figure
%     % surf(denoised_sig_cellarray{1}, 'edgecolor','none')
%     clear Y_PCA_test123_base
%     for i = 1:10000/sample_size
%         [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(dsc(:,(i-1)*sample_size+1:sample_size*i)',options);
%         Ktest1_RX123 = constructKernel(dsc(:,(i-1)*sample_size+1:sample_size*i)',[],options);
%         PC_orig = Ktest1_RX123*eigVector_PCA_test123;
%         if(i > 1)
%             eig_vec_flip = -eigVector_PCA_test123;
%             PC_flip = -PC_orig;
%             if(PC_orig(1,2) - Y_PCA_test123_base(sample_size*(i - 1),2) > PC_flip(1,2) - Y_PCA_test123_base(sample_size*(i - 1),2))
%                  Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = PC_flip;
%                  eig_vec_mat(:,i) = eig_vec_flip(:,2);
%             else
%                 Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = PC_orig;
%                 eig_vec_mat(:,i) = eigVector_PCA_test123(:,2);
%             end
%         else
%             Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = PC_orig;
%              eig_vec_mat(:,i) = eigVector_PCA_test123(:,2);
%         end
%        
%         eigValue(:,i)=eigValue_PCA_test123;
%     end
%     PC2_activities(j) = Y_PCA_test123_base(:,1);
% end

% 
%     
%     figure; plot(score(:,1))
%     [B,I] = sort(score(:,1),'descend');
%     figure; plot(dsc(I(1:10),:)')
%         figure; plot(dsc(I(21:30),:)')
%         
%         
%  figure; plot(dsc(I(20),:)')
%  
%     figure; plot(coeff)
%     
%     figure
%     plot(sqrt(eigenvalue(2,:))./delta_q2)
%     figure
%     plot(eigenvalue(2,:))
%     
%     figure
%     plot(eig_vec2_mat(:,6))
%     [coeff,score,eigenvalue] = pca(dsc);
% 
% 
% 
% max_corr = max(abs(score));
% [rows, columns] = size(score);
% denom = repmat(max_corr, [rows, 1])
% ratio_eigvec = score./denom;
% figure
% plot(ratio_eigvec(:,1))
% 
% figure
% subplot(6,1,1)
% plot(empty_LoS_interp1(:,1))
% title('empty unsubtracted mean')
% subplot(6,1,2)
% plot(dsc(:,1))
% title('slipping, mean subtracted')
% subplot(6,1,3)
% plot(ratio_eigvec(:,1))
% title('1st PC, correlations')
% subplot(6,1,4)
% plot(ratio_eigvec(:,2))
% title('2nd PC, correlations')
% subplot(6,1,5)
% plot(ratio_eigvec(:,3))
% title('3rd PC, correlations')
% subplot(6,1,6)
% plot(ratio_eigvec(:,4))
% title('4th PC, correlations')
% 
% figure
% surf(dsc, 'edgecolor','none')
% 
% 
% figure
% plot(coeff(:,1))
% 
% figure
% plot(dsc(2,:),'.')
% 
% dsc=denoised_sig_cellarray{14};
% %corr_mat = dsc*dsc'
% figure
% corr_mat =corrcoef(run_amp_RX123_centered');
% surf(corr_mat, 'edgecolor', 'none')
% figure
% surf(dsc(:,1:5000), 'edgecolor', 'none')
% figure
% plot(run_amp_RX123_centered(1,:),run_amp_RX123_centered(12,:),'.')
% 
% fs = 1000;
% t = 0.001:1/fs:10;
% % y = sin(32*pi*t).*(t<2) + sin(128*pi*t).*(t>=2);
% % figure
% % subplot(2,1,1);
% % plot(t,dsc(2,:)); 
% % axis tight
% % title('Analyzed Signal');
% 
% % Wavelet packet spectrum
% level = 6;
% %figure
% subplot(2,1,2);
% wpt1 = wpdec(coeff(:,1),level,'sym6');
% wpt2 = wpdec(coeff(:,2),level,'sym6');
% wpt3 = wpdec(coeff(:,3),level,'sym6');
% wpt4 = wpdec(coeff(:,4),level,'sym6');
% wpt5 = wpdec(coeff(:,5),level,'sym6');
% [S1,T1,F1] = wpspectrum(wpt1,fs,'plot');
% [S2,T2,F2] = wpspectrum(wpt2,fs,'plot');
% [S3,T3,F3] = wpspectrum(wpt3,fs,'plot');
% [S4,T4,F4] = wpspectrum(wpt4,fs,'plot');
% [S5,T5,F5] = wpspectrum(wpt5,fs,'plot');
% figure
% surf(T1,F1,(S1+S2+S3+S4+S5),'edgecolor','none')
% colormap(jet)
% wpt = wpdec(coeff(:,3),level,'sym6');
% %figure
% subplot(2,1,2);
% colormap(jet)
% 
% PC2_activities_cell_array  = cell(PC2_activities);
% % figure
% % plot(eigValue_PCA_test123)
% figure
% SC=5;
% for i =1:SC
% subplot(SC,1,i)
% plot(Y_PCA_test123_base(:,i))
% end
% figure
% SC=5;
% for i =1:SC
% subplot(SC,1,i)
% plot(dsc(i,:))
% end
% figure
% surf(Y_PCA_test123_base, 'edgecolor', 'none')
% figure
% plot(PC2_activities_cell_array{2})
