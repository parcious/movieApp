import 'package:flutter/material.dart';
import 'package:movie_app/user_model.dart';

class MovieListViewDetails extends StatelessWidget {
  //const MovieListViewDetails({super.key});
  final String movieName;
  final Movie movie;
  const MovieListViewDetails(
      {super.key, required this.movieName, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderwithPoster(movie: movie),
          HorizontaLine(),
          MovieDetailsCast(movie: movie),
          HorizontaLine(),
          MovieDetailsExtraPosters(posters: movie.images)
        ],
      ),
      /*  body: Center(
        child: Container(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back ${this.movie.director}")),
        ),
      ),*/
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail), fit: BoxFit.cover),
              ),
            ),
            Icon(
              Icons.play_circle_fill_outlined,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderwithPoster extends StatelessWidget {
  // const MovieDetailsHeaderwithPoster({super.key});
  final Movie movie;

  const MovieDetailsHeaderwithPoster({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  //const MoviePoster({super.key});
  final String poster;

  const MoviePoster({super.key, required this.poster});
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 140,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year}.${movie.genre}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 46, 11, 173)),
        ),
        Text(
          movie.Title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 16),
        ),
        Text.rich(
          TextSpan(
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              children: [
                TextSpan(text: movie.plot),
                TextSpan(
                    text: "  More ...",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
              ]),
        )
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        
        children: [
          MovieField(field: "Cast", value: movie.Actors,),
          MovieField(field: "Director", value: movie.director),
          MovieField(field: "Awards", value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({super.key, required this.field, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field : ",
          style: TextStyle(
              color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        Expanded(
            child: Text(
          value,
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.w300),
        ))
      ],
    );
  }
}

class HorizontaLine extends StatelessWidget {
  //const HorizontaLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 0.5,
        color: Color.fromARGB(255, 34, 30, 30),
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  // const MovieDetailsExtraPosters({super.key});
  final List<String> posters;

  const MovieDetailsExtraPosters({super.key, required this.posters});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "More ScreenShots".toUpperCase(),
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black26),
        ),
        Container(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posters[index]),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
