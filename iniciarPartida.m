function [Partida,Rodada,Jogador] = iniciarPartida(Jogo,Partida,Rodada,Jogador)

Partida.NDeals = Partida.NDeals + 1;

Dealer = mod(find(Partida.Indice==1)+find([Partida.Indice(find(Partida.Indice==1)+1:end)...
                                           Partida.Indice(1:find(Partida.Indice==1)-1)]>0,1)-1,10)+1;
Atual = 1;
for ii = [ Dealer:Jogo.NJogadores 1:min([Dealer-1 Jogo.NJogadores]) ]
    if Partida.Ativos(ii)
        Partida.Indice(ii) = Atual;
        Atual = Atual + 1;
    else
        Partida.Indice(ii) = 0;
    end
end

Jogador.Ativos = Partida.Ativos;
Jogador.Pot = zeros(1,Jogo.NJogadores);

Rodada.ApostaMinima = 0;
Rodada.JogAtual = find(Partida.Indice==max(Partida.Indice));
Rodada.NRodadas = 0;
Rodada.TipoJogada = 0;

if Jogo.AumentarBB && ~any(Partida.Ativos(1:find(Partida.Indice==1)-1)) && Partida.NDeals ~= 1
    Partida.BigBlind = 2*Partida.BigBlind;
end