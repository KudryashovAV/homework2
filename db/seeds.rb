[
  ["Star Wars", "PG", "1977-05-02 00:00:00 UTC", "Star Wars is an American epic space opera franchise centered on a film series created by George Lucas", "1"],
  ["Aladdin", "G", "1992-11-25 00:00:00 UTC", "Aladdin is a 1992 American animated musical fantasy film", "2"],
  ["The Terminator", "R", "1984-10-26 00:00:00 UTC", "The Terminator is a 1984 American science fiction action film directed by James Cameron", "3"],
  ["When Harry Met Sally", "R", "1989-07-21 00:00:00 UTC", "When Harry Met Sally… is a 1989 American romantic comedy film", "1"],
  ["The Help", "PG-13", "2011-08-10 00:00:00 UTC", "The Help is a 2009 novel by American author Kathryn Stockett", "2"],
  ["Chocolat", "PG-13", "2001-01-05 00:00:00 UTC", "Chocolat (French pronunciation: ​[ʃɔkɔla]) is a 2000 American-British romance film", "3"],
  ["Amelie", "R", "2001-04-25 00:00:00 UTC", "Amélie (French: Le Fabuleux Destin d'Amélie Poulain (French pronunciation: ​[lə.fa.by.lø.dɛs.tɛ̃.da.me.li.puˈlɛ̃])", "2"],
  ["2001: A Space Odyssey", "G", "1968-04-06 00:00:00 UTC", "2001: A Space Odyssey is a 1968 American-British science fiction film produced and directed by Stanley Kubrick.", "3"],
  ["The Incredibles", "PG", "2004-11-05 00:00:00 UTC", "The Incredibles is a 2004 American computer-animated comedy superhero film", "1"],
  ["Raiders of the Lost Ark", "PG", "1981-06-12 00:00:00", "Raiders of the Lost Ark (later marketed as Indiana Jones and the Raiders of the Lost Ark)", "2"],
  ["Chicken Run", "G", "2000-06-21 00:00:00", "Chicken Run is a 2000 British-American stop-motion animated comedy film", "3"]
].each do |(title, rating, date, description, user_id)|
  Movie.create! title: title, rating: rating, release_date: DateTime.parse(date), description: description, user_id: user_id 
end
[
  ["123@qwe.qwe","123", true],
  ["qwe@qwe.qwe","123", false],
  ["asd@asd.asd","123", false]
].each do |(email, password, admin)|
  User.create! email: email, password: password, admin: admin
end
