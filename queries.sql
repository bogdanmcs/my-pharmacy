-- Queries
-- 1. Cate comenzi a plasat farmacia Dona in August - suma totala, valoarea medie per comanda.

select
	count(*) dona_august_packages_counter,
	sum(package_cost) total_cost,
	avg(package_cost) average_cost_per_package 
from
	(
		select
			package.id_package,
			sum(package_item.quantity * drug.price) package_cost 
		from
			package,
			pharmacy,
			package_item,
			drug 
		where
			pharmacy.name = 'Dona' 
			and pharmacy.id_pharmacy = package.id_pharmacy 
			and extract(month 
		from
			to_date(package.timestamp, 'dd/mm/yyyy')) = 8 
			and package.id_package = package_item.id_package 
			and package_item.id_drug = drug.id_drug 
		group by
			package.id_package 
		order by
			package.id_package 
	)
;

-- 2. Cate comenzi de antibiotice a plasat farmacia Vlad in 2021.
select
	count(*) vlad_2021_ordered_antibiotics_counter
from
	(
		select
			package.id_package,
			category.name 
		from
			package,
			pharmacy,
			package_item,
			drug,
			category,
			drug_category 
		where
			pharmacy.name = 'Vlad' 
			and pharmacy.id_pharmacy = package.id_pharmacy 
			and package.id_package = package_item.id_package 
			and package_item.id_drug = drug.id_drug 
			and drug.id_drug = drug_category.id_drug 
			and drug_category.id_category = category.id_category 
			and category.name = 'antibiotics' 
		group by
			package.id_package,
			category.name 
	)
;

-- 3. Care e farmacia care a comandat cel mai mult in 2021 , ca valoare absoluta.
-- dona: 58, vlad: 38 (drugs counter)
select
	most_ordered_drugs,
    total_quantity
from
	(
		select
			pharmacy.name most_ordered_drugs,
			sum(package_item.quantity) total_quantity 
		from
			pharmacy,
			package,
			package_item 
		where
			pharmacy.id_pharmacy = package.id_pharmacy 
			and package.id_package = package_item.id_package 
		group by
			pharmacy.name 
		order by
			total_quantity desc 
	)
where
	rownum = 1;
   
--4. Sa se printeze urmatorul raport in PL/SQL: pentru fiecare produs cat s-a comandat de catre fiecare client.
declare drug_quantity number;

cursor pharmacy_list is 
select
	name 
from
	pharmacy;
	
cursor drug_list is 
select
	id_drug,
	name 
from
	drug;
	
cursor items is 
select
	pharmacy.name,
	package.id_package,
	package_item.id_drug,
	package_item.quantity 
from
	pharmacy,
	package,
	package_item 
where
	pharmacy.id_pharmacy = package.id_pharmacy 
	and package.id_package = package_item.id_package 
order by
	pharmacy.name,
	package.id_package;

begin
	for pharmacy in pharmacy_list loop
		dbms_output.put_line(pharmacy.name || ':');
	    
		for drug in drug_list loop
			dbms_output.put('(id=' || drug.id_drug || ') '  || drug.name || ' = ');
            
			drug_quantity := 0;
			for i in items loop
				if i.name = pharmacy.name and i.id_drug = drug.id_drug then
					drug_quantity := drug_quantity + i.quantity;
				end if;
			end loop;
            
            dbms_output.put_line(drug_quantity);
		end loop;
        dbms_output.put_line('');
	end loop;
end;