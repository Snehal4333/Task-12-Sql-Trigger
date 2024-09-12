select * from sales

create table report_table(
	product_id int primary key,
	total_sales int,
	total_profit int
)

select * from report_table

CREATE OR REPLACE FUNCTION update_report_table()
RETURNS TRIGGER AS $$
DECLARE
total_sales int;
total_profit int;
BEGIN
select sum(sales),sum(profit) total_sales,total_profit
from sales
where product_id=NEW.product_id;
if not found then
insert into report_table(product_id,total_sales,total_profit)
values (NEW.product_id,total_sales,total_profit);
END if;
RETURN new;
END;
$$ language plpgsql;

CREATE TRIGGER update_report_on_insert
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION update_Report_Table()

insert into sales values(21,19,'2019-02-09',5,50,2,'Callifornia')

select * from sales


