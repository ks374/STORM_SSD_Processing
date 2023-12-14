outpath = 'Y:\Chenghang\SSD_and_ML\Database\';

Mapper_list = [];

Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP2A','X:\Chenghang\04_4_Color\Exp_Group\1.2.2021_P2EA_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP2B','X:\Chenghang\04_4_Color\Exp_Group\1.4.2021_P2EB_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP2C','Y:\Chenghang\4_Color\Raw\1.6.2021_P2EC_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP4B','X:\Chenghang\04_4_Color\Exp_Group\9.25.2020_P4EC_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP4C','Y:\Chenghang\4_Color\Raw\12.5.2020_P4ED_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP8A','Y:\Chenghang\4_Color\Raw\12.21.2020_P8EA_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP8B','X:\Chenghang\04_4_Color\Exp_Group\12.23.2020_P8EB_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('WTP8C','Y:\Chenghang\4_Color\Raw\1.12.2021_P8EC_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P2A','X:\Chenghang\04_4_Color\Exp_Group\9.29.2020_B2P2A_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P2B','X:\Chenghang\04_4_Color\Exp_Group\12.13.2020_B2P2B_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P2C','Y:\Chenghang\4_Color\Raw\12.18.2020_B2P2C_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P4A','X:\Chenghang\04_4_Color\Exp_Group\10.3.2020_B2P4A_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P4B','Y:\Chenghang\4_Color\Raw\10.27.2020_B2P4B_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P4C','Y:\Chenghang\4_Color\Raw\12.8.2020_B2P4C_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P8A','Y:\Chenghang\4_Color\Raw\12.12.2020_B2P8A_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P8B','Y:\Chenghang\4_Color\Raw\1.13.2021_B2P8B_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));
Mapper_list = cat(2,Mapper_list,Directory_mapper_CSV('B2P8C','Y:\Chenghang\4_Color\Raw\1.11.2021_B2P8C_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\'));

save([outpath 'Mapper_list.mat'],'Mapper_list');
%%
test = Directory_mapper_CSV('WTP8B','X:\Chenghang\04_4_Color\Exp_Group\12.23.2020_P8EB_B_V2\','Y:\Chenghang\SSD_and_ML\SSD_CSV\');