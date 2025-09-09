# **Развертывание приложений в Docker контейнерах**

**1С: Шина**

  - Клонируем репозиторий 1c_esb
  - Кладем в каталог дистрибутив установки 1С:Шина
  - Собираем Docker образ (например: docker build -t onec_esb:latest . )
  - Запускаем контейнер (напрмер: docker run --network=onec_esb -it --rm --name=onec_esb1 -p 9099:9090 onec_esb:latest) 
