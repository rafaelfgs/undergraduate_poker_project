function Partida = darCartas(Jogo,Partida)

Baralho = randperm(52);
Baralho = Baralho(randperm(52));

Texto = '23456789TJQKAecpo';
Mao = zeros(4,14);
Mesa = false(4,14);

for ii = 1:Jogo.NJogadores
    
    if Partida.Ativos(ii)
        
        Mao(ceil(Baralho(ii)/13),mod(Baralho(ii)-1,13)+2) = ii;
        Mao(ceil(Baralho(Jogo.NJogadores+ii)/13),mod(Baralho(Jogo.NJogadores+ii)-1,13)+2) = ii;
        Partida.Mao{1,ii} = [ Texto(mod(Baralho(ii)-1,13)+1) Texto(ceil(Baralho(ii)/13)+13) ];
        Partida.Mao{2,ii} = [ Texto(mod(Baralho(Jogo.NJogadores+ii)-1,13)+1) ...
                              Texto(ceil(Baralho(Jogo.NJogadores+ii)/13)+13) ];
        
    else
        
        Partida.Mao(:,ii) = {'No';'No'};
        
    end
    
end

for ii = 1:5
    Mesa(ceil(Baralho(end-5+ii)/13),mod(Baralho(end-5+ii)-1,13)+2) = true;
    Partida.Mesa{1,ii} = [ Texto(mod(Baralho(end-5+ii)-1,13)+1) Texto(ceil(Baralho(end-5+ii)/13)+13) ];
end

Resultado = zeros(Jogo.NJogadores,6);
Naipes = zeros(Jogo.NJogadores,5);

