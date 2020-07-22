function [Rodada,Jogador] = controlarJogada(Jogo,Partida,Rodada,Jogador)

Rodada.TipoJogada = min([Rodada.TipoJogada+1 4]);

for ii = [Rodada.JogAtual+1:numel(Partida.Ativos) 1:Rodada.JogAtual-1]
    if Partida.Ativos(ii)
        Rodada.JogAtual = ii;
        break
    end
end

% Jogada do Dealer
if Rodada.TipoJogada == 1
    Jogador.Acao{Rodada.JogAtual} = 'Dealer';
    Jogador.Aposta(Rodada.JogAtual) = 0;
    Jogador.Gasto(Rodada.JogAtual) = 0;
    Jogador.Call(Partida.Ativos) = Partida.BigBlind;
    Jogador.Check(Rodada.JogAtual) = false;
    Jogador.Ativos(Rodada.JogAtual) = true;
    
% Jogada do SmallBlind
elseif Rodada.TipoJogada == 2
    if Jogador.Stack(Rodada.JogAtual) > Partida.BigBlind/2
        Jogador.Acao{Rodada.JogAtual} = 'SmallBlind';
        Jogador.Aposta(Rodada.JogAtual) = 0;
        Jogador.Gasto(Rodada.JogAtual) = Partida.BigBlind/2;
        Jogador.Call(Rodada.JogAtual) = Partida.BigBlind/2;
        Jogador.Check(Rodada.JogAtual) = false;
        Jogador.Ativos(Rodada.JogAtual) = true;
    else
        Jogador.Acao{Rodada.JogAtual} = 'All-in';
        Jogador.Aposta(Rodada.JogAtual) = 0;
        Jogador.Gasto(Rodada.JogAtual) = Jogador.Stack(Rodada.JogAtual);
        Jogador.Call(Rodada.JogAtual) = 0;
        Jogador.Check(Rodada.JogAtual) = true;
        Jogador.Ativos(Rodada.JogAtual) = true;
    end
    
% Jogada do BigBlind
elseif Rodada.TipoJogada == 3
    if Jogador.Stack(Rodada.JogAtual) > Partida.BigBlind
        Jogador.Acao{Rodada.JogAtual} = 'BigBlind';
        Jogador.Aposta(Rodada.JogAtual) = 0;
        Jogador.Gasto(Rodada.JogAtual) = Partida.BigBlind;
        Jogador.Call(Rodada.JogAtual) = 0;
        Jogador.Check(Rodada.JogAtual) = false;
        Jogador.Ativos(Rodada.JogAtual) = true;
    else
        Jogador.Acao{Rodada.JogAtual} = 'All-in';
        Jogador.Aposta(Rodada.JogAtual) = 0;
        Jogador.Gasto(Rodada.JogAtual) = Jogador.Stack(Rodada.JogAtual);
        Jogador.Call(Rodada.JogAtual) = 0;
        Jogador.Check(Rodada.JogAtual) = true;
        Jogador.Ativos(Rodada.JogAtual) = true;
    end
    
% Jogada de alguém que desistiu
elseif ~Jogador.Ativos(Rodada.JogAtual)
    
    Jogador.Acao{Rodada.JogAtual} = '';
    Jogador.Aposta(Rodada.JogAtual) = 0;
    Jogador.Gasto(Rodada.JogAtual) = 0;
    Jogador.Call(Rodada.JogAtual) = 0;
    Jogador.Check(Rodada.JogAtual) = true;
    Jogador.Ativos(Rodada.JogAtual) = false;
    
% Jogada de alguém ativo na partida
else
    
    % Jogada de alguém que não tem mais dinheiro ou que restou apenas um com dinheiro
    if ( sum(Jogador.Stack(Jogador.Ativos)>0) == 1 && Jogador.Call(Rodada.JogAtual) == 0 ) || ...
        Jogador.Stack(Rodada.JogAtual) == 0
        
        Jogador.Acao{Rodada.JogAtual} = 'Check';
        Jogador.Aposta(Rodada.JogAtual) = 0;
        Jogador.Gasto(Rodada.JogAtual) = 0;
        Jogador.Call(Rodada.JogAtual) = 0;
        Jogador.Check(Rodada.JogAtual) = true;
        Jogador.Ativos(Rodada.JogAtual) = true;
    
    % Jogada normal de alguém ativo e que ainda tem dinheiro
    else
        
        % Determina as Variáveis do Jogador
        Variavel = controlarVariaveis(Jogo,Partida,Rodada,Jogador);
        
        % Chama a jogada e arredonda a aposta
        Jogador.ApostaTemp(Rodada.JogAtual) = round(Jogo.Funcao{Rodada.JogAtual}(Variavel));
        
        % Adequa as ações e apostas às regras do poker
        [Rodada,Jogador] = controlarAcao(Rodada,Jogador);
        
    end
    
end

% Atualiza os valores do Jogador.Stack e do Jogador.Pot
Jogador.Stack(Rodada.JogAtual) = Jogador.Stack(Rodada.JogAtual) - Jogador.Gasto(Rodada.JogAtual);
Jogador.Pot(Rodada.JogAtual) = Jogador.Pot(Rodada.JogAtual) + Jogador.Gasto(Rodada.JogAtual);