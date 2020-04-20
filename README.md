# Test task (RoR developers)

1. a:b = 3:2; (1.5)

2.
    ```link
    https://docs.google.com/spreadsheets/d/1UHRcdwqISC13UvirC6jUrt1DrCVbLj_RVGfdT_s8IwY/edit#gid=0
    ```

3. Code
### Запуск проекта Code:

- Клонируйте проект

    ```bash
    $ git clone https://github.com/SofiBit/converter-csv-to-ascii.git
    ```
- В директории convertor-csv-to-ascii запустите скрипт:

    ```bash
    $ ruby script.rb
    ```
### Ответы на вопросы:
4. SHELL
   ```bash
    sort access.log | uniq -c | sort -nr | sed 's/^ *//' | cut -d" " -f4 | grep -m2 ''
    ```
5. DB 
   Мой ответ: 5,8

   Я думаю надо создать индексы на поля, которые участвуют в BETWEEN, по скольку
   это затратная операция по сравнению с другими из приведенного запроса.
   Так же хотелось бы облегчить INNER JOIN. Поэтому я выбрала в Table1 ID1 и ID2,
   а в Table2 ID3.

   Правильно было бы протестировать это с помощью EXPLAIN.
