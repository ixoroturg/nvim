#!/bin/bash

# Путь к сокету (адаптируйте если нужно)
# SOCKET_PATH="/run/user/$(id -u)/lsp/lua.sock"
SOCKET_PATH="/run/lsp/lua.sock"
# Проверяем, существует ли сокет
if [[ ! -S "$SOCKET_PATH" ]]; then
    echo "Сокет не найден: $SOCKET_PATH"
    echo "Проверьте, запущен ли сервис: systemctl --user status lua.socket"
    exit 1
fi

# Проверяем наличие socat
if ! command -v socat &> /dev/null; then
    echo "socat не установлен"
    exit 1
fi

# Файл для анализа
FILE_PATH="/home/ixoroturg/.config/nvim/test.lua"
URI="file://$FILE_PATH"

# Позиция (строка 0, символ 6 - внутри слова "print")
LINE=0
CHARACTER=3

# Создаем LSP запрос для definition
REQUEST=$(cat <<EOF
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "textDocument/definition",
  "params": {
    "textDocument": {
      "uri": "$URI"
    },
    "position": {
      "line": $LINE,
      "character": $CHARACTER
    }
  }
}
EOF
)

# Вычисляем длину содержимого
CONTENT_LENGTH=$(echo -n "$REQUEST" | wc -c)

# Формируем полное сообщение с заголовками
FULL_MESSAGE="Content-Length: $CONTENT_LENGTH\r\n\r\n$REQUEST"

# Отправляем запрос через socat и получаем ответ
echo -e "$FULL_MESSAGE" | socat -t10 UNIX-CONNECT:"$SOCKET_PATH" -

# Альтернативный вариант с ожиданием ответа:
# echo -e "$FULL_MESSAGE" | socat UNIX-CONNECT:"$SOCKET_PATH" stdio
