delete from actor;
delete from genre;
delete from movie;
delete from movieactor;
delete from moviegenre;
delete from rating;

-- MPA Film Ratings:
insert into rating values ('G', 'General Audiences');
insert into rating values ('PG', 'Parental Guidance Suggested');
insert into rating values ('PG-13', 'Parents Strongly Cautioned');
insert into rating values ('R', 'Restricted');
insert into rating values ('NC-17', 'Adults Only');
insert into rating values ('NR', 'Not Rated');

-- Some Genres:
insert into genre values ('Thriller', 'Movies that elicit suspense.');
insert into genre values ('Horror', 'Movies that scare the viewer.');
insert into genre values ('Drama', 'Movies that use serious tones to confront conflict.');

-- My Favorite Indie Movies:
insert into movie values ('001', 'It Follows', 'R');
insert into movie values ('002', 'Super Dark Times', null);
insert into movie values ('003', 'Watcher', 'R');
insert into movie values ('004', 'Donnie Darko', 'R');

-- Their Actors:
insert into actor values ('001', 'Maika Monroe', 'active');
insert into actor values ('002', 'Keir Gilchrist', 'active');
insert into actor values ('003', 'Jake Weary', 'active');

insert into actor values ('004', 'Owen Campbell', 'active');
insert into actor values ('005', 'Charlie Tahan', 'active');
insert into actor values ('006', 'Elizabeth Cappuccino', 'active');

insert into actor values ('007', 'Burn Gorman', 'active');
insert into actor values ('008', 'Karl Glusman', 'active');

insert into actor values ('009', 'Kyle MacLachlan', 'active');

-- Assigning actors to movies:
insert into movieactor values ('001', '001', 'Y');
insert into movieactor values ('001', '002', 'N');
insert into movieactor values ('001', '003', 'N');

insert into movieactor values ('002', '004', 'Y');
insert into movieactor values ('002', '005', 'Y');
insert into movieactor values ('002', '006', 'Y');

insert into movieactor values ('003', '001', 'Y');
insert into movieactor values ('003', '007', 'N');
insert into movieactor values ('003', '008', 'Y');

-- Assigning genres to movies:
insert into moviegenre values ('001', 'Thriller');
insert into moviegenre values ('001', 'Horror');

insert into moviegenre values ('002', 'Thriller');

insert into moviegenre values ('003', 'Thriller');
insert into moviegenre values ('003', 'Drama');

