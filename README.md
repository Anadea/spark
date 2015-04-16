# Spark

Генератор Ruby on Rails приложений для [быстрого старта проектов](https://anahoret.com/wiki/Anahoret/AnadeaSpark).

## Установка

Установите gem:

    gem install anadea-spark

И запустите генератор:

    spark projectname

Будет создано Rails-приложение `projectname` с использованием [последней стабильной версии Rails](lib/spark/version.rb).

## Гемы для приложения

* [Bootstrap](https://github.com/twbs/bootstrap-sass) для стандартного внешнего
  вида и вёрстки по сетке.
* [Email Validator](https://github.com/balexand/email_validator) для валидации
  адреса электронной почты.
* [Exception Notification](https://github.com/smartinez87/exception_notification)
  для уведомления по электронной почте о неперехваченных исключениях во время
  работы приложения. Включается при наличии переменной окружения
  `MAIL_ERRORS_TO`, задающей список адресов для уведомления через запятую.
* [Figaro](https://github.com/laserlemon/figaro) для конфигурации приложения
  через переменные окружения.
* [Haml Rails](https://github.com/indirect/haml-rails) для структурированных
  шаблонов.
* [High Voltage](https://github.com/thoughtbot/high_voltage) отображения
  домашней страницы и других страниц, не требующих кастомного контроллера.
* [Jquery Rails](https://github.com/rails/jquery-rails) для JQuery как дефолт
  Рельсов.
* [Postgres](https://github.com/ged/ruby-pg) для доступа к базе данных Postgres.
* [Thin](https://github.com/macournoyer/thin) как руби-сервер в разработке и в
  первоначальном продакшене.
* [Rack Timeout](https://github.com/heroku/rack-timeout) чтобы отменять слишком
  длинные запросы. Включается при наличии переменной окружения `RACK_TIMEOUT`,
  задаваемой в секундах.
* [Recipient Interceptor](https://github.com/croaky/recipient_interceptor) чтобы
  избежать случайной отправки почты реальным адресатам со стейджинга. Включается
  при наличии переменной окружения `EMAIL_RECIPIENTS`, задающей адрес, которым
  будет заменено поле `to` любого отправляемого письма.
* [Sass Rails](https://github.com/rails/sass-rails) как дефолт Рельсов.
* [Simple Form](https://github.com/plataformatec/simple_form) для разметки и
  стиллизации форм. Инициализатор сгенерирован для twitter bootstrap.
* [Title](https://github.com/calebthompson/title) для удобного задания тайтлов
  страниц в файлах перевода i18n.
* [Uglifier](https://github.com/lautis/uglifier) как дефолт Рельсов.

## Гемы для разработки

* [Bundler Audit](https://github.com/rubysec/bundler-audit) для проверки
  `Gemfile` на предмет наличия в использованных гемах опубликованных уязвимостей
  (CVE).
* [ByeBug](https://github.com/deivid-rodriguez/byebug) для интерактивной отладки.
* [Pry Rails](https://github.com/rweng/pry-rails) как более удобный и мощный
  REPL.
* [Spring](https://github.com/rails/spring) для предзагрузки окружения Rails,
  чтобы быстрее выполнять многие действия.
* [Spring Commands Rspec](https://github.com/jonleighton/spring-commands-rspec)
  для использования Spring в `bin/rspec`.
* [Web Console](https://github.com/rails/web-console) для удобной REPL отладки
  в браузере.  

## Гемы для тестирования

* [Capybara](https://github.com/jnicklas/capybara) и
  [Poltergeist](https://github.com/teampoltergeist/poltergeist) для
  интеграционного тестирования.
* [Factory Girl](https://github.com/thoughtbot/factory_girl) для тестовых данных.
* [Formulaic](https://github.com/thoughtbot/formulaic) для интеграционного
  тестирования HTML форм.
* [RSpec](https://github.com/rspec/rspec) для тестирования.
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) для стабов.
* [SimpleCov](https://github.com/colszowka/simplecov) для измерения покрытия
  кода. Работает при передаче переменной окружения COVERAGE.
* [Timecop](https://github.com/jtrupiano/timecop-console) для тестирования с
  учётом времени.
* [Webmock](https://github.com/bblimke/webmock) для тестирования внешних HTTP
  запросов. Сконфигурирован запрещать любые запросы, за пределами localhost.

## Прочие настройки

* В приложении создаётся скрипт `bin/setup` для лёгкого старта новыми разработчиками.
* Макет (layout) приложения с флеш-сообщениями, навигацией и подвалом, сделанный
  под twitter bootstrap.
* Удалён гем `coffee-rails`, так как Coffeescript признан плохой практикой.
* Готовый шаблон для home page – заходи и меняй.
* Несколько удобных форматов даты и времени для локализации.
* [Уменьшен размер пула соединений с базой данных][pool].
* `t()` и `l()` хелперы в тестах, чтобы вызывать их без префиксов.
* Переменная окружения `SECRET_KEY_BASE` используется во всех окружениях.
* Google analytics установлен и настроен. Работает при передаче переменной
  окружения `GOOGLE_ANALYTICS_KEY`.
* [Rails 12 factor][rails12factor] для удобства деплоя в Heroku-like платформы.
* [Procfile][foreman] для использования в процессе разработки и для удобства
  деплоя в Heroku-like платформы. Также устанавливается Foreman.
* В development отправка почты настроена через [Mailcatcher][mailcatcher]. Также
  устанавливается и запускается Mailcatcher.
* В production отправка почты настраивается через app.mailarbor.com.
* При нарушении Strong Parameters во всех окружениях бросается исключение.
* При отсутствии перевода для i18n в окружениях development и test бросается
  исключение.
* Добавлен `.ruby-version`, понимаемый большинством менеджеров версий Руби.
* Контент `config/routes.rb`, состоящий из большого комментария, удалён.

[pool]: https://devcenter.heroku.com/articles/concurrency-and-database-connections
[rails12factor]: https://github.com/heroku/rails_12factor
[mailcatcher]: http://mailcatcher.me/
[foreman]: http://ddollar.github.io/foreman/

## Зависимости

Последняя стабильная [версия Руби](.ruby-version).

Некоторые гемы, от которых зависит созданное Rails приложение, требуют от системы возможность скопмилировать код на C(++).
Для этого на машине должен быть установлен GCC.
Используйте [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action) для Lion (OS X 10.7) и новее.

Для интеграционного тестирования с Джаваскриптом используется [Poltergeist](https://github.com/teampoltergeist/poltergeist),
для сборки которого потребуется [установленный PhantomJS](https://github.com/teampoltergeist/poltergeist#installing-phantomjs).

Для успешного выполнения задачи `rake db:create` нужен установленный и запущенный Postgresql.
