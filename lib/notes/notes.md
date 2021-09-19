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
