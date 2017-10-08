%Consensus_Cluster_DataSet_shell

% clear
% load('C:\Users\Administrator\Desktop\96361_12202016_s1\96361_12202016_s1_cellpos.mat')
% load('C:\Users\Administrator\Desktop\96361_12202016_s1\96361_12202016_s1_str.mat')
% datapath = 'C:\Users\Administrator\Desktop\96361_12202016_s1';
% [DataList,spks]=PCA_vertexes(str,datapath);
% Consensus_Cluster_DataSet

datapath = 'C:\Users\Administrator\Desktop\96361_12202016_s1';

dir_cellpos = dir([datapath,'\','*','cellpos.mat']);
dir_str = dir([datapath,'\','*','str.mat']);
load([datapath,'\',dir_str.name])
load([datapath,'\',dir_cellpos.name])
[DataList,spks]=PCA_vertexes(str,datapath);