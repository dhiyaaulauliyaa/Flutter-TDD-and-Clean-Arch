- Aplikasi dibagi menjadi fitur2, dan setiap fitur dibagi menjadi 3 bagian:
  - Presentation
    presentation berisi hal2 yg berkaitan dengan UI
  - Domain
    domain berisi usecase (biasanya logic utama aplikasi berada disini)
  - Data
    data berisi fungsi2 untuk ngambil data dari datasource
  -> notes: kalo ada widget/fungsi/dll yg dipake di bbrp fitur, pindahin ke core 

- Beda model dan entities:
  - Model 
    - bergantung dengan API yang di consume
    - mempunyai method untuk convert json
  - Entity
    - Tidak bergantung dengan apapun, murni sesuai kebutuhan use case
    - hanya hold property/method yg dibutuhkan oleh use case

- Di domain dan presentation, tidak ada try catch, semua error di handling di bagian data. 
  jika ada error, data akan return failure class

- Untuk melakukan tdd, kita memisahkan domain dan data, lalu bikin contract di repository ]


[VIDEO 4]
Demonstrate cara membangun data layer, dimulai dari pembuatan model.
Proses membuat model:
1. Bikin model, lalu test apakah model tersebut merupakan subclass dari entitynya

Sebelum masuk ke tahap 2, kita harus menguji json yang akan diambil dari network.
dalam TDD, semua file dari network harus direpresntasikan melalui file didalam project, 
hal ini dinamakan FIXTURE.
Untuk membuat fixture, kita tinggal bikin file JSON nya dan bikin method untuk membaca file json
tersebut menjadi JSONMap
2. Bikin factory fromJson, lalu test apakah result dari factory method merupakan model yang tepat
3. Bikin method toJson, lalu test apakah result dari method merupakan jsonMap yang tepat

[VIDEO 5]
lanjut bikin data layer, sekarang ngurusin repository & data sourcenya.
di video ini hanya akan di jelaskan persiapan2 untuk melakukan implementasi repository.
1. Bikin kelas di data layer untuk implemen repository
  - data's repository merupakan otak dari data layer, disitu akan 
    diimplementasikan entity's repository
  - agar repository bisa dites, dependency2 dari repository harus dibuat dulu.
    repository di project ini bergantung pada: 
    1. model (udah dibuat): tipe data dari data yg diproses 
    2. network info: dibutuhkan untuk mengecek konektifitas internet, karena data akan diambil dari API
    3. data source: sumber data repository 

2. Bikin kelas network info:
   - bikin kelas network info, didalemnya ada variabel yg menyatakan status konektifitas
   - taro di core/platform. pokoknya yg ada kaitannya dgn hp seperti 
     sensor, bluetooth dll masuk platform  

3. bikin remote data source 
   - di data source, akan implementasi metod yg sama kaya di entity's repository, bedanya
     return typenya hanyalah model, bukan either (gaada failure class). 
     ini karena data source merupakan layer paling ujung aplikasi yg membatasi dgn dunia luar.
     
3.5 bikin kelas untuk handle exception
   - untuk implemen error, bikin class baru yaitu exception, jadi kalau trycatch nya fail, 
     akan dihandle oleh kelas ini

4. bikin local data source
   - di kelas ini, ada dua metode, yaitu:
     1. metode untuk mengambil trivia yg disimpan di cache
     2. metode untuk menyimpan trivia terakhir  

5. bikin unit test
   seperti biasa sebelum implementasi, harus dilakukan tes.
   di video ini, baru dilakukan persiapan untuk melakukan tes, yaitu bikin mock class  

[VIDEO 6]
disini mulai implementasi repository di data layer. akan ada beberapa step unit test.
1. Bikin unit test untuk cek konektifitas
