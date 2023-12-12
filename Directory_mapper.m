classdef Directory_mapper
    %DIRECTORY_MAPPER Map csv files to raw data directory
    %   Each Directory_mapper store information from one experiment
    
    properties
        Name char;
        Name_E char;
        Target_directory char;
    end
    
    methods
        function obj = Directory_mapper(name,outpath)
            %DIRECTORY_MAPPER name: WTP2A, outpath: *\1.1.2020_P2EA_B_V2\
            if length(name) == 5
                obj.Name = name;
            else
                disp("Name length incorrect!");
            end
            if name(1:2) == "WT"
                obj.Name_E = [name(3:4),'E',name(5)];
            else
                obj.Name_E = obj.Name;
            end
            obj.Target_directory = outpath;
            
        end
        
        function date_char = get_date_char(obj)
            %METHOD1 example target_directory: X:\Chenghang\04_4_Color\Exp_Group\12.23.2020_P8EB_B_V2\
            temp = split(obj.Target_directory,'\');
            temp = split(temp{end-1},'_');
            date_char = temp{1};
        end
    end
end

