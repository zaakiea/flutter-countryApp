import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          MemberCard(
            name: 'Dzaki Eka Atmaja',
            nim: '21120123130068',
            group: 'Kelompok 25',
            shift: 'Shift 2',
            imageUrl:
                'https://i.pinimg.com/736x/67/67/45/676745f2e336e5f4dbe554e2c113652c.jpg',
            githubUrl: 'https://github.com/zaakiea',
          ),
          MemberCard(
            name: 'Nama Anggota Lain',
            nim: 'NIM Anggota Lain',
            group: 'Kelompok 25',
            shift: 'Shift 2',
            imageUrl:
                'https://via.placeholder.com/150', // Ganti dengan URL foto
            githubUrl:
                'https://github.com/username-lain', // Ganti dengan URL GitHub
          ),
          // Tambahkan MemberCard lain di sini untuk anggota lainnya
          MemberCard(
            name: 'Nama Anggota Lain',
            nim: 'NIM Anggota Lain',
            group: 'Kelompok 25',
            shift: 'Shift 2',
            imageUrl:
                'https://via.placeholder.com/150', // Ganti dengan URL foto
            githubUrl:
                'https://github.com/username-lain', // Ganti dengan URL GitHub
          ),
          MemberCard(
            name: 'Nama Anggota Lain',
            nim: 'NIM Anggota Lain',
            group: 'Kelompok 25',
            shift: 'Shift 2',
            imageUrl:
                'https://via.placeholder.com/150', // Ganti dengan URL foto
            githubUrl:
                'https://github.com/username-lain', // Ganti dengan URL GitHub
          ),
        ],
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String nim;
  final String group;
  final String shift;
  final String imageUrl;
  final String githubUrl;

  const MemberCard({
    super.key,
    required this.name,
    required this.nim,
    required this.group,
    required this.shift,
    required this.imageUrl,
    required this.githubUrl,
  });

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text('NIM: $nim'),
                  Text('$group / $shift'),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () => _launchURL(githubUrl),
                    child: Text(
                      'GitHub Profile',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
