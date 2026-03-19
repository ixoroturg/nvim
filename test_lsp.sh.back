#!/bin/bash

# Скрипт для тестирования lua-language-server через stdio
# с использованием cat для обхода блокировок

# Создаем временные FIFO каналы
TEMP_DIR=$(mktemp -d)
SERVER_IN="$TEMP_DIR/server_in"
SERVER_OUT="$TEMP_DIR/server_out"

mkfifo "$SERVER_IN"
mkfifo "$SERVER_OUT"

# Запускаем сервер в фоне, читая из FIFO
lua-language-server --stdio < "$SERVER_IN" > "$SERVER_OUT" 2>&1 &
SERVER_PID=$!

# Открываем дескрипторы для FIFO
exec 3>"$SERVER_IN"  # для записи в сервер
exec 4<"$SERVER_OUT" # для чтения из сервера

# Функция для отправки JSON-RPC сообщения
send_message() {
    local message="$1"
    local length=$(printf "%s" "$message" | wc -c)
    printf "Content-Length: %d\r\n\r\n%s" "$length" "$message" >&3
    # Важно: сбрасываем буфер
    sleep 0.1
}

# Функция для чтения ответа (неблокирующая)
read_response() {
    local timeout=2
    local start_time=$(date +%s)
    local response=""
    
    while true; do
        # Проверяем таймаут
        local current_time=$(date +%s)
        if (( current_time - start_time > timeout )); then
            echo "Таймаут при чтении ответа" >&2
            return 1
        fi
        
        # Пытаемся прочитать строку с таймаутом
        if IFS= read -r -t 0.1 line <&4; then
            echo "Прочитано: $line" >&2
            if [[ "$line" =~ ^Content-Length:[[:space:]]*([0-9]+) ]]; then
                content_length="${BASH_REMATCH[1]}"
                # Читаем пустую строку
                IFS= read -r empty_line <&4
                # Читаем тело сообщения
                IFS= read -r -N "$content_length" response <&4
                echo "$response"
                return 0
            fi
        fi
    done
}

# Даем серверу время на запуск
echo "Ждем запуска сервера..." >&2
sleep 1

# 1. Инициализация
echo "1. Отправляем initialize запрос..." >&2
INIT_REQUEST='{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":"file:///home/ixoroturg/.config/nvim","capabilities":{}}}'
send_message "$INIT_REQUEST"

echo "Ждем ответ на initialize..." >&2
response=$(read_response 2>/dev/null || echo "Нет ответа")
if [[ "$response" != "Нет ответа" ]]; then
    echo "Ответ на initialize: $response" | jq '.' 2>/dev/null || echo "$response"
else
    echo "Не получили ответ на initialize"
fi

# 2. Ждем и читаем все, что сервер мог отправить (включая $/hello)
echo -e "\n2. Проверяем есть ли дополнительные сообщения от сервера..." >&2
for i in {1..3}; do
    if response=$(read_response 2>/dev/null); then
        echo "Дополнительное сообщение $i: $response" | jq '.' 2>/dev/null || echo "$response"
    fi
    sleep 0.1
done

# 3. Отправляем уведомление об открытии файла
echo -e "\n3. Отправляем textDocument/didOpen..." >&2
DID_OPEN_NOTIFICATION='{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"file:///home/ixoroturg/.config/nvim/test.lua","languageId":"lua","version":1,"text":"print(\"hello\")"}}}'
send_message "$DID_OPEN_NOTIFICATION"

echo "Уведомление отправлено, ждем 0.5 секунды..." >&2
sleep 0.5

# 4. Проверяем есть ли ответ на уведомление
echo "Проверяем ответы..." >&2
for i in {1..3}; do
    if response=$(read_response 2>/dev/null); then
        echo "Ответ $i после didOpen: $response" | jq '.' 2>/dev/null || echo "$response"
    fi
    sleep 0.1
done

# 5. Отправляем запрос на получение definition
echo -e "\n4. Отправляем textDocument/definition запрос..." >&2
DEFINITION_REQUEST='{"jsonrpc":"2.0","id":2,"method":"textDocument/definition","params":{"textDocument":{"uri":"file:///home/ixoroturg/.config/nvim/test.lua"},"position":{"line":0,"character":0}}}'
send_message "$DEFINITION_REQUEST"

echo "Ждем ответ на definition..." >&2
response=$(read_response 2>/dev/null || echo "Нет ответа")
if [[ "$response" != "Нет ответа" ]]; then
    echo "Ответ на definition: $response" | jq '.' 2>/dev/null || echo "$response"
else
    echo "Не получили ответ на definition"
fi

# 6. Завершаем работу
echo -e "\n5. Завершаем работу сервера..." >&2
SHUTDOWN_REQUEST='{"jsonrpc":"2.0","id":3,"method":"shutdown"}'
send_message "$SHUTDOWN_REQUEST"

sleep 0.2
response=$(read_response 2>/dev/null || echo "Нет ответа")
if [[ "$response" != "Нет ответа" ]]; then
    echo "Ответ на shutdown: $response" | jq '.' 2>/dev/null || echo "$response"
fi

EXIT_NOTIFICATION='{"jsonrpc":"2.0","method":"exit"}'
send_message "$EXIT_NOTIFICATION"

# Закрываем дескрипторы
exec 3>&-
exec 4<&-

# Даем время на завершение
sleep 0.5
kill $SERVER_PID 2>/dev/null
wait $SERVER_PID 2>/dev/null

# Удаляем временные файлы
rm -rf "$TEMP_DIR"

echo -e "\nТест завершен!" >&2
