<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Neslihan Yenge'ye Özel Sürpriz</title>
    <style>
        body { margin: 0; height: 100vh; display: flex; justify-content: center; align-items: center; background-color: #ffe4e6; font-family: 'Segoe UI', sans-serif; overflow: hidden; }
        
        .main-container { position: relative; display: flex; justify-content: center; align-items: center; }
        
        /* Zarf */
        .envelope { width: 300px; height: 200px; background: #e91e63; border-radius: 5px; position: relative; display: flex; justify-content: center; align-items: center; color: white; font-weight: bold; font-size: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.3); z-index: 10; transition: 1s ease-in-out; cursor: pointer; }
        .flap { position: absolute; top: 0; width: 0; height: 0; border-left: 150px solid transparent; border-right: 150px solid transparent; border-top: 100px solid #c2185b; transition: 0.5s; transform-origin: top; z-index: 2; }
        
        /* El Animasyonu */
        .hand { position: absolute; font-size: 80px; bottom: -50px; right: -50px; opacity: 0; transition: 1s; z-index: 15; }
        
        /* Kart */
        .card { position: absolute; width: 260px; height: 160px; background: white; border-radius: 10px; display: none; padding: 20px; text-align: center; color: #555; box-shadow: 0 5px 25px rgba(0,0,0,0.3); z-index: 5; opacity: 0; transition: 0.5s; }
        
        /* Dansçılar */
        .dancers { display: flex; justify-content: center; gap: 20px; font-size: 50px; margin-top: 20px; }
        .dancer { animation: jump 0.6s infinite alternate; }
        @keyframes jump { from { transform: translateY(0); } to { transform: translateY(-20px); } }
        
        /* Çiçekler */
        .flower { position: absolute; font-size: 30px; animation: fly linear forwards; z-index: 1; }
        @keyframes fly {
            from { transform: translateY(100vh) rotate(0deg); opacity: 1; }
            to { transform: translateY(-20vh) rotate(360deg); opacity: 0; }
        }
        
        /* Hareketler */
        .open .flap { transform: rotateX(180deg); }
        .open .hand { opacity: 1; transform: translate(-100px, -100px); }
        .open .card { display: block; opacity: 1; transform: translateY(-150px); }
        .open .envelope { transform: translateX(-400px) rotate(-10deg); opacity: 0.5; }
    </style>
</head>
<body>

    <div class="main-container" onclick="startSurprise(this)">
        <div class="envelope">
            Tıkla Yengem! ✉️
            <div class="flap"></div>
            <div class="hand">✋</div>
        </div>
        
        <div class="card">
            <h3>İyi ki Doğdun Neslihan Yenge! 🎂</h3>
            <div class="dancers">
                <span class="dancer">🐼</span>
                <span class="dancer">🧸</span>
            </div>
        </div>
    </div>

    <script>
        function startSurprise(el) {
            if (el.classList.contains('open')) return;
            el.classList.add('open');
            
            // Çiçek yağmurunu başlat
            setInterval(createFlower, 400);
        }

        function createFlower() {
            const flower = document.createElement('div');
            flower.className = 'flower';
            flower.innerHTML = ['🌹', '🌸', '🌺', '🌼', '🌷'][Math.floor(Math.random() * 5)];
            flower.style.left = Math.random() * 100 + 'vw';
            flower.style.animationDuration = (Math.random() * 4 + 3) + 's';
            document.body.appendChild(flower);
            setTimeout(() => flower.remove(), 7000);
        }
    </script>
</body>
</html>
