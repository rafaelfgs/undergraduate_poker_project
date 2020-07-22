function Jogo = atualizarInicio(Inicio)

Decidindo = true;

Funcao = {@AIHuman,@AISmart,@AICall,@AICheck,@AIRaise,@AIRandom};

Nomes = {'Miguel','Sophia','Davi','Alice','Arthur','Julia','Pedro','Isabella','Gabriel','Manuela'};

while Decidindo
    
    try
        
        if str2double(Inicio.Campo(1).String) < 1
            Inicio.Campo(1).String = '1';
        end
        Jogo.NJogos = str2double(Inicio.Campo(1).String);
        
        if str2double(Inicio.Campo(2).String) < 2
            Inicio.Campo(2).String = '2';
        elseif str2double(Inicio.Campo(2).String) > 10
            Inicio.Campo(2).String = '10';
        end
        Jogo.NJogadores = str2double(Inicio.Campo(2).String);
        
        Jogo.Humano = logical(Inicio.TipoAI(1).Value);
        
        Jogo.NAIs = Jogo.NJogadores - Jogo.Humano;
        
        Jogo.Funcao = Funcao([ ones(Inicio.TipoAI(1).Value) ...
            mod(find(repmat(cell2mat({Inicio.TipoAI(2:6).Value}),1,Jogo.NAIs),Jogo.NAIs)-1,5)+2 ]);
        
        if str2double(Inicio.Campo(4).String) < str2double(Inicio.Campo(5).String)
            Inicio.Campo(4).String = Inicio.Campo(5).String;
        end
        
        Jogo.Stack = str2double(Inicio.Campo(4).String);
        
        if str2double(Inicio.Campo(5).String) < 10
            Inicio.Campo(5).String = '10';
        end
        Jogo.BigBlind = str2double(Inicio.Campo(5).String);
        
        Jogo.AumentarBB = logical(-2.5*Inicio.Campo(6).SelectedObject.Position(1)+1.5);
        
        Jogo.SalvarBD = logical(-2.5*Inicio.Campo(7).SelectedObject.Position(1)+1.5);
        
        if Inicio.Botao(1).Value == 1
            Decidindo = false;
            close(Inicio.Fig)
        end
        
    catch
        
        Decidindo = false;
        
    end
    
    drawnow
    pause(0.1)
    
end

if Jogo.Humano
    NomeHumano = inputdlg('Digite seu nome','',1,{'Rafael'});
    if ~isempty(NomeHumano)
        if any(strcmp(Nomes,NomeHumano))
            if find(strcmp(Nomes,NomeHumano)) <= Jogo.NJogadores
                Jogo.Nomes = Nomes(1:Jogo.NJogadores);
                Jogo.Nomes(strcmp(Nomes,NomeHumano)) = Jogo.Nomes(1);
                Jogo.Nomes(1) = NomeHumano;
            else
                Jogo.Nomes = [NomeHumano Nomes(1:Jogo.NJogadores-1)];
            end
        else
            Jogo.Nomes = [NomeHumano Nomes(1:Jogo.NJogadores-1)];
        end
    else
        Jogo.Nomes = Nomes(1:Jogo.NJogadores);
    end
else
    Jogo.Nomes = Nomes(1:Jogo.NJogadores);
end

Jogo.MaxJogadores = size(Nomes,2);

Jogo.DataHora = datestr(now,'yymmdd_HHMMSS');