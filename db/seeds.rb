[
  ["Star Wars", "PG", "1977-05-02 00:00:00 UTC", "Star Wars is an American epic space opera franchise centered on a film series created by George Lucas"],
  ["Aladdin", "G", "1992-11-25 00:00:00 UTC", "Aladdin is a 1992 American animated musical fantasy film"],
  ["The Terminator", "R", "1984-10-26 00:00:00 UTC", "The Terminator is a 1984 American science fiction action film directed by James Cameron"],
  ["When Harry Met Sally", "R", "1989-07-21 00:00:00 UTC", "When Harry Met Sally… is a 1989 American romantic comedy film"],
  ["The Help", "PG-13", "2011-08-10 00:00:00 UTC", "The Help is a 2009 novel by American author Kathryn Stockett"],
  ["Chocolat", "PG-13", "2001-01-05 00:00:00 UTC", "Chocolat (French pronunciation: ​[ʃɔkɔla]) is a 2000 American-British romance film"],
  ["Amelie", "R", "2001-04-25 00:00:00 UTC", "Amélie (French: Le Fabuleux Destin d'Amélie Poulain (French pronunciation: ​[lə.fa.by.lø.dɛs.tɛ̃.da.me.li.puˈlɛ̃])"],
  ["2001: A Space Odyssey", "G", "1968-04-06 00:00:00 UTC", "2001: A Space Odyssey is a 1968 American-British science fiction film produced and directed by Stanley Kubrick."],
  ["The Incredibles", "PG", "2004-11-05 00:00:00 UTC", "The Incredibles is a 2004 American computer-animated comedy superhero film"],
  ["Raiders of the Lost Ark", "PG", "1981-06-12 00:00:00", "Raiders of the Lost Ark (later marketed as Indiana Jones and the Raiders of the Lost Ark) "],
  ["Chicken Run", "G", "2000-06-21 00:00:00", "Chicken Run is a 2000 British-American stop-motion animated comedy film"]
].each do |(title, rating, date, description)|
  Movie.create! title: title, rating: rating, release_date: DateTime.parse(date), description: description
end
