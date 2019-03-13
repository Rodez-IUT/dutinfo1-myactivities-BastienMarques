CREATE OR REPLACE FUNCTION get_default_owner() RETURNS "user" AS $$
	DECLARE
		defaultOwner "user"%rowtype;
		defaultOwnerUsername varchar(500) := 'Default Owner';
     BEGIN
     	select * into defaultOwner from "user"
     		where username= defaultOwnerUsername;
     	IF not found THEN
     		insert into "user" (id, username)
     			values (nextval('id_generator'),defaultOwnerUsername);
     		select * into defaultOwner from "user"
     			where username =defaultOwnerUsername;
     	END IF;
     	RETURN defaultOwner;
     END	
$$ LANGUAGE plpgsql;
