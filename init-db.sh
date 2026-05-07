#!/bin/bash
# Cria um banco MySQL para cada projeto
# Uso: ./init-db.sh projeto1 projeto2 meu-projeto

MYSQL_ROOT_PASSWORD=${DB_ROOT_PASSWORD:-root}
MYSQL_USER=${DB_USERNAME:-laravel}
MYSQL_PASSWORD=${DB_PASSWORD:-secret}

for PROJECT in "$@"; do
  echo "Criando banco: $PROJECT"
  docker exec laravel_mysql mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "
    CREATE DATABASE IF NOT EXISTS \`$PROJECT\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    GRANT ALL PRIVILEGES ON \`$PROJECT\`.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
  "
done

echo "Bancos criados com sucesso!"
