function Aposta = AIHuman(Variavel)

Valor = inputdlg(['Call: ' num2str(Variavel.Call) 10 ...
                  'Raise Mínimo: ' num2str(Variavel.Call + Variavel.ApostaMinima) 10 10 ...
                  'Quanto você deseja mover?'],'Aposta',1,{num2str(Variavel.Call)});

if ~isempty(Valor)
    Aposta = str2double(cell2mat(Valor));
else
    Aposta = 0;
end

if Variavel.SalvarBD
    salvarBanco(Aposta,Variavel)
end