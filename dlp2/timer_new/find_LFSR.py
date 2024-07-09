# -*- coding: utf-8 -*-

def lfsr(seed, taps, count):
    # Converte o seed de string binária para uma lista de inteiros
    state = [int(bit) for bit in seed]
    
    # Função para calcular o próximo bit usando os taps
    def next_bit(state, taps):
        xor = 0
        for t in taps:
            xor ^= state[t]
        return xor
    
    for i in range(count):
        new_bit = next_bit(state, taps)  # Calcula o próximo bit
        state = [new_bit] + state[:-1]  # Desloca os bits para a direita e insere o novo bit na frente
        state_str = ''.join(map(str, state))
        print("{:4d}: {}".format(i, state_str))

# Parâmetros
seed = '111111'
taps = [0, 5]
count = 50

# Gera a sequência LFSR e imprime todos os estados
lfsr(seed, taps, count)