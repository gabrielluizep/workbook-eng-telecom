# Analisando um somador 16bits unsigned

|     | Metodologia            | Área (LE) | Delay (ns) |
| --- | ---------------------- | --------- | ---------- |
| a   | in_a + in_b            | 16        | 1,932      |
| b   | a + "0000000000000001" | 15        |            |
| c   | a + "0000000010000000" | 8         |            |
| d   | a + "1000000000000000" | 0         |            |
| e   | a + "1010101010101010" | 14        |            |


## Análise de área

Analisando a área de cada item, vemos que `b` possui um elemento a menos porque a soma com o binário `0000000000000001` indica que no somador utilizado o último somador não é necessário e pode ser trocado pelo `c_in` do somador seguinte.

## Análise de delay

Usando o `Timing Analyser` com projeto compilado apenas pelo `Analysis & Synthesis`:

```bash
report_path -from {*input|o*} -to {*output|i*} -npaths 20 -panel_name {Report Path}
```


