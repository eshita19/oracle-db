# Oracle-db

## Entity Relationship Model : 
   - It is used to display all the relationships.
   - Entity: Table, Attributes: Columns of Table, Relationship: Foreign References to other tables( 1:1, 1:*, *:1)
   - <img src="https://github.com/eshita19/oracle-db/blob/master/ER_Schema.png"> </img>
## Oracle Setup:
   - Cloud DB: https://livesql.oracle.com/
   - Docker: 
     - docker login
     - Run container: docker run -d -it --name <Oracle-DB> store/oracle/database-enterprise:12.2.0.1
     - User name / PWD: sys/Oradoc_db1
     - Oracle bash: docker exec -it <Oracle-DB> bash -c "source /home/oracle/.bashrc; sqlplus /nolog"
   
## Oracle comments: 
   - Multiline comments: `/*..*/`
   - Single line comments: `--`
   
## Select statements:
   - <img src="https://github.com/eshita19/oracle-db/blob/master/operator_precedence.png"></img>
   - https://github.com/eshita19/oracle-db/blob/master/select.sql
   
##  Grouping functions:
   - <img src="https://github.com/eshita19/oracle-db/blob/master/group_funcs.png"></img>
   - https://github.com/eshita19/oracle-db/blob/master/multi-row-func.sql
   
## Multi Table joins:
   - https://github.com/eshita19/oracle-db/blob/master/multi-table.sql
   
   
   
   
   
  
