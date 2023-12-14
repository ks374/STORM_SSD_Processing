classdef Cluster_info
    %CLUSTER_INFO Store information of each cluster for visualization
    
    properties
        base_path char;
        ID int16;
        loc_type char;%pred or gtgt
        channel char;
        CTB char;

        SSDsequence int16;
        slices int16;
        locs3d_file string;
        DBscan_file string;
        Img_directory string;
        Img_files string;

        Starting_pixel double %1*2 array;
        
    end
    
    methods
        function obj = Cluster_info(DM,name,ID)
            %name format: Pos_750_pred
            obj.base_path = DM.Target_directory;
            obj.ID = ID;
            name_split = split(name,'_');
            obj.loc_type = char(string(name_split{3}));
            obj.channel = char(string(name_split{2}));
            obj.CTB = char(string(name_split{1}));
            obj.SSDsequence = int16(DM.Cluster_linker.(name+"_sequence"){ID});
            obj.slices = int16(DM.Cluster_linker.(name+"_slices"){ID});

            obj.locs3d_file = DM.Target_directory + "ML_result_" +...
                string(obj.channel) + "_" + string(obj.CTB) + "\locs3d_" +...
                string(obj.loc_type) + "_sequences\locs3d_pred_sequence_"+...
                string(ID)+".data";
            if obj.loc_type == "pred"
                obj.DBscan_file = DM.Target_directory + "ML_result_" +...
                    string(obj.channel) + "_" + string(obj.CTB) + ...
                    "\dbscan_output_sequences_eps_20_min_smpl_6\" +...
                    "dbscan_out_sequence_" + string(ID) +".data";
            else
                obj.DBscan_file = DM.Target_directory + "ML_result_" +...
                    string(obj.channel) + "_" + string(obj.CTB) + ...
                    "\gtgt_dbscan_output_sequences_eps_20_min_smpl_6\" +...
                    "dbscan_out_sequence_" + string(ID) +".data";
            end

            obj.Img_directory = DM.Target_directory + "ML_result_" +...
                string(obj.channel) + "_" + string(obj.CTB) + "\ML_result_" +...
                string(obj.channel) + "\";
            
            temp_cell = [];
            for i = 1:numel(obj.slices)
                filename = DM.Target_directory + "ML_result_" +...
                    string(obj.channel) + "_" + string(obj.CTB) + ...
                    "\ML_result_" + string(obj.channel) + "\" + ...
                    sprintf('%06d',obj.slices(i)) + ".tif";
                temp_cell = cat(1,temp_cell,filename);
            end
            obj.Img_files = temp_cell;

            obj.Starting_pixel = get_start_pix(DM.Cluster_linker,name,ID);
        end
        
        function show_all_tiles(obj)
            %Show all tiles in this cluster;
            for i = 1:numel(obj.Img_files)
                I = imread(obj.Img_files(i));
                figure;imshow(I);
            end
        end

    end
end

