# Cálculo Numérico - Trabalho 2

Uma pequena ponte está sendo analisada para que uma carga muito pesada passe por ela. Existem alguns pontos amostrais, calculados pelo sistema linear S1, em que a pressão pode ser descoberta pelo sistema linear S2. O ponto mais frágil da ponte se encontra na média dos pontos amostrais.

## Equipe

- Antônio Victor Figueiredo Porto (líder)
- Iago Braga
- Jefferson Alves Costa
- Lucas da Silva Soares
- Renan Da Silveira Teles

## Como usar:

Rodar o arquivo trabalho.m, passando os parametros nescessários:

    -f1 = Arquivo com matriz1;
	-f2 = Arquivo com vetor1;
	-f3 = Arquivo com matriz2;
	-f4 = Arquivo com vetor2;
	-e  = erro permitido;

**Exemplo:**

    octave trabalho.m -f1 in/matriz1 -f2 in/vetor1 -f3 in/matriz2 -f4 in/vetor2 -e '10^-3'
