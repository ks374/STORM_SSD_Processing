classdef Cluster_linker
    %CLUSTER_LINKER link cluster list in SSD_CSV class to individual
    %clusters. 
    
    properties
        Pos_750_pred_sequence cell;
        Pos_750_gtgt_sequence cell;
        Neg_750_pred_sequence cell;
        Neg_750_gtgt_sequence cell;
        Pos_647_pred_sequence cell;
        Pos_647_gtgt_sequence cell;
        Neg_647_pred_sequence cell;
        Neg_647_gtgt_sequence cell;
        Pos_750_pred_ROIs double;
        Pos_750_gtgt_ROIs double;
        Neg_750_pred_ROIs double;
        Neg_750_gtgt_ROIs double;
        Pos_647_pred_ROIs double;
        Pos_647_gtgt_ROIs double;
        Neg_647_pred_ROIs double;
        Neg_647_gtgt_ROIs double;
        Pos_750_pred_slices cell;
        Pos_750_gtgt_slices cell;
        Neg_750_pred_slices cell;
        Neg_750_gtgt_slices cell;
        Pos_647_pred_slices cell;
        Pos_647_gtgt_slices cell;
        Neg_647_pred_slices cell;
        Neg_647_gtgt_slices cell;
    end
    
    methods
        function obj = Cluster_linker(DM)
            pname_list = properties(DM.CSV_list);
            for i = 1:numel(pname_list)
                pname = string(pname_list(i));
                pnameout = pname + "_sequence";
                cluster_id_list = [DM.CSV_list.(pname).cluster_id]+1;
                temp_cell = {};
                for j = 1:max(cluster_id_list)
                    sequence = find(cluster_id_list == j);
                    if numel(sequence) == 0
                        temp_cell = cat(1,temp_cell,0);
                        %disp("Skip empty cluster");
                    else
                        temp_cell = cat(1,temp_cell,sequence);
                    end
                end
                eval("obj."+pnameout+"=temp_cell;");
            end
            
            for i = 1:numel(pname_list)
                pname = string(pname_list(i));
                pnameout = pname + "_ROIs";
                %disp(pnameout)
                pnameout_2 = pname + "_slices";
                pname_split = split(pname,'_');
                csv_file = readmatrix(DM.Target_directory+"ML_result_"+...
                    pname_split(2)+"_"+pname_split(1)+"\ML_result_"+...
                    pname_split(2)+"\ROIs.csv");
                eval("obj."+pnameout+"=csv_file;");
                z_list = csv_file(:,5);
                cluster_id_list = csv_file(:,4);
                temp_cell = {};
                for j = 1:numel(z_list)
                    cur_slice = z_list(cluster_id_list==j);
                    temp_cell = cat(1,temp_cell,cur_slice);
                end
                eval("obj."+pnameout_2+"=temp_cell;");
            end

        end
        
        function out = get_start_pix(obj,name,ID)
            target_ROIs = obj.(name+"_ROIs");
            z_list = target_ROIs(:,4);
            target_ROIs = target_ROIs(z_list == ID,1:2);
            out = [target_ROIs(1,1),target_ROIs(1,2)];
        end
    end
end

