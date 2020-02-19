DECLARE
    l_message varchar(20) := 'Eshita';
    l_number number;
BEGIN 
    l_number := 1/0;
    DBMS_OUTPUT.put_line(l_message);
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.put_line(SQLERRM);
END;
