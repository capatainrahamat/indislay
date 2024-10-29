index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Indislay - Transforming Social Media</title>
  <style>
    /* Basic Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
      background-color: #000;
      color: #f5f5f5;
      line-height: 1.6;
      scroll-behavior: smooth;
    }
    /* Navigation Bar */
    nav {
      display: flex;
      justify-content: space-between;
      padding: 20px;
      background-color: #111;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 10;
    }
    nav a {
      color: #f5f5f5;
      text-decoration: none;
      padding: 8px 15px;
      font-weight: bold;
      transition: color 0.3s;
    }
    nav a:hover {
      color: #777;
    }
    /* Header Section */
    header {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      text-align: center;
      background: #111;
    }
    header h1 {
      font-size: 3rem;
      margin-bottom: 10px;
    }
    header p {
      font-size: 1.2rem;
      max-width: 700px;
    }
    /* Content Sections */
    section {
      padding: 60px 20px;
      max-width: 800px;
      margin: auto;
    }
    .content h2 {
      font-size: 2rem;
      border-bottom: 2px solid #f5f5f5;
      padding-bottom: 5px;
      margin-bottom: 20px;
    }
    .content p, .content ul {
      margin-bottom: 15px;
    }
    /* Footer */
    footer {
      padding: 20px;
      text-align: center;
      background-color: #111;
    }
  </style>
</head>
<body>

  <!-- Navigation -->
  <nav>
    <a href="#about">About Us</a>
    <a href="#sub-apps">Our Apps</a>
    <a href="#vision">Our Vision</a>
    <a href="#contact">Contact</a>
  </nav>

  <!-- Header -->
  <header>
    <h1>Welcome to Indislay</h1>
    <p>Revolutionizing Social Media - Combining Entertainment, Lifestyle, and Networking into One Ecosystem.</p>
  </header>

  <!-- About Section -->
  <section id="about" class="content">
    <h2>About Indislay</h2>
    <p>Indislay is designed to offer a revolutionary social media experience, bringing multiple sub-apps under one platform with AI-driven customization and blockchain-backed security.</p>
  </section>

  <!-- Sub-Apps Section -->
  <section id="sub-apps" class="content">
    <h2>Our Sub-Apps</h2>
    <ul>
      <li><strong>Slaynity</strong>: Main app for video content, memes, reels, and personal profiles with Aadhaar ID verification and premium blue verification.</li>
      <li><strong>Slaytown</strong>: An entertainment app merging elements from Instagram, YouTube, and Netflix.</li>
      <li><strong>Slayverse</strong>: Music streaming platform tailored for emerging and popular music trends.</li>
      <li><strong>Slaystyle</strong>: Lifestyle platform for fashion and wellness.</li>
      <li><strong>Slaywork</strong>: Professional networking platform, like LinkedIn, for career growth and collaborations.</li>
      <li><strong>Slaycare</strong>: A health-focused app with wellness resources.</li>
    </ul>
  </section>

  <!-- Vision Section -->
  <section id="vision" class="content">
    <h2>Our Vision</h2>
    <p>Indislay aims to be the world's leading social media ecosystem, combining innovative technology, user-centered design, and community-driven experiences to set new standards in the industry.</p>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="content">
    <h2>Contact Us</h2>
    <p>For inquiries, email us at <a href="mailto:contact@indislay.com">contact@indislay.com</a></p>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2024 Indislay. All Rights Reserved.</p>
  </footer>

</body>
</html>
