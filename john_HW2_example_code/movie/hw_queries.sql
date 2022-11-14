-- Testing on my own:
--select title, name from movieactor, actor, movie where actor.id = movieactor.actorid and movieactor.movieid = movie.id

-- 3:
-- First natural join:
--select * from movie natural join rating

-- Second:
--select * from (select * from movie natural join rating) as result1 natural join moviegenre
-- Equivalent:
--select * from movie natural join rating natural join moviegenre

-- Third:
--select * from (select * from (select * from movie natural join rating) as result1 natural join moviegenre) as result2 natural join genre
-- Equivalent:
--select * from movie natural join rating natural join movieGenre natural join genre;

-- 5:
-- a)
--select title, movie.rating as rating, description from movie left outer join rating on movie.rating = rating.rating;
-- b)
--select title, rating, description from movie natural join rating;
-- c)
--select movie.title, movie.rating, actor.name, actor.status, movieactor.star from movie left outer join (actor inner join movieactor on actor.id = movieactor.actorid) on movie.id = movieactor.movieid;
-- d)
--select movie.title, movie.rating, actor.name, actor.status, movieactor.star from movie full outer join (actor left outer join movieactor on actor.id = movieactor.actorid) on movie.id = movieactor.movieid;
-- e)
select movie.title, movie.rating, actor.name, actor.status, movieactor.star from movie right outer join (actor left outer join movieactor on actor.id = movieactor.actorid) on movie.id = movieactor.movieid;