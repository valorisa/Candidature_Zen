from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from pyvirtualdisplay import Display
import time

options = Options()
options.binary_location = "/usr/bin/chromium-browser"  # Chemin spécifique Alpine
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")
options.add_argument("--headless=new")
options.add_argument("--single-process")

try:
    with Display(visible=0, size=(1920, 1080)):
        driver = webdriver.Chrome(
            executable_path="/usr/bin/chromedriver",
            options=options
        )
        print("👉 Test de connexion à LinkedIn...")
        driver.get("https://www.linkedin.com")
        print(f"✅ Succès ! Titre : {driver.title}")
        time.sleep(2)
        
except Exception as e:
    print(f"💥 Erreur : {str(e)}")
    
finally:
    if 'driver' in locals():
        driver.quit()
    print("🔚 Script terminé.")
