import 'package:flutter/material.dart';

void main() {
  runApp(const AyatApp());
}

class AyatApp extends StatelessWidget {
  const AyatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'آيات',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<Map<String, String>> videos = [
    {'title': 'سورة الفاتحة - تلاوة خاشعة', 'user': '@quran_karim', 'likes': '12.5K'},
    {'title': 'آية الكرسي - بصوت جميل', 'user': '@ayat_daily', 'likes': '8.2K'},
    {'title': 'سورة يس - 15 ثانية من السكينة', 'user': '@noor_quran', 'likes': '25K'},
    {'title': 'دعاء الصباح - ابدأ يومك بذكر الله', 'user': '@doaa_sabah', 'likes': '5.1K'},
    {'title': 'سورة الرحمن - فبأي آلاء ربكما تكذبان', 'user': '@rahman_tilawa', 'likes': '18K'},
    {'title': 'فأنت تقرأ سورة الكهف', 'username': '@ayat_daily', 'videoUrl': 'https://res.cloudinary.com/jdqsmgw0/video/upload/c5cfd603_Facebook_Video.mp4', 'likes': '1.5K', 'comments': '120', 'shares': '80'},
  ];
{'title': 'فأنت تقرأ سورة الكهف', 'username': '@ayat_daily', 'videoUrl': 'https://res.cloudinary.com/jdqsmgw0/video/upload/c5cfd603_Facebook_Video.mp4', 'likes': '1.5K', 'comments': '120', 'shares': '80'},
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('آيات', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.tealAccent)),
        centerTitle: true,
        actions: const [Icon(Icons.search, color: Colors.white), SizedBox(width: 16)],
      ),
      body: _index == 0 ? _buildFeed() : _buildProfile(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white60,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }

  Widget _buildFeed() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final v = videos[index];
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.teal.shade900, Colors.black],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_circle_fill, size: 100, color: Colors.white70),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(v['title']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    Text(v['user']!, style: const TextStyle(color: Colors.tealAccent, fontSize: 18)),
                    const SizedBox(height: 10),
                    Text('❤️ ${v['likes']}  •  فيديو قصير 15 ثانية', style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              Positioned(
                right: 16, bottom: 100,
                child: Column(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red, size: 35),
                    Text(v['likes']!),
                    const SizedBox(height: 20),
                    const Icon(Icons.comment, color: Colors.white, size: 35),
                    const Text('234'),
                    const SizedBox(height: 20),
                    const Icon(Icons.share, color: Colors.white, size: 35),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfile() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, backgroundColor: Colors.teal, child: Icon(Icons.person, size: 60, color: Colors.white)),
          SizedBox(height: 16),
          Text('أهلاً بك في آيات', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('منصة مقاطع الفيديو القصيرة الإسلامية', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
