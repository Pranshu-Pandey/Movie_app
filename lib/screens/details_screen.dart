import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: EdgeInsetsDirectional.only(top: 16, start: 16),
              decoration: BoxDecoration(
                color: Colours.scaffoldBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
            ),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title.toString(),
                style: GoogleFonts.belleza(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${constants.imagePath}${movie.backdrop_path}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    "Overview",
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${movie.overview}',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text('Release Date : ' + '${movie.release_date}')
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
