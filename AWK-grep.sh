#!/bin/bash
# Purpose: grep, awk
#  AWK: C-подобный скриптовый специализированный язык построчного разбора и обработки входного потока (например, текстового файла) по заданным шаблонам (регулярным выражениям). Язык AWK был разработан и реализован как утилита UNIX'а в 1977 году Э.Ахо, П.Вайнбергером и Б.Керниганом. AWK предназначен для обработки структурированных текстовых документов. Он соединяет в себе основные свойства и возможности утилит sed и grep, но одновременно является простым и удобным языком программирования, пригодным для решения широкого спектра простых повседневных задач. Название AWK складывается из инициалов разработчиков языка: Alfred V. Aho, Peter J. Weinberger и Brian W. Kernighan.
#Утилита awk интерпретирует язык программирования специального назначения, в котором с помощью нескольких строк кода выполняются простые управляемые данными операции переформатирования.
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
# FS — Field Separator, переменная, позволяющая задавать символ-разделитель полей. FS = разделитель входных полей. FS является переменной языка awk.
# RS — Record Separator, переменная, которая позволяет задавать символ-разделитель записей.
# OFS — Output Field Separator, разделитель полей на выводе awk-скрипта.
# ORS — Output Record Separator, разделитель записей на выводе awk-скрипта.
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
# NR = Number of Rows
# NF = Number of Fields
# Экранирование двойных кавычек в awk.
awk 'BEGIN { print "He said \"hi!\" to her." }'
# Модифицирует inventory и печатает его с той разницей, что значение второго поля будет уменьшено на 10.
awk '{ $2 = $2 - 10; print $0 }' Ab.txt > Abm10.txt
# Даже если поле шесть не существует в inventory, вы можете создать его и присвоить значение, затем вывести его.
awk '{ $3 = ($1 + $2); print $3 }' Abm10.txt > Abm3.txt
#
echo a b c d e f | awk '{ print "NF =", NF; > NF = 3; print $0 }'
# OFS - это Output Field Separator (разделитель выходных полей)
# Функция printf() записывает в stdout аргументы из списка arg-list под управлением строки, на которую указывает аргумент format.
awk 'BEGIN {msg = "Dont Panic!"} { printf "%s\n", msg}'
# Символы форматирования для Gawk
# \n Символ новой строки
# \t Символ табуляции
# шаблон awk:
awk 'EXPRESSION { PROGRAM }' file(s)
awk 'BEGIN { FS="" } { print $1 "\t" $5 }' AWK-table2.txt
awk '{ print $1, $5 }' AWK-table2.txt
awk 'BEGIN { FS="" } { print $1, $5 }' AWK-table2.txt
awk '{ print $1 "\t" $5 }' AWK-table2.txt
# cat (от англ. concatenate) - Утилита UNIX, которая последовательно читает файлы и пишет их в стандартный вывод. Иногда (в учебных примерах) используется в качестве первой ступени конвейера обработки текста утилитами sed, awk. Cat выводит последовательно указанные файлы, объединяя их в единый поток.
cat AWK-table2.txt
awk '{ print $2, $3}' AWK-table2.txt
cat awk_testfile.txt
# создать новое поле
cat AWK-table2.txt
# Программа printf. Для более точного управления выходным форматом, чем тот, что обычно обеспечивается командой print, используйте команду printf. В команде printf можно указывать ширину поля каждого элемента, а также указывать различные форматы чисел (например, будет ли указываться основание числа, выдаваться экспонента, следует ли выдавать знак числа, и сколько цифр будет выдаваться после десятичной точки). Это делается с помощью специальной строки, называемой строкой формата, в которой указывается, как и где выдавать другие аргументы.
# Tutorial 2.
############
# simple print file output
awk '{print $0}' AWK-table2.txt
# precede each line by its line number
awk '{print FNR "\t" $0}' AWK-table2.txt
# number each line of a file (number on left, right-aligned)
awk '{printf("%5d : %s\n", NR,$0)}' AWK-table2.txt
# number each line of file, but only print numbers if line is not blank
awk 'NF{$0=++a " :" $0};1' AWK-table2.txt
awk '{print (NF? ++a " :" :"") $0}' AWK-table2.txt
# count lines (emulates "wc -l")
awk 'END {print NR}' AWK-table2.txt
# count lines
wc -l AWK-table2.txt
# print the sums of the fields of every line
awk '{s=0; for (i=1; i<=NF; i++) s=s+$i; print s}' awk_testfile.txt
# print the total number of fields ("words") in all lines
awk '{ total = total + NF }; END {print total}' awk_testfile.txt
awk '{ total = total + NF }; END {print total}' AWK-table2.txt
# print the total number of lines that contain "160." (160 degrees)
awk '/160./{n++}; END {print n+0}' AWK-table2.txt
# print the largest first field and the line that contains it
# Intended for finding the longest string in field #1
awk '$1 > max {max=$1; maxline=$0}; END{ print max, maxline}' awk_testfile.txt
# print the number of fields in each line, followed by the line
awk '{ print NF ":" $0 } ' awk_testfile.txt
awk '{ print NF ":" $0 } ' AWK-table2.txt
# print the last field of each line
awk '{ print $NF }' AWK-table2.txt
# print the last field of the last line
awk '{ field = $NF }; END{ print field }' AWK-table2.txt
# print every line with more than 4 fields
awk 'NF > 5' AWK-table2.txt
# print every line where the value of the last field is > 4
awk '$NF > 4' AWK-table2.txt
# insert 5 blank spaces at beginning of each line (make page offset)
awk '{sub(/^/, "     ")};1' awk_testfile.txt > awk_testfile_offset.txt
cat awk_testfile_offset.txt
# substitute (find and replace) "foo" with "bar" on each line
awk '{sub(/foo/,"bar")}; 1' awk_testfile_offset.txt > awk_testfile_bar.txt
cat awk_testfile_bar.txt
# substitute (find and replace) "bar" with "foo" on each line
awk '{gsub(/bar/,"foo")}; 1' awk_testfile_bar.txt > awk_testfile_foo.txt
cat awk_testfile_foo.txt
# change "scarlet" or "ruby" or "puce" or "rose" to "red"
awk '{gsub(/scarlet|ruby|puce|rose/, "red")}; 1' awk_testfile_colors.txt > awk_testfile_colors_red.txt
cat awk_testfile_colors_red.txt
cat awk_testfile_colors.txt
# print the first 2 fields, in opposite order, of every line
cat awk_testfile.txt
awk '{print $2, $1}' awk_testfile_colors.txt
awk '{print $1, $2}' awk_testfile_colors.txt
# print every line, deleting the second field of that line
cat awk_testfile_colors.txt
awk '{ $2 = ""; print }' awk_testfile_colors.txt
# print in reverse order the fields of every line
cat Ab_copy.txt
awk '{for (i=NF; i>0; i--) printf("%s ",$i);print ""}' Ab_copy.txt
# print every line, deleting the second field of that line
cat Ab_copy.txt
awk '{ $2 = ""; print }' Ab_copy.txt
# print first line of file (emulates "head -1")
awk 'NR>1{exit};1' Ab_copy.txt
# print first line of file
head -1 Ab_copy.txt
# print the last 2 lines of a file (emulates "tail -2")
awk '{y=x "\n" $0; x=$0};END{print y}' Ab_copy.txt
# print the last 2 lines of a file
tail -2 Ab_copy.txt
# print the last line of a file (emulates "tail -1")
awk 'END{print}' Ab_copy.txt
# print the last line of a file
tail -1 Ab_copy.txt
# print only lines which match regular expression (emulates "grep")
awk '/62./' Ab.txt
# print only lines which do NOT match regex (emulates "grep -v")
awk '!/62./' Ab_copy.txt
# print any line where field #1 is equal to "177.030889"
awk '$1 == "177.030889"' Ab_copy.txt
# print only those lines where field #5 is NOT equal to "abc123"
awk '$1 != "177.030889"' Ab_copy.txt
# print the line immediately before a regex, but not the line
# containing the regex
awk '/177.030889/{print x};{x=$0}' Ab_copy.txt
awk '/177.030889/{print (NR==1 ? "match on line 1" : x)};{x=$0}' Ab_copy.txt
# print the line immediately after a regex, but not the line
# containing the regex
awk '/177.030889/{getline;print}' Ab_copy.txt
# grep for AAA and BBB and CCC (in any order on the same line)
awk '/177.030889/ && /62.533278/' Ab_copy.txt
# print only lines of 6 characters or longer
awk 'length > 5' Ab_copy.txt
# print section of file from regular expression to end of file
awk '/177.030889/,0' Ab_copy.txt
awk '/177.030889/,EOF' Ab_copy.txt
# print section of file based on line numbers (lines 8-12, inclusive)
awk 'NR==2,NR==4' Ab_copy.txt
# print line number 52
cat Ab_copy.txt
awk 'NR==4' Ab_copy.txt
awk 'NR==4 {print;exit}' Ab_copy.txt          # more efficient on large files
