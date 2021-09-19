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