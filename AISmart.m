function Aposta = AISmart(Variavel)

Texto = '23456789TJQKAecpo';
Nflop = 7464;

Mao = false(4,14);
Mesa = false(4,14);

Mao(find(Texto==Variavel.Mao{1}(2))-13,find(Texto==Variavel.Mao{1}(1))+1) = true;
Mao(find(Texto==Variavel.Mao{2}(2))-13,find(Texto==Variavel.Mao{2}(1))+1) = true;

if any(strcmp(Variavel.Mesa(1:3),''))
    
    Indice = find(sum(Mao,1)==2,1,'last');
    if ~isempty(Indice)
        Resultado = [ 2 Indice Indice 0 0 0 ]; %#ok<NASGU>
    else
        
        Indice = flip(find(sum(Mao,1)==1,2,'last'));
        if ~isempty(Indice)
            Resultado = [ 1 Indice 0 0 0 ]; %#ok<NASGU>
        end
    end
    
    Jogos = [ 0.851 0.669 0.662 0.654 0.647 0.629 0.621 0.611 0.601 0.599 0.590 0.581 0.573; ...
              0.654 0.824 0.633 0.624 0.617 0.599 0.583 0.575 0.568 0.557 0.549 0.540 0.532; ...
              0.644 0.615 0.798 0.602 0.594 0.577 0.561 0.544 0.537 0.528 0.518 0.511 0.502; ...
              0.636 0.605 0.581 0.775 0.575 0.558 0.540 0.522 0.506 0.499 0.490 0.482 0.475; ...
              0.628 0.597 0.572 0.553 0.748 0.539 0.524 0.505 0.490 0.473 0.465 0.457 0.448; ...
              0.607 0.577 0.554 0.532 0.516 0.720 0.507 0.491 0.474 0.457 0.438 0.432 0.425; ...
              0.599 0.560 0.536 0.515 0.497 0.482 0.691 0.478 0.463 0.446 0.427 0.409 0.402; ...
              0.589 0.552 0.517 0.496 0.479 0.463 0.450 0.662 0.453 0.437 0.419 0.401 0.382; ...
              0.577 0.542 0.511 0.478 0.461 0.446 0.433 0.424 0.631 0.432 0.414 0.396 0.378; ...
              0.578 0.533 0.502 0.472 0.442 0.426 0.414 0.405 0.401 0.603 0.415 0.397 0.378; ...
              0.567 0.524 0.492 0.462 0.435 0.407 0.394 0.386 0.381 0.381 0.569 0.387 0.369; ...
              0.558 0.514 0.484 0.453 0.426 0.400 0.374 0.366 0.361 0.362 0.351 0.536 0.361; ...
              0.550 0.506 0.473 0.444 0.417 0.391 0.368 0.346 0.341 0.343 0.333 0.323 0.503 ];
    
    if any(sum(Mao,2)==2)
        Probabilidade = Jogos(15-find(sum(Mao,1)>0,1),15-find(sum(Mao,1)>0,1,'last'))^2;
    else
        Probabilidade = Jogos(15-find(sum(Mao,1)>0,1,'last'),15-find(sum(Mao,1)>0,1))^2;
    end
    
