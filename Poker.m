close all
clear
clc

Inicio = criarInicio;

Jogo = atualizarInicio(Inicio);

[Tela,Exibe] = criarTela;

Rodada = struct;
Jogador = struct;
Partida.NJogos = 0;

while Partida.NJogos < Jogo.NJogos
    
    [Jogo,Partida,Jogador] = iniciarJogo(Jogo,Partida,Jogador);
    
    Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,-2);
    
    while sum(Partida.Ativos) > 1
        
        Partida = darCartas(Jogo,Partida);
        
        [Partida,Rodada,Jogador] = iniciarPartida(Jogo,Partida,Rodada,Jogador);
        
        Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,-1);
        
        while Rodada.NRodadas < 4
            
            [Rodada,Jogador] = iniciarRodada(Jogo,Partida,Rodada,Jogador);
            
            Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,0);
            
            while any(~Jogador.Check(Jogador.Ativos))
                
                [Rodada,Jogador] = controlarJogada(Jogo,Partida,Rodada,Jogador);
                
                Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,Rodada.JogAtual);
                
                if sum(Jogador.Ativos) == 1 || sum(Jogador.Stack(Jogador.Ativos)>=0) == 1
                    break
                end
                
            end
            
            if sum(Jogador.Ativos) == 1 || sum(Jogador.Stack(Jogador.Ativos)>=0) == 1
                break
            end
            
        end
        
        [Partida,Jogador] = finalizarPartida(Partida,Jogador);
        
        Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,Jogo.NJogadores+1);
        
    end
    
    Exibe = atualizarTela(Tela,Exibe,Jogo,Partida,Rodada,Jogador,Jogo.NJogadores+2);
    
end