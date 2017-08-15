sample_size = 2000
%% Amplitude extraction
TX_ant =1;

for i = 1:3%:3
    TX_ant = i;
    %%REFERNCE SCENARIO FOR CENTERING THE EMPTY ROOM AND THE COMPARED SCENARIO.
    %%SCENARIO HAVING THE HIGHEST STANDARD DEVIATION IN DATA IS SELECTED.
    data_file = '/project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_ldn.dat'   ;values = 59847; scenario = 'LoSdyn';
    [nLoSdynRX1_amp_interp((i-1)*30+1:i*30,:), nLoSdynRX2_amp_interp((i-1)*30+1:i*30,:), nLoSdynRX3_amp_interp((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
   
    % OBTAINING EMPTY ROOM DATA
    data_file = 'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_empty.dat'        ;values = 59965;   %LoS connection
    % data_file = 'project/PCA_kPCA/data/empty_3ant2.dat'        ;values = 9985;   %LoS connection
    [abs_RX1_amp_empty_interp((i-1)*30+1:i*30,:),abs_RX2_amp_empty_interp((i-1)*30+1:i*30,:),abs_RX3_amp_empty_interp((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file, values);
end
% figure;plot(abs_RX1_amp_empty_interp(1,:),'.');
% figure;plot(abs_RX2_amp_empty_interp(1,:),'.');
% figure;plot(abs_RX3_amp_empty_interp(1,:),'.');
% figure; h=surf(abs_RX1_amp_empty_interp);set(h,'EdgeColor','none')
% figure; h=surf(abs_RX2_amp_empty_interp);set(h,'EdgeColor','none')
% figure; h=surf(abs_RX3_amp_empty_interp(:,1:1000));set(h,'EdgeColor','none')

    % SELECTING THE SCENARIO FOR COMPARISON WITH EMPTY DATA
    data_file = [ 'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_nld.dat'; 'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_ldn.dat';  'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s53.dat';'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s52.dat';'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s51.dat';'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s43.dat'; 'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s41.dat'; 'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s33.dat' ;'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s32.dat' ;'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s31.dat' ;'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s23.dat' ;'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s21.dat' ;'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s12.dat' ;'project/PCA_kPCA/data/PR_lab2_60s/PRL_nLoS_s11.dat' ; ] ; values = 59774; 
    values = [59774; 59847; 59952; 57914; 59833; 59967; 59772; 59968; 59824; 59199; 59970; 59902; 59823; 59950;  ] 
    scene_ = ['nLoSdyn ';'LoSdyn  ';'static53';'static52';'static51';'static43';'static41';'static33';'static32';'static31';'static23';'static21';'static12';'static11';];
    for l = 3:3%14
        close all
        
        scenario = scene_ (l,:)
        for i = 1:3%:3
            TX_ant = i;
            [abs_RX1_amp_interp((i-1)*30+1:i*30,:),abs_RX2_amp_interp((i-1)*30+1:i*30,:),abs_RX3_amp_interp((i-1)*30+1:i*30,:)] = extract_amp_interp(TX_ant, data_file(l,:), 1);
        end
        % figure;plot(abs_RX1_amp_interp(1,:),'.');
        % figure;plot(abs_RX2_amp_interp(1,:),'.');
        % figure;plot(abs_RX3_amp_interp(1,:),'.');
        % figure; h=surf(abs_RX1_amp_interp(:,1:1000));set(h,'EdgeColor','none')
        % figure; h=surf(abs_RX2_amp_interp);set(h,'EdgeColor','none')
        % figure; h=surf(abs_RX3_amp_interp);set(h,'EdgeColor','none')
       
%%
occu_empty_concat_RX1 = horzcat(abs_RX1_amp_empty_interp,abs_RX1_amp_interp, nLoSdynRX1_amp_interp);
occu_empty_concat_RX2 = horzcat(abs_RX2_amp_empty_interp,abs_RX2_amp_interp, nLoSdynRX2_amp_interp);
occu_empty_concat_RX3 = horzcat(abs_RX3_amp_empty_interp,abs_RX3_amp_interp, nLoSdynRX3_amp_interp);

% figure; h=surf(occu_empty_concat_RX1);set(h,'EdgeColor','none')
% figure; h=surf(occu_empty_concat_RX2);set(h,'EdgeColor','none')
%  figure; h=surf(occu_empty_concat_RX3(:,1:1000));set(h,'EdgeColor','none')

% CENTERING THE DATA

[abs_amp_RX1_centered,abs_amp_RX2_centered,abs_amp_RX3_centered, abs_amp_RX12_centered, abs_amp_RX123_centered] = center_data(occu_empty_concat_RX1,occu_empty_concat_RX2,occu_empty_concat_RX3, sample_size);
% for i = 1:10000/sample_size
% figure; plot((abs_amp_RX123_centered(30,10000+(i-1)*sample_size:10000+(i)*sample_size)), (abs_amp_RX123_centered(60,10000+(i-1)*sample_size:10000+(i)*sample_size)),'.')
% end
% figure; plot((abs_amp_RX123_centered(50,10001:15000)), (abs_amp_RX123_centered(80,10001:15000)),'.')

% figure;plot(abs_amp_RX1_centered(1,:),'.')
% figure;plot(abs_amp_RX1_centered(2,:),'.')
% figure;plot((abs_amp_RX1_centered(3,:)),'.')
% figure; h=surf(abs_amp_RX1_centered);set(h,'EdgeColor','none')
% figure; h=surf(abs_amp_RX2_centered);set(h,'EdgeColor','none')
% figure; h=surf(abs_amp_RX3_centered);set(h,'EdgeColor','none')
% figure; h=surf(abs_amp_RX12_centered);set(h,'EdgeColor','none')
% figure; h=surf(abs_amp_RX123_centered(:,20000:25000));set(h,'EdgeColor','none')

% for i =3:4
% [Y_PCA_test1((i-1)*5000+1:5000*i,:), eigVector_PCA_test1, eigValue_PCA_test1] =PCA(abs_amp_RX1_centered(:,(i-1)*5000+1:5000*i)',90);% PCA(test_abs_RX1_amp_interp_ml',4);
% end
% PCA_varratio_1 = var(Y_PCA_test1(10001:20000,:))./var(Y_PCA_test1(1:10000,:))
%
% for i =3:4
% [Y_PCA_test12((i-1)*5000+1:5000*i,:), eigVector_PCA_test12, eigValue_PCA_test12] =PCA(abs_amp_RX12_centered(:,(i-1)*5000+1:5000*i)',90);% PCA(test_abs_RX1_amp_interp_ml',4);
% end
% PCA_varratio_12 =var(Y_PCA_test12(10001:20000,:))./var(Y_PCA_test12(1:10000,:))


%% LINEAR PCA
valid_data = (abs_amp_RX123_centered(:,60001:120000));
empty_data = (abs_amp_RX123_centered(:,1:60000));
ref_data   = (abs_amp_RX123_centered(:,120001:180000));

options.KernelType = 'Linear';%'PolyPlus';%'Polynomial';%  'Gaussian';%
options.ReducedDim = 90;

for i = 1:size(valid_data,2)/sample_size
    [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(empty_data(:,(i-1)*sample_size+1:sample_size*i)',options);
    Ktest1_RX123 = constructKernel(empty_data(:,(i-1)*sample_size+1:sample_size*i)',[],options);
    
    Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = Ktest1_RX123*eigVector_PCA_test123;
end

for i =1:size(valid_data,2)/sample_size
    %      options.t =20;%mean_eudist_empty(i)%ind1(i);%LoS%48;%nLoS%
    
    [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(valid_data(:,(i-1)*sample_size+1:sample_size*i)',options);
    Ktest1_RX123 = constructKernel(valid_data(:,(i-1)*sample_size+1:sample_size*i)',[],options);
    %     figure; h = surf(Ktest1_RX123); set(h, 'EdgeColor','none')
    Y_PCA_test123((i-1)*sample_size+1:sample_size*(i),:) = Ktest1_RX123*eigVector_PCA_test123;
end

PCA_varratio_123 =var(Y_PCA_test123)./var(Y_PCA_test123_base);
%
%
% for i =1:10
%      [Y_PCA_test123((i-1)*1000+1:1000*i,:), eigVector_PCA_test123, eigValue_PCA_test123] =PCA(valid_data(:,(i-1)*1000+1:1000*i)',90);% PCA(test_abs_RX1_amp_interp_ml',4);
%      [Y_PCA_test123_base((i-1)*1000+1:1000*i,:), eigVector_PCA_test123, eigValue_PCA_test123] =PCA(empty_data(:,(i-1)*1000+1:1000*i)',90);% PCA(test_abs_RX1_amp_interp_ml',4);
% end
%
% PCA_varratio_123 =var(Y_PCA_test123)./var(Y_PCA_test123_base)
% %     [Y_PCA_test123, eigVector_PCA_test123, eigValue_PCA_test123] =PCA(valid_data(:,1:10000)',90);% PCA(test_abs_RX1_amp_interp_ml',4);
% %     [Y_PCA_test123_base, eigVector_PCA_test123, eigValue_PCA_test123] =PCA(empty_data(:,1:10000)',90);% PCA(test_abs_RX1_amp_interp_ml',4);

for i = 1:size(valid_data,2)/sample_size
    PCA_var_empty(i,:) = var(Y_PCA_test123_base((i-1)*sample_size+1:sample_size*i,:),0,1);
    PCA_var_occu(i,:) = var(Y_PCA_test123((i-1)*sample_size+1:sample_size*i,:),0,1);
end


%COMPUTING THE DETECTION PERECENTAGE
for i = 1:10
%         figure; plot(PCA_var_occu(:,i))
%         hold on
%         plot(PCA_var_empty(:,i))
%         title(['PCA variance', int2str(i) ])
%         plot(get(gca,'xlim'), [max(PCA_var_empty(:,i)) max(PCA_var_empty(:,i))], '-- k');
    percent_PCA_high(i) = 100-sum(max(PCA_var_empty(:,i)) > PCA_var_occu(:,i))/(size(valid_data,2)/sample_size)*100;
end
percent_PCA_high

    end
    
    
  %  for i = 6:15
        hfc = 10;
        lfc = 0;
        fs = 1000;
        order = 10;
        
        [b,a] = butter(order, hfc/(fs/2));
        figure
        freqz(b,a)
        close
        
        %dataIn = randn(1000,1);
        dataOut = filter(b,a,abs_amp_RX123_centered(1,:));
        figure
        plot(dataOut)
        str = sprintf('Butterworth, order = %d , and cut off = %d - %d Hz',order,lfc,hfc);
        title(str)
        pause(1)
        
        %Rule 1: Selection using principle of Stein's Unbiased Risk Estimate (SURE)
        rigrsure_thr = thselect(abs_amp_RX123_centered(1,1:10000),'rigrsure')
        %Rule 2: Fixed form threshold equal to sqrt(2*log(length(y)))
        sqtwolog_thr = thselect(abs_amp_RX123_centered(1,1:10000),'sqtwolog')
        %Rule 3: Selection using a mixture of the first two options
        heursure_thr = thselect(abs_amp_RX123_centered(1,1:10000),'heursure')
        %Rule 4: Selection using minimax principle
        minimaxi_thr = thselect(abs_amp_RX123_centered(1,1:10000),'minimaxi')
    %%    
        scal = 'one'; % Use model assuming standard Gaussian white noise.
        xd = wden(abs_amp_RX123_centered(1,:),'heursure','s',scal,3,'sym8');
        figure
        plot(xd)
        str = sprintf('dwt, thr = heursure , and wavelet = sym8');
        title(str)
    %%   
         xd = wden(abs_amp_RX123_centered(1,:),'sqtwolog','s',scal,3,'sym8');
        figure
        plot(xd)
        str = sprintf('dwt, thr = sqtwolog , and wavelet = sym8');
        title(str)
    %%    
        xd = wden(abs_amp_RX123_centered(1,:),'heursure','s',scal,3,'db4');
        figure
        plot(xd)
        str = sprintf('dwt, thr = heursure , and wavelet = db4');
        title(str)
 %   end
%surf(dataOut(1:30,60001:90000), 'EdgeColor', 'none')

figure
lev   = 5;
wname = 'db5';
nbcol = 64;
[c,l] = wavedec(PC2_denoised,lev,wname);
%Expand discrete wavelet coefficients for plot.

len = length(PC2_denoised);
cfd = zeros(lev,len);
for k = 1:lev
    d = detcoef(c,l,k);
    d = d(:)';
    d = d(ones(1,2^k),:);
    cfd(k,:) = wkeep1(d(:)',len);
end
cfd =  cfd(:);
I = find(abs(cfd)<sqrt(eps));
cfd(I) = zeros(size(I));
cfd    = reshape(cfd,lev,len);
cfd = wcodemat(cfd,nbcol,'row');

h211 = subplot(2,1,1);
h211.XTick = [];
plot(PC2_denoised,'r');
title('Analyzed signal.');
ax = gca;
ax.XLim = [1 length(PC2_denoised)];
subplot(2,1,2);
colormap(hot(20));
image(cfd);
tics = 1:lev;
labs = int2str(tics');
ax = gca;
ax.YTickLabelMode = 'manual';
ax.YDir = 'normal';
ax.Box = 'On';
ax.YTick = tics;
ax.YTickLabel = labs;
title('Discrete Transform, absolute coefficients.');
ylabel('Level');



scal = 'one'; % Use model assuming standard Gaussian white noise.
for i =1:270
 xd(i,:) = wden(abs_amp_RX123_centered(i,:),'heursure','s',scal,8,'db8');
end
figure;hold on; plot(abs_amp_RX123_centered(1,:))
plot(xd(1,:))


%%
denoised_sig = zeros(270,76800);
for i = 1:270
   denoised_sig(i,:)= wavelet_denoise_1d(abs_amp_RX123_centered(i,[45001:75000  105001:135000 163201:180000]));
end

figure
plot(denoised_sig(2,:))

% valid_data = (abs_amp_RX123_centered(:,60001:120000));
% empty_data = (abs_amp_RX123_centered(:,1:60000));
% ref_data   = (abs_amp_RX123_centered(:,120001:180000));

options.KernelType = 'Linear';%'PolyPlus';%'Polynomial';%  'Gaussian';%
options.ReducedDim = 30;

for i = 1:76000/sample_size
    [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(denoised_sig(1:30,(i-1)*sample_size+1:sample_size*i)',options);
    Ktest1_RX123 = constructKernel(denoised_sig(1:30,(i-1)*sample_size+1:sample_size*i)',[],options);
    
    Y_PCA_test123_base((i-1)*sample_size+1:sample_size*(i),:) = Ktest1_RX123*eigVector_PCA_test123;
end

figure
plot(Y_PCA_test123_base(:,2))


Y_PCA_test123_base = [Y_PCA_test123_base; zeros(800,30)];

lev   = 8;
wname = 'db10';
nbcol = 20;
[c,l] = wavedec(Y_PCA_test123_base(:,2),lev,wname);

len = length(Y_PCA_test123_base(:,1));
cfd = zeros(lev,len);
for k = 1:lev
    d = detcoef(c,l,k);
    d = d(:)';
    d = d(ones(1,2^k),:);
    cfd(k,:) = wkeep1(d(:)',len);
end
cfd =  cfd(:);
I = find(abs(cfd)<sqrt(eps));
cfd(I) = zeros(size(I));
cfd    = reshape(cfd,lev,len);
cfd = wcodemat(cfd,nbcol,'row');

figure
h211 = subplot(2,1,1);
h211.XTick = [];
plot(Y_PCA_test123_base(:,1),'r');
title('Analyzed signal.');
ax = gca;
ax.XLim = [1 length(Y_PCA_test123_base(:,1))];
subplot(2,1,2);
colormap(hot(nbcol));
image(cfd);
tics = 1:lev;
labs = int2str(tics');
ax = gca;
ax.YTickLabelMode = 'manual';
ax.YDir = 'normal';
ax.Box = 'On';
ax.YTick = tics;
ax.YTickLabel = labs;
title('Discrete Transform, absolute coefficients.');
ylabel('Level');

figure
len = length(Y_PCA_test123_base(:,1));
cw1 = cwt(Y_PCA_test123_base(:,1),1:8,'db8','plot'); 
title('Continuous Transform, absolute coefficients.') 
ylabel('Scale')
[cw1,sc] = cwt(Y_PCA_test123_base(:,1),1:8,'db8','scal');
title('Scalogram') 
ylabel('Scale')

% for i =1:size(valid_data,2)/sample_size
%     %      options.t =20;%mean_eudist_empty(i)%ind1(i);%LoS%48;%nLoS%
%     
%     [eigVector_PCA_test123,eigValue_PCA_test123] = KPCA(valid_data(:,(i-1)*sample_size+1:sample_size*i)',options);
%     Ktest1_RX123 = constructKernel(valid_data(:,(i-1)*sample_size+1:sample_size*i)',[],options);
%     %     figure; h = surf(Ktest1_RX123); set(h, 'EdgeColor','none')
%     Y_PCA_test123((i-1)*sample_size+1:sample_size*(i),:) = Ktest1_RX123*eigVector_PCA_test123;
% end