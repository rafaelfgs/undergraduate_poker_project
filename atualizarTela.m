function Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,N) %#ok<*AGROW>

if N == -2
    for ii = 1:Jogo.NJogadores
        try delete(Exibe.Jogador(ii).Funcao),catch,end
        try delete(Exibe.Jogador(ii).Nome),catch,end
        Exibe.Jogador(ii).Funcao = text(0.5,0.5,func2str(Jogo.Funcao{ii}),'horizontalalignment','center','fontsize',12,'parent',Tela.Jogador(ii).Funcao);
        Exibe.Jogador(ii).Nome = text(0.5,0.5,Jogo.Nomes{ii},'horizontalalignment','center','fontsize',12,'parent',Tela.Jogador(ii).Nome);
    end

elseif N == -1
    
    for ii = 1:Jogo.NJogadores
        try delete(Exibe.Jogador(ii).Carta),catch,end
        try delete(Exibe.Jogador(ii).Dealer),catch,end
        try delete(Exibe.Jogador(ii).Pot),catch,end
    end
    for ii = find(Jogador.Ativos)
        try delete(Exibe.Jogador(ii).Stack),catch,end
        
        if strcmp(func2str(Jogo.Funcao{ii}),'AIHuman')
            Exibe.Jogador(ii).Carta(1) = imshow(['fig\' Tela.Res '\' Partida.Mao{1,ii} '.png'],'parent',Tela.Jogador(ii).Carta(1));
            Exibe.Jogador(ii).Carta(2) = imshow(['fig\' Tela.Res '\' Partida.Mao{2,ii} '.png'],'parent',Tela.Jogador(ii).Carta(2));
        else
            Exibe.Jogador(ii).Carta(1) = imshow(['fig\' Tela.Res '\No.png'],'parent',Tela.Jogador(ii).Carta(1));
            Exibe.Jogador(ii).Carta(2) = imshow(['fig\' Tela.Res '\No.png'],'parent',Tela.Jogador(ii).Carta(2));
        end
        
        if Partida.Indice(ii) == 1
            Exibe.Jogador(ii).Dealer = imshow(['fig\' Tela.Res '\Dl.png'],'parent',Tela.Jogador(ii).Dealer);
        end
        Exibe.Jogador(ii).Stack = text(0.5,0.5,num2str(Jogador.Stack(ii)),'horizontalalignment','center','fontsize',12,'parent',Tela.Jogador(ii).Stack);
        Exibe.Jogador(ii).Pot = text(0.5,0.5,num2str(Jogador.Pot(ii)),'horizontalalignment','center','parent',Tela.Jogador(ii).Pot);
    end
    for ii = 1:5
        try delete(Exibe.Mesa.Carta(ii)),catch,end
        Exibe.Mesa.Carta(ii) = imshow(['fig\' Tela.Res '\No.png'],'parent',Tela.Mesa.Carta(ii));
    end
    
elseif N == 0
    
    for ii = 1:Jogo.NJogadores
        try delete(Exibe.Jogador(ii).Acao),catch,end
    end
    
    if Rodada.NRodadas == 2
        for ii = 1:3
            delete(Exibe.Mesa.Carta(ii))
            Exibe.Mesa.Carta(ii) = imshow(['fig\' Tela.Res '\' Partida.Mesa{ii} '.png'],'parent',Tela.Mesa.Carta(ii));
        end
        
    elseif Rodada.NRodadas == 3
        ii = 4;
        delete(Exibe.Mesa.Carta(ii))
        Exibe.Mesa.Carta(ii) = imshow(['fig\' Tela.Res '\' Partida.Mesa{ii} '.png'],'parent',Tela.Mesa.Carta(ii));
        
    elseif Rodada.NRodadas == 4
        ii = 5;
        delete(Exibe.Mesa.Carta(ii))
        Exibe.Mesa.Carta(ii) = imshow(['fig\' Tela.Res '\' Partida.Mesa{ii} '.png'],'parent',Tela.Mesa.Carta(ii));
        
    end
    
elseif N >= 0 && N <= Jogo.NJogadores
    
    try delete(Exibe.Jogador(N).Acao),catch,end
    try delete(Exibe.Jogador(N).Stack),catch,end
    try delete(Exibe.Jogador(N).Pot),catch,end
    Exibe.Jogador(N).Acao = text(0.5,0.5,Jogador.Acao(N),'horizontalalignment','center','fontsize',08,'parent',Tela.Jogador(N).Acao);
    Exibe.Jogador(N).Stack = text(0.5,0.5,num2str(Jogador.Stack(N)),'horizontalalignment','center','fontsize',12,'parent',Tela.Jogador(N).Stack);
    Exibe.Jogador(N).Pot = text(0.5,0.5,num2str(Jogador.Pot(N)),'horizontalalignment','center','parent',Tela.Jogador(N).Pot);
    
    if ~Jogador.Ativos(N)
        try delete(Exibe.Jogador(N).Carta),catch,end
    end
    
elseif N == Jogo.NJogadores+1
    
    for ii = 1:Jogo.NJogadores
        try delete(Exibe.Jogador(ii).Stack),catch,end
        Exibe.Jogador(ii).Stack = text(0.5,0.5,num2str(Jogador.Stack(ii)),'horizontalalignment','center','fontsize',12,'parent',Tela.Jogador(ii).Stack);
    end
    
    for ii = find(Jogador.Ativos)
        
        if sum(Jogador.Ativos) > 1
            if Jogador.Ativos(ii)
                try delete(Exibe.Jogador(ii).Carta),catch,end
                Exibe.Jogador(ii).Carta(1) = imshow(['fig\' Tela.Res '\' Partida.Mao{1,ii} '.png'],'parent',Tela.Jogador(ii).Carta(1));
                Exibe.Jogador(ii).Carta(2) = imshow(['fig\' Tela.Res '\' Partida.Mao{2,ii} '.png'],'parent',Tela.Jogador(ii).Carta(2));
            end
        end
        
    end
    
    Texto = ['                     Fim da partida!                     ' 10 10];
    for ii = 1:Jogo.NJogadores
        if Partida.Ganhador(ii) > 0
            Texto = [Texto Jogo.Nomes{ii} ' ganhou ' num2str(Partida.Ganhador(ii))];
            if sum(Jogador.Ativos) > 1
                Texto = [Texto ' com ' Partida.NomeJogo{ii}];
            end
            Texto = [Texto 10];
        end
    end
    
    for ii = 1:Jogo.NJogadores
        if isequal(Jogo.Funcao{ii},@AIHuman) && Partida.Ativos(ii)
            waitfor(msgbox(Texto))
        end
    end
    
elseif N == Jogo.NJogadores+2
    
    [Posicao,Indice] = sort(Partida.Final);
    
    Texto = ['              Fim de jogo!              ' 10 10];
    for ii = 1:Jogo.NJogadores
        Texto = [ Texto num2str(Posicao(ii)) 'º lugar - ' Jogo.Nomes{Indice(ii)} ...
                  ' (' func2str(Jogo.Funcao{Indice(ii)}) ')' 10];
    end
    
    waitfor(msgbox(Texto))
    
end

drawnow