%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Algoritmo que gera o conjunto de direções do método MADS na iteração k a partir da sequência de Halton %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Dk] = hsd(k,deltap,deltam,i1,i2,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENTRADAS:                                                %%
%% k: iteração                                              %%
%% deltap: tamanho do frame                                 %%
%% deltam: tamanho da malha                                 %%
%% i1: índice do primeiro elemento da sequência de Halton   %%
%% i2: índice do último elemento da sequência de Halton     %%
%% m: dimensão do problema                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  Bk = [];
  u = halton_sequence(i1,i2,m); % Sequência de Halton %
  Hk = eye(m) - (2/(u(:,k)'*u(:,k)))*(u(:,k)*u(:,k)'); % Matriz de Householder associada %

  %% Ajuste da Matriz de Householder %%
  for j = 1:length(Hk)
    Bk(:,j) = round((deltap/deltam)*(Hk(:,j)./norm(Hk(:,j))));
  endfor

  Dk = [Bk -Bk]; % Conjunto de direções para o método MADS %

endfunction
