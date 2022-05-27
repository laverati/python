#!/bin/bash


# функция, отображающая меню на экране 
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

# функция, получает информацию об операционной системе
function os_info(){
    echo "---------------------------------------------------------------"
    echo "                     Системная информация                                      "
    echo "---------------------------------------------------------------"
	echo "Имя операционной системы: $(uname)" # узнает имя ОС
	echo "$(lsb_release -a)" # узнает версию дистрибутива

}

# функция, получает информацию о хосте, такую как dns, IP и имя хоста.
function host_info(){
	echo "---------------------------------------------------------------"
    echo "                     Имя хоста и информация о DNS                                      "
    echo "---------------------------------------------------------------"
	echo "Имя хоста : $(hostname)"
	echo "DNS-домен : $(hostname -d)"
	echo "Полное доменное имя : $(hostname -f)"
	echo "IP-адреса :  $(hostname -I)"

}

# функция получает информацию о сетевом интерфейсе и маршрутизации
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


# функция, отвечающая за input
function wait_input(){
	local c
	read -p "Ввведите цифру [ 1 - 4 ] " c # ждет input от пользователя
	case $c in
		1)	os_info ;;
		2)	host_info ;;
		3)	net_info ;;
		4)	echo "Чао!"; exit 0;; # выходит из программы
		*)	
			echo "Пожалуйста, выберите только от 1 до 4."
	esac
    read -p "Нажмите любую клавишу, чтобы продолжить..."  
}


# запускает цикл
while true
do
	clear # очищает консоль
 	show_menu	# показывает меню
 	wait_input  # ждет input от пользователя 
done