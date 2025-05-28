%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Algoritmo do Método Mesh Adaptive Direct Search para DFO %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numitermads,nfvalsmads,vfmads] = mads(f,xk,deltap,tau,tol,kmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENTRADAS:                                                                                             %
% f: função objetivo, xk: ponto inicial                                                                 %
% deltap: tamanho inicial do frame, tau: ajuste (valor em (0;1)), tol: critério de parada               %                                             
% kmax: número máximo de iterações                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  k = 0; % Iteração zero %
  m = length(xk); % Dimensão do Problema %
  i1 = 1; % Índice do primeiro elemento da sequência de Halton %
  i2 = kmax; % Índice do último elemento da sequência de Halton %

  xfminsearch = fminsearch(f,xk); % Solução do Problema usando o comando fminsearch para medir acurácia %
  fotim = f(xfminsearch); % Valor da função na Melhor Solução para medir acurácia do método %

  f0 = f(xk); % Avaliação para conferir a qualidade da solução %
  fa = f(xk); % Valor utilizado para medir decrescimento da função (muda a cada iteração) %
  fvalmads = 1;

  %%% Etapa de ESCOLHA: %%%
  while k < kmax

    k = k + 1;
    i = 1;
    decrescimento = 0; % Critério de Decrescimento %
    deltam = min(deltap,deltap^2); % Atualização do Tamanho da malha %

    [Dk] = hsd(k,deltap,deltam,i1,i2,m); % Conjunto de direções gerado a partir da matriz de Householder %

    for cont = 1:length(Dk) % Contador do número de direções %

      t = xk;
      t = t + deltam*Dk(:,i); % Gerando os novos pontos a serem avaliados %
      fn = f(t); % Avaliação da função nos novos pontos %
      fvalmads = fvalmads + 1;

      if fn < fa % Quando houve decrescimento no valor da função %

        xk = t; % Solução Incumbente %
        fa = fn; % Atualização do valor da função %
        deltap = deltap/tau; % Aumento do tamanho do frame %
        decrescimento = 1;
        break

      endif
      i = i + 1;
    endfor

    if (~decrescimento) % Quando não houve decrescimento no valor da função %

      deltap = deltap*tau; % Redução no tamanho do frame %
      if deltap < tol % Critério de Parada %
        break
      endif

    endif

  endwhile

  %%% Saídas: %%%
  xmads = xk; % Solução do Problema gerada pelo Método MADS %
  vfmads = f(xmads); % Valor da Função %
  nfvalsmads = fvalmads;
  numitermads = k; % Número de Iterações usadas para obter a solução %
  fqualimads = (vfmads - f0)./(fotim - f0); % Qualidade da solução obtida %

endfunction
