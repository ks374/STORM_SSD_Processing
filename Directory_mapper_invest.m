%Check the histogram of SSD statistics;
Mapper_WTP8B = Mapper_list(7);
%%
%Investigation
f = Mapper_list(1).CSV_list.histogram_invest('Pos_750_pred','num_locs',num_bin);
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 32;
    thre = Mapper_list(i).CSV_list.get_thre('Pos_750_pred','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 40;
    thre = Mapper_list(i).CSV_list.get_thre('Neg_750_pred','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 20;
    thre = Mapper_list(i).CSV_list.get_thre('Pos_647_pred','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 20;
    thre = Mapper_list(i).CSV_list.get_thre('Neg_647_pred','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 32;
    thre = Mapper_list(i).CSV_list.get_thre('Pos_750_gtgt','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 32;
    thre = Mapper_list(i).CSV_list.get_thre('Neg_750_gtgt','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 24;
    thre = Mapper_list(i).CSV_list.get_thre('Pos_647_gtgt','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
thre_list = [];
for i = 1:numel(Mapper_list)
    num_bin = 24;
    thre = Mapper_list(i).CSV_list.get_thre('Neg_647_gtgt','num_locs',num_bin);
    thre_list = cat(1,thre_list,thre);
end
figure;plot(thre_list(:,1));
hold on;plot(thre_list(:,2));
disp(mean(10.^(thre_list)));
%%
