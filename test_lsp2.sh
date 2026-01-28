#!/bin/bash

# 1. Формируем JSON-запрос (в данном случае это initialize)
REQUEST=$(cat test.json)
# REQUEST=$(cat <<EOF
# {
#     "jsonrpc": "2.0",
#     "id": 1,
#     "method": "initialize",
#     "params": {
#         "processId": null,
#         "rootUri": null,
#         "capabilities": {}
#     }
# }
# EOF
# )

# 2. Вычисляем длину JSON в байтах
LENGTH=$(echo -n "$REQUEST" | wc -c)

# 3. Формируем финальное сообщение в формате LSP:
#    Content-Length: <N>\r\n\r\n<JSON>
echo -ne "Content-Length: $LENGTH\r\n\r\n$REQUEST"

# 4. Отправляем серверу и читаем ответ 5 секунд
echo -ne "Content-Length: $LENGTH\r\n\r\n$REQUEST" | timeout 5 lua-language-server --stdio
