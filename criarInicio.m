function Inicio = criarInicio()

Inicio.Fig = figure;
set(Inicio.Fig,'menubar','none','numbertitle','off','name','Parâmetros Iniciais')

Inicio.Texto(1) = uicontrol(Inicio.Fig,'style','text','string','Número de Jogos','units','normalized','position',[0.05 0.805 0.3 0.1],'fontsize',12);
Inicio.Campo(1) = uicontrol(Inicio.Fig,'style','edit','string','1','units','normalized','position',[0.36 0.84 0.1 0.08],'fontsize',12);

Inicio.Texto(2) = uicontrol(Inicio.Fig,'style','text','string','Número de Jogadores','units','normalized','position',[0.05 0.665 0.3 0.1],'fontsize',12);
Inicio.Campo(2) = uicontrol(Inicio.Fig,'style','edit','string','10','units','normalized','position',[0.36 0.70 0.1 0.08],'fontsize',12);

Inicio.Texto(3) = uicontrol(Inicio.Fig,'style','text','string','Tipos de Jogadores','units','normalized','position',[0.1 0.52 0.3 0.1],'fontsize',12);
Inicio.TipoAI(1) = uicontrol(Inicio.Fig,'style','checkbox','string','Humano','units','normalized','position',[0.1 0.46 0.15 0.1],'fontsize',12,'value',1);
Inicio.TipoAI(2) = uicontrol(Inicio.Fig,'style','checkbox','string','Smart' ,'units','normalized','position',[0.3 0.46 0.15 0.1],'fontsize',12,'value',1);
Inicio.TipoAI(3) = uicontrol(Inicio.Fig,'style','checkbox','string','Call'  ,'units','normalized','position',[0.1 0.38 0.15 0.1],'fontsize',12,'value',0);
Inicio.TipoAI(4) = uicontrol(Inicio.Fig,'style','checkbox','string','Check' ,'units','normalized','position',[0.3 0.38 0.15 0.1],'fontsize',12,'value',0);
Inicio.TipoAI(5) = uicontrol(Inicio.Fig,'style','checkbox','string','Raise' ,'units','normalized','position',[0.1 0.30 0.15 0.1],'fontsize',12,'value',0);
Inicio.TipoAI(6) = uicontrol(Inicio.Fig,'style','checkbox','string','Random','units','normalized','position',[0.3 0.30 0.15 0.1],'fontsize',12,'value',0);

Inicio.Texto(4) = uicontrol(Inicio.Fig,'style','text','string','Stack Inicial','units','normalized','position',[0.55 0.805 0.25 0.1],'fontsize',12);
Inicio.Campo(4) = uicontrol(Inicio.Fig,'style','edit','string','10000','units','normalized','position',[0.81 0.84 0.1 0.08],'fontsize',12);

Inicio.Texto(5) = uicontrol(Inicio.Fig,'style','text','string','BigBlind Inicial','units','normalized','position',[0.55 0.665 0.25 0.1],'fontsize',12);
Inicio.Campo(5) = uicontrol(Inicio.Fig,'style','edit','string','100','units','normalized','position',[0.81 0.70 0.1 0.08],'fontsize',12);

Inicio.Texto(6) = uicontrol(Inicio.Fig,'style','text','string','Aumentar BigBlind','units','normalized','position',[0.59 0.52 0.3 0.1],'fontsize',12);
Inicio.Campo(6) = uibuttongroup(Inicio.Fig,'units','normalized','position',[0.58 0.46 0.3 0.1],'bordertype','none');
uicontrol(Inicio.Campo(6),'style','radiobutton','string','Sim','units','normalized','position',[1/5 0 2/5 1],'fontsize',12);
uicontrol(Inicio.Campo(6),'style','radiobutton','string','Não','units','normalized','position',[3/5 0 2/5 1],'fontsize',12);

Inicio.Texto(7) = uicontrol(Inicio.Fig,'style','text','string','Salvar Banco de Dados','units','normalized','position',[0.59 0.32 0.3 0.1],'fontsize',12);
Inicio.Campo(7) = uibuttongroup(Inicio.Fig,'units','normalized','position',[0.58 0.26 0.3 0.1],'bordertype','none');
uicontrol(Inicio.Campo(7),'style','radiobutton','string','Sim','units','normalized','position',[1/5 0 2/5 1],'fontsize',12,'value',0);
uicontrol(Inicio.Campo(7),'style','radiobutton','string','Não','units','normalized','position',[3/5 0 2/5 1],'fontsize',12,'value',1);

Inicio.Botao(1) = uicontrol(Inicio.Fig,'style','togglebutton','string','Iniciar Jogo','units','normalized','position',[0.35 0.08 0.3 0.12],'fontsize',14);