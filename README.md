# Backend Engineer Code Challenge - Levee - Adriano

## Stack utilizada:

O challenge foi desenvolvido em Sinatra, sendo que os dois apps estao nos arquivos `main.rb` e `db.rb`.

Para rodar as duas apps ao mesmo tempo é necessário rodar o comando:

`rackup`

Que a partir do arquivo config.ru mapeia as aplicações usando `Rack::URLMap`.

A suite de testes ainda nao foi desenvolvida.

## Apps

1. `main.rb`
  - criar, ativar e listar as vagas;
  - listar a porcentagem e número de vagas ativas por categoria.

2. `db.rb`

## Endpoints

| Name       | Method    | URL                  | Protected |
| ---        | ---       | ---                  | :--:      |
| List       | GET       | /jobs                | ✓         |
| Create     | POST      | /jobs                | ✓         |
| Activate   | POST      | /jobs/{:id}/activate | ✓         |
| Percentage | GET       | /category/{:id}      | ✘         |