for ii = 1:Jogo.NJogadores
    
    if Partida.Ativos(ii)
        
        Atual = (Mao == ii) | Mesa;
        
        Atual(:,1) = Atual(:,14);
        for Indice = 14:-1:5
            if any(all(Atual(:,Indice:-1:Indice-4),2),1)
                Resultado(ii,:) = [ 9 Indice:-1:Indice-4 ];
                Naipes(ii,:) = repmat(find(all(Atual(:,Indice:-1:Indice-4),2),1),1,5);
                Partida.NomeJogo{ii} = 'Straight Flush';
                break
            end
        end
        Atual(:,1) = false(4,1);
        
        if all(Resultado(ii,:)==0)
            
            Indice = [ find(sum(Atual,1)==4,1,'last') ...
                       find(sum(Atual,1)~=4&sum(Atual,1)~=0,1,'last') ];
            if ~isempty(Indice) && numel(Indice)==2
                Resultado(ii,:) = [ 8 repmat(Indice(1),1,4) Indice(2) ];
                Naipes(ii,:) = [ find(Atual(:,Indice(1)),4)' find(Atual(:,Indice(2)),1) ];
                Partida.NomeJogo{ii} = 'Quadra';
                
            else
                
                Indice = [ flip(find(sum(Atual,1)==3,2,'last')) ...
                           find(sum(Atual,1)==2,1,'last') ];
                if ~isempty(Indice) && numel(Indice)==2
                    Resultado(ii,:) = [ 7 repmat(Indice(1),1,3) repmat(Indice(2),1,2) ];
                    Naipes(ii,:) = [ find(Atual(:,Indice(1)),3)' find(Atual(:,Indice(2)),2)' ];
                    Partida.NomeJogo{ii} = 'Full House';
                    
                else
                    
                    Indice = flip(find(Atual(sum(Atual,2)>=5,:),5,'last'));
                    if ~isempty(Indice) && numel(Indice)==5
                        Resultado(ii,:) = [ 6 Indice ];
                        Naipes(ii,:) = repmat(find(sum(Atual,2)>=5,1),1,5);
                        Partida.NomeJogo{ii} = 'Flush';
                        
                    else
                        
                        Atual(:,1) = Atual(:,14);
                        for Indice = 14:-1:5
                            if all(any(Atual(:,Indice:-1:Indice-4),1),2)
                                Resultado(ii,:) = [ 5 Indice:-1:Indice-4 ];
                                Partida.NomeJogo{ii} = 'Sequência';
                                Naipes(ii,:) = [ find(Atual(:,Indice),1) find(Atual(:,Indice-1),1) ...
                                                 find(Atual(:,Indice-2),1) find(Atual(:,Indice-3),1) ...
                                                 find(Atual(:,Indice-4),1) ];
                                break
                            end
                        end
                        Atual(:,1) = false(4,1);
                        
                        if all(Resultado(ii,:)==0)
                            
                            Indice = [ find(sum(Atual,1)==3,1,'last') ...
                                flip(find(sum(Atual,1)==1,2,'last')) ];
                            if ~isempty(Indice) && numel(Indice)==3
                                Resultado(ii,:) = [ 4 repmat(Indice(1),1,3) Indice(2:3) ];
                                Naipes(ii,:) = [ find(Atual(:,Indice(1)),3)' find(Atual(:,Indice(2)),1) ...
                                                 find(Atual(:,Indice(3)),1) ];
                                Partida.NomeJogo{ii} = 'Trinca';
                                
                            else
                                
                                Indice = [ flip(find(sum(Atual,1)==2,3,'last')) ...
                                    find(sum(Atual,1)==1,1,'last') ];
                                if size(Indice,2)==4
                                    Indice(3) = max(Indice(3:4)); Indice(4) = [];
                                end
                                if ~isempty(Indice) && numel(Indice)==3
                                    Resultado(ii,:) = [ 3 repmat(Indice(1),1,2) repmat(Indice(2),1,2) Indice(3) ];
                                    Naipes(ii,:) = [ find(Atual(:,Indice(1)),2)' find(Atual(:,Indice(2)),2)' ...
                                                     find(Atual(:,Indice(3)),1) ];
                                    Partida.NomeJogo{ii} = 'Dois Pares';
                                    
                                else
                                    
                                    Indice = [ find(sum(Atual,1)==2,1,'last') ...
                                        flip(find(sum(Atual,1)==1,3,'last')) ];
                                    if ~isempty(Indice) && numel(Indice)==4
                                        Resultado(ii,:) = [ 2 repmat(Indice(1),1,2) Indice(2:4) ];
                                        Naipes(ii,:) = [ find(Atual(:,Indice(1)),2)' find(Atual(:,Indice(2)),1) ...
                                                         find(Atual(:,Indice(3)),1) find(Atual(:,Indice(4)),1) ];
                                        Partida.NomeJogo{ii} = 'Par';
                                        
                                    else
                                        
                                        Indice = flip(find(sum(Atual,1)==1,5,'last'));
                                        Resultado(ii,:) = [ 1 Indice ];
                                        Naipes(ii,:) = [ find(Atual(:,Indice(1)),1) find(Atual(:,Indice(2)),1) ...
                                                         find(Atual(:,Indice(3)),1) find(Atual(:,Indice(4)),1) ...
                                                         find(Atual(:,Indice(5)),1) ];
                                        Partida.NomeJogo{ii} = 'Carta Alta';
                                        
                                    end
                                    
                                end
                                
                            end
                            
                        end
                        
                    end
                    
                end
                
            end
            
        end
        
        if mod(Resultado(ii,end)-1,14) == 0
            Resultado(ii,end) = 14;
        end
        
        for jj = 1:5
            Partida.CartasJogo{ii,jj} = [ Texto(Resultado(ii,jj+1)-1) Texto(Naipes(ii,jj)+13) ];
        end
        
    else
        
        Partida.CartasJogo(ii,:) = {'No' 'No' 'No' 'No' 'No'};
        Partida.NomeJogo{ii} = '';
        
    end
end

[~,Partida.Ordem] = sortrows(14-Resultado);
[~,Partida.Ordem] = sort(Partida.Ordem);
Partida.Ordem = Partida.Ordem';

for ii = 1:Jogo.NJogadores-1
    for jj = 1+ii:Jogo.NJogadores
        if all(13-mod(Resultado(ii,:)-1,13)==13-mod(Resultado(jj,:)-1,13)) && ~all(Resultado(ii,:)==0)
            Partida.Ordem(ii) = min([Partida.Ordem(ii) Partida.Ordem(jj)]);
            Partida.Ordem(jj) = min([Partida.Ordem(ii) Partida.Ordem(jj)]);
        end
    end
end