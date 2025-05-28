# Métodos de Busca Direta (DFO)

Implementação no software Octave dos Métodos de Busca Direta (Direct Search Methods) encontrados na área de Otimização Livre de Derivadas (Derivative-Free Optimization/DFO). 

- coordsearch.m: Método Coordinate Search
- gps.m: Método Generalized Pattern Search
- mads.m: Método Mesh Adaptive Direct Seach
- halton_sequence.m: Algoritmo que gera a Sequência de Halton, retirado de https://people.sc.fsu.edu/~jburkardt/octave_src/halton/halton.html (John Burkardt, 2016)
- hsd.m: Algoritmo que gera as direções de busca utilizadas no método MADS
- funct.m: Conjunto de Funções Teste
- matriz_pp.m: Algoritmo que gera as matrizes utilizadas para construir os gráficos de performance-profile
- performance_profile.m: Algoritmo que compara o desempenho dos métodos via gráficos de performance-profile
