## İleri Seviye Uygulamalar
Buradaki uygulamalar kullanıma hazır, code refectoring içeren ve bazılarında gerek duyulmasa veya kullanılmasa bile çoğunda uygulama mimarisi içeren 
(genellikle MVMM) ve Provider, Getx, Bloc, Riverpod gibi çeşitli kütüphaneler ile state management sağlanmış, try catch yapısı ile hata yönetimi sağlayan, 
API'ler ile veya SQLite, Firebase, Firestore gibi veri tabanları ile uyumlu çalışan servisleri olan, ileri seviye widget ve paketleri içeren uygulamalardır.

#### *Trip and Travel*
State management'ı Bloc / Cubit ile sağlanmış ve uygulamada bulunan verilerin http isteği ile bir API'den çekilip sunulduğu, çeşitli widget ve paketlerin kullanıldığı bir seyahat uygulamasıdır.

#### *Get It Done*
Provider ile state management sağlanmış, kullanıcıların görev kartları ekleyebildiği, kartlar üzerinde çeşitli işlemler gerçekleştirebildiği ve yapılan bu işlemlerin shared preferences ile cihaz hafızasında saklandığı bir "to-do list" uygulamasıdır.

#### *Instagram Clone*
Firebase ve Firestore ile geliştirdiğim Web, IOS ve Android platformlarında responsive olarak çalışabilen bir Instagram klonudur. Authentication, profil oluşturma, gönderi ekleme, kullanıcıları takip etme ve gönderi beğenme gibi Instagramın içerdiği çeşitli sosyal medya etkileşimlerini tamamı ile kapsar.

#### *Library App*
Kullanıcıların yeni kitap ekleyebildiği, eklenilen kitap listeleri üzerinde düzenleme, silme ve ödünç kayıt listesi oluşturma işlemlerini gerçekleştirebildiği, ödünç kayıt listesi ekranında profil fotoğrafı gibi bilgiler ile birden fazla kullanıcı ekleyebildiği, yeni eklenen kitapları arama çubuğu ile filtreleyebildiği, yapılan işlemlerin gerçek zamanlı olarak Firestore bulut veritabanında da güncellendiği ve bu bağlamda Firestore ile ilgili CRUD işlemlerini gerçekleştiren servis ve metotları olan, MVMM Mimarisi ile oluşturulmuş dinamik bir kütüphane uygulamasıdır.

#### *Task Maven*
Dynamic Theme & Local Push Notification & Get Storage & GetX Listview & Using Sqlite & Sqflite CRUD With Local Scheduled Notifications

Task Maven, kullanıcıların görev eklediği ve bu görev kartları üzerinde çeşitli işlemler yapabildiği, yerel bildirimlerin ve tema değişikliklerinin bulunduğu, GetX Route Management ve GetX Navigation kullanılmış, dinamik, gelişmiş ve kullanıcı dostu bir "to-do list" uygulamasıdır.

#### *Amazon E-Commerce App (Tamamlandı. İçerik bekleniyor...)*

Firebase ve Firestore ile geliştirdiğim, Web, IOS ve Android platformlarında responsive olarak çalışabilen, 10+ farklı ekran arayüzüne ve ihtiyaca yönelik kendim oluşturduğum 20+ farklı özel widget'a sahip, Provider ile state management sağlanmış, Authentication ve Cloud Firestore veritabanı ile ilgili servis metotları içeren, dinamik ve gerçek zamanlı bir Amazon E-ticaret uygulaması.

Kullanıcılar kayıt olduktan sonra hesaplarına giriş yapıp, reklam içerikleri bulunan ana sayfadan çeşitli indirim kategorilerinde bulunan ürünleri inceleyip satın alabilir veya sepetine ekleyebilir. Arama çubuğu ile ürün araması yapılabilir. Kullanıcılar satış yap ekranında bir ürün satışı yapabilir ve satışı yapılan ürün ana sayfada ilgili indirim oranına göre listelenmiş ürünlerin arasında gösterilerek erişilebilir hale gelir. Yapılan tüm işlemler gerçek zamanlı olarak veri tabanında "kullanıcılar", "ürünler", "satışa konan ürünler", "sepet", "siparişi tamamlanan ürünler" olarak ayrı ayrı collection ve document'ler halinde kaydedilir.
