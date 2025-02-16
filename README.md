# 🤖 CandidatureZen 
**Automatisation intelligente de candidatures avec comportement humain simulé**  
*(Alpine Linux/Python/Selenium)*  

![Workflow](https://img.shields.io/badge/Status-En%20développement-brightgreen)

## 📦 Fonctionnalités
- ✅ Limite de volume (<10 candidatures/jour)
- 🕵️ Navigation réaliste anti-détection
- ⚙️ Configuration JSON simple
- 🌐 Compatible LinkedIn/Indeed/Glassdoor
- 🕒 Délais aléatoires humains

## 📲 Installation rapide
```bash
# Cloner le dépôt
git clone https://github.com/<votre_user>/CandidatureZen.git
cd CandidatureZen

# Créer l'environnement virtuel
python -m venv venv
source venv/bin/activate

# Installer les dépendances
pip install -r requirements.txt --break-system-packages
```

## ⚙️ Configuration
1. **Fichier de configuration** (`config/config.json`) :
```json
{
  "daily_limit": 10,
  "human_behavior": {
    "working_hours": {"start": 8, "end": 20},
    "random_delays": {"min_sec": 5, "max_sec": 30}
  }
}
```

2. **Liste des offres** (`data/job_urls.txt`) :
```
https://www.linkedin.com/jobs/view/123456
https://careers.microsoft.com/professionals/us/en/job/7890
```

## ▶️ Utilisation
```bash
# Activer l'environnement
source venv/bin/activate

# Lancer l'automation
python src/main.py
```

## 🛠 Personnalisation
Modifiez `src/main.py` pour :
```python
# Exemple de délais personnalisés
options.add_argument("--delay-min=300")  # 5 minutes
options.add_argument("--delay-max=1800") # 30 minutes
```

## 🐛 Dépannage courant
**Problème** : Chrome ne démarre pas  
**Solution** :
```bash
sudo apk fix chromium chromium-chromedriver
```

**Problème** : Erreur de dépendances  
**Solution** :
```bash
pip install --upgrade selenium webdriver-manager --break-system-packages
```

**Problème** : Détection de bot  
**Solution** : Augmenter les délais dans `config.json`

## 📜 Licence
Ce projet est sous licence [MIT](LICENSE).  
```text
Copyright (c) 2024 [Votre Nom]
```

## 🤝 Contributions
Les contributions sont les bienvenues ! Processus :
1. Forker le dépôt
2. Créer une branche (`git checkout -b feature/ma-fonctionnalité`)
3. Commit vos changements (`git commit -m 'Ajout d'une super fonctionnalité'`)
4. Pusher (`git push origin feature/ma-fonctionnalité`)
5. Ouvrir une Pull Request

**Exigences** :
- Tests unitaires inclus
- Documentation mise à jour
- Respect du PEP8
```
