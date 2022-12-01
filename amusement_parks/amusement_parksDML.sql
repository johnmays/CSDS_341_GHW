-- find all parks in the U.S.
select park.name from park, location where country = 'USA' or country = 'U.S.A.' or country = 'United States'

-- find all rides in a specific park
