intex.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Indislay - Transforming Social Media</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
  <style>
    /* Basic Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    :root {
      --primary: #FF5722;
      --secondary: #FF8A65;
      --accent: #FFB74D;
      --dark: #1A1A1A;
      --light: #f5f5f5;
      --gradient: linear-gradient(135deg, var(--primary), var(--secondary));
      --gradient-accent: linear-gradient(135deg, var(--secondary), var(--accent));
    }

    body {
      font-family: 'Inter', sans-serif;
      background-color: var(--dark);
      color: var(--light);
      line-height: 1.6;
      scroll-behavior: smooth;
    }

    /* Navigation Bar */
    nav {
      display: flex;
      justify-content: center;
      padding: 20px;
      background: rgba(26, 26, 26, 0.95);
      backdrop-filter: blur(10px);
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 10;
      transition: all 0.3s ease;
    }

    nav.scrolled {
      padding: 15px;
      background: rgba(26, 26, 26, 0.98);
    }

    nav a {
      color: var(--light);
      text-decoration: none;
      padding: 8px 20px;
      font-weight: 500;
      transition: all 0.3s;
      border-radius: 20px;
      margin: 0 5px;
    }

    nav a:hover {
      background: var(--gradient);
      transform: translateY(-2px);
    }

    /* Header Section */
    header {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      text-align: center;
      background: var(--gradient);
      position: relative;
      overflow: hidden;
    }

    header::before {
      content: '';
      position: absolute;
      width: 150%;
      height: 150%;
      background: var(--dark);
      transform: rotate(-3deg);
      top: 85%;
      left: -25%;
    }

    .logo-text {
      font-size: 5rem;
      font-weight: 800;
      margin-bottom: 20px;
      color: var(--light);
      text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
      position: relative;
      display: inline-block;
    }

    .logo-text::after {
      content: '';
      position: absolute;
      width: 100%;
      height: 4px;
      bottom: -10px;
      left: 0;
      background: var(--light);
      transform: scaleX(0);
      transform-origin: right;
      transition: transform 0.5s ease;
    }

    .logo-text:hover::after {
      transform: scaleX(1);
      transform-origin: left;
    }

    header p {
      font-size: 1.4rem;
      max-width: 700px;
      margin: 0 20px;
      color: rgba(255,255,255,0.9);
    }

    /* Content Sections */
    section {
      padding: 100px 20px;
      max-width: 1200px;
      margin: auto;
    }

    .content {
      background: rgba(255,255,255,0.03);
      border-radius: 20px;
      padding: 40px;
      margin: 20px;
      backdrop-filter: blur(10px);
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      border: 1px solid rgba(255,255,255,0.1);
    }

    .content h2 {
      font-size: 2.5rem;
      margin-bottom: 30px;
      background: var(--gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .content p, .content ul {
      margin-bottom: 20px;
      color: rgba(255,255,255,0.8);
    }

    /* Sub-Apps Cards */
    .apps-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin-top: 40px;
    }

    .app-card {
      background: rgba(255,255,255,0.05);
      border-radius: 15px;
      padding: 25px;
      transition: all 0.3s ease;
      border: 1px solid rgba(255,255,255,0.1);
      position: relative;
      overflow: hidden;
    }

    .app-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: var(--gradient);
      opacity: 0;
      transition: opacity 0.3s ease;
      z-index: 1;
    }

    .app-card:hover::before {
      opacity: 0.1;
    }

    .app-card:hover {
      transform: translateY(-5px);
    }

    .app-card strong {
      color: var(--primary);
      font-size: 1.2rem;
      display: block;
      margin-bottom: 10px;
      position: relative;
      z-index: 2;
    }

    .app-card p {
      position: relative;
      z-index: 2;
    }

    /* Contact Section */
    #contact a {
      color: var(--primary);
      text-decoration: none;
      transition: color 0.3s;
    }

    #contact a:hover {
      color: var(--secondary);
    }

    /* Footer */
    footer {
      padding: 40px 20px;
      text-align: center;
      background: var(--gradient);
      position: relative;
      overflow: hidden;
    }

    footer::before {
      content: '';
      position: absolute;
      width: 150%;
      height: 150%;
      background: var(--dark);
      transform: rotate(3deg);
      bottom: 85%;
      left: -25%;
    }

    footer p {
      position: relative;
      color: rgba(255,255,255,0.9);
    }

    /* Floating Elements */
    .floating-shapes {
      position: absolute;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: 1;
    }

    .shape {
      position: absolute;
      background: var(--primary);
      opacity: 0.1;
      border-radius: 50%;
      animation: float 15s infinite;
    }

    .shape:nth-child(1) {
      width: 100px;
      height: 100px;
      top: 20%;
      left: 10%;
      animation-delay: 0s;
    }

    .shape:nth-child(2) {
      width: 150px;
      height: 150px;
      top: 60%;
      right: 15%;
      animation-delay: -5s;
      background: var(--secondary);
    }

    .shape:nth-child(3) {
      width: 80px;
      height: 80px;
      bottom: 20%;
      left: 20%;
      animation-delay: -10s;
      background: var(--accent);
    }

    @keyframes float {
      0% {
        transform: translate(0, 0) rotate(0deg);
      }
      50% {
        transform: translate(100px, 100px) rotate(180deg);
      }
      100% {
        transform: translate(0, 0) rotate(360deg);
      }
    }

    /* Animations */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .animate-fadeInUp {
      animation: fadeInUp 0.6s ease forwards;
    }
  </style>
