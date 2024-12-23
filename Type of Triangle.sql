select 
case 
when ((A+B)<= C) OR ((A+C)<=B) OR ((B+C)<=A) THEN 'Not A Triangle'
when A=B AND B=C THEN 'Equilateral'
WHEN (A=B) OR (A=C) OR (B=C)  THEN 'Isosceles'
ELSE 'Scalene'
 END as triangle_sides
from TRIANGLES ;