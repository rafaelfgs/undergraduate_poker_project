function Aposta = AIRandom(Variavel)

Result = sum(randi([0 1],1,8));

if Result == 4
    Aposta = 0;
elseif Result == 3 || Result == 5
    Aposta = Variavel.Call;
elseif Result == 2 || Result == 6
    Aposta = Variavel.Call + Variavel.ApostaMinima;
elseif Result == 1 || Result == 7
    Aposta = min([ Variavel.Call+4*Variavel.ApostaMinima Variavel.Stack(Variavel.Jogador)/3 ...
                   max(Variavel.Stack([1:Variavel.Jogador-1 Variavel.Jogador+1:end])) ]);
else
    Aposta = Variavel.Stack(Variavel.Jogador);
end