%function Calcium_Behavior_VideoMaker_copy(fpath_ca,fpath_be,fpath_ca_extraced)
% Make the video for behavior and calcium imaging
% ???fpath_ca?fpath_be???String ?????????????
% fpath_ca = 'C:\Users\Administrator\Desktop\test';
% fpath_be = 'C:\Users\Administrator\Desktop\test_v';
fpath_ca = 'C:\Users\Administrator\Desktop\forvid\ca';
fpath_be = 'C:\Users\Administrator\Desktop\forvid\mv';
fpath_ca_extraced = 'C:\Users\Administrator\Desktop\forvid\ca_ex';

flist_ca = dir([fpath_ca,'\','*.tif']);
flist_be = dir([fpath_be,'\','*.jpg']);
flist_extraced = dir([fpath_ca_extraced,'\','*.jpg']);

flist_ca = {flist_ca.name}';
flist_be = {flist_be.name}';
flist_extraced={flist_extraced.name}';

flist_ca = cellfun(@(x) fullfile(fpath_ca,x),flist_ca,'Uniformoutput',false);
flist_be = cellfun(@(x) fullfile(fpath_be,x),flist_be,'Uniformoutput',false);
flist_extraced = cellfun(@(x) fullfile(fpath_ca_extraced,x),flist_extraced,'Uniformoutput',false);

flist_ca = natsortfiles(flist_ca);
flist_be = natsortfiles(flist_be);
flist_extraced=natsortfiles(flist_extraced);

info_ca = imfinfo(flist_ca{1});
info_be = imfinfo(flist_be{1});
info_extraced = imfinfo(flist_extraced{1});

imleng_ca = length(flist_ca);
%imleng_be = length(flist_be);

width_ca = info_ca.Width;
height_ca = info_ca.Height;

width_be = info_be.Width;
height_be = info_be.Height;

width_extraced = info_extraced.Width;
height_extraced = info_extraced.Height;

D = ceil((width_ca+width_be)/2);
E = (width_ca+width_be);

s_ca = struct('cdata',zeros(height_ca,width_ca,'uint8'),...
    'colormap',[]);
s_be = struct('cdata',zeros(width_be,height_be,3,'uint8'),...
    'colormap',[]);
s_extraced = struct('cdata',zeros(width_extraced,height_extraced,3,'uint8'),...
    'colormap',[]);

%% Load all the data
tic;textprogressbar('Loading images:');
ca_mat = zeros(width_ca,height_ca,imleng_ca,'uint8'); 
for f = 1:imleng_ca   
    textprogressbar(floor(f/(imleng_ca)*100));
    s_ca(f).cdata = im2uint8(imread(flist_ca{f}));
    s_be(f).cdata = im2uint8(imread(flist_be{f}));
    s_extraced(f).cdata = im2uint8(imread(flist_extraced{f}));
    ca_mat(:,:,f) = s_ca(f).cdata;
end
ca_min = min(ca_mat,[],3);
textprogressbar('done');toc;
%% Write to a avi video
fvid = ['Calcium-Behavior-Video-',date,'.mp4'];
Obj = VideoWriter(fvid,'MPEG-4');
Obj.FrameRate = 5;
play_speed = Obj.FrameRate/10;
Obj.Quality = 100;
open(Obj);


img_ca = s_ca(1).cdata;
img_be = s_be(1).cdata;
img_extraced = s_extraced(1).cdata;

hf = figure('position',[0 0 E D],'color','black');
hbe = axes('unit','normalized','position',[0.525 0.17 0.45 0.9],...
    'parent',hf,'xtick',[],'ytick',[],'box','on');
hextraced = axes('unit','normalized','position',[0.347 0.05 0.8 0.25],...
    'parent',hf,'xtick',[],'ytick',[],'box','on');
hca = axes('unit','normalized','position',[0.05 0.05 0.45 0.9],...
    'parent',hf,'xtick',[],'ytick',[],'box','on');

scale = 100/(width_ca*2.75)*0.45;
annotation(hf,'line',[0.42 0.42+scale],...
    [0.9 0.9],'Color',[1 1 0],'LineWidth',3);
annotation(hf,'textbox',[0.415 0.845 0.05 0.05],...
    'Color',[1 1 0],'String',{'100 \mum'},'FitBoxToText','off');
annotation(hf,'rectangle',[0.05 0.05 0.45 0.9],...
    'Color',[0.5 0.5 0.5],'LineWidth',1);
annotation(hf,'rectangle',[0.525 0.05 0.45 0.9],...
    'Color',[0.5 0.5 0.5],'LineWidth',1);
 hica = imshow(img_ca,[1 30],'parent',hca);
 hibe = imshow(img_be,'parent',hbe);
 hiextraced = imshow(img_extraced,'parent',hextraced);
 
tt = linspace(0,(imleng_ca-1)/10,imleng_ca);

for f = 1:imleng_ca
    
    set(hica,'cdata',s_ca(f).cdata-ca_min)
    text(10,25,[num2str(tt(f),'%3.1f'),' s(',num2str(play_speed),'x)'],'color','yellow','fontsize',16);
    text(10,380,'Dorsal Striatum(D1-MSN)','color','yellow','fontsize',16);
    
    for ii=1:5
        text(text_pos(1,ii),text_pos(2,ii),num2str(ii),'color','yellow','fontsize',16)
    end
    
    set(hibe,'cdata',s_be(f).cdata)
    set(hiextraced,'cdata',s_extraced(f).cdata)
    drawnow;
    writeVideo(Obj,getframe(hf));
    htxt = findobj(gca,'Type','text'); delete(htxt);
end

close(hf);close(Obj);