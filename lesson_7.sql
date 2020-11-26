-- Задание № 1

-- Сначала заполним таблицы значениями
insert into orders (user_id)
values
(1), (2), (3), (5);

insert into orders_products(order_id, product_id, total)
values
(1, 2, 2),
(2, 3, 1),
(3, 5, 1),
(4, 2, 1);

-- Выводим список пользователей, делающих когда-либо заказы
select 
u.name 
from users u
right join 
orders o
on o.user_id = u.id;


-- Задание № 2
select 
p.name,
c.name
from products p 
left join catalogs c
on c.id = p.catalog_id;


-- Задание № 3

-- Сначала создадим таблицы

drop table if exists flights;
create table flights(
id serial primary key,
`from` varchar(55),
`to` varchar(55)
);
insert into flights(`from`, `to`) values
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk','moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

drop table if exists cities;
create table cities(
label varchar(55),
name varchar(55)
);

insert into cities values
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

-- Выведем рейсы

select
f.id,
c1.name,
c2.name
from flights f
join cities c1
on f.`from` = c1.label
join cities c2
on f.`to` = c2.label
order by f.id
