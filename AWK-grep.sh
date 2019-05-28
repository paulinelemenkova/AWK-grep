#!/bin/bash
# Purpose: grep, awk
#  AWK: C-подобный скриптовый специализированный язык построчного разбора и обработки входного потока (например, текстового файла) по заданным шаблонам (регулярным выражениям). Язык AWK был разработан и реализован как утилита UNIX'а в 1977 году Э.Ахо, П.Вайнбергером и Б.Керниганом. AWK предназначен для обработки структурированных текстовых документов. Он соединяет в себе основные свойства и возможности утилит sed и grep, но одновременно является простым и удобным языком программирования, пригодным для решения широкого спектра простых повседневных задач. Название AWK складывается из инициалов разработчиков языка: Alfred V. Aho, Peter J. Weinberger и Brian W. Kernighan.
# 1. найдет все координаты с 177 град. и впишет точки в новый файл Ab.txt
grep '^177' gshhs_i.txt > Ab.txt
# 2. вывод строки на экран. выход: Ctrl+D
awk '{print "Hello World"}'
# 3. По умолчанию awk назначает следующие переменные каждому полю данных, обнаруженному им в записи:
$0 — представляет всю строку текста (запись).
$1 — первое поле.
$2 — второе поле.
$n — n-ное поле.
# позиционные переменные — $1, $2, $3, которые позволяют извлекать значения полей
# 4. выкусит долготы (1 столбец)
awk '{print $1}' Ab.txt > Alon.txt
# 5. выкусит широты (2 столбец)
awk '{print $2}' Ab.txt > Alat.txt
# 6. чтобы передать awk многострочную команду, нужно разделить её части точкой с запятой:
$ echo "My name is Tom" | awk '{$4="Adam"; print $0}'
# 7. выполнить какие-то действия до того, как скрипт начнёт обработку записей из входного потока. Например — создать шапку отчёта или что-то подобное.
awk 'BEGIN {print "Hello World!"}'
# 8. блоки BEGIN и END
awk 'BEGIN {print "The File Contents:"} {print $0}' Ab.txt
$ awk 'BEGIN {print "The File Contents:"} {print $0} END {print "End of File"}' Ab.txt
# 9. echo+awk
echo 'one two three four' | awk '{print $1}'
echo 'one two three four' | awk '{print $3,$1}'
# 10. some Russian text
echo 'one two three four' | awk '{print "что-то:",$3,"| bar:",$1}'
# 11. separator : -F":"
echo 'one mississippi:two mississippi:three mississippi:four mississippi' | awk -F":" '{print $4}'
echo 'one mississippi:two mississippi:three mississippi:four mississippi' | awk -F: '{print $4}'
# 12. последнее поле
echo 'one two three four' | awk '{print $NF}'
# 13. предпоследнее поле
echo 'one two three four' | awk '{print $(NF-1)}'
# 14. выбрать выражением
echo 'one two three four' | awk '{print $((NF/2)+1)}'
# 15. строка с новой строки
echo -e 'one 1\n two 2' | awk '{print $1}'
echo -e 'one 1\n two 2' | awk '{print $2}'
echo -e 'one 1\n two 2' | awk '{sum+=$2} END {print sum}'
# FS — переменная, позволяющая задавать символ-разделитель полей.
# RS — переменная, которая позволяет задавать символ-разделитель записей.
# OFS — разделитель полей на выводе awk-скрипта.
# ORS — разделитель записей на выводе awk-скрипта.
awk 'BEGIN{OFS=":"} {print $1,$2,$3}' Ab.txt > Abcolon.txt
awk 'BEGIN{FS=":"; OFS="-"} {print $1,$2,$3}' Abcolon.txt > Abdefis.txt
awk 'BEGIN{OFS="|"} {print $7}' GSFML_my.txt > GSFML_my_new.txt
awk '{print $1}' GSFML_my.txt > GSFML_my_new.txt
awk '{print $1}' GSFML_my_new.txt > GSFML_my_n.txt
awk 'BEGIN{FIELDWIDTHS="8 1 1 3"}{print $1,$2,$3,$4}' GSFML_my.txt > GSFML_my_new.txt
awk 'BEGIN{FIELDWIDTHS="3 5 2 5"}{print $1,$2,$3,$4}' awk_testfile.txt
awk '{print $3}' awk_testfile.txt > GSFML_my_new3.txt
#
awk 'BEGIN{FS="\n"; RS=""} {print $1,$3}' awk_addresses.txt
