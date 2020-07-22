function res = definirResolucao(fig)

MaxRes = get(0,'screensize');
MaxRes(1:2) = [];

AvalRes = [1920 1080; 1600 900; 1280 720; 960 540; 640 360];

for ii = 1:size(AvalRes,1)
    if all(MaxRes >= AvalRes(ii,:)) && ii == 3
        set(fig,'position',[round((MaxRes-AvalRes(ii,:))/2) AvalRes(ii,:)])
        res = num2str(ii);
    end
end

% set(fig,'position',[20 50 960 540])
% pause(0.25)
% warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
% set(get(handle(fig),'JavaFrame'),'Maximized',1);
% pause(0.25);