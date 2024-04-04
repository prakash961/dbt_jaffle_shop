{% macro discounting(amount) %}

case when {{amount}} between 1000 and 2000 then round(0.9*{{amount}},2) 
     when {{amount}} between 2000 and 2500 then round(0.8*{{amount}},2)
     else {{amount}}

{% endmacro %}     