-- (1) Are tables working?
select * from park -- or location or zone
select * from park where park.name='CheeseLand'


-- (2) slightly advances queries
    -- find all parks in the U.S.
select park.name from park, location where country = 'USA' or country = 'U.S.A.' or country == 'United States'

    -- look for duplicate zones
select zonename, count(zonename) from zone group by zonename having count(zonename) > 1

    -- return two parknames of duplicate zones
    -- DO LATER