%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Comparação entre os métodos via gráficos de Performance-Profile %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;
alphamax = 5;
alpha = [1:0.1:alphamax];
crit = 10^(-1); % Precisão %

[Tp,fquali,nfval] = matriz_pp % Matriz com o número de iterações de cada problema %
Tps = Tp(:,2:end);
rpsk = [];
rpsv = [];
Tpmin = [];

% Comparação via Iterações: %
for p = 1:20
  Tpmin(p,1) = min(Tps(p,:));
  for s = 1:3

    if (fquali(p,s) < (1 - crit) || fquali(p,s) > 1.5)
      rpsk(p,s) = inf;
    else
      rpsk(p,s) = Tps(p,s)/Tpmin(p,1); % Índice de Desempenho %
    endif

  endfor
endfor

rpsk % Desempenho com Iterações %

% Função de Desempenho (número de iterações) de cada Algoritmo %
ro_s1 = @(alpha) (1/20)*sum(rpsk(:,1) <= alpha);
ro_1 = ro_s1(alpha);

ro_s2 = @(alpha) (1/20)*sum(rpsk(:,2) <= alpha);
ro_2 = ro_s2(alpha);

ro_s3 = @(alpha) (1/20)*sum(rpsk(:,3) <= alpha);
ro_3 = ro_s3(alpha);


% Comparação via Avaliações de Função: %
for p = 1:20
  nfvalmin(p,1) = min(nfval(p,:));
  for s = 1:3

    if (fquali(p,s) < (1 - crit) || fquali(p,s) > 1.5)
      rpsv(p,s) = inf;
    else
      rpsv(p,s) = nfval(p,s)/nfvalmin(p,1); % Índice de Desempenho %
    endif

  endfor
endfor

rpsv % Desempenho com Avaliações de Função %

% Função de Desempenho (número de avaliações de função) de cada Algoritmo %
rov_s1 = @(alpha) (1/20)*sum(rpsv(:,1) <= alpha);
rov_1 = rov_s1(alpha);

rov_s2 = @(alpha) (1/20)*sum(rpsv(:,2) <= alpha);
rov_2 = rov_s2(alpha);

rov_s3 = @(alpha) (1/20)*sum(rpsv(:,3) <= alpha);
rov_3 = rov_s3(alpha);

%%% Gráfico de performance-profile %%%
stairs(alpha,ro_1,'r','linewidth',1.2)
hold on
stairs(alpha,ro_2,'k','linewidth',1.2)
hold on
stairs(alpha,ro_3,'b','linewidth',1.2)
legend('Método CS','Método GPS','Método MADS','location','southeast',"fontsize", 13);
grid on;
xlabel('Valor de Alpha',"fontsize", 14); ylabel('Função de Desempenho',"fontsize", 14);
title('Performance-profile com \gamma = 10^{-1}',"fontsize", 16) % Gráfico do Número de Iterações %
figure
stairs(alpha,rov_1,'r','linewidth',1.2)
hold on
stairs(alpha,rov_2,'k','linewidth',1.2)
hold on
stairs(alpha,rov_3,'b','linewidth',1.2)
legend('Método CS','Método GPS','Método MADS','location','southeast',"fontsize", 13);
grid on;
xlabel('Valor de Alpha',"fontsize", 14); ylabel('Função de Desempenho',"fontsize", 14);
title('Performance-profile com \gamma = 10^{-1}',"fontsize", 16) % Gráfico do Número de Avaliações de Função %
