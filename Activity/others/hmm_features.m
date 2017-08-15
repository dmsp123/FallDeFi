
% 8 frequency levels
level_freq = [500,250,125,72.5,36.25,18.125,9.0625,4.53125];

% why the negative values in cfd1?
speed_amp = flipud(abs(cfd1(:,201:200:20000)));%(:,5001:200:9000)); %1
% figure
% surf(speed_amp,'edgecolor','none')
% figure
% surf(speed_amp)
speed_amp_rshift = flipud(abs(cfd1(:,1:200:19800)));%abs(cfd1(:,4801:200:8800));

clear amp_change;
amp_change        = speed_amp - speed_amp_lshift; %2
amp_change        = [zeros(8,1) amp_change];
speed_energy_step = flipud(abs(cfd1(:,1:200:20000)));

for i = 1 : size(speed_energy_step,2)
 % [ f(:,i), ind_(:,i)] =  ecdf(speed(:,i));
[f(:,i)] = cumsum(speed_energy_step(:,i))/sum(speed_energy_step(:,i));
[minDifferenceValue(i), indexAtMin(i)] = min(abs(f(:,i) - .5));
      
end

Y = prctile(speed_energy_step,[25 50 75],1) ;
hmm_feats = [speed_energy_step; amp_change; Y];
% 
% figure
% cdfplot(speed_amp(:,1))

% [a,b]   =ecdf(speed_amp(:,i))