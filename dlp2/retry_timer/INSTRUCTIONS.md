### Parte 1 - Adicionar centésimo de segundo
A partir do projeto `timer_new_qsf.qar` unificar as modificações estudadas nas aulas:

- Modificar para a arquitetura single_clock.
- Adicionar o SDC.
- Adicionar o contador de centésimo de segundo.
    - Atenção ao tamanho do registrador no timer e da nova saída de centésimo de segundos para a contagem até 99. O contador de centésimo deve receber o enable do `r_reg` e gerar o enable do contador de segundo, ou seja, o contador mod-50000000 precisa ser modificado para gerar um sinal a cada centésimo de segundo e não a cada segundo.
- Precisa instanciar um BIN2BCD e dois BCD2SSD.
- Modificar a entidade do topo para usar os displays da seguinte forma:
    - HEX2 (unidade) e HEX3 (dezena) do centésimo de segundo;
    - HEX4 (unidade) e HEX5 (dezena) do segundo;
    - HEX6 (unidade) e HEX7 (dezena) do minuto.
- Modificar o `run_tb.do` gerando o `run_tb_centesimo.do` para testar as situações de borda e comprovar o funcionamento da modificação.
- Compilar e anotar informações na coluna Binário/50M da tabela abaixo.
- Mostrar em sala a simulação e funcionamento.

### Parte 2 - Adicionar PLL

- Adicionar PLL de 50Mhz para as seguintes frequências:
    - 2,5 KHz: Deivid e Jessica
    - 5 KHz: Arthur e Gabriel
    - 10 KHz: Matheus e Rhenzo
    - 20 Khz: Faber e Gustavo
- Modificar o contador `r_reg` para a frequência acima. **Percebam que agora o `r_reg` gera o sinal para o contador de centésimo de segundo e não para o segundo**.
- Modificar o run_tb.do gerando o `run_tb_FreqKHz.do` para testar as situações de borda e comprovar o funcionamento da modificação.
- Rodar simulação e capturar tela das formas de onda.
- Anotar informações na coluna Binário/FreqKHz (verificar tabela abaixo).
- Mostrar em sala a simulação e funcionamento.

### Parte 3 - Modificar contadores para BCD

- Modificar os contadores de centésimo de segundo (adicionado por vocês), minuto e segundo para BCD.
- Atualizar o TOPO retirando os componentes bin2bcd.
- Modificar o `run_tb_FreqKHz.do` gerando o `run_tb_FreqKHz_bcd.do` para testar as situações de borda e comprovar o funcionamento da modificação.
- Compilar e anotar informações em BCD/FreqKHz (verificar tabela abaixo).
- Mostrar em sala a simulação e funcionamento.

### Parte 4 - Modificar o r_reg para LFSR

- Modificar o contador binário (`r_reg`) para um contador LFSR:
- Utilize a tabela de TAPs apresentada conforme a necessidade de bits.
- Modifique o `run_lfsr_tb.do` e utilize o processo para encontrar o valor do ciclo desejado conforme apresentado na aula.
- Anotar informações na coluna BCD/FreqKHz LFSR (verificar tabela abaixo).
- Mostrar em sala a simulação e funcionamento.

