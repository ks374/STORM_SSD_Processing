classdef SSD_CSV
    %SSD_CSV Handle all csv files from an experiment
    
    properties
        Pos_750_pred;
        Pos_750_gtgt;
        Neg_750_pred;
        Neg_750_gtgt;
        Pos_647_pred;
        Pos_647_gtgt;
        Neg_647_pred;
        Neg_647_gtgt;
    end
    
    methods
        function obj = SSD_CSV(DM)
            obj.Pos_750_pred = table2struct(readtable([DM.CSV_directory '750_Pos\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_pred.csv']));
            obj.Pos_750_gtgt = table2struct(readtable([DM.CSV_directory '750_Pos\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_gtgt.csv']));
            obj.Neg_750_pred = table2struct(readtable([DM.CSV_directory '750_Neg\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_pred.csv']));
            obj.Neg_750_gtgt = table2struct(readtable([DM.CSV_directory '750_Neg\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_gtgt.csv']));
            obj.Pos_647_pred = table2struct(readtable([DM.CSV_directory '647_Pos\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_pred.csv']));
            obj.Pos_647_gtgt = table2struct(readtable([DM.CSV_directory '647_Pos\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_gtgt.csv']));
            obj.Neg_647_pred = table2struct(readtable([DM.CSV_directory '647_Neg\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_pred.csv']));
            obj.Neg_647_gtgt = table2struct(readtable([DM.CSV_directory '647_Neg\' DM.get_date_char '_' DM.Name_E '_B_V2_subcluster_gtgt.csv']));
        end
        
        function H = get_histogram(obj,type,prop,bin_num)
            %type = Pos_750_pred
            %prop = num_locs|volume
            statistics = [obj.(type).(prop)];
            figure;
            H = histogram(log10(statistics),bin_num);
        end

        function [b2,c2,b3,c3] = histogram_invest(obj,type,prop,bin_num)
            H = obj.get_histogram(type,prop,bin_num);
            x = H.BinEdges(1:bin_num) + H.BinWidth/2;
            y = H.Values;
            fo = fitoptions('gauss3');
            fo.Lower = [0 0 0 0 0 0 0 1 0];
            f = fit(x',y','gauss3',fo);
            hold on;
            H2 = plot(f);
            H2.LineWidth = 3;
            
            b_list = [f.b1,f.b2,f.b3];
            c_list = [f.c1,f.c2,f.c3];
            [~,ind] = maxk(b_list,2);
            b2 = b_list(ind(2));
            c2 = c_list(ind(2));
            b3 = b_list(ind(1));
            c3 = c_list(ind(1));
        end

        function thre = get_thre(obj,type,prop,bin_num)
            [b2,c2,b3,c3] = obj.histogram_invest(type,prop,bin_num);
            thre1 = b3-c3;
            thre2 = b2+3*c2;
            thre = [thre1,thre2];
        end
    end
end

