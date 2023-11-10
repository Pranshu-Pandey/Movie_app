import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trendingslider.dart';
import 'package:movie_app/widgets/upcomming.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Movie>>? trendingMovies;
  Future<List<Movie>>? topRatedMovies;
  Future<List<Movie>>? upcommingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcommingMovies = Api().getUpcommingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Movie App",
          style: GoogleFonts.aclonica(color: Colors.red, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending Movie",
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      // print(data);
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      return TopRated(snapshot: snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Upcomming movies",
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: upcommingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      return Upcomming(snapshot: snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
