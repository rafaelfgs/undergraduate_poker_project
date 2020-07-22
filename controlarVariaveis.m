function Variavel = controlarVariaveis(Jogo,Partida,Rodada,Jogador)

Variavel.Acao = Jogador.Acao;

Variavel.ApostaMinima = Rodada.ApostaMinima;

Variavel.Ativos = Jogador.Ativos;

Variavel.BigBlind = Partida.BigBlind;

Variavel.Call = Jogador.Call(Rodada.JogAtual);

Variavel.Dealer = find(Partida.Indice==1);

Variavel.Hora = Jogo.DataHora;

Variavel.Indice = Partida.Indice(Rodada.JogAtual);

Variavel.Jogador = Rodada.JogAtual;

Variavel.MaxJog = Jogo.MaxJogadores;

Variavel.Mao = Partida.Mao(:,Rodada.JogAtual)';

Variavel.Pot = Jogador.Pot;

Variavel.SalvarBD = Jogo.SalvarBD;

Variavel.Stack = Jogador.Stack;

if Rodada.NRodadas == 4
    Variavel.Mesa = Partida.Mesa;
elseif Rodada.NRodadas == 3
    Variavel.Mesa = {Partida.Mesa{1:4},''};
elseif Rodada.NRodadas == 2
    Variavel.Mesa = {Partida.Mesa{1:3},'',''};
else
    Variavel.Mesa = {'','','','',''};
end