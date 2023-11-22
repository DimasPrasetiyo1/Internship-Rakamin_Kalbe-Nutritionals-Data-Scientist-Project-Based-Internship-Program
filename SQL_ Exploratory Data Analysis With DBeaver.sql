select *
from customer c 

select "Marital Status" 
from customer c 

select count(*) as jumlah_customer
from customer c 

select count(*) as jumlah_nilai_null
from customer c 
where "Marital Status" isnull

// mengecek nilai yg kosong pada kolom martial status
select count(*) as jumlah_nilai_null
from customer c 
where "Marital Status" = ''

select count(*) as jumlah_nilai_not_null
from customer c 
where "Marital Status" is not null

// menghapus 3 nilai kosong yg ada di kolom martial status, dari 447 menjadi 444 baris data
DELETE FROM customer 
WHERE "Marital Status" = '';

// Query 1 : rata rata umur customer berdasarkan martial status
select avg(age)as avg_age_cust_from_status ,"Marital Status" 
from customer c 
group by "Marital Status" 

// Query 2 : rata rata umur customer berdasarkan gender
// Gender : 0 Wanita, 1 Pria
select avg(age)as avg_age_cust_from_gender, gender 
from customer c 
group by gender 


select count(*) as jumlah_nilai_null
from "Transaction" t  
where qty isnull 

SELECT *
FROM "Transaction" t 

// nama store dengan total quantity(item yg paling banyak di beli) terbanyak!
select s.storeid, storename, SUM(qty) as Total_Quantity, SUM(totalamount) as Total_Amount
from store s 
left outer join "Transaction" t on s.storeid = t.storeid
group by s.storeid , s.storename 
order by Total_Quantity desc 

// nama produk terlaris dengan total amount terbanyak
select p.productid, p."Product Name"  , SUM(totalamount) as Total_Amount
from product p 
left outer join "Transaction" t on p.productid = t.productid 
group by p.productid , p."Product Name" 
order by Total_Amount desc 


select p.productid, p."Product Name"  , SUM(qty) as Total_Qty
from product p 
left outer join "Transaction" t on p.productid = t.productid 
group by p.productid , p."Product Name" 
order by Total_Qty desc 

select s.storeid, storename, groupstore , SUM(totalamount) as Total_Amount
from store s 
left outer join "Transaction" t on s.storeid = t.storeid
group by s.storeid , s.storename, s.groupstore 
order by Total_Amount desc 

SELECT s.storeid, CONCAT(s.storeid, '. ', storename, ' & ', groupstore) AS id_name_groupstore, SUM(totalamount) AS Total_Amount
FROM store s
LEFT JOIN "Transaction" t ON s.storeid = t.storeid
GROUP BY s.storeid, s.storename, s.groupstore
ORDER BY Total_Amount DESC;














