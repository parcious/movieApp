import 'package:flutter/material.dart';
import 'package:movie_app/movie_details.dart';
import 'package:movie_app/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movie> movieList = Movie.getMovies();
  final List Movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of The Wall Street",
    "InterSeller",
    "Game Of Thrones",
    "Vikings"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Movies List",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 95, 132),
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              movieCard(movieList[index], context),
              Positioned(
                  top: 10, child: movieImage(movieList[index].images[2])),
            ]);
            /*  return Card(
              elevation: 4.8,
              color: Colors.white,
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(movieList[index].images[2]),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: null,
                    ),
                  ),
                  trailing: Text("..."),
                  title: Text(movieList[index].Title),
                  subtitle: Text("${movieList[0].Title}"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieListViewDetails(
                                  movieName: movieList.elementAt(index).Title,
                                  movie: movieList[index],
                                )));
                  }
                  // debugPrint("Movie Name : ${Movies.elementAt(index)}"),
                  ),
            );*/
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 55),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        movie.Title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "Rating: ${movie.imdbrating}/10",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Released : ${movie.released}",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      movie.rated,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.Title,
                      movie: movie,
                    )))
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??
                  'https://images8.alphacoders.com/103/1030452.jpg'),
              fit: BoxFit.cover)),
    );
  }
}
