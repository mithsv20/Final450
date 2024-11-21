CREATE TABLE user_content (content_id INT PRIMARY KEY,customer_id INT,content_type VARCHAR(50),content_text VARCHAR(255));

INSERT INTO user_content (content_id, customer_id, content_type, content_text)
VALUES(1, 2, 'comment', 'hello world! this is a TEST.'),
    (2, 8, 'comment', 'what a great day'),
    (3, 4, 'comment', 'WELCOME to the event.'),
    (4, 2, 'comment', 'e-commerce is booming.'),
    (5, 6, 'comment', 'Python is fun!!'),
    (6, 6, 'review', '123 numbers in text.'),
    (7, 10, 'review', 'special chars: @#$$%^&*()'),
    (8, 4, 'comment', 'multiple CAPITALS here.'),
    (9, 6, 'review', 'sentence. and ANOTHER sentence!'),
    (10, 2, 'post', 'goodBYE!');

-- Convert the first letter of each word found in content_text to uppercase,
-- while keeping the rest of the letters lowercase.
-- Your output should include the original text in one column and the modified text in another column.

-- base query
with CTE as(
select
    content_id,
    customer_id,
    content_type,
    content_text as original_text,
    unnest(string_to_array(lower(content_text), ' ')) as modified_text
from
    user_content)

select content_id,
  STRING_AGG(concat(
    UPPER(LEFT(modified_text, 1)),
    SUBSTRING(modified_text, 2, LENGTH(modified_text))
  ), ' ') as rest_value
from CTE
group by content_id
order by content_id



-- optimized query
select
    content_id,
    customer_id,
    content_type,
    content_text as original_text,
    STRING_AGG(concat(
      UPPER(LEFT(modified_text, 1)),
      SUBSTRING(modified_text, 2, LENGTH(modified_text))
    ), ' ') as modified_text
from
    user_content,
    unnest(string_to_array(lower(content_text), ' ')) as modified_text
group by
    content_id,
    customer_id,
    content_type
order by
    content_id,
    customer_id,
    content_type
