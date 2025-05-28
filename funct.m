%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Funções de Teste para os Algoritmos CS,GPS,MADS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [xk,xotim,f] = funct(p)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENTRADAS:              %
% p: número do problema  %
%%%%%%%%%%%%%%%%%%%%%%%%%%

  m = 2; % Dimensão dos Problemas %

  % Funções %
  if (p == 1) % Problema 1 %
    xk = [4.1;4.1];
    xotim = [pi;pi];
    f = @(x) -cos(x(1))*cos(x(2))*exp(-(x(1) - pi)^2 - (x(2) - pi)^2); % Função Easom %
  endif

  if (p == 2) % Problema 2 %
    xk = [20;20];
    xotim = [0;0];
    f = @(x) -20*exp(-0.2*sqrt((1/m)*((x(1))^2 + (x(2))^2))) - exp((1/m)*(cos(2*pi*x(1)) + cos(2*pi*x(2)))) + 20 + exp(1); % Função Ackley %
  endif

  if (p == 3) % Problema 3 %
    xk = [-15;-5];
    xotim = [-10;1];
    f = @(x) 100*sqrt(abs(x(2) - 0.01*(x(1))^2)) + 0.01*(abs(x(1) + 10)); % Função Bukin n.6 %
  endif

  if (p == 4) % Problema 4 %
    xk = [-3.1;3.1];
    xotim = [-0.0898;0.7126];
    f = @(x) (4 - 2.1*(x(1))^2 + (x(1))^4/3)*(x(1))^2 + x(1)*x(2) + (-4 + 4*(x(2))^2)*(x(2))^2; % Função Six-Hump Camel %
  endif

  if (p == 5) % Problema 5 %
    xk = [-10;10];
    xotim = [1;1];
    f = @(x) (sin(3*pi*x(1)))^2 + (x(1) - 1)^2*(1 + (sin(3*pi*x(2)))^2) + (x(2) - 1)^2*(1 + (sin(2*pi*x(2)))^2); % Função Levy n.13 %
  endif

  if (p == 6) % Problema 6 %
    xk = [-5.1;5.1];
    xotim = [0;0];
    f = @(x) 10*m + (x(1))^2 - 10*cos(2*pi*x(1)) + (x(2))^2 - 10*cos(2*pi*x(2)); % Função Rastrigin %
  endif

  if (p == 7) % Problema 7 %
    xk = [-1;3];
    xotim = [0;0];
    f = @(x) 0.5 + ((sin((x(1))^2 - (x(2))^2))^2 - 0.5)/((1 + 0.001*((x(1))^2 + (x(2))^2))^2); % Função Schaffer n.2 %
    %return
  endif

  if (p == 8) % Problema 8 %
    xk = [450.1;500.1];
    xotim = [420.9687;420.9687];
    f = @(x) 418.9829*m - (x(1)*sin(sqrt(abs(x(1)))) + x(2)*sin(sqrt(abs(x(2))))); % Função Schwefel %
  endif

  if (p == 9) % Problema 9 %
    xk = [-3;1];
    xotim = [0;0];
    f = @(x) -(1 + cos(12*sqrt((x(1))^2 + (x(2))^2)))/(0.5*((x(1))^2 + (x(2))^2) + 2); % Função Drop-Wave %
  endif

  if (p == 10) % Problema 10 %
    xk = [-2.1;2.1];
    xotim = [0;-1];
    f = @(x) (1 + (x(1) + x(2) + 1)^2*(19 - 14*x(1) + 3*(x(1))^2 - 14*x(2) + 6*x(1)*x(2) + 3*(x(2))^2))*(30 + (2*x(1) - 3*x(2))^2*(18 - 32*x(1) + 12*(x(1))^2 + 48*x(2) - 36*x(1)*x(2) + 27*(x(2))^2)); % Função Goldstein-Price %
  endif

  if (p == 11) % Problema 11 %
    xk = [3.1;pi];
    xotim = [2.20;1.57];
    f = @(x) -(sin(x(1))*(sin(((x(1))^2)/pi))^20 + sin(x(2))*(sin((2*(x(2))^2)/pi))^20); % Função Michalewicz %
  endif

  if (p == 12) % Problema 12 %
    xk = [-pi;-pi];
    xotim = [-2.903534;-2.903534];
    f = @(x) 1/2*((x(1))^4 - 16*(x(1))^2 + 5*x(1) + (x(2))^4 - 16*(x(2))^2 + 5*x(2)); % Função Styblinski-Tang %
  endif

  if (p == 13) % Problema 13 %
    xk = [-4.5;4.5];
    xotim = [3;0.5];
    f = @(x) (1.5 - x(1) + x(1)*x(2))^2 + (2.25 - x(1) + x(1)*(x(2))^2)^2 + (2.625 - x(1) + x(1)*(x(2))^3)^2; % Função Beale %
    %return
  endif

  if (p == 14) % Problema 14 %
    xk = [-10;10];
    xotim = [1;1];
    f = @(x) (sin(pi*(1 + (x(1)-1)/4)))^2 + ((x(1)-1)/4)^2*(1 + 10*(sin(pi*(1 + (x(1)-1)/4)) + 1)^2) + ((x(2)-1)/4)^2*(1 + (sin(2*pi*(1 + (x(2)-1)/4)))^2); % Função Levy %
  endif

  if (p == 15) % Problema 15 %
    xk = [-3.1;4.1];
    xotim = [1;1];
    f = @(x) 100*(x(2) - (x(1))^2)^2 + (x(1) - 1)^2; % Função Rosenbrock%
  endif

  if (p == 16) % Problema 16 %
    xk = [-3.1;3.1];
    xotim = [1;2^(-0.5)];
    f = @(x) (x(1) - 1)^2 + 2*(2*(x(2))^2 - x(1))^2; % Função Dixon-Price %
  endif

  if (p == 17) % Problema 17 %
    xk = [-1;-1];
    xotim = [-0.54719;-1.54719];
    f = @(x) sin(x(1) + x(2)) + (x(1) - x(2))^2 - 1.5*x(1) + 2.5*x(2) + 1; % Função McCormick %
  endif

  if (p == 18) % Problema 18 %
    xk = [-10;10];
    xotim = [1;3];
    f = @(x) (x(1) + 2*x(2) - 7)^2 + (2*x(1) + x(2) - 5)^2; % Função Booth %
  endif

  if (p == 19) % Problema 19 %
    xk = [-100.1;100.1];
    xotim = [0;0];
    f = @(x) (x(1))^2 + 2*(x(2))^2 - 0.3*cos(3*pi*x(1) + 4*pi*x(2)) + 0.3; % Função Bohachevsky n.3 %
  endif

  if (p == 20) % Problema 20 %
    xk = [-3.1;2.1];
    xotim = [0;0];
    f = @(x) 2*(x(1))^2 - 1.05*(x(1))^4 + ((x(1))^6)/6 + x(1)*x(2) + (x(2))^2; % Função Three-Hump Camel %
  endif

endfunction

