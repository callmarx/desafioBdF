# Teste de Programação - Brasil de Fato
Resolução do teste de desenvolvimento requisitado em entrevista pela
[Brasil de Fato](https://www.brasildefato.com.br/). Enunciado disponível no
[pdf](Teste_de_Programação_Brasil_de_Fato.pdf).

## Interpretação do enunciado
Trata-se de movimentações sobre o eixo cartesiano (x, y). As direções **N**, **E**, **S** e
**W** da Rosa dos Ventos, correspondem as incrementações de ponto-a-ponto sobre o plano, ou seja,
dado o ponto inicial (x,y), o ponto resultante de:
  - Mover-se para N (Norte) = (x, y+1)
  - Mover-se para E (Oeste) = (x+1, y)
  - Mover-se para S (Sul) = (x, y-1)
  - Mover-se para W (leste) = (x-1, y)


Como o ponto (0, 0) foi definido como *"no canto inferior esquerdo"*, subentende-se que não haverá
valores negativos para ```x``` e ```y```. Da mesma forma, como na primeira linha da entrada teremos
*"a coordenada do ponto superior-direito"*, subentende-se que esse será o limite da malha de
movimentação. Sendo assim, foi trabalhado com o seguinte limite do plano cartesiano:
```
0 <= x <= x_max
0 <= y <= y_max
```
Onde ```x_max``` e ```y_max``` são os valores obtidos da primeira linha da entrada.

**OBS:** Se uma movimentação gerar um ponto para além do limite da malha, será devolvido a última
posição válida mais o caracter ```@```, na mesma linha à saída do programa.
