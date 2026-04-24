- composer create-project laravel/laravel src
- docker-compose up -d --build
- docker-compose exec app php artisan migrate


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

## Portas disponíveis

| Serviço | URL |
|---------|-----|
| Laravel | http://localhost:8080 |
| MailHog | http://localhost:8025 |
| MySQL   | localhost:3306 |