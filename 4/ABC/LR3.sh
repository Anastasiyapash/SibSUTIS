#!/usr/bin/env bash

#3. Используя оболочку bash, команду echo –e и скрипт 2 , проверьте работу полученных последо вательностей. Символ escape задается как \033 или \E. Например – echo -e "\033[m". Для проверки сформируйте последовательность escape-команд, выполняющую следующие действия:
#- очищает экран;
#- выводит в пятой строке, начиная с 10 символа Ваше имя красными буквами на черном фоне;
#- в шестой строке, начиная с 8 символа Вашу группу зеленым цветом на белом фоне;
#- перемещает курсор в 10 строку, 1 символ и возвращает настройки цвета в значения «по умолчанию».




#http://terminal-color-builder.mudasobwa.ru/

#echo -e "\E[H\E[2J"
#echo -e "\E[5;10HБаклажан"
#echo -e "\E[5;10H\033[38;05;196;48;05;232mБаклажан"
#echo -e "\E[5;10H\033[38;05;196;48;05;232mБаклажан\n\E[6;8H\033[38;05;46;48;05;15mИП514\E[10;0H1\033[m"


#- очищает экран;
echo -e "\E[H\E[2J"

#- выводит в пятой строке, начиная с 10 символа Ваше имя красными буквами на черном фоне;
echo -e "\E[5;10H\033[38;05;196;48;05;232mБаклажан"

#- в шестой строке, начиная с 8 символа Вашу группу зеленым цветом на белом фоне;
echo -e "\E[6;8H\033[38;05;46;48;05;15mИП514"

#- перемещает курсор в 10 строку, 1 символ и возвращает настройки цвета в значения «по умолчанию».
echo -e "\E[10;0H1\033[m"
