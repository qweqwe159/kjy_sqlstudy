HR@orcl> SELECT ROUND(MAX(salary),0) "Maximum", ROUND(MIN(salary),0) "Minimum", ROUND(SUM
  2  (salary),0) "SUM", ROUND(AVG(salary),0) "Average"
  3  FROM employees;

   Maximum    Minimum        SUM    Average                                     
---------- ---------- ---------- ----------                                     
     24000       2500     204400       8887                                     

HR@orcl> SELECT job_id, ROUND(MAX(salary),0) "Maximum", ROUND(MIN(salary),0) "Minimum", ROUND(SUM(salary),0) "SUM", ROUND(AVG(salary),0) "Average"
  2  FROM employees
  3  GROUP BY job_id;

JOB_ID        Maximum    Minimum        SUM    Average                          
---------- ---------- ---------- ---------- ----------                          
IT_PROG          9000       4200      19200       6400                          
AC_MGR          12000      12000      12000      12000                          
AC_ACCOUNT       8300       6900      15200       7600                          
ST_MAN           5800       5800       5800       5800                          
AD_ASST          4400       4400       4400       4400                          
AD_VP           17000      17000      34000      17000                          
SA_MAN          10500      10500      10500      10500                          
MK_MAN          13000      13000      13000      13000                          
AD_PRES         24000      24000      24000      24000                          
SA_REP          11000       7000      48600       9720                          
MK_REP           6000       6000       6000       6000                          

JOB_ID        Maximum    Minimum        SUM    Average                          
---------- ---------- ---------- ---------- ----------                          
ST_CLERK         3500       2500      11700       2925                          

12 rows selected.

HR@orcl> SELECT job_id, COUNT(*)
  2  FROM employees
  3  GROUP BY job_id;

JOB_ID       COUNT(*)                                                           
---------- ----------                                                           
AC_ACCOUNT          2                                                           
AC_MGR              1                                                           
AD_ASST             1                                                           
AD_PRES             1                                                           
AD_VP               2                                                           
IT_PROG             3                                                           
MK_MAN              1                                                           
MK_REP              1                                                           
SA_MAN              1                                                           
SA_REP              5                                                           
ST_CLERK            4                                                           

JOB_ID       COUNT(*)                                                           
---------- ----------                                                           
ST_MAN              1                                                           

12 rows selected.

HR@orcl> SELECT COUNT(DISTINCT manager_id) "Number of Managers"
  2  FROM employees;

Number of Managers                                                              
------------------                                                              
                 8                                                              

HR@orcl> SELECT MAX(salary) - MIN(salary) DIFFERENCE
  2  FROM employees;

DIFFERENCE                                                                      
----------                                                                      
     21500                                                                      

HR@orcl> SELECT manager_id, MIN(salary) FROM employees
  2  WHERE manager_id IS NOT NULL
  3  GROUP BY manager_id
  4  HAVING MIN(salary) > 6000
  5  ORDER BY MIN(salary) DESC;

MANAGER_ID MIN(SALARY)                                                          
---------- -----------                                                          
       102        9000                                                          
       149        7000                                                          
       205        6900                                                          

HR@orcl> SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1995,1,0))"1995",
  2  				SUM(DECODE(department_id,50,salary)) "Dept 50"
  3  				SUM(DECODE(department_id,80,salary)) "Dept 80"
  4  				SUM(DECODE(department_id,90,salary)) "Dept 90"
  5  				SUM(salary) "Total"
  6  FROM employees
  7  GROUP BY job_id;
				SUM(DECODE(department_id,80,salary)) "Dept 80"
				*
ERROR at line 3:
ORA-00923: FROM keyword not found where expected 


HR@orcl> ed
Wrote file afiedt.buf

  1  SELECT job_id,"Job",  SUM(DECODE(department_id, 20, salary)) " Dept 20",
  2  				SUM(DECODE(department_id,50,salary)) "Dept 50",
  3  				SUM(DECODE(department_id,80,salary)) "Dept 80",
  4  				SUM(DECODE(department_id,90,salary)) "Dept 90",
  5  				SUM(salary) "Total"
  6  FROM employees
  7* GROUP BY job_id
HR@orcl> /
SELECT job_id,"Job",  SUM(DECODE(department_id, 20, salary)) " Dept 20",
              *
ERROR at line 1:
ORA-00904: "Job": invalid identifier 


HR@orcl> ed
Wrote file afiedt.buf

  1  SELECT job_id "Job",  SUM(DECODE(department_id, 20, salary)) " Dept 20",
  2  				SUM(DECODE(department_id,50,salary)) "Dept 50",
  3  				SUM(DECODE(department_id,80,salary)) "Dept 80",
  4  				SUM(DECODE(department_id,90,salary)) "Dept 90",
  5  				SUM(salary) "Total"
  6  FROM employees
  7* GROUP BY job_id
HR@orcl> .
HR@orcl> /

Job           Dept 20    Dept 50    Dept 80    Dept 90      Total               
---------- ---------- ---------- ---------- ---------- ----------               
IT_PROG                                                     19200               
AC_MGR                                                      12000               
AC_ACCOUNT                                                  15200               
ST_MAN                      5800                             5800               
AD_ASST                                                      4400               
AD_VP                                            34000      34000               
SA_MAN                                10500                 10500               
MK_MAN                                                      13000               
AD_PRES                                          24000      24000               
SA_REP                                19600                 48600               
MK_REP           6000                                        6000               

Job           Dept 20    Dept 50    Dept 80    Dept 90      Total               
---------- ---------- ---------- ---------- ---------- ----------               
ST_CLERK                   11700                            11700               

12 rows selected.

