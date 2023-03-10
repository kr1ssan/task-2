/*Выбрать все данные обо всех владельцах. Результат отсортировать по
фамилии в лексикографическом порядке*/
SELECT *
FROM public."Owner"
ORDER BY surname ASC;

/*Выбрать все данные о ДТП, произошедших вчера.*/
SELECT *
FROM public."DTP"
WHERE date = CURRENT_DATE - 1;

/*Выбрать дату ДТП, время, id_автомобиля. Результат отсортировать в
порядке возрастания дат и убывания id_автомобиля*/
SELECT  N.id_car, D.Date, D.time
FROM public."DTP" D join public."DTP_number" N
ORDER BY D.date ASC, N.id_car DESC;

/*Вывести заглавными буквами фамилию имя отчество владельцев в одном
столбце, год рождения для владельцев старше 65 лет.*/
SELECT UPPER(CONCAT(O.name, ' ',  O.surname, ' ', O.middle_name)),
CASE
    WHEN EXTRACT (YEAR FROM age(date)) > 65 THEN EXTRACT (YEAR FROM (date))
END
FROM public."Owner" O 

/*Выбрать имена и отчества владельцев без повторений.*/
SELECT DISTINCT name, surname 
FROM public."Owner";

/*Выбрать данные о ДТП, для которых виновность не определена.*/
SELECT *
FROM public."DTP_number"
WHERE guilt IS NULL;

/*Выбрать данные о владельцах в возрасте от 18 до 25 лет.*/
SELECT *
FROM public."Owner"
WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM date) BETWEEN 18 AND 25

/*Выбрать данные о ДТП, для автомобилей с id равным 3, 5, 1, 40*/
SELECT *
FROM public."DTP_number" d
WHERE d.id_car IN (1, 3, 5, 40);

/*Выбрать данные о владельцах с двойной фамилией. Из результата
исключить владельцев без отчеств, рожденных в 1970, 1971, 1973, 1989 и
1986 годах.*/
SELECT *
FROM public."Owner" O
WHERE O.surname LIKE '%-%' AND EXTRACT(YEAR FROM date) NOT IN (1970, 1971, 1973, 1986, 1989) AND middle_name NOTNULL

/*Выбрать номера автомобилей, состоящие только из цифр, или
содержащие знак “_”*/
SELECT reg_number
FROM public."Car" C
WHERE C.reg_number LIKE '%#_%' ESCAPE '#' OR C.reg_number !~* '[^0-9]';
