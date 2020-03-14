1. Report:

How many mail were delivered from austria?

select count(id) from deposited where `id` in (
    select `id` from cust where `id` in (
        select `id` from adress where country = "germany"
    )
)

1

2. Who delivered mail at 2020-03-01?

select f_name, l_name from person where id in (
    select fk_person from cust where id in (
        select fk_cust from deposited where deposited >= "2020-03-01 00:00:00"
        and deposited < "2020-03-02 00:00:00"
    )
)

john doe

3. Who delivered mail from 2020-03-02 to 2020-03-03 inclusively?

select f_name, l_name from person where id in (
    select fk_person from cust where id in (
        select fk_cust from deposited where deposited >= "2020-03-02 00:00:00"
        and deposited < "2020-03-04 00:00:00"
    )
)

oliver stein
bartolomeo rosso

4. Who received packages?

select f_name, l_name from person where id in (
    select fk_person from recipient where id in (
        select id from mail where type = "package"
    )
)

oliver stein 

5. Who from the registered persons lives in germany and in wich cities?

select person.f_name, person.l_name, adress.city from person
inner join adress on adress.id = person.fk_adress
where adress.country = "germany"

bartolomeo rosso berlin
gretchen kusnezowa nuernberg

6. What is the weight of the mail for the recipient bartolomeo rosso?

select mail.weight from mail
inner join person on person.id = mail.fk_recipient
and f_name = "bartolomeo"
and l_name = "rosso"

20