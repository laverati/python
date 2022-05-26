#!/bin/bash
# Управляемое меню для получения информации об Вашем компьютере 

# Меню: здесь отображаються варианты для выбора пользователя

# Нужно оптимизировать заголовки каждого раздела, чтобы не повторялось...Но как? 

# Функция, отображающая меню на экране 
function show_menu(){
    date # отображается сегодняшняя дата 
    echo "---------------------------"
    echo "           Меню            "
    echo "---------------------------"
	echo "1. Информация об операционной системе"
	echo "2. Информация о хосте и dns"
	echo "3. Информация о сети"
	echo "4. Выход"
}

# Функция, получает информацию о Вашей операционной системе
function os_info(){
	echo "---------------------------------------------------------------"
	echo "                     Системная информация                                      "
	echo "---------------------------------------------------------------"
	echo "Имя операционной системы: $(uname)" 
	echo "$(lsb_release -a)" # Узнаем версию дистрибутива

}

# Функция, получает информацию о хосте, такую как dns, IP и имя хоста.
function host_info(){
	echo "---------------------------------------------------------------"
	echo "                     Имя хоста и информация о DNS                                      "
	echo "---------------------------------------------------------------"
	echo "Имя хоста : $(hostname)"
	echo "DNS-домен : $(hostname -d)"
	echo "Полное доменное имя : $(hostname -f)"
	echo "IP-адрес :  $(hostname -i)"

}

# Функция получает информацию о сетевом интерфейсе и маршрутизации
function net_info(){
	echo "---------------------------------------------------------------"
	echo "                     Сетевая информация                        "
	echo "---------------------------------------------------------------"

	echo "Информация об IP-адресах: "
	ip -4 address show

	echo "---------------------------------------------------------------"
	echo "                     Маршрутизация сети                        "
	echo "---------------------------------------------------------------"
	netstat -nr 

	echo "---------------------------------------------------------------"
	echo "                     Информация о трафике интерфейса           "
	echo "---------------------------------------------------------------"
	netstat -i


}


# Функция, отвечающая за input
function wait_input(){
	local c
	read -p "Ввведите цифру [ 1 - 4 ] " c
	case $c in
		1)	os_info ;;
		2)	host_info ;;
		3)	net_info ;;
		4)	echo "Чао!"; exit 0;;
		*)	
			echo "Пожалуйста, выберите только от 1 до 4."
			pause
	esac
}


# Запускаем цикл
while true
do
	clear # очищаем консоль
 	show_menu	# показываем меню
 	wait_input  # ждем input от пользователя 
done