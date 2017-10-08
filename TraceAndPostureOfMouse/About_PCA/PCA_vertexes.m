% vertexes = arrayfun(@(x) PCA_vertex(str(x,:),1:size(str,1)));
% get events from raw data ;
function [DataList,spks]=PCA_vertexes(str,datapath)
vertexes=[];
recording_speed = 10; %frame/second
for i = 1:size(str,1)
    indx=PCA_vertex(str(i,:));
    buffer = zeros(2,numel(indx));
    buffer(2,:)=indx/recording_speed;
    buffer(1,:)=i;
    vertexes=[vertexes,buffer];
end
spks=vertexes';
save([datapath,'\spks.mat'],'spks');
DataList = struct([]);
DataList(1).spikes ='spks';
dir_cellpos = dir([datapath,'\','*','cellpos.mat']);
DataList(1).position = dir_cellpos.name;
save([datapath,'\DataList.mat'],'DataList');