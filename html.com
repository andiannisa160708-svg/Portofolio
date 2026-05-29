<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Portfolio | Andi Annisa</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      scroll-behavior: smooth;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: #0f172a;
      color: #f8fafc;
      overflow-x: hidden;
    }

    body::before {
      content: "";
      position: fixed;
      width: 500px;
      height: 500px;
      background: radial-gradient(circle, rgba(99,102,241,0.35), transparent 70%);
      top: -200px;
      right: -100px;
      z-index: -1;
    }

    body::after {
      content: "";
      position: fixed;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(236,72,153,0.25), transparent 70%);
      bottom: -150px;
      left: -100px;
      z-index: -1;
    }

    header {
      width: 100%;
      position: fixed;
      top: 0;
      left: 0;
      padding: 20px 8%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: rgba(15, 23, 42, 0.75);
      backdrop-filter: blur(12px);
      z-index: 1000;
      border-bottom: 1px solid rgba(255,255,255,0.08);
    }

    .logo {
      font-size: 1.5rem;
      font-weight: 700;
      color: #ffffff;
      letter-spacing: 1px;
    }

    nav a {
      text-decoration: none;
      color: #e2e8f0;
      margin-left: 28px;
      font-size: 0.95rem;
      transition: 0.3s;
    }

    nav a:hover {
      color: #a78bfa;
    }

    section {
      padding: 110px 8% 80px;
    }

    .hero {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 50px;
      flex-wrap: wrap;
    }

    .hero-text {
      flex: 1;
      min-width: 300px;
    }

    .hero-text h4 {
      color: #cbd5e1;
      font-size: 1rem;
      margin-bottom: 10px;
      letter-spacing: 2px;
    }

    .hero-text h1 {
      font-size: 4rem;
      line-height: 1.1;
      margin-bottom: 20px;
      background: linear-gradient(to right, #ffffff, #a78bfa);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .hero-text p {
      color: #cbd5e1;
      line-height: 1.8;
      max-width: 650px;
      margin-bottom: 30px;
    }

    .buttons {
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
    }

    .btn {
      padding: 14px 28px;
      border-radius: 50px;
      border: none;
      cursor: pointer;
      font-size: 0.95rem;
      font-weight: 500;
      transition: 0.3s ease;
      text-decoration: none;
      display: inline-block;
    }

    .btn-primary {
      background: linear-gradient(135deg, #8b5cf6, #ec4899);
      color: white;
      box-shadow: 0 10px 25px rgba(168,85,247,0.35);
    }

    .btn-primary:hover {
      transform: translateY(-3px);
      box-shadow: 0 14px 30px rgba(168,85,247,0.45);
    }

    .btn-outline {
      border: 1px solid rgba(255,255,255,0.2);
      color: #fff;
      background: transparent;
    }

    .btn-outline:hover {
      background: rgba(255,255,255,0.08);
    }

    .hero-card {
      flex: 1;
      min-width: 300px;
      display: flex;
      justify-content: center;
    }

    .profile-box {
      width: 350px;
      padding: 35px;
      border-radius: 28px;
      background: rgba(255,255,255,0.06);
      backdrop-filter: blur(15px);
      border: 1px solid rgba(255,255,255,0.1);
      box-shadow: 0 20px 40px rgba(0,0,0,0.35);
      text-align: center;
    }

    .profile-image {
      width: 120px;
      height: 120px;
      margin: auto;
      border-radius: 50%;
      background: linear-gradient(135deg, #8b5cf6, #ec4899);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 20px;
    }

    .profile-box h2 {
      margin-bottom: 10px;
    }

    .profile-box p {
      color: #cbd5e1;
      margin-bottom: 8px;
    }

    .section-title {
      text-align: center;
      margin-bottom: 60px;
    }

    .section-title h2 {
      font-size: 2.5rem;
      margin-bottom: 10px;
    }

    .section-title p {
      color: #cbd5e1;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 25px;
    }

    .card {
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 24px;
      padding: 30px;
      transition: 0.3s ease;
      backdrop-filter: blur(12px);
    }

    .card:hover {
      transform: translateY(-8px);
      border-color: rgba(168,85,247,0.4);
      box-shadow: 0 15px 35px rgba(0,0,0,0.25);
    }

    .card h3 {
      margin-bottom: 15px;
      color: #ffffff;
    }

    .card p {
      color: #cbd5e1;
      line-height: 1.7;
      font-size: 0.95rem;
    }

    .timeline {
      position: relative;
      margin-top: 40px;
    }

    .timeline::before {
      content: "";
      position: absolute;
      left: 20px;
      top: 0;
      width: 2px;
      height: 100%;
      background: rgba(255,255,255,0.15);
    }

    .timeline-item {
      position: relative;
      padding-left: 70px;
      margin-bottom: 40px;
    }

    .timeline-item::before {
      content: "";
      position: absolute;
      left: 11px;
      top: 8px;
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background: linear-gradient(135deg, #8b5cf6, #ec4899);
    }

    .timeline-item h3 {
      margin-bottom: 10px;
    }

    .timeline-item span {
      display: inline-block;
      margin-bottom: 10px;
      color: #a78bfa;
      font-size: 0.9rem;
    }

    .skills {
      display: flex;
      flex-wrap: wrap;
      gap: 15px;
      justify-content: center;
      margin-top: 30px;
    }

    .skill {
      padding: 12px 20px;
      border-radius: 50px;
      background: rgba(255,255,255,0.08);
      border: 1px solid rgba(255,255,255,0.1);
      color: #fff;
      transition: 0.3s;
    }

    .skill:hover {
      background: linear-gradient(135deg, #8b5cf6, #ec4899);
      transform: scale(1.05);
    }

    footer {
      padding: 35px 8%;
      text-align: center;
      color: #94a3b8;
      border-top: 1px solid rgba(255,255,255,0.08);
      margin-top: 40px;
    }

    @media(max-width: 900px) {
      .hero {
        flex-direction: column;
        text-align: center;
      }

      .buttons {
        justify-content: center;
      }

      .hero-text h1 {
        font-size: 3rem;
      }

      nav {
        display: none;
      }
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">ANDI ANNISA</div>
    <nav>
      <a href="#about">Tentang</a>
      <a href="#experience">Pengalaman</a>
      <a href="#achievement">Pencapaian</a>
      <a href="#skills">Skill</a>
      <a href="#contact">Kontak</a>
    </nav>
  </header>

  <section class="hero">
    <div class="hero-text">
      <h4>PORTFOLIO WEBSITE</h4>
      <h1>ANDI ANNISA</h1>
      <p>
        Mahasiswa perempuan yang aktif, kreatif, dan memiliki minat besar di bidang komunikasi digital,
        desain modern, serta pengembangan media kreatif. Memiliki kemampuan dalam membangun ide inovatif,
        bekerja dalam tim, dan beradaptasi dengan cepat di lingkungan profesional maupun akademik.
      </p>

      <div class="buttons">
        <a href="#about" class="btn btn-primary">Lihat Profil</a>
        <a href="#contact" class="btn btn-outline">Hubungi Saya</a>
      </div>
    </div>

    <div class="hero-card">
      <div class="profile-box">
        <div class="profile-image">AA</div>
        <h2>Andi Annisa</h2>
        <p>Mahasiswa</p>
        <p>Perempuan</p>
        <p>Makassar, Indonesia</p>
        <p>Digital Creative Enthusiast</p>
      </div>
    </div>
  </section>

  <section id="about">
    <div class="section-title">
      <h2>Tentang Saya</h2>
      <p>Profil singkat dan perjalanan akademik</p>
    </div>

    <div class="grid">
      <div class="card">
        <h3>Bio</h3>
        <p>
          Andi Annisa adalah mahasiswa yang dikenal aktif dalam kegiatan organisasi dan pengembangan proyek kreatif.
          Sejak awal perkuliahan, ia memiliki ketertarikan pada dunia desain visual, branding digital, dan teknologi.
          Dengan kemampuan komunikasi yang baik dan pola pikir inovatif, ia terus mengembangkan potensi diri untuk
          menjadi profesional muda yang adaptif dan berpengaruh di era digital.
        </p>
      </div>

      <div class="card">
        <h3>Pendidikan</h3>
        <p>
          Sedang menempuh pendidikan sarjana dengan fokus pada pengembangan keterampilan komunikasi, teknologi,
          serta manajemen proyek kreatif. Aktif mengikuti seminar nasional, workshop digital branding,
          dan berbagai pelatihan pengembangan diri.
        </p>
      </div>

      <div class="card">
        <h3>Kepribadian</h3>
        <p>
          Memiliki karakter disiplin, bertanggung jawab, mudah beradaptasi, dan mampu bekerja secara kolaboratif.
          Senang mengeksplorasi ide baru dan memiliki motivasi tinggi dalam meningkatkan kualitas diri dan karier.
        </p>
      </div>
    </div>
  </section>

  <section id="experience">
    <div class="section-title">
      <h2>Pengalaman Kerja</h2>
      <p>Pengalaman profesional dan organisasi</p>
    </div>

    <div class="timeline">
      <div class="timeline-item">
        <h3>Creative Media Intern</h3>
        <span>2024 - 2025 | Vision Creative Studio</span>
        <p>
          Bertanggung jawab dalam membuat desain konten media sosial, membantu pengelolaan branding digital,
          serta mendukung kampanye promosi online untuk berbagai klien lokal.
        </p>
      </div>

      <div class="timeline-item">
        <h3>Social Media Specialist</h3>
        <span>2023 - 2024 | Bright Agency</span>
        <p>
          Mengelola strategi media sosial, meningkatkan interaksi audiens, dan membuat konsep konten kreatif
          yang berhasil meningkatkan engagement hingga 40%.
        </p>
      </div>

      <div class="timeline-item">
        <h3>Ketua Divisi Kreatif Organisasi Kampus</h3>
        <span>2022 - 2023 | Organisasi Mahasiswa</span>
        <p>
          Memimpin tim kreatif dalam penyelenggaraan acara kampus, pembuatan desain promosi,
          dan pengembangan identitas visual organisasi.
        </p>
      </div>
    </div>
  </section>

  <section id="achievement">
    <div class="section-title">
      <h2>Pencapaian & Karier</h2>
      <p>Prestasi dan perjalanan pengembangan diri</p>
    </div>

    <div class="grid">
      <div class="card">
        <h3>Best Creative Project 2025</h3>
        <p>
          Meraih penghargaan proyek kreatif terbaik dalam kompetisi media digital tingkat nasional
          berkat inovasi kampanye visual yang interaktif dan modern.
        </p>
      </div>

      <div class="card">
        <h3>Top 10 Young Digital Talent</h3>
        <p>
          Masuk dalam daftar talenta muda kreatif pada ajang pengembangan digital creator
          yang diikuti oleh mahasiswa dari berbagai universitas di Indonesia.
        </p>
      </div>

      <div class="card">
        <h3>Speaker Seminar Mahasiswa</h3>
        <p>
          Menjadi pembicara dalam seminar pengembangan personal branding dan kreativitas digital
          untuk mahasiswa dan generasi muda.
        </p>
      </div>
    </div>
  </section>

  <section id="skills">
    <div class="section-title">
      <h2>Skills</h2>
      <p>Kemampuan dan kompetensi utama</p>
    </div>

    <div class="skills">
      <div class="skill">UI/UX Design</div>
      <div class="skill">Graphic Design</div>
      <div class="skill">Public Speaking</div>
      <div class="skill">Content Writing</div>
      <div class="skill">Digital Marketing</div>
      <div class="skill">Leadership</div>
      <div class="skill">Team Collaboration</div>
      <div class="skill">Creative Thinking</div>
    </div>
  </section>

  <section id="contact">
    <div class="section-title">
      <h2>Kontak</h2>
      <p>Terhubung dan berkolaborasi bersama saya</p>
    </div>

    <div class="grid">
      <div class="card">
        <h3>Email</h3>
        <p>andiannisa.portfolio@gmail.com</p>
      </div>

      <div class="card">
        <h3>Instagram</h3>
        <p>@andiannisa.creative</p>
      </div>

      <div class="card">
        <h3>LinkedIn</h3>
        <p>linkedin.com/in/andiannisa</p>
      </div>
    </div>
  </section>

  <footer>
    <p>© 2026 Andi Annisa — Modern Portfolio Website</p>
  </footer>

</body>
</html>
