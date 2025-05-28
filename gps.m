%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Algoritmo do Método Generalized Pattern Search para DFO %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numitergps,nfvalsgps,vfgps] = gps(f,xk,delta,tau,tol,kmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENTRADAS:                                                                                             %%
%% f: função objetivo, xk: ponto inicial                                                                 %%
%% delta: tamanho do passo inicial, tau: ajuste (valor em (0;1)), tol: critério de parada                %%
%% G: matriz não singular, Z: matriz inteira com colunas que formam um CGP                               %%
%% kmax: número máximo de iterações                                                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  k = 0; % Iteração zero %
  xfminsearch = fminsearch(f,xk); %% Solução do Problema usando o comando fminsearch para medir acurácia %%
  fotim = f(xfminsearch); % Valor da função na Melhor Solução para medir acurácia do método %
  f0 = f(xk); % Avaliação para conferir a qualidade da solução %
  fa = f(xk); % Valor utilizado para medir decrescimento da função (muda a cada iteração) %
  fvalgps = 1;

  d = [1 1 0 -1;0 1 1 1];
  Dk = [d -d]; % Direções teste %

  %%% Etapa de ESCOLHA: %%%
  while k < kmax

    k = k + 1;
    i = 1;
    decrescimento = 0; % Critério de Decrescimento %

    for cont = 1:length(Dk) % Contador do número de direções %

      t = xk;
      t = t + delta*Dk(:,i); % Gerando os novos pontos a serem avaliados %
      fn = f(t); % Avaliação da função nos novos pontos %
      fvalgps = fvalgps + 1;

      if fn < fa % Quando houve decrescimento no valor da função %

        xk = t; % Solução Incumbente %
        fa = fn; % Atualização do valor da função %
        delta = delta/tau; % Aumento do passo %
        decrescimento = 1;
        break

      endif
      i = i + 1;
    endfor

    if (~decrescimento) % Quando não houve decrescimento no valor da função %

      delta = delta*tau; % Redução no tamanho do passo %
      if delta < tol % Critério de Parada %
        break
      endif

    endif

endwhile

  %% Saídas: %%
  xgps = xk; %% Solução do Problema gerada pelo Método GPS %%
  vfgps = f(xgps); %% Valor da Função %%
  nfvalsgps = fvalgps;
  numitergps = k; %% Número de Iterações usadas para obter a solução %%
  fqualigps = (vfgps - f0)./(fotim - f0); %% Qualidade da solução obtida %%

endfunction
