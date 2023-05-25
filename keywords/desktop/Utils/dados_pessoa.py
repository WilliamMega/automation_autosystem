import random

def get_nome():
    nomes = [
        'João', 'Maria', 'Pedro', 'Ana', 'Lucas', 'Julia', 'Mariana', 'Gustavo',
        'Camila', 'Rafael', 'Fernanda', 'Diego', 'Isabela', 'Luiz', 'Carolina', 
        'Thiago', 'Letícia', 'Guilherme', 'Larissa', 'Ricardo', 'Gabriela', 'Arthur',
        'Beatriz', 'Matheus', 'Laura', 'Marcelo', 'Vanessa', 'Alexandre', 'Talita',
        'André', 'Natália', 'Carlos', 'Amanda', 'José', 'Júlia', 'Rafaela', 'Leandro',
        'Sara', 'Bruno', 'Fernando', 'Luana', 'Vitor', 'Clara', 'Vinicius', 'William',
        'Leonardo', 'Mariana', 'Paulo', 'Bianca', 'Eduardo', 'Renata', 'Andréa', 'Thais'
    ]
    nome_aleatorio = random.choice(nomes)
    return nome_aleatorio

def get_sobrenome():
    sobrenomes = [
        'Silva', 'Santos', 'Oliveira', 'Souza', 'Rodrigues', 'Ferreira', 'Alves',
        'Pereira', 'Ribeiro', 'Carvalho', 'Gomes', 'Martins', 'Lima', 'Costa',
        'Sousa', 'Freitas', 'Barbosa', 'Melo', 'Nascimento', 'Araújo', 'Cavalcanti',
        'Correia', 'Monteiro', 'Pinto', 'Cardoso', 'Dias', 'Castro', 'Fernandes',
        'Cunha', 'Mendes', 'Dantas', 'Siqueira', 'Moreira', 'Teixeira', 'Nunes',
        'Vieira', 'Carneiro', 'Machado', 'Rocha', 'Lopes', 'Sales', 'Gonçalves',
        'Azevedo', 'Pinheiro', 'Campos', 'Garcia', 'Cruz', 'Viana', 'Freire',
        'Ramos', 'Leal', 'Fogaça', 'Fonseca', 'Andrade', 'Soares'
    ]
    sobrenome_aleatorio = random.choice(sobrenomes)
    return sobrenome_aleatorio