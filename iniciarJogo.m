function [Jogo,Partida,Jogador] = iniciarJogo(Jogo,Partida,Jogador)

Indice = randperm(size(Jogo.Nomes,2));

Jogo.Nomes = Jogo.Nomes(Indice);

Jogo.Funcao = Jogo.Funcao(Indice);

Partida.Ativos = true(1,Jogo.NJogadores);

Partida.BigBlind = Jogo.BigBlind;

Partida.CartasJogo = cell(Jogo.NJogadores,5);

Partida.Final = zeros(1,Jogo.NJogadores);

Partida.Ganhador = zeros(1,Jogo.NJogadores);

Partida.Indice = [2:Jogo.NJogadores 1];

Partida.Mao = cell(2,Jogo.NJogadores);

Partida.Mesa = cell(1,5);

Partida.NDeals = 0;

Partida.NJogos = Partida.NJogos + 1;

Partida.NomeJogo = cell(Jogo.NJogadores,1);

Partida.Ordem = zeros(1,Jogo.NJogadores);

Jogador.Stack = Jogo.Stack * ones(1,Jogo.NJogadores);