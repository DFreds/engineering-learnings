import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_samples/network_request_list/my_repo.dart';
import 'package:my_flutter_samples/network_request_list/photo.dart';

class NetworkRequestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Request List'),
      ),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return FutureBuilder<List<Photo>>(
      future: MyRepo.fetchPhotos(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return _createPhotoWidget(snapshot.data[index]);
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _createPhotoWidget(Photo photo) {
    double rating = Random().nextDouble() + Random().nextInt(4).toDouble();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // Image.network(photo.thumbnailUrl),
          // below requires package
          _createImageWidget(photo.thumbnailUrl),

          SizedBox(width: 15.0),

          // expanded to tell it to take priority over image
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _createTitle(photo.title),
                SizedBox(height: 8.0),
                _createDetail(photo.title),
                SizedBox(height: 14.0),
                _createStarsRow(rating),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createImageWidget(String thumbnailUrl) {
    return CachedNetworkImage(
      placeholder: Container(
        height: 150.0,
        width: 150.0,
        color: Colors.grey,
      ),
      imageUrl: thumbnailUrl,
    );
  }

  Widget _createTitle(String title) {
    return Text(
      title.substring(0, 8),
      style: TextStyle(
        color: const Color(0xFF343A40),
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createDetail(String detail) {
    return Text(
      detail,
      style: TextStyle(
        color: const Color(0xFF6C757D),
        fontSize: 18.0,
      ),
    );
  }

  Widget _createStarsRow(double rating) {
    List<Widget> stars = [];
    double initalRating = rating;

    while (rating > 0) {
      rating = rating - 1;

      if (rating > 0) {
        stars.add(Icon(Icons.star));
      } else if (rating < 0 && rating > -0.5) {
        stars.add(Icon(Icons.star_half));
      }
    }

    while (stars.length < 5) {
      stars.add(Icon(Icons.star_border));
    }

    return Row(
      children: stars..add(Text(' (${initalRating.toString().substring(0, 3)})')),
    );
  }
}
