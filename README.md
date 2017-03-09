# Emprego Ligado teste para BackEnd Developer

Você está participando da rodada de contratação da Emprego Ligado, esse teste nos permite avaliar seu código e habilidades para propor arquiteturas e solucionar problemas.

**Sem tempo para realizar testes técnicos?**

Bem, você pode enviar o link de uma Pull Request com uma contribuição sua para qualquer projeto OpenSource ou algum projeto próprio que você acredita que demonstre o seu nível técnico e a qualidade do seu código. Projetos próprios sem cobertura de testes, sem documentação ou sem integração contínua não serão considerados

Mas caso você prefira/deseje fazer o nosso teste técnico, você pode utilizar qualquer lib/gem ou framework, mas quanto mais código seu for utilizado (leia-se não gerado automaticamente por frameworks), melhor você poderá ser avaliado.

## Pré requisitos

O seu teste deve ter um README com os passos necessários para:
- Rodar o projeto;
- Instalar as dependências (de preferência utilizando `docker-compose`);
- Rodar os testes automatizados;

### Tecnologia

- Aceitaremos soluções escritas em Ruby, Go ou ambas;

## Instruções

Crie um fork deste repositório (ou, caso prefira, clone ele para um outro repo privado seu), trabalhe nele e nos dê acesso para podermos avaliar a solução. Nosso prazo inicial é de 2 semanas, caso tenha algum problema e dificuldade podemos extender o prazo sem problemas. Se você achar que tem o suficiente para avaliarmos seu trabalho antes mesmo de finalizar, nos avise que avaliamos todas as submissões.

## Requisitos

Você precisará criar duas aplicações:

1. A primeira aplicação irá expor uma API seguindo os padrões REST para:
  - criar, ativar e listar os Jobs;
  - listar a porcentagem e número de Jobs ativos por categoria;

2. A segunda aplicação deverá ser responsável por ler o arquivo "jobs.txt", extrair a informação referente aos jobs, e sincronizar os dados com a aplicação 1.
Fica a seu critério escolher a maneira que as aplicações irão se comunicar.

3. Certifique-se de que a aplicação seja `idempotente`, para isso você pode considerar que o atributo partnerID de cada Job é sempre único durante a importação;

4. Todo Job recém importado deve ser salvo no estado 'draft';

5. A aplicação responsável por coletar os dados do arquivo deve atender as seguintes regras:
  - importar somente jobs onde a data em que irá expirar for maior do que a data da importação;
  - importar somente 80% do total de jobs listados no arquivo.

### Endpoints

Os endpoints disponíveis na aplicação estão listados abaixo. Os classificados como `Protected` devem exigir autenticação, porém o método utilizado fica a seu critério.

#### Jobs

| Name       | Method    | URL                  | Protected |
| ---        | ---       | ---                  | :--:      |
| List       | GET       | /jobs                | ✓         |
| Create     | POST      | /jobs                | ✓         |
| Activate   | POST      | /jobs/{:id}/activate | ✓         |
| Percentage | GET       | /category/{:id}      | ✘         |
    
## Critério de avaliação:
- Sua API deve conter os 4 endpoints listados acima
- Sua API deve retornar **JSON** válidos em qualquer endpoint;
- Seu projeto deve ter uma suíte de testes automatizados, quanto maior a cobertura melhor;
- Não é necessário UI;
- Qualidade da abstração da solução;
- Estrutura do código e qualidade dos testes unitários;
- Projeto rodando dentro de um container.

*Bonus points:*
- Ter configurado no projeto qualquer serviço de integração contínua;
- Conseguir levantar toda a solução com um simples `docker-compose up`;
- Utilizar message queue;
- Suas respostas durante o Code Review;
- Seguir o guia de estilo padrão de mercado para a linguagem que você escolher usar;
- Um histórico do git (mesmo que breve) com mensagens claras e concisas.