else
    
    if any(strcmp(Variavel.Mesa(4),''))
        for ii = 1:3
            Mesa(find(Texto==Variavel.Mesa{ii}(2))-13,find(Texto==Variavel.Mesa{ii}(1))+1) = true;
        end
    elseif any(strcmp(Variavel.Mesa(5),''))
        for ii = 1:4
            Mesa(find(Texto==Variavel.Mesa{ii}(2))-13,find(Texto==Variavel.Mesa{ii}(1))+1) = true;
        end
    else
        for ii = 1:5
            Mesa(find(Texto==Variavel.Mesa{ii}(2))-13,find(Texto==Variavel.Mesa{ii}(1))+1) = true;
        end
    end
    
    Atual = Mao | Mesa;
    Resultado = zeros(1,6);
    
    Atual(:,1) = Atual(:,14);
    for Indice = 14:-1:5
        if any(all(Atual(:,Indice:-1:Indice-4),2),1)
            Resultado = [ 9 Indice:-1:Indice-4 ];
            break
        end
    end
    Atual(:,1) = false(4,1);
    
    if all(Resultado==0)
        
        Indice = [ find(sum(Atual,1)==4,1,'last') ...
                   find(sum(Atual,1)~=4&sum(Atual,1)~=0,1,'last') ];
        if ~isempty(Indice) && numel(Indice)==2
            Resultado = [ 8 repmat(Indice(1),1,4) Indice(2) ];
            
        else
            
            Indice = [ flip(find(sum(Atual,1)==3,2,'last')) ...
                       find(sum(Atual,1)==2,1,'last') ];
            if ~isempty(Indice) && numel(Indice)==2
                Resultado = [ 7 repmat(Indice(1),1,3) repmat(Indice(2),1,2) ];
                
            else
                
                Indice = flip(find(Atual(sum(Atual,2)>=5,:),5,'last'));
                if ~isempty(Indice) && numel(Indice)==5
                    Resultado = [ 6 Indice ];
                    
                else
                    
                    Atual(:,1) = Atual(:,14);
                    for Indice = 14:-1:5
                        if all(any(Atual(:,Indice:-1:Indice-4),1),2)
                            Resultado = [ 5 Indice:-1:Indice-4 ];
                            break
                        end
                    end
                    Atual(:,1) = false(4,1);
                    
                    if all(Resultado==0)
                        
                        Indice = [ find(sum(Atual,1)==3,1,'last') ...
                                   flip(find(sum(Atual,1)==1,2,'last')) ];
                        if ~isempty(Indice) && numel(Indice)==3
                            Resultado = [ 4 repmat(Indice(1),1,3) Indice(2:3) ];
                            
                        else
                            
                            Indice = [ flip(find(sum(Atual,1)==2,3,'last')) ...
                                       find(sum(Atual,1)==1,1,'last') ];
                            if size(Indice,2)==4
                                Indice(3) = max(Indice(3:4)); Indice(4) = [];
                            end
                            if ~isempty(Indice) && numel(Indice)==3
                                Resultado = [ 3 repmat(Indice(1),1,2) repmat(Indice(2),1,2) Indice(3) ];
                                
                            else
                                
                                Indice = [ find(sum(Atual,1)==2,1,'last') ...
                                           flip(find(sum(Atual,1)==1,3,'last')) ];
                                if ~isempty(Indice) && numel(Indice)==4
                                    Resultado = [ 2 repmat(Indice(1),1,2) Indice(2:4) ];
                                    
                                else
                                    
                                    Indice = flip(find(sum(Atual,1)==1,5,'last'));
                                    Resultado = [ 1 Indice ];
                                    
                                end
                                
                            end
                            
                        end
                        
                    end
                    
                end
                
            end
            
        end
        
    end
    
    Jogos = zeros(Nflop,6);
    ii = 1;
    for i1 = 14:-1:5
        Jogos(ii,:) = [9 i1 i1-1 i1-2 i1-3 i1-4];
        ii = ii + 1;
    end
    for i1 = 14:-1:2
        for i2 = 14:-1:2
            if i2 ~= i1
                Jogos(ii,:) = [8 i1 i1 i1 i1 i2];
                ii = ii + 1;
            end
        end
    end
    for i1 = 14:-1:2
        for i2 = 14:-1:2
            if i2 ~= i1
                Jogos(ii,:) = [7 i1 i1 i1 i2 i2];
                ii = ii + 1;
            end
        end
    end
    for i1 = 14:-1:2
        for i2 = i1-1:-1:2
            for i3 = i2-1:-1:2
                for i4 = i3-1:-1:2
                    for i5 = i4-1:-1:2
                        if ~all([i1-i2,i2-i3,i3-i4,i4-i5]==1)
                            Jogos(ii,:) = [6 i1 i2 i3 i4 i5];
                            ii = ii + 1;
                        end
                    end
                end
            end
        end
    end
    for i1 = 14:-1:5
        Jogos(ii,:) = [5 i1 i1-1 i1-2 i1-3 i1-4];
        ii = ii + 1;
    end
    for i1 = 14:-1:2
        for i2 = 14:-1:2
            for i3 = i2-1:-1:2
                if i1 ~= i2 && i1 ~= i3
                    Jogos(ii,:) = [4 i1 i1 i1 i2 i3];
                    ii = ii + 1;
                end
            end
        end
    end
    for i1 = 14:-1:2
        for i2 = i1-1:-1:2
            for i3 = 14:-1:2
                if i3 ~= i1 && i3 ~= i2
                    Jogos(ii,:) = [3 i1 i1 i2 i2 i3];
                    ii = ii + 1;
                end
            end
        end
    end
    for i1 = 14:-1:2
        for i2 = 14:-1:2
            for i3 = i2-1:-1:2
                for i4 = i3-1:-1:2
                    if i1 ~= i2 && i1 ~= i3 && i1 ~= i4
                        Jogos(ii,:) = [2 i1 i1 i2 i3 i4];
                        ii = ii + 1;
                    end
                end
            end
        end
    end
    for i1 = 14:-1:2
        for i2 = i1-1:-1:2
            for i3 = i2-1:-1:2
                for i4 = i3-1:-1:2
                    for i5 = i4-1:-1:2
                        if ~all([i1-i2,i2-i3,i3-i4,i4-i5]==1)
                            Jogos(ii,:) = [1 i1 i2 i3 i4 i5];
                            ii = ii + 1;
                        end
                    end
                end
            end
        end
    end
    
    [~,Posicao] = ismember(Resultado,Jogos,'rows');
    
    Atual = Mesa;
    Melhores = 0;
    Piores = 0;
    Iguais = 0;
    
    for ii = 1:55
        
        for jj = ii+1:56
            
            if ~Mesa(ceil(ii/14),mod(ii-1,14)+1) && ~Mesa(ceil(jj/14),mod(jj-1,14)+1) && ...
                ~Mao(ceil(ii/14),mod(ii-1,14)+1) &&  ~Mao(ceil(jj/14),mod(jj-1,14)+1) && ...
                mod(ii,14) ~= 1 && mod(jj,14) ~= 1
                
                Atual(ceil(ii/14),mod(ii-1,14)+1) = true;
                Atual(ceil(jj/14),mod(jj-1,14)+1) = true;
                Resultado = zeros(1,6);
                
                Atual(:,1) = Atual(:,14);
                for Indice = 14:-1:5
                    if any(all(Atual(:,Indice:-1:Indice-4),2),1)
                        Resultado = [ 9 Indice:-1:Indice-4];
                        break
                    end
                end
                Atual(:,1) = false(4,1);
                
                if all(Resultado==0)
                    
                    Indice = [ find(sum(Atual,1)==4,1,'last') ...
                        find(sum(Atual,1)~=4&sum(Atual,1)~=0,1,'last') ];
                    if ~isempty(Indice) && numel(Indice)==2
                        Resultado = [ 8 repmat(Indice(1),1,4) Indice(2) ];
                        
                    else
                        
                        Indice = [ flip(find(sum(Atual,1)==3,2,'last')) ...
                            find(sum(Atual,1)==2,1,'last') ];
                        if ~isempty(Indice) && numel(Indice)==2
                            Resultado = [ 7 repmat(Indice(1),1,3) repmat(Indice(2),1,2) ];
                            
                        else
                            
                            Indice = flip(find(Atual(sum(Atual,2)>=5,:),5,'last'));
                            if ~isempty(Indice) && numel(Indice)==5
                                Resultado = [ 6 Indice ];
                                
                            else
                                
                                Atual(:,1) = Atual(:,14);
                                for Indice = 14:-1:5
                                    if all(any(Atual(:,Indice:-1:Indice-4),1),2)
                                        Resultado = [ 5 Indice:-1:Indice-4 ];
                                        break
                                    end
                                end
                                Atual(:,1) = false(4,1);
                                
                                if all(Resultado==0)
                                    
                                    Indice = [ find(sum(Atual,1)==3,1,'last') ...
                                        flip(find(sum(Atual,1)==1,2,'last')) ];
                                    if ~isempty(Indice) && numel(Indice)==3
                                        Resultado = [ 4 repmat(Indice(1),1,3) Indice(2:3) ];
                                        
                                    else
                                        
                                        Indice = [ flip(find(sum(Atual,1)==2,3,'last')) ...
                                            find(sum(Atual,1)==1,1,'last') ];
                                        if size(Indice,2)==4
                                            Indice(3) = max(Indice(3:4)); Indice(4) = [];
                                        end
                                        if ~isempty(Indice) && numel(Indice)==3
                                            Resultado = [ 3 repmat(Indice(1),1,2) repmat(Indice(2),1,2) Indice(3) ];
                                            
                                        else
                                            
                                            Indice = [ find(sum(Atual,1)==2,1,'last') ...
                                                flip(find(sum(Atual,1)==1,3,'last')) ];
                                            if ~isempty(Indice) && numel(Indice)==4
                                                Resultado = [ 2 repmat(Indice(1),1,2) Indice(2:4) ];
                                                
                                            else
                                                
                                                Indice = flip(find(sum(Atual,1)==1,5,'last'));
                                                Resultado = [ 1 Indice ];
                                                
                                            end
                                            
                                        end
                                        
                                    end
                                    
                                end
                                
                            end
                            
                        end
                        
                    end
                    
                end
                
                if all(Resultado == Jogos(Posicao,:))
                    Iguais = Iguais + 1;
                else
                    if issorted( [ Jogos(Posicao,:) ; Resultado] , 'rows' )
                        Melhores = Melhores + 1;
                    else
                        Piores = Piores + 1;
                    end
                end
                
                Atual(ceil(ii/14),mod(ii-1,14)+1) = false;
                Atual(ceil(jj/14),mod(jj-1,14)+1) = false;
                
            end
            
        end
        
    end
    
    Probabilidade = ( Iguais/2 + Piores ) / ( Melhores + Iguais/2 + Piores );
    
end

Stack = Variavel.Stack(Variavel.Jogador) / sum(Variavel.Stack);

Viradas = (5-sum(strcmp(Variavel.Mesa,{'','','','',''})))/5;

NPartida = sum(Variavel.Ativos) / Variavel.MaxJog;

BigBlind = min([Variavel.BigBlind / sum(Variavel.Stack) 1]);

% Posicao = ( (Variavel.Indice-3) + numel(Variavel.Ativos)*(Variavel.Indice<=3) + ...
%            (-4*Variavel.Indice+3)*(numel(Variavel.Ativos)<=2) ) / numel(Variavel.Ativos);
% 
% NRaise = ( sum(strcmp(Variavel.Acao,'All-in')) + sum(strcmp(Variavel.Acao,'Raise')) + ...
%            sum(strcmp(Variavel.Acao,'Bet')) ) / numel(Variavel.Ativos);
% 
% NFold = ( sum(strcmp(Variavel.Acao,'Fold')) + sum(strcmp(Variavel.Acao,'Check')) ) / numel(Variavel.Ativos);
% 
% Pot = Variavel.Pot(Variavel.Jogador) / sum(Variavel.Stack);
% 
% StackMin = min(Variavel.Stack([1:Variavel.Jogador Variavel.Jogador:end])) / sum(Variavel.Stack);
% 
% PotTotal = sum(Variavel.Pot) / sum(Variavel.Stack);
% 
% Dealer = Variavel.Dealer / numel(Variavel.Ativos);
% 
% NJogo = numel(Variavel.Ativos) / Variavel.MaxJog;

load('bd\net1')

Entrada = ([Probabilidade; Stack; Viradas; NPartida; BigBlind]);
%            NRaise; NFold; Posicao; Pot; ...
%            StackMin; PotTotal; Dealer; NJogo]);

Saida = min([max([net1(Entrada) 0]) 1]);

Aposta = Saida * Variavel.Stack(Variavel.Jogador);