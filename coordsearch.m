%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Algoritmo do Método Coordinate Search para DFO %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numitercs,nfvalscs,vfcs] = coordsearch(f,xk,delta,tol,kmax)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENTRADAS:                                                %
% f: função objetivo, xk: ponto inicial                    %
% delta: tamanho do passo inicial, tol: critério de parada %
% kmax: número máximo de iterações                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  k = 0; % Iteração zero %
  xfminsearch = fminsearch(f,xk); % Solução do Problema usando o comando fminsearch para medir acurácia %
  n = length(xk); % Dimensão do problema %
  fotim = f(xfminsearch); % Valor da função na Melhor Solução para medir acurácia do método %

  f0 = f(xk); % Avaliação para conferir a qualidade da solução %
  fa = f(xk); % Valor utilizado para medir decrescimento da função (muda a cada iteração) %
  fvalcs = 1;
  d = eye(n);
  Dk = [d -d]; % Conjunto de Direções Coordenadas %

  %%% Etapa de ESCOLHA: %%%
  while k < kmax

    k = k + 1;
    i = 1;
    decrescimento = 0; % Critério de Decrescimento %

    for cont = 1:2*n % Contador do número de direções %

      t = xk;
      t = t + delta*Dk(:,i);
      fn = f(t); % Avaliação da função nos novos pontos %
      fvalcs = fvalcs + 1;

      if fn < fa % Quando houve decrescimento no valor da função %

        xk = t; % Solução Incumbente %
        fa = fn; % Atualização do valor da função %
        decrescimento = 1;
        break

      endif
      i = i + 1;
    endfor

    if (~decrescimento) % Quando não houve decrescimento no valor da função %

      delta = delta/2; % Redução no tamanho do passo %
      if delta < tol % Critério de Parada %
        break
      endif

    endif

  endwhile

  %%% Saídas %%%
  xcs = xk; % Solução do Problema gerada pelo Método CS %
  vfcs = f(xcs); % Valor da Função %
  nfvalscs = fvalcs;
  numitercs = k; % Número de Iterações usadas para obter a solução %
  fqualics = (vfcs - f0)./(fotim - f0); % Qualidade da solução obtida %

endfunction