</head>
<body>
  <!-- Navigation -->
  <nav id="navbar">
    <a href="#about">About Us</a>
    <a href="#sub-apps">Our Apps</a>
    <a href="#vision">Our Vision</a>
    <a href="#contact">Contact</a>
  </nav>

  <!-- Header -->
  <header>
    <div class="floating-shapes">
      <div class="shape"></div>
      <div class="shape"></div>
      <div class="shape"></div>
    </div>
    <h1 class="logo-text" data-aos="fade-down">INDISLAY</h1>
    <p data-aos="fade-up" data-aos-delay="200">Revolutionizing Social Media - Combining Entertainment, Lifestyle, and Networking into One Ecosystem.</p>
  </header>

  <!-- About Section -->
  <section id="about" class="content" data-aos="fade-up">
    <h2>About Indislay</h2>
    <p>Indislay is designed to offer a revolutionary social media experience, bringing multiple sub-apps under one platform with AI-driven customization and blockchain-backed security.</p>
  </section>

  <!-- Sub-Apps Section -->
  <section id="sub-apps" class="content" data-aos="fade-up">
    <h2>Our Sub-Apps</h2>
    <div class="apps-grid">
      <div class="app-card" data-aos="fade-up" data-aos-delay="100">
        <strong>Slaynity</strong>
        <p>Main app for video content, memes, reels, and personal profiles with Aadhaar ID verification and premium blue verification.</p>
      </div>
      <div class="app-card" data-aos="fade-up" data-aos-delay="200">
        <strong>Slaytown</strong>
        <p>An entertainment app merging elements from Instagram, YouTube, and Netflix.</p>
      </div>
      <div class="app-card" data-aos="fade-up" data-aos-delay="300">
        <strong>Slayverse</strong>
        <p>Music streaming platform tailored for emerging and popular music trends.</p>
      </div>
      <div class="app-card" data-aos="fade-up" data-aos-delay="400">
        <strong>Slaystyle</strong>
        <p>Lifestyle platform for fashion and wellness.</p>
      </div>
      <div class="app-card" data-aos="fade-up" data-aos-delay="500">
        <strong>Slaywork</strong>
        <p>Professional networking platform, like LinkedIn, for career growth and collaborations.</p>
      </div>
      <div class="app-card" data-aos="fade-up" data-aos-delay="600">
        <strong>Slaycare</strong>
        <p>A health-focused app with wellness resources.</p>
      </div>
    </div>
  </section>

  <!-- Vision Section -->
  <section id="vision" class="content" data-aos="fade-up">
    <h2>Our Vision</h2>
    <p>Indislay aims to be the world's leading social media ecosystem, combining innovative technology, user-centered design, and community-driven experiences to set new standards in the industry.</p>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="content" data-aos="fade-up">
    <h2>Contact Us</h2>
    <p>For inquiries, email us at <a href="mailto:contact@indislay.com">contact@indislay.com</a></p>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2024 Indislay. All Rights Reserved.</p>
  </footer>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
  <script>
    // Initialize AOS
    AOS.init({
      duration: 800,
      once: true
    });

    // Navbar scroll effect
    window.addEventListener('scroll', function() {
      const navbar = document.getElementById('navbar');
      if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });
  </script>
</body>
</html>
