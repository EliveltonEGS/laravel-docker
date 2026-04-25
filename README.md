- composer create-project laravel/laravel nome-do-projeto "10.*"
- docker-compose up -d --build
- docker-compose exec app php artisan migrate
- docker-compose down && docker-compose up -d --build
- docker exec laravel_app php artisan migrate

```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```
## Testa envio de Email
```
docker exec -it laravel_app php artisan tinker
```

```
Mail::raw('Teste de email', fn($m) => $m->to('dest@test.com')->subject('Teste'));
```


## Portas disponíveis

| Serviço | URL |
|---------|-----|
| Laravel | http://localhost:8080 |
| MailHog | http://localhost:8025 |
| MySQL   | localhost:3306 |