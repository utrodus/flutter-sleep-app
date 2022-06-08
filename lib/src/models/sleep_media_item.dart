class SleepMediaItem {
  final String title;
  final SleepMediaCategory category;
  final String duration;
  final String imgUrl;
  final String description;
  final String mediaUrl;
  final String totalFavorite;
  final String totalListening;
  SleepMediaItem({
    required this.title,
    required this.category,
    required this.duration,
    required this.imgUrl,
    required this.description,
    required this.mediaUrl,
    required this.totalFavorite,
    required this.totalListening,
  });
}

class SleepMediaCategory {
  late int id;
  late String name;
  SleepMediaCategory({
    required this.id,
    required this.name,
  });
}

List<SleepMediaItem> sleepMediaList = [
  SleepMediaItem(
    title: 'Aku dan Sepi Yang Kusimpan Rapi',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "03:14",
    imgUrl: "https://i.ibb.co/r0Ln7Wc/image-akudansepi.jpg",
    description:
        "Yang membuat kesendirian menjadi penderitaan bukan karena aku tidak memiliki siapa pun untuk berbagi beban, tetapi ini: Aku hanya memiliki beban sendiri untuk ditanggung.",
    mediaUrl:
        "https://archive.org/download/kapan-menikah-cerita-sebelum-tidur/stories/Aku%20dan%20Sepi%20Yang%20Kusimpan%20Rapi%20%20Cerita%20Sebelum%20Tidur%20Podcast%20%20Dialog%20Rindu.mp3",
    totalFavorite: "312",
    totalListening: "5.412",
  ),
  SleepMediaItem(
    title: 'Kapan Menikah ?',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "03:15",
    imgUrl: "https://i.ibb.co/9qt8MYP/image-kapanmenikah.jpg",
    description:
        "Jangan terlalu yakin jika kita benar-benar mencintai pasangan kita karena dalam pernikahan dibutuhkan jatuh cinta setiap harinya",
    mediaUrl:
        "https://archive.org/download/kapan-menikah-cerita-sebelum-tidur/stories/KAPAN%20MENIKAH%20%20%20%20Cerita%20Sebelum%20Tidur.mp3",
    totalFavorite: "412",
    totalListening: "6.123",
  ),
  SleepMediaItem(
    title: 'Lagi Mikirin Apa Kok Belum Tidur',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "02:28",
    imgUrl: "https://i.ibb.co/X3s9wj9/image-lagimikirinapa.jpg",
    description:
        "Kebanyakan orang tak bisa tidur, mereka hanya tertidur, karena sepanjang siang dan malam hari mereka diberati oleh dunia.",
    mediaUrl:
        "https://archive.org/download/kapan-menikah-cerita-sebelum-tidur/stories/LAGI%20MIKIRIN%20APA%20KOK%20BELUM%20TIDUR%20%20%20I%20Puisi%20Bedcover.mp3",
    totalFavorite: "512",
    totalListening: "2.123",
  ),
  SleepMediaItem(
    title: 'Nyatakan Sekarang Sebelum Menyesal',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "02:31",
    imgUrl: "https://i.ibb.co/vhTvFHf/image-nyatakansekarang.jpg",
    description:
        "Ketika seseorang membuat kamu menjadi orang yang paling bahagia dan orang paling menyedihkan pada saat yang sama, itulah saat yang nyata. Itu adalah sesuatu yang berharga.",
    mediaUrl:
        "https://archive.org/download/kapan-menikah-cerita-sebelum-tidur/stories/Nyatakan%20sekarang%20sebelum%20menyesal%20teaser%20episode%20141%20Podcast%20Teman%20Tidur.mp3",
    totalFavorite: "331",
    totalListening: "4.123",
  ),
  SleepMediaItem(
    title: 'Seandainya Waktu Dapat Kuulang',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "03:08",
    imgUrl: "https://i.ibb.co/N7NkTWQ/image-seandainyawaktu.jpg",
    description:
        "Apabila sebuah penyesalah merupakan sebuah pengalaman, maka hikmah adalah sebuah hal besar yang terkandung di dalamnya",
    mediaUrl:
        "https://archive.org/download/kapan-menikah-cerita-sebelum-tidur/stories/SEANDAINYA%20WAKTU%20DAPAT%20KUULANG%20%20Cerita%20Sebelum%20Tidur.mp3",
    totalFavorite: "612",
    totalListening: "3.123",
  ),
  SleepMediaItem(
    title: 'Kapan Terakhir Kali Nyenengin Diri Sendiri',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "03:17",
    imgUrl: "https://i.ibb.co/s2pW4sq/kapan-nyenengin.jpg",
    description:
        "Waktumu itu terbatas, jadi jangan menyia-nyiakannya dengan menjalani hidup orang lain.",
    mediaUrl:
        "https://archive.org/download/kapan-terakhir-kali-nyenengin-diri-sendiri-i-puisi-bedcover_202206/KAPAN%20TERAKHIR%20KALI%20NYENENGIN%20DIRI%20SENDIRI%20%20I%20Puisi%20Bedcover.mp3",
    totalFavorite: "552",
    totalListening: "10.123",
  ),
  SleepMediaItem(
    title: 'Sudut Suara',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "01:51",
    imgUrl: "https://i.ibb.co/QjWRN0X/sudut-suara.jpg",
    description:
        "Tetapi Tuan... kemustahilan itulah yang kerap kali memupuk cinta.",
    mediaUrl:
        "https://archive.org/download/bukan-hanya-tentang-nyaman/SUDUT%20SUARA%20.mp3",
    totalFavorite: "773",
    totalListening: "1.123",
  ),
  SleepMediaItem(
    title: 'Bukan Hanya Tentang Nyaman',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep Story',
    ),
    duration: "04:42",
    imgUrl: "https://i.ibb.co/CMHmZqf/bukan-hanya-tentang-nyaman.jpg",
    description:
        "Kenyamanan adalah penjara kebebasan dan hambatan untuk berkembang.",
    mediaUrl:
        "https://archive.org/download/bukan-hanya-tentang-nyaman/Bukan%20Hanya%20Tentang%20Nyaman.mp3",
    totalFavorite: "1234",
    totalListening: "4.321",
  ),
  SleepMediaItem(
    title: 'Don\'t Cry',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "02:31",
    imgUrl: "https://i.ibb.co/6Y49Wfr/Dont-Cry.jpg",
    description:
        "Jika Anda tidak memperjuangkan apa yang Anda inginkan, jangan menangis untuk setiap kehilangan yang Anda rasakan.",
    mediaUrl:
        "https://archive.org/download/forget-jakarta-adhitia-sofyan-original-audio-only/sleep%20music/Dont%20Cry.mp3",
    totalFavorite: "86",
    totalListening: "5.856",
  ),
  SleepMediaItem(
    title: 'Forget Jakarta',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "06:42",
    imgUrl: "https://i.ibb.co/M6VKsHN/forget-jakarta.jpg",
    description:
        "Jakarta itu cinta yang tak hapus oleh hujan tak lekang oleh panas. Jakarta itu kasih sayang.",
    mediaUrl:
        "https://archive.org/download/forget-jakarta-adhitia-sofyan-original-audio-only/sleep%20music/Forget%20Jakarta%20%20Adhitia%20Sofyan%20original%20%20audio%20only.mp3",
    totalFavorite: "12.000",
    totalListening: "4000.000",
  ),
  SleepMediaItem(
    title: 'Song for my wife',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "02:35",
    imgUrl:
        "https://i.ibb.co/d6r4MCB/I-made-a-song-for-my-wiferead-description.jpg",
    description:
        "Do you remember our first time when we were 12 years old ? Please stay by my side until everything becomes a memory I'll live just one more day than you",
    mediaUrl:
        "https://archive.org/download/forget-jakarta-adhitia-sofyan-original-audio-only/sleep%20music/I%20made%20a%20song%20for%20my%20wiferead%20description.mp3",
    totalFavorite: "2.000",
    totalListening: "45.154",
  ),
  SleepMediaItem(
    title: 'Meditation',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "03:34",
    imgUrl: "https://i.ibb.co/JB4pg9b/Meditation.jpg",
    description:
        "In every happy moment, I know an inevitable shadow, the Sadness, is coming. So I tend to feel both sentiments at the same time. I made this tune in one of these moments. ",
    mediaUrl:
        "https://archive.org/download/forget-jakarta-adhitia-sofyan-original-audio-only/sleep%20music/Meditation.mp3",
    totalFavorite: "14.000.000",
    totalListening: "74.737",
  ),
  SleepMediaItem(
    title: 'Study Night',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "04:10",
    imgUrl: "https://i.ibb.co/t20SWFL/Study-Night.jpg",
    description:
        "That's the advantage of insomnia. People who go to be early always complain that the night is too short, but for those of us who stay up all night, it can feel as long as a lifetime. You get a lot done",
    mediaUrl:
        "https://archive.org/download/forget-jakarta-adhitia-sofyan-original-audio-only/sleep%20music/Study%20Night.mp3",
    totalFavorite: "25.000",
    totalListening: "1.390",
  ),
  SleepMediaItem(
    title: 'To The Stars',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "04:10",
    imgUrl: "https://i.ibb.co/fd28dZ3/To-the-Stars.jpg",
    description:
        "Don't ever stop reaching for the stars. Even if they remain out of reach, you'll still go further than if you didn't bother to try.",
    mediaUrl:
        "https://archive.org/download/forget-jakarta-adhitia-sofyan-original-audio-only/sleep%20music/To%20the%20Stars.mp3",
    totalFavorite: "3.752",
    totalListening: "92",
  ),
  SleepMediaItem(
    title: 'Novo Amor - Ontario',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "03:32",
    imgUrl: "https://i.ibb.co/nLGwDcs/maxresdefault.jpg",
    description:
        "Beristirahatlah saat Kamu lelah. Segarkan dan perbarui dirimu, tubuhmu, pikiranmu, jiwamu. Lalu, kembali bekerja.",
    mediaUrl:
        "https://archive.org/download/senar-senja-dialog-hujan/Ontario%20.mp3",
    totalFavorite: "1.752",
    totalListening: "8.300",
  ),
  SleepMediaItem(
    title: 'Dialog Hujan',
    category: SleepMediaCategory(
      id: 2,
      name: 'Sleep Music',
    ),
    duration: "03:32",
    imgUrl: "https://i.ibb.co/WHHBTMj/Dialog-Hujan.jpg",
    description:
        "Hujan selalu mengerti, meski dia jatuh berulang ulang tetapi dia selalu setia pada yang ia jatuhkan hatinya",
    mediaUrl:
        "https://archive.org/download/senar-senja-dialog-hujan/Senar%20Senja%20%20Dialog%20Hujan.mp3",
    totalFavorite: "75.000",
    totalListening: "7.204",
  ),
];
