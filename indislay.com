<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INDISLAY - SLAYING EVERY DROP OF YOUR DRIP</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ff8c00;
            --secondary-color: #ff0080;
            --text-color: #fff;
            --bg-color: #000;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            overflow: hidden;
            position: relative;
            min-height: 100vh;
        }

        .background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at center, #1a1a1a 0%, #000 100%);
            z-index: -1;
        }

        .stars {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .star {
            position: absolute;
            background-color: #fff;
            border-radius: 50%;
            animation: twinkle 5s infinite;
        }

        @keyframes twinkle {
            0%, 100% { opacity: 0; }
            50% { opacity: 1; }
        }

        .container {
            position: relative;
            z-index: 2;
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
            text-align: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            perspective: 1000px;
        }

        .logo-container {
            margin-bottom: 40px;
            transform-style: preserve-3d;
            animation: logoFloat 6s ease-in-out infinite;
        }

        @keyframes logoFloat {
            0%, 100% { transform: translateY(0) rotateX(0); }
            50% { transform: translateY(-20px) rotateX(5deg); }
        }

        h1 {
            font-size: 5em;
            font-weight: 900;
            letter-spacing: 8px;
            margin-bottom: 20px;
            background: linear-gradient(45deg, var(--text-color), var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 20px rgba(255, 140, 0, 0.3);
            animation: glowText 3s ease-in-out infinite;
        }

        @keyframes glowText {
            0%, 100% { filter: brightness(100%) blur(0px); }
            50% { filter: brightness(150%) blur(2px); }
        }

        h2 {
            font-size: 1.5em;
            font-weight: 300;
            color: #888;
            margin-bottom: 50px;
            letter-spacing: 4px;
            text-transform: uppercase;
        }

        .button {
            display: inline-block;
            padding: 20px 50px;
            font-size: 1.2em;
            color: var(--text-color);
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 700;
            letter-spacing: 2px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(255, 140, 0, 0.4);
        }

        .button:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 10px 25px rgba(255, 140, 0, 0.6);
        }

        .button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .button:hover::before {
            left: 100%;
        }

        .footer {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            color: #555;
            font-size: 0.9em;
            z-index: 2;
        }

        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.4);
            transform: scale(0);
            animation: ripple 0.6s linear;
        }

        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="stars" id="stars"></div>

    <div class="container">
        <div class="logo-container">
            <h1>INDISLAY</h1>
            <h2>Slaying Every Drop of Your Drip</h2>
        </div>
        
        <a href="https://indislay-jqlh5p4.gamma.site/" class="button" id="exploreButton">EXPLORE NOW</a>
    </div>

    <footer class="footer">
        &copy; 2024 Indislay. All Rights Reserved.
    </footer>

    <script>
        // Create twinkling stars
        const starsContainer = document.getElementById('stars');
        for (let i = 0; i < 100; i++) {
            const star = document.createElement('div');
            star.className = 'star';
            star.style.width = `${Math.random() * 2 + 1}px`;
            star.style.height = star.style.width;
            star.style.left = `${Math.random() * 100}%`;
            star.style.top = `${Math.random() * 100}%`;
            star.style.animationDelay = `${Math.random() * 5}s`;
            starsContainer.appendChild(star);
        }

        // Add ripple effect to button
        const button = document.getElementById('exploreButton');
        button.addEventListener('click', function(e) {
            let ripple = document.createElement('span');
            ripple.classList.add('ripple');
            this.appendChild(ripple);
            let x = e.clientX - e.target.offsetLeft;
            let y = e.clientY - e.target.offsetTop;
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    </script>
</body>
</html>