HR@orcl> SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(hire_date, 'YYYY'
  2  ),1995,1,0)) "1995",
  3  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1996,1,0))"1996"
  4  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997,1,0))"1997"
  5  				SUM(DECODE(TO_CHAR(hier_date, 'YYYY'), 1998,1,0))"1998"
  6  FROM employees;
				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997,1,0))"1997"
				*
ERROR at line 4:
ORA-00923: FROM keyword not found where expected 


HR@orcl> /
				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997,1,0))"1997"
				*
ERROR at line 4:
ORA-00923: FROM keyword not found where expected 


HR@orcl> ed
Wrote file afiedt.buf

  1  SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(hire_date, 'YYYY'
  2  ),1995,1,0)) "1995",
  3  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1996,1,0))"1996",
  4  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997,1,0))"1997",
  5  				SUM(DECODE(TO_CHAR(hier_date, 'YYYY'), 1998,1,0))"1998"
  6* FROM employees
HR@orcl> /
				SUM(DECODE(TO_CHAR(hier_date, 'YYYY'), 1998,1,0))"1998"
				                   *
ERROR at line 5:
ORA-00904: "HIER_DATE": invalid identifier 


HR@orcl> ed
Wrote file afiedt.buf

  1  SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1995,1,0)) "1995",
  2  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1996,1,0))"1996",
  3  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997,1,0))"1997",
  4  				SUM(DECODE(TO_CHAR(hier_date, 'YYYY'), 1998,1,0))"1998"
  5* FROM employees
HR@orcl> /
				SUM(DECODE(TO_CHAR(hier_date, 'YYYY'), 1998,1,0))"1998"
				                   *
ERROR at line 4:
ORA-00904: "HIER_DATE": invalid identifier 


HR@orcl> ed
Wrote file afiedt.buf

  1  SELECT COUNT(*) total, SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1995,1,0))"1995",
  2  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1996,1,0))"1996",
  3  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1997,1,0))"1997",
  4  				SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),1998,1,0))"1998"
  5* FROM employees
HR@orcl> /

     TOTAL       1995       1996       1997       1998                          
---------- ---------- ---------- ---------- ----------                          
        23          1          2          2          3                          

HR@orcl> SELECT location_id, street_address, city, state_province, country_name
  2  FROM locations NATURAL JOIN countries;

LOCATION_ID STREET_ADDRESS                                                      
----------- ----------------------------------------                            
CITY                           STATE_PROVINCE                                   
------------------------------ -------------------------                        
COUNTRY_NAME                                                                    
----------------------------------------                                        
       1400 2014 Jabberwocky Rd                                                 
Southlake                      Texas                                            
United States of America                                                        
                                                                                
       1500 2011 Interiors Blvd                                                 
South San Francisco            California                                       
United States of America                                                        

LOCATION_ID STREET_ADDRESS                                                      
----------- ----------------------------------------                            
CITY                           STATE_PROVINCE                                   
------------------------------ -------------------------                        
COUNTRY_NAME                                                                    
----------------------------------------                                        
                                                                                
       1700 2004 Charade Rd                                                     
Seattle                        Washington                                       
United States of America                                                        
                                                                                
       1800 460 Bloor St. W.                                                    
Toronto                        Ontario                                          

LOCATION_ID STREET_ADDRESS                                                      
----------- ----------------------------------------                            
CITY                           STATE_PROVINCE                                   
------------------------------ -------------------------                        
COUNTRY_NAME                                                                    
----------------------------------------                                        
Canada                                                                          
                                                                                
       2500 Magdalen Centre, The Oxford Science Park                            
Oxford                         Oxford                                           
United Kingdom                                                                  
                                                                                

HR@orcl> SELECT last_name, department_id, department_name
  2  FROM employees JOIN departments
  3  USING (department_id);

LAST_NAME                 DEPARTMENT_ID DEPARTMENT_NAME                         
------------------------- ------------- ------------------------------          
Abel                                 80 Sales                                   
DEAN                                 60 IT                                      
Davies                               50 Shipping                                
De Haan                              90 Executive                               
Ernst                                60 IT                                      
Fay                                  20 Marketing                               
Gietz                               110 Accounting                              
Hartstein                            40 Human Resource                          
Higgins                             110 Accounting                              
Hunold                               60 IT                                      
King                                 90 Executive                               

LAST_NAME                 DEPARTMENT_ID DEPARTMENT_NAME                         
------------------------- ------------- ------------------------------          
Kochhar                              90 Executive                               
Lorentz                              60 IT                                      
Matos                                50 Shipping                                
Mourgos                              50 Shipping                                
Popp                                110 Accounting                              
Rajs                                 50 Shipping                                
Raphealy                             60 IT                                      
Taylor                               80 Sales                                   
Vargas                               50 Shipping                                
Whalen                               10 Administration                          
Zlotkey                              80 Sales                                   

22 rows selected.

HR@orcl> SELECT e.last_name, e.job_id, e.department_id, d.department_name
  2  FROM employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  JOIN locations 1
  5  ON (d.location_id = 1.location_id)
  6  WHERE LOWER(1.city) = 'toronto';
JOIN locations 1
               *
ERROR at line 4:
ORA-00905: missing keyword 


HR@orcl> ed
Wrote file afiedt.buf

  1  SELECT e.last_name, e.job_id, e.department_id, d.department_name
  2  FROM employees e JOIN departments d
  3  ON (e.department_id = d.department_id)
  4  JOIN locations l
  5  ON (d.location_id = l.location_id)
  6* WHERE LOWER(l.city) = 'toronto'
HR@orcl> .
HR@orcl> /

LAST_NAME                 JOB_ID     DEPARTMENT_ID                              
------------------------- ---------- -------------                              
DEPARTMENT_NAME                                                                 
------------------------------                                                  
Fay                       MK_REP                20                              
Marketing                                                                       
                                                                                

HR@orcl> spool off
