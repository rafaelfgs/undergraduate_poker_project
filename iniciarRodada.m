function [Rodada,Jogador] = iniciarRodada(Jogo,Partida,Rodada,Jogador)

Rodada.NRodadas = Rodada.NRodadas + 1;

Rodada.ApostaMinima = Partida.BigBlind;

Jogador.Acao = cell(1,Jogo.NJogadores);

Jogador.Aposta = zeros(1,Jogo.NJogadores);

Jogador.ApostaTemp = zeros(1,Jogo.NJogadores);

Jogador.Call = zeros(1,Jogo.NJogadores);

Jogador.Check = true(1,Jogo.NJogadores);
Jogador.Check(Partida.Ativos) = false;

Jogador.Gasto = zeros(1,Jogo.NJogadores);