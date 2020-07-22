function [Partida,Jogador] = finalizarPartida(Partida,Jogador)

Partida.Ganhador = double((Partida.Ordem.*(Jogador.Ativos))==min(Partida.Ordem((Partida.Ordem.*(Jogador.Ativos))>0)));

Partida.Ganhador(Partida.Ganhador==1) = floor(sum(Jogador.Pot)/sum(Partida.Ganhador));

Partida.Ganhador(find(Partida.Ganhador>0,1)) = Partida.Ganhador(find(Partida.Ganhador>0,1)) + ...
rem(sum(Jogador.Pot),sum((Partida.Ordem.*(Jogador.Ativos))==min(Partida.Ordem((Partida.Ordem.*(Jogador.Ativos))>0))));

Jogador.Stack = Jogador.Stack + Partida.Ganhador;

Partida.Final(Partida.Ativos & (Jogador.Stack==0)) = sum([(Jogador.Stack>0) 1]);

if sum(Jogador.Stack>0) == 1
    Partida.Final(Jogador.Stack>0) = 1;
end

Partida.Ativos(Jogador.Stack==0) = 0;