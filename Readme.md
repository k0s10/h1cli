# Что это такое и для чего оно?
Как видно из описания репозитория, это docker образ с http сервисом для дешифровки лицензий 1С.
В интернете наверно уже есть 100500 реализаций подобных вещей, но мне просто хотелось сделать данный вариант. Just for fun и для решения некоторых рабочих задач, когда есть довольно много клиентов на поддержке и нужно вытаскивать информацию по лицензиям.

# Как работает?
1. Читаем описание в build/1c/ и делаем что там написано;
2. Проверяем docker-compose файл и если нужно, то редактируем под свои нужды. Например проброс в traefik\caddy этого http сервиса или изменение порта, который используется. Используемую сеть docker образа нужно создать, для этого можно выполнить `docker network create --driver=bridge --attachable --internal=false web-proxy` либо поменять в docker-compose файле сеть `web-proxy` на свою ;
3. Собственно запускаем с помощью `docker-compose up -d --build `
4. Заходим на http://localhost:54500 либо в общем виде http://{IP_адрес_сервера_где_запущен_докер}:54500
5. Выбираем файлы лицензий. Здесь 2 ограничения:
* Тип загружаемого файла lic, сервис проверит это при загрузке;
* Размер одного файла не должен превышать 20 Кб (переменная MAX_UPLOAD_SIZE в main.go файле);
6. Нажимаем загрузить и ждём обработки.
