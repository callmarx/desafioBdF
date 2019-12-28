# Teste de Programação - Brasil de Fato
Resolução do teste de desenvolvimento requisitado em entrevista pela
[Brasil de Fato](https://www.brasildefato.com.br/). Enunciado disponível no
[pdf](Teste_de_Programação_Brasil_de_Fato.pdf).

## Interpretação do enunciado
Trata-se de movimentações sobre o eixo cartesiano (x, y). As direções **N**, **E**, **S** e
**W** da Rosa dos Ventos, correspondem as incrementações de ponto-a-ponto sobre o plano, ou seja,
dado o ponto inicial (x,y), o ponto resultante de:
  - Mover-se para N (Norte) = (x, y+1)
  - Mover-se para E (Leste) = (x+1, y)
  - Mover-se para S (Sul) = (x, y-1)
  - Mover-se para W (Oeste) = (x-1, y)


Como o ponto (0, 0) foi definido como *"no canto inferior esquerdo"*, subentende-se que não haverá
valores negativos para ```x``` e ```y```. Da mesma forma, como na primeira linha da entrada teremos
*"a coordenada do ponto superior-direito"*, subentende-se que esse será o limite da malha de
movimentação. Sendo assim, foi trabalhado com o seguinte limite do plano cartesiano:
```
0 <= x <= x_max
0 <= y <= y_max
```
Onde ```x_max``` e ```y_max``` são os valores obtidos da primeira linha da entrada.

**OBS:** Se uma movimentação gerar um ponto para além do limite da malha, será mantido o ponto
anterior, do qual poderá ser impresso na saída caso não haja movimentações válidas seguintes.

## Linguagem, ambiente e instruções de execução
O teste foi desenvolvido em Ruby 2.6.5 e ambiente Linux. As entradas e saídas estão em arquivo
texto.

Para executar basta ter o Ruby instalado e dentro da pasta do projeto utilizar:
```
ruby src/main.rb tmp/input_example2.txt
```
  A saída será salva no formato ```./tmp/<timestamp>_output.txt```

A resolução do problema em si esta mais concentrada no arquivo [mars_probe.rb](./src/mars_probe.rb).
Mesmo tratando-se de um problema procedural, foi optado por uso de classe apenas para demonstrar um
pouco do conhecimento em Orientação a Objetos ao avaliador.
