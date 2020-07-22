function [Rodada,Jogador] = controlarAcao(Rodada,Jogador)

% Se a aposta for igual ou maior que o dinheiro do jogador
if Jogador.ApostaTemp(Rodada.JogAtual) >= Jogador.Stack(Rodada.JogAtual)
    
    % Se houver Call para o jogador
    if Jogador.Call(Rodada.JogAtual) > 0
        
        % Se o que ele quer fazer é compatível com o Raise, dá All-in
        if Jogador.Stack(Rodada.JogAtual) >= Jogador.Call(Rodada.JogAtual) + Rodada.ApostaMinima
            
            Rodada.ApostaMinima = Jogador.Stack(Rodada.JogAtual) - Jogador.Call(Rodada.JogAtual);
            Jogador.Call = Jogador.Call + Rodada.ApostaMinima;
            Jogador.Check = false(1,numel(Jogador.Ativos));
            
            Jogador.Acao{Rodada.JogAtual} = 'All-in';
            Jogador.Aposta(Rodada.JogAtual) = Rodada.ApostaMinima;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.Stack(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        % Se o que ele quer fazer é compatível com o Call, dá Call
        elseif Jogador.Stack(Rodada.JogAtual) >= Jogador.Call(Rodada.JogAtual)
            
            Jogador.Acao{Rodada.JogAtual} = 'Call';
            Jogador.Aposta(Rodada.JogAtual) = 0;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.Call(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        % Se o que ele quer fazer é menor que o Call, dá All-in
        else
            
            Jogador.Acao{Rodada.JogAtual} = 'All-in';
            Jogador.Aposta(Rodada.JogAtual) = 0;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.Stack(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        end
        
    % Se não houver Call para o jogador
    else
        
        % Se o que ele quer fazer é compatível com o Bet, dá All-in
        if Jogador.Stack(Rodada.JogAtual) >= Rodada.ApostaMinima
            
            Rodada.ApostaMinima = Jogador.Stack(Rodada.JogAtual);
            Jogador.Call = Jogador.Call + Rodada.ApostaMinima;
            Jogador.Check = false(1,numel(Jogador.Ativos));
            
            Jogador.Acao{Rodada.JogAtual} = 'All-in';
            Jogador.Aposta(Rodada.JogAtual) = Rodada.ApostaMinima;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.Stack(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        % Se o que ele quer fazer é menor que a Aposta Mínima, dá Check
        else
            
            Jogador.Acao{Rodada.JogAtual} = 'Check';
            Jogador.Aposta(Rodada.JogAtual) = 0;
            Jogador.Gasto(Rodada.JogAtual) = 0;
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        end
        
    end
    
% Se tiver dinheiro mais que suficiente para a aposta
else
    
    % Se o houver Jogador.Call para o jogador
    if Jogador.Call(Rodada.JogAtual) > 0
        
        % Se o que ele quer fazer é compatível com o Raise, dá Raise
        if Jogador.ApostaTemp(Rodada.JogAtual) >= Jogador.Call(Rodada.JogAtual) + Rodada.ApostaMinima
            
            Rodada.ApostaMinima = Jogador.ApostaTemp(Rodada.JogAtual) - Jogador.Call(Rodada.JogAtual);
            Jogador.Call = Jogador.Call + Rodada.ApostaMinima;
            Jogador.Check = false(1,numel(Jogador.Ativos));
            
            Jogador.Acao{Rodada.JogAtual} = 'Raise';
            Jogador.Aposta(Rodada.JogAtual) = Rodada.ApostaMinima;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.ApostaTemp(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = false;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        % Se o que ele quer fazer é compatível com o Call, dá Call
        elseif Jogador.ApostaTemp(Rodada.JogAtual) >= Jogador.Call(Rodada.JogAtual)
            
            Jogador.Acao{Rodada.JogAtual} = 'Call';
            Jogador.Aposta(Rodada.JogAtual) = 0;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.Call(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        % Se o que ele quer fazer é menor que o Call, dá Fold
        else
            
            Jogador.Acao{Rodada.JogAtual} = 'Fold';
            Jogador.Aposta(Rodada.JogAtual) = 0;
            Jogador.Gasto(Rodada.JogAtual) = 0;
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = false;
            
        end
        
    % Se não houver Call para o jogador
    else
        
        % Se o que ele quer fazer é compatível com o Bet, dá Bet
        if Jogador.ApostaTemp(Rodada.JogAtual) >= Rodada.ApostaMinima
            
            Rodada.ApostaMinima = Jogador.ApostaTemp(Rodada.JogAtual);
            Jogador.Call = Jogador.Call + Rodada.ApostaMinima;
            Jogador.Check = false(1,numel(Jogador.Ativos));
            
            Jogador.Acao{Rodada.JogAtual} = 'Bet';
            Jogador.Aposta(Rodada.JogAtual) = Rodada.ApostaMinima;
            Jogador.Gasto(Rodada.JogAtual) = Jogador.ApostaTemp(Rodada.JogAtual);
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = false;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        % Se o que ele quer fazer é menor que a Aposta Mínima, dá Check
        else
            
            Jogador.Acao{Rodada.JogAtual} = 'Check';
            Jogador.Aposta(Rodada.JogAtual) = 0;
            Jogador.Gasto(Rodada.JogAtual) = 0;
            Jogador.Call(Rodada.JogAtual) = 0;
            Jogador.Check(Rodada.JogAtual) = true;
            Jogador.Ativos(Rodada.JogAtual) = true;
            
        end
        
    end
    
end