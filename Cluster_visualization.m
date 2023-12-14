test_mapper = Mapper_list(7);
%%
test_cluster = Cluster_info(test_mapper,"Pos_750_pred",2);
%
test_cluster.show_all_tiles;
%
pyrunfile("dbscan_plot.py",DBscanfile=test_cluster.DBscan_file,...
    locs3d_file=test_cluster.locs3d_file,filter_size=0,...
    starting_x=test_cluster.Starting_pixel(1),...
    starting_y=test_cluster.Starting_pixel(2));
%%
test_cluster = Cluster_info(test_mapper,"Pos_750_gtgt",2);
%
%test_cluster.show_all_tiles;
%
pyrunfile("dbscan_plot.py",DBscanfile=test_cluster.DBscan_file,...
    locs3d_file=test_cluster.locs3d_file,filter_size=0,...
    starting_x=test_cluster.Starting_pixel(1),...
    starting_y=test_cluster.Starting_pixel(2));
%%
close all
pyrun("import matplotlib.pyplot as plt;plt.close('all')");