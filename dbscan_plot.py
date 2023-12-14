"""
Script to show 2D tiles from target cluster. 
Called by Matlab 

Chenghang 12/13/2023
"""

import numpy as np
import sys
import glob
import pickle
import os
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

class DBscan_visual:
    def __init__(self,DBscanfile,locs3dfile,starting_x,starting_y):
        self.DBscanfile = DBscanfile
        self.locs3dfile = locs3dfile
        channel = locs3dfile.split('_')
        #print(channel[-7])
        if channel[-5] == "750":
            self.block_size = 86 * 15.5
        else:
            self.block_size = 72 * 15.5
        self.x = starting_x * 15.5
        self.y = starting_y * 15.5
        # self.IDs = np.array(IDs)
    
    def plot_tiles(self,filter_size):
        with open(self.locs3dfile,'rb') as filehandle:
            locs3d_seq_arr = pickle.load(filehandle)
        if locs3d_seq_arr.shape[0] <= 1:
            print("No molecule found in this cluster");
            return -1
        z_array = locs3d_seq_arr[:,2]
        z_start = round(z_array.min() - z_array.min()%70)
        n_section = round(((z_array.max() - z_array.max()%70 + 70) - (z_array.min() - z_array.min()%70))/70)
        # return z_array
        for i in range(n_section):
            z_min_cur = z_start + i*70
            z_max_cur = z_start + (i+1)*70
            cur_mask = (z_array >= z_min_cur) & (z_array < z_max_cur)
            self.plot_tile(filter_size,cur_mask)
        return 1
    
    def plot_tile(self,filter_size,cur_mask):
        with open(self.locs3dfile,'rb') as filehandle:
            locs3d_seq_arr = pickle.load(filehandle)
        # DBSCAN expects first column of array to be x and second column to be y, so swap the two columns of locs3d_seq_arr. 
        if locs3d_seq_arr.shape[0] > 1:
            locs3d_seq_arr[:,[0,1]] = locs3d_seq_arr[:,[1,0]]
        
        with open(self.DBscanfile,'rb') as filehandle:
            db = pickle.load(filehandle)
        
        core_samples_mask = np.zeros_like(db.labels_, dtype=bool)
        core_samples_mask[db.core_sample_indices_] = True
        labels = db.labels_
        
        n_clusters_ = len(set(labels)) - (1 if -1 in labels else 0)
        n_noise_ = list(labels).count(-1)
        
        clst_ct = filter_size
        
        unique_labels = set(labels)
        unique_labels = set(labels)
        colors = [plt.cm.Spectral(each) for each in np.linspace(0, 1, len(unique_labels))]

        plt.figure()
        for k, col in zip(unique_labels, colors):
            if k == -1:
                col = [0, 0, 0, 1]
                mark_size = 1
            else:
                mark_size = 4
            class_member_mask = labels == k
            noise_mask = labels == -1
            
            # xy = locs3d_seq_arr[class_member_mask & ~noise_mask]
            xy = locs3d_seq_arr[class_member_mask & cur_mask]
            plt.plot(
                xy[:, 0],
                xy[:, 1],
                "o",
                markerfacecolor=tuple(col),
                markeredgecolor="k",
                markersize=mark_size,
            )
        # plt.gca().invert_yaxis()
        plt.xlim((self.y,self.y+self.block_size))
        plt.ylim((self.x+self.block_size,self.x))
        plt.show(block=False)
        return 1
        
if __name__ == '__main__':
    # Example statement: 
    # pyrunfile('Thisfile.py',DBscan_file,locs3d_file,filter_size)
    # print(DBscanfile)
    # print(locs3d_file)
    # print(filter_size)
    # DBscanfile = "X:\\Chenghang\\04_4_Color\\Exp_Group\\12.23.2020_P8EB_B_V2\\ML_result_750_Pos\\dbscan_output_sequences_eps_20_min_smpl_6\\dbscan_out_sequence_1.data"
    # locs3d_file = "X:\\Chenghang\\04_4_Color\\Exp_Group\\12.23.2020_P8EB_B_V2\\ML_result_750_Pos\\locs3d_pred_sequences\\locs3d_pred_sequence_1.data"
    # filter_size = 0
    DBV = DBscan_visual(DBscanfile,locs3d_file,starting_x,starting_y)
    DBV.plot_tiles(filter_size)
    # plt.show()
