
function [phdiff12_interp] = extract_phase_interp(TX_ant, data_file,interp_val)
% data_file = 'occupancy_model_verification/data/perp_2_5m5t1_sh_5s_2.dat' ;
data_file = ['C:\Users\R00119847\Documents\MATLAB\csi-code\test-data\walk2_LoS.dat']; 
TX_ant=1
[phase_RX1_ant_sq, phase_RX2_ant_sq] = extract_CSI_from_TX_antenna(TX_ant, data_file);

figure
plot(abs(phase_RX1_ant_sq(1,:)),'.')
abc=angle(phase_RX1_ant_sq)-angle(phase_RX2_ant_sq);
figure
plot(unwrap(abc(1,:)),'.')

test1=phase_RX1_ant_sq.*conj(phase_RX2_ant_sq);
figure
plot(abs(test1(1,:)),'.')

    figure
    plot((angle(test1(1,:))),'.')
    absp= (abs(test1(1,:))-mean(abs(test1(1,:))))/std(abs(test1(1,:)));
    absp2=(abs(test1(2,:))-mean(abs(test1(2,:))))/std(abs(test1(2,:)));
    phasep= (unwrap(angle(test1(1,:)))-mean(unwrap(angle(abs(test1(1,:))))))/std(unwrap(angle(test1(1,:))));
    compp = absp.*exp(angle(test1(1,:))*sqrt(-1));

    fs=1000; nfft = 512;noverlap=511;window=512;
    [S,~,~,~] = spectrogram(unwrap(abc(1,:)),window,noverlap,nfft,fs);
%     s_shift=fftshift(S, 1);
    S_abs = imresize( abs(S),[500 10000]);
    
    
    
    figure
    s=   surf(S_abs,'edgecolor','none');
    colormap(jet)
    % % % brighten(.2)
     axis([0 10000 0 50])
    caxis([0,.01])
    set(s,'EdgeColor','interp');
    
    [S,~,~,~] = spectrogram(absp,window,noverlap,nfft,fs);
    S_abs = imresize( abs(S),[500 10000]);
    figure
    s=   surf((S_abs),'edgecolor','none');
    colormap(jet)
    % % % brighten(.2)
     axis([0 10000 0 100])
    %caxis([100,3000])
    set(s,'EdgeColor','interp');

% num_elements = numel(num2str(size(phase_RX1_ant_sq,2)));

% e.g.:  num_elements = 5, size(phase_RX1_ant_sq,2) = 58999, 
% interp_val = ceil(58999/10^4)*10^4
%     interp_val = ceil(size(phase_RX1_ant_sq,2)/10^(num_elements-1))*10^(num_elements-1);

RX1_phase = unwrap(angle(phase_RX1_ant_sq));
RX2_phase = unwrap(angle(phase_RX2_ant_sq));
ph_diff=RX2_phase-RX1_phase;%figure; plot(wraptopi(ph_diff,2*pi),'.')
phdiff_12 = wraptopi(ph_diff,2*pi);
figure 
plot(phdiff_12(1,:),'.')
% abs_RX3_phase = angle(phase_RX3_ant_sq);
phdiff12_interp = zeros(30,interp_val);
% abs_RX2_phase_interp = zeros(30,interp_val);
% abs_RX3_phase_interp = zeros(30,interp_val);

for i = 1:30
    phdiff12_interp(i,:) = interp1( phdiff_12(i,:)',1:(size(phdiff_12,2)-1)/(interp_val-1):size(phdiff_12,2));%figure;mesh(Hs_f_interp);
end



