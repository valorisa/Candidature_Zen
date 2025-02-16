#!/bin/ash

PROJECT_DIR="Candidature_zen"
cd ~/Projets

# Installer les dépendances système
sudo apk update && sudo apk add \
    python3 \
    py3-pip \
    chromium \
    chromium-chromedriver \
    xvfb \
    bash \
    git \
    python3-dev \
    gcc \
    musl-dev \
    libffi-dev \
    libc6-compat

# Créer l'arborescence
mkdir -p $PROJECT_DIR && cd $PROJECT_DIR
mkdir -p {src,config,data}

# Configurer le virtualenv
python3 -m venv venv
source venv/bin/activate

# Installer les dépendances Python
cat > requirements.txt << EOF
selenium==4.11.0
webdriver-manager==4.0.1
pyvirtualdisplay==3.0
EOF

pip install -r requirements.txt

# Créer le script principal
cat > src/main.py << EOF
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from pyvirtualdisplay import Display

options = Options()
options.binary_location = "/usr/bin/chromium-browser"
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")

with Display(visible=0, size=(1920, 1080)):
    driver = webdriver.Chrome(
        executable_path="/usr/bin/chromedriver",
        options=options
    )
    try:
        driver.get("https://www.linkedin.com")
        print("Titre:", driver.title)
    finally:
        driver.quit()
EOF

# Finalisation
chmod +x src/main.py
touch config/config.json data/job_urls.txt
echo "✅ Setup réussi !"
