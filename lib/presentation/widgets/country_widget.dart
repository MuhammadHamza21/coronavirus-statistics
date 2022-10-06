import 'package:coronavirus_statistics/Models/country_model.dart';
import 'package:coronavirus_statistics/presentation/screens/specefic_country_screen.dart';
import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  final CountryModel country;
  // ignore: use_key_in_widget_constructors
  const CountryWidget({required this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificCountry(
              country: country,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 70,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image(
                height: 50,
                width: 80,
                image: NetworkImage(
                  '${country.countryInfo!.flag}',
                ),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.country!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${country.cases}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
