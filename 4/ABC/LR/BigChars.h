/*
Лабораторная работа 4. Консоль управления моделью Simple Computer. Псевдографика. «Большие символы».
	Цель работы
		Изучить работу текстового терминала с псевдографическими символами. Понять, что такое шрифт и как он используется в терминалах при выводе информации. Разработать библиотеку myBigChars, реализующую функции по работе с псевдографикой и выводу «больших символов» на экран. Доработать консоль управления Simple Computer так, чтобы выводились псевдографические элементы.
	Задание на лабораторную работу.
		1. Прочитайте главу 5 практикума по курсу «Организация ЭВМ и систем». Обратите особое внимание на параграфы 5.2, 5.3, 5.4.2. Изучите страницу man для команды infocmp , базы terminfo (раздел псевдографика).
		2. Используя оболочку bash и команду infocmp , определите escape-последовательности для переключения используемых терминалом кодировочных таблиц (enter_alt_charset_mode и exit_alt_charset_mode) и соответствие символов для вывода псевдографики (acs_chars).
		3. Используя оболочку bash , команду echo –e и скрипт, проверьте работу полученных последовательностей. Символ escape задается как \033 или \E. Например - echo -e "\033[m". Для проверки сформируйте последовательность escape-команд, выполняющую следующие действия:
			a. очищает экран;
			b. выводит псевдографическую рамку, начиная с 5 символа 10 строки, размером 8 строк на 8 столбцов;
			c. с помощью псевдографического символа «закрашенный прямоугольник» (ACS_CKBOARD) в рамке выводится большой символ, соответствующий последней цифре дня вашего рождения (например, день рождения 13 января 1991 года, выводится цифра 3).
		4. Разработать следующие функции:
			a. int bc_printA (char * str) - выводит строку символов с использованием дополнительной кодировочной таблицы;
			b. int bc_box(int x1, int y1, int x2, int y2) - выводит на экран псевдографическую рамку, в которой левый верхний угол располагается в строке x1 и столбце y1, а еѐ ширина и высота равна y2 столбцов и x2 строк;
			c. int bc_printbigchar (int [2], int x, int y, enum color, enum color) - выводит на экран "большой символ" размером восемь строк на восемь столбцов, левый верхний угол которого располагается в строке x и столбце y. Третий и четвѐртый параметры определяют цвет и фон выводимых символов. "Символ" выводится исходя из значений массива целых чисел следующим образом. В первой строке выводится 8 младших бит первого числа, во второй следующие 8, в третьей и 4 следующие. В 5 строке выводятся 8 младших бит второго числа и т.д. При этом если значение бита = 0, то выводится символ "пробел", иначе - символ, закрашивающий знакоместо (ACS_CKBOARD);
			d. int bc_setbigcharpos (int * big, int x, int y, int value) - устанавливает значение знакоместа "большого символа" в строке x и столбце y в значение value;
			e. int bc_getbigcharpos(int * big, int x, int y, int *value) - возвращает значение позиции в "большом символе" в строке x и столбце y;
			f. int bc_bigcharwrite (int fd, int * big, int count) - записывает заданное число "больших символов" в файл. Формат записи определяется пользователем;
			g. int bc_bigcharread (int fd, int * big, int need_count, int * count) считывает из файла заданное количество "больших символов". Третий параметр указывает адрес переменной, в которую помещается количество считанных символов или 0, в случае ошибки.
			Все функции возвращают 0 в случае успешного выполнения и -1 в случае ошибки. В качестве терминала используется стандартный поток вывода.
		5. Оформите разработанные функции как статическую библиотеку myBigChars. Подготовьте заголовочный файл для неѐ.
*/

#ifndef BIGCHARS_H
#define BIGCHARS_H

#include "BigChars.h"
#include "terminal.h"

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

#define BOXCHAR_REC 'a'
#define BOXCHAR_BR "j"
#define BOXCHAR_BL "m"
#define BOXCHAR_TR "k"
#define BOXCHAR_TL "l"
#define BOXCHAR_VERT "x"
#define BOXCHAR_HOR "q"

int bc_printA(char *str);
int bc_box(int x1, int y1, int x2, int y2);
int bc_printbigchar(int *big, int x, int y, enum colors fg, enum colors bg);
int bc_setbigcharpos(int *big, int x, int y, int value);
int bc_bigcharwrite(int fd, int *big, int count);
int bc_bigcharread(int fd, int *big, int need_count, int *count);

#endif

