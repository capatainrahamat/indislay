inex.html<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Indislay - About Us</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #000;
      color: #fff;
      margin: 0;
      padding: 0;
    }
    header, footer {
      text-align: center;
      padding: 20px;
      background-color: #333;
    }
    h1, h2, h3 {
      color: #fff;
    }
    .content {
      padding: 20px;
      max-width: 800px;
      margin: auto;
    }
    section {
      margin-bottom: 30px;
    }
    a {
      color: #fff;
      text-decoration: none;
      border-bottom: 1px solid #fff;
    }
    a:hover {
      color: #ccc;
      border-bottom: 1px solid #ccc;
    }
  </style>
</head>
<body>

  <header>
    <h1>Indislay</h1>
    <p>Revolutionizing Social Media and Beyond</p>
  </header>

  <div class="content">
    <section id="about">
      <h2>About Indislay</h2>
      <p>Indislay is an innovative social media platform designed to merge multiple interactive experiences, creating a dynamic ecosystem that caters to entertainment, lifestyle, professional networking, and more.</p>
    </section>

    <section id="sub-apps">
      <h2>Our Sub-Apps</h2>
      <ul>
        <li><strong>Slaynity</strong>: Our main app featuring videos, memes, reels, and ID profiles. ID verification is managed through Aadhaar and premium memberships.</li>
        <li><strong>Slaytown</strong>: Entertainment-focused app combining features from Instagram, YouTube, and Netflix.</li>
        <li><strong>Slayverse</strong>: Music streaming and discovery platform.</li>
        <li><strong>Slaystyle</strong>: Lifestyle and fashion social networking.</li>
        <li><strong>Slaywork</strong>: Professional networking app like LinkedIn.</li>
        <li><strong>Slaycare</strong>: Health and wellness hub.</li>
      </ul>
    </section>

    <section id="future-plans">
      <h2>Our Vision</h2>
      <p>Indislay aims to lead the global social media market with a user-first approach and cutting-edge AI and blockchain integration to enhance security, personalization, and user engagement.</p>
    </section>
  </div>

  <footer>
    <p>&copy; 2024 Indislay. All Rights Reserved.</p>
  </footer>

</body>
</html>
