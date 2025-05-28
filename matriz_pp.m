%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Criando a Matriz utilizada no gráfico Performance-Profile %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Tp,fquali,nfval] = matriz_pp

  Tp = []; iter = []; fquali = []; nfval = [];
  tol = 10^(-6); kmax = 200; delta = 2; deltap = 2; tau = 0.5; % Parâmetros dos Métodos %

  % Resolvendo os 20 problemas %
  for p = 1:20
    [xk,xotim,f] = funct(p); % Funções de Teste %
    f0 = f(xk); % Valor da Função no ponto inicial %
    fotim = f(xotim); % Valor Ótimo %

    [numitercs,nfvalscs,vfcs] = coordsearch(f,xk,delta,tol,kmax); % Método CS %
    [numitergps,nfvalsgps,vfgps] = gps(f,xk,delta,tau,tol,kmax); % Método GPS %
    [numitermads,nfvalsmads,vfmads] = mads(f,xk,deltap,tau,tol,kmax); % Método MADS %

    % Acurácia da solução obtida %
    fqualics = (vfcs - f0)./(fotim - f0);
    fqualigps = (vfgps - f0)./(fotim - f0);
    fqualimads = (vfmads - f0)./(fotim - f0);

    iter(p,:) = [numitercs numitergps numitermads]; % Matriz do Número de Iterações %
    fquali(p,:) = [fqualics fqualigps fqualimads]; % Matriz da Acurácia da Solução %
    nfval(p,:) = [nfvalscs nfvalsgps nfvalsmads]; % Matriz do Número de Avaliações de Função %
  endfor

  prob = [1:20]';
  Tp = [prob iter];
