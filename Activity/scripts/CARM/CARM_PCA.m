
eigs_cell_array  = cell(length(fall_cell_array),1);
dnPCA_cell_array = cell(length(fall_cell_array),1);

%      dsc                  = denoised_sig_cellarray{7}';
%      dsc                  = fall_cell_array{7};
%     [PCs,score,eigenvalue] = PCA(dsc(1:30,:)',30);
    for i = 1 : length(fall_cell_array)
        
%          dsc = fall_cell_array{i};
         
        dsc = fall_cell_array{i};
       [PCs,~,eigenvalue] = PCA(dsc(1:60,:)',30);
       %         for ii = 1:10
%             test(:,(ii-1)*sample_size+1:sample_size*ii) = score'*dsc(1:30,(ii-1)*sample_size+1:sample_size*ii);
%         end
        eigs_cell_array{i}  = eigenvalue;
        dnPCA_cell_array{i} = PCs;%PCs;
    end  
    
%     test1 = dnPCA_cell_array{3};     
%     figure;hold on
% %     for i=1:length(dnPCA_cell_array)   
%      plot(test1(:,2),'k')
%      
%      figure
%      plot(test1(:,2),'k')
%      
%      figure
%      plot(test1(:,3),'k')
     
     
%      axis([0 10000 -120 120])
% 
%      figure
%     plot(test1(:,2),'k')      
%      axis([0 10000 -120 120])

    
%     end


clear dnPCA_netcell_array eigs_netcell_array eigs_cell_array denoised_sig_cellarray PCs score test1 dsc
