- composer create-project laravel/laravel nome-do-projeto "12.*"
- docker compose up -d --build
- docker compose down && docker compose up -d --build

## Adicionar novo projeto

1. Crie a pasta `projects/meu-projeto/` com o código Laravel/PHP
2. Adicione o serviço `app_meu_projeto` no `docker-compose.yml`
3. Monte o volume no nginx e crie `docker/nginx/meu-projeto.conf` com a porta desejada
4. Crie o banco: `./init-db.sh meu-projeto`
5. Suba os containers: `docker compose up -d --build`

## Acessar container de um projeto
```
docker exec -it laravel_app_projeto1 bash
docker exec -it laravel_app_projeto2 bash
```

## Rodar migrate por projeto
```
docker exec laravel_app_projeto1 php artisan migrate
docker exec laravel_app_projeto2 php artisan migrate
```

## Conexão Mysql
```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```

## Config mailhog
```
MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```
## Conexao Postgresql
```
DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```

## Testa envio de Email
```
docker exec -it laravel_app php artisan tinker
```

```
Mail::raw('Teste de email', fn($m) => $m->to('dest@test.com')->subject('Teste'));
```


## Acessar os Projetos

| Projeto | URL |
|---------|-----|
| projeto1 | http://localhost:8080 |
| projeto2 | http://localhost:8090 |

> Os projetos ficam em `projects/projeto1/` e `projects/projeto2/`.
> Para adicionar um novo projeto, consulte a seção abaixo.

## Portas disponíveis

| Serviço | URL |
|---------|-----|
| projeto1 | http://localhost:8080 |
| projeto2 | http://localhost:8090 |
| MailHog    | http://localhost:8025 |
| MySQL      | localhost:3306        |
| phpMyAdmin | http://localhost:8081 |
| PGAdmin    | http://localhost:8082 |

## Acesso phpMyAdmin

- http://localhost:8081

- Usuário: root
- Senha: root

## Redis


## PGAdmin

- Acesse http://localhost:8082 com:

- Email: admin@admin.com
- Senha: admin


## Confi redis
```
REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
```

- docker exec laravel_app composer require predis/predis

## Limpar imagens
```
docker system prune --all --force --volumes
```
```
docker system prune
```

## Config do .env
```
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:VJ6H9w0nEKyaqkQWEngNjqAc6Z5ocVLVew97JAYOh4c=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret

BROADCAST_DRIVER=log
CACHE_DRIVER=redis
FILESYSTEM_DISK=local
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_APP_NAME="${APP_NAME}"
VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
```
