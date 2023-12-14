classdef Directory_mapper_CSV < Directory_mapper
    %DIRECTORY_MAPPER Map csv files to raw data directory
    %   Each Directory_mapper store information from one experiment
    
    properties
        CSV_directory char;
        CSV_list;
        Cluster_linker;
    end
    
    methods
        function obj = Directory_mapper_CSV(name,outpath,CSV_path)
            %DIRECTORY_MAPPER name: WTP2A, outpath: *\1.1.2020_P2EA_B_V2\
            obj = obj@Directory_mapper(name,outpath);
            obj.CSV_directory = [CSV_path,name,'\'];

            obj.CSV_list = SSD_CSV(obj);
            obj.Cluster_linker = Cluster_linker(obj);
        end
        
    end
end

