import random

def formata_cpf(cpf):
    cpf_formatado = "{}.{}.{}-{}".format(cpf[:3], cpf[3:6], cpf[6:9], cpf[9:])
    return cpf_formatado

def formata_cnpj(cnpj):
    cnpj_formatado = "{}.{}.{}/{}-{}".format(cnpj[:2], cnpj[2:5], cnpj[5:8], cnpj[8:12], cnpj[12:])
    return cnpj_formatado

def gera_cpf():
    def calcula_digito(digs):
        s = 0
        qtd = len(digs)
        for i in range(qtd):
            s += n[i] * (1+qtd-i)
        res = 11 - s % 11
        if res >= 10:
            return 0
        return res

    n = [random.randint(0, 9) for _ in range(9)]
    n.append(calcula_digito(n))
    n.append(calcula_digito(n))
    return ''.join(map(str, n))

def gera_cnpj():
    def calcula_digito(digs):
        if len(digs) == 12:
            base = list(range(2, 10)) + list(range(2, 6))
        else:
            base = list(range(2, 10)) + list(range(2, 6)) + [5, 6]
        soma = sum([a*b for a, b in zip(digs, base)])
        dig = 11 - (soma % 11)
        return dig if dig < 10 else 0

    n = [random.randint(0, 9) for _ in range(8)]
    n += [0, 0, 0, 1]
    n.append(calcula_digito(n))
    n.append(calcula_digito(n))
    return ''.join(map(str, n))

def gera_cpf_format():
    def calcula_digito(digs):
        s = 0
        qtd = len(digs)
        for i in range(qtd):
            s += n[i] * (1+qtd-i)
        res = 11 - s % 11
        if res >= 10:
            return 0
        return res

    n = [random.randint(0, 9) for _ in range(9)]
    n.append(calcula_digito(n))
    n.append(calcula_digito(n))
    cpf = ''.join(map(str, n))
    return formata_cpf(cpf)

def gera_cnpj_format():
    def calcula_digito(digs):
        if len(digs) == 12:
            base = list(range(2, 10)) + list(range(2, 6))
        else:
            base = list(range(2, 10)) + list(range(2, 6)) + [5, 6]
        soma = sum([a*b for a, b in zip(digs, base)])
        dig = 11 - (soma % 11)
        return dig if dig < 10 else 0

    n = [random.randint(0, 9) for _ in range(8)]
    n += [0, 0, 0, 1]
    n.append(calcula_digito(n))
    n.append(calcula_digito(n))
    cnpj = ''.join(map(str, n))
    return formata_cnpj(cnpj)
