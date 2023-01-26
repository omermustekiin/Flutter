# Get It Done


Uygulama Splash Screen ile açılıyor.

Settings kısmından tema değişikliği yapılabiliyor. 

Kullanıcılar yeni görev ekleyebiliyor ve eklenilen görevler üzerinde çeşitli değişiklikler yapabiliyor.

Yapılan yenilik ve değişiklikler provider paketi ile bütün widget ağacına yayınlanıyor ve state management bu şekilde yapılyor. 

State management provider paketi ile kullanıcı tuşa basıp yeni görev eklediği zaman, görevlerin yapılıp yapılmadığını tikleyip işaretleyebiliyor ve bu değişikliklier provider paketi ile sağlanıyor.

Kullanıcı, kaydırma işlemi ile görev silebiliyor ve state yönetimi ile uygulamanın ilgili widget’ları kendini yeniden inşa edebiliyor. 

Tema ve görev kartı bilgilerini cihazın shared prefernces’ına kaydedebiliyoruz ve uygulama kapatıp açıldığı zaman kullanıcının yapmış olduğu işlemler kaybedilmiyor.

Veri tabanı yönetimi en basit hali ıle shared preferences ile sağlanmıştır.
