# 🕊️ The Comforter - Streamlit Web App

A beautiful web application that provides spiritual encouragement through Bible verses using LangChain + OpenAI + Streamlit.

[![Streamlit App](https://static.streamlit.io/badges/streamlit_badge_black_white.svg)](https://share.streamlit.io)

## 🌟 Live Demo

**[Launch The Comforter →](https://your-app-url.streamlit.app)** *(Update after deployment)*

## 🚀 Quick Start

### Option 1: Run Locally
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/the-comforter-app.git
cd the-comforter-app

# Install dependencies
pip install -r requirements.txt

# Set up your API key
cp .streamlit/secrets.toml.example .streamlit/secrets.toml
# Edit secrets.toml and add your API key

# Run the app
streamlit run app.py
```

Or use the launcher script:
```bash
./run.sh
```

### Option 2: Deploy to Streamlit Cloud

**Quick Deploy:**
1. Fork this repository on GitHub
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Click "New app" and select your forked repo
4. Set main file: `app.py`
5. Add your API key in Secrets:
   ```toml
   OPENAI_API_KEY = "sk-your-key-here"
   ```
6. Click "Deploy"!

**Detailed instructions:** See [DEPLOYMENT.md](DEPLOYMENT.md)

## 📁 Folder Structure
```
streamlit_app/
├── app.py                 # Main Streamlit application
├── prompts.py            # LangChain prompt templates
├── utils.py              # Verse management utilities
├── bible_verses.json     # Bible verses database (24 verses)
├── requirements.txt      # Python dependencies
├── .streamlit/
│   └── secrets.toml      # API key configuration
└── README.md            # This file
```

## ✨ Features

- **4 Support Modes**: General Life, Dating & Relationship, Developer, Spiritual
- **AI-Powered**: Uses LangChain + GPT-3.5-turbo for intelligent responses
- **Smart Verse Selection**: Matches Bible verses to your situation
- **Beautiful UI**: Modern gradient design with animations
- **Fallback Mode**: Works even without API key

## 🌐 Access

Once running, open your browser to:
- Local: http://localhost:8501
- Network: http://192.168.1.101:8501

## 💡 Usage Examples

- "I'm feeling anxious about my job interview tomorrow"
- "Should I ask her out on a date?"
- "I'm stuck on this coding problem"
- "I'm struggling with my faith"

---

*"Cast all your anxiety on him because he cares for you." - 1 Peter 5:7*
