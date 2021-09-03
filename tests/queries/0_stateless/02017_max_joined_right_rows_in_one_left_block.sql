select w1.id
FROM
(
    SELECT 'test' as id FROM numbers(10000)
) w1
global left join 
(
    SELECT 'test' as id FROM numbers(10000)
) w2 
on w1.id = w2.id
limit 5;


select w1.id
FROM
(
    SELECT 'test' as id FROM numbers(100000000)
) w1
global left join 
(
    SELECT 'test' as id FROM numbers(10000000)
) w2 
on w1.id = w2.id
limit 10
SETTINGS max_joined_right_rows_in_one_left_block = 10000; -- { serverError 191 }
