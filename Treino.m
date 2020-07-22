%% Data reading

close all
clear
clc

n_hidden = 20;

arq_name = ls('bd');
arq_name(1:2,:) = [];

var_name = {};

data_total = [];

for ii = 1:size(arq_name)
    
    if strcmp(arq_name(ii,14:17),'.txt')
        
        arq = fopen(['bd\' arq_name(ii,:)]);
        head = fgetl(arq);
        
        for jj = 1:((size(head,2)+1)/7)
            if ~any(strcmp(var_name,head(7*jj+(-6:-1))))
                var_name = [var_name head(7*jj+(-6:-1))]; %#ok<AGROW>
            end
        end
        
        data = fscanf(arq,'%f',[((size(head,2)+1)/7) Inf])';
        
        data_total = [ data_total; zeros(size(data))]; %#ok<AGROW>
        
        for jj = 1:((size(head,2)+1)/7)
            m = size(data_total,1)-size(data,1);
            n = find(strcmp(var_name,head(7*jj+(-6:-1))));
            data_total(m+1:end,n) = data(:,n);
        end
        
        fclose(arq);
        
    end
    
end

%% Data manipulating

var_0 = ' SAIDA';
var_1 = {'PROBAB' ' STACK' 'VIRADA' 'NPARTI' 'BIGBLI'};
var_2 = {'NRAISE' ' NFOLD' 'POSICA' '   POT'};
var_3 = {'STACKM' 'POTTOT' 'DEALER' ' NJOGO'};

t = data_total(:,strcmp(var_0,var_name));
x1 = [];
for ii = 1:size(var_1,2)
    x1 = [x1 data_total(:,strcmp(var_1(ii),var_name))]; %#ok<AGROW>
end
x2 = [];
for ii = 1:size(var_1,2)
    x2 = [x2 data_total(:,strcmp(var_1(ii),var_name))]; %#ok<AGROW>
end
x3 = [];
for ii = 1:size(var_1,2)
    x3 = [x3 data_total(:,strcmp(var_1(ii),var_name))]; %#ok<AGROW>
end

[x1,~] = sortrows([t x1]); x1 = x1(:,2:end)';
[x2,~] = sortrows([t x2]); x2 = x2(:,2:end)';
[x3,~] = sortrows([t x3]); x3 = x3(:,2:end)';
[t,~] = sortrows(t); t = t';

net1_new = train(configure(feedforwardnet(n_hidden),x1,t),x1,t);
net2_new = train(configure(feedforwardnet(n_hidden),x2,t),x2,t);
net3_new = train(configure(feedforwardnet(n_hidden),x3,t),x3,t);

load('bd\net1')
% load('bd\net2')
% load('bd\net3')

%% Data printing

figure

% subplot(311)
hold on
plot(t,'k','linewidth',2)
plot(net1(x1),'r')
plot(net1_new(x1),'b')
legend('Original','Old Net1','New Net1','location','northwest')
ylim([-0.4 1.2])
set(gca,'ygrid','on')
hold off

% subplot(312)
% hold on
% plot(t,'k','linewidth',2)
% plot(net2(x2),'r')
% plot(net2_new(x2),'b')
% legend('Original','Old Net2','New Net2','location','northwest')
% ylim([-0.4 1.2])
% set(gca,'ygrid','on')
% hold off
% 
% subplot(313)
% hold on
% plot(t,'k','linewidth',2)
% plot(net3(x3),'r')
% plot(net3_new(x3),'b')
% % legend('Original','Old Net3','New Net3','location','northwest')
% ylim([-0.4 1.2])
% set(gca,'ygrid','on')
% hold off
% 
% net1 = net1_new; save('bd\net1.mat','net1')
% net2 = net2_new; save('bd\net2.mat','net2')
% net3 = net3_new; save('bd\net3.mat','net3')

% if strcmp(questdlg('Update Old Net1 to New Net1?','','Yes','No','Yes'),'Yes')
%     net1 = net1_new;
%     save('bd\net1.mat','net1')
% end