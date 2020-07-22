function [Tela,Exibe] = criarTela()

Tela.Fig = figure('menubar','none','numbertitle','off','name','Poker','resize','off');

Tela.Res = definirResolucao(Tela.Fig);

Tela.Mesa.Fig = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0 0 1 1],'bordertype','none'),'position',[0 0 1 1],'xcolor','none','ycolor','none');
Exibe.Mesa.Fig = imshow(['fig\' Tela.Res '\Ms.png'],'parent',Tela.Mesa.Fig);

Tela.Jogador(1).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.465 0.675 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(1).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.465 0.71 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(1).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.503 0.71 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(1).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.54 0.71 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(1).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.46 0.94 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(1).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.46 0.90 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(1).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.46 0.86 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(1).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.48 0.56 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(2).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.665 0.675 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(2).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.665 0.71 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(2).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.703 0.71 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(2).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.63 0.71 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(2).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.68 0.94 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(2).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.68 0.90 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(2).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.68 0.86 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(2).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.55 0.56 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(3).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.785 0.545 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(3).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.785 0.58 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(3).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.823 0.58 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(3).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.785 0.67 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(3).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.91 0.70 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(3).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.91 0.66 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(3).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.91 0.62 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(3).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.61 0.52 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(4).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.785 0.425 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(4).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.785 0.34 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(4).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.823 0.34 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(4).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.785 0.28 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(4).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.91 0.34 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(4).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.91 0.30 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(4).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.91 0.26 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(4).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.61 0.45 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(5).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.665 0.295 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(5).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.665 0.21 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(5).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.703 0.21 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(5).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.63 0.24 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(5).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.68 0.10 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(5).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.68 0.06 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(5).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.68 0.02 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(5).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.55 0.41 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(6).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.465 0.295 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(6).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.465 0.21 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(6).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.503 0.21 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(6).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.43 0.24 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(6).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.46 0.10 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(6).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.46 0.06 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(6).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.46 0.02 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(6).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.48 0.41 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(7).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.265 0.295 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(7).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.265 0.21 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(7).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.303 0.21 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(7).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.34 0.24 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(7).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.24 0.10 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(7).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.24 0.06 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(7).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.24 0.02 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(7).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.41 0.41 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(8).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.145 0.425 0.07 0.025],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(8).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.145 0.34 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(8).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.183 0.34 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(8).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.185 0.28 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(8).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.01 0.34 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(8).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.01 0.30 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(8).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.01 0.26 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(8).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.35 0.45 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(9).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.145 0.545 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(9).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.145 0.58 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(9).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.183 0.58 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(9).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.185 0.67 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(9).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.01 0.70 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(9).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.01 0.66 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(9).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.01 0.62 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(9).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.35 0.52 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Jogador(10).Acao     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.265 0.675 0.07 0.03],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(10).Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.265 0.71 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(10).Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.303 0.71 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(10).Dealer   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.34 0.71 0.03 0.05],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Jogador(10).Nome     = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.24 0.94 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(10).Funcao   = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.24 0.90 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(10).Stack    = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.24 0.86 0.08 0.04],'bordertype','none'),'position',[0 0 1 1],'color',[0.75 0.75 0.75],'xcolor','none','ycolor','none');
Tela.Jogador(10).Pot      = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.41 0.56 0.04 0.03],'bordertype','none'),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

Tela.Mesa.Carta(1) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.408 0.46 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Mesa.Carta(2) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.446 0.46 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Mesa.Carta(3) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.484 0.46 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Mesa.Carta(4) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.522 0.46 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');
Tela.Mesa.Carta(5) = subplot(1,1,1,'parent',uipanel(Tela.Fig,'units','normalized','position',[0.560 0.46 0.032 0.08],'bordertype','none','backgroundcolor',[0 0.5 0]),'position',[0 0 1 1],'color',[0 0.5 0],'xcolor','none','ycolor','none');

drawnow