1. Report:

How many mail were delivered from austria?

select count(id) from deposited where `id` in (
    select `id` from cust where `id` in (
        select `id` from adress where country = "germany"
    )
)

1

2. Who delivered mail at "2020-03-01"?

select f_name, l_name from person where id in (
    select fk_person from cust where id in (
        select fk_cust from deposited where deposited >= "2020-03-01 00:00:00"
        and deposited < "2020-03-02 00:00:00"
    )
)

john doe

3. Who delivered mail from "2020-03-01" to "2020-03-03" inclusively?

select f_name, l_name from person where id in (
    select fk_person from cust where id in (
        select fk_cust from deposited where deposited >= "2020-03-01 00:00:00"
        and deposited < "2020-03-04 00:00:00"
    )
)

john doe
oliver stein
bartolomeo rosso

4. 