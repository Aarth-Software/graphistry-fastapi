CREATE TABLE ld_utility_tab (
    id SERIAL PRIMARY KEY,
    utility_type VARCHAR(50),
    utility_value VARCHAR(50)
);

insert into ld_utility_tab (utility_type,utility_value)
values ('DEFAULT_GRAPH','cdd490e3dd154b819da31fb82c67fc1a');