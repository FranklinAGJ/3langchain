# 🚀 Deployment Guide - Streamlit Cloud

This guide will help you deploy **The Comforter** to Streamlit Cloud from GitHub.

## 📋 Prerequisites

1. GitHub account
2. Streamlit Cloud account (free at [share.streamlit.io](https://share.streamlit.io))
3. OpenAI or OpenRouter API key

## 🔧 Step-by-Step Deployment

### Step 1: Push to GitHub

1. **Create a new GitHub repository**
   - Go to [github.com/new](https://github.com/new)
   - Name it: `the-comforter-app` (or your preferred name)
   - Make it Public or Private
   - Don't initialize with README (we already have one)

2. **Push this folder to GitHub**
   ```bash
   cd streamlit_app
   git init
   git add .
   git commit -m "Initial commit: The Comforter Streamlit app"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/the-comforter-app.git
   git push -u origin main
   ```

### Step 2: Deploy to Streamlit Cloud

1. **Go to Streamlit Cloud**
   - Visit [share.streamlit.io](https://share.streamlit.io)
   - Sign in with your GitHub account

2. **Create New App**
   - Click "New app" button
   - Select your repository: `YOUR_USERNAME/the-comforter-app`
   - Branch: `main`
   - Main file path: `app.py`
   - Click "Deploy"

3. **Configure Secrets (API Key)**
   - While app is deploying, click "Advanced settings" or go to app settings
   - Navigate to "Secrets" section
   - Add your API key:
   
   **For OpenAI:**
   ```toml
   OPENAI_API_KEY = "sk-your-actual-openai-key-here"
   ```
   
   **For OpenRouter:**
   ```toml
   OPENAI_API_KEY = "sk-or-v1-your-actual-openrouter-key-here"
   ```

4. **Save and Reboot**
   - Click "Save"
   - App will automatically reboot with the new secrets

### Step 3: Access Your App

Your app will be available at:
```
https://YOUR_USERNAME-the-comforter-app-RANDOM.streamlit.app
```

## 🔑 Getting API Keys

### OpenAI API Key
1. Go to [platform.openai.com](https://platform.openai.com)
2. Sign up or log in
3. Navigate to API Keys section
4. Create new secret key
5. Copy the key (starts with `sk-`)

### OpenRouter API Key (Alternative)
1. Go to [openrouter.ai](https://openrouter.ai)
2. Sign up or log in
3. Navigate to Keys section
4. Create new key
5. Copy the key (starts with `sk-or-v1-`)

## 📁 Repository Structure

Your GitHub repo should look like this:
```
the-comforter-app/
├── .streamlit/
│   ├── config.toml           # Streamlit configuration
│   └── secrets.toml.example  # Example secrets file
├── app.py                    # Main Streamlit app
├── prompts.py               # LangChain prompts
├── utils.py                 # Utilities
├── bible_verses.json        # Bible verses database
├── requirements.txt         # Python dependencies
├── README.md               # Project documentation
├── DEPLOYMENT.md           # This file
├── .gitignore             # Git ignore rules
└── run.sh                 # Local run script
```

## ⚙️ Configuration Options

### Custom Domain (Optional)
- Available on Streamlit Cloud paid plans
- Configure in app settings

### Environment Variables
Add in Streamlit Cloud secrets:
```toml
OPENAI_API_KEY = "your-key"
OPENAI_MODEL = "gpt-3.5-turbo"
OPENAI_TEMPERATURE = "0.7"
```

## 🐛 Troubleshooting

### App Won't Start
- Check that `requirements.txt` has all dependencies
- Verify API key is correctly set in secrets
- Check logs in Streamlit Cloud dashboard

### API Errors
- Verify API key is valid and has credits
- Check API key format (OpenAI vs OpenRouter)
- Review error logs in app

### Import Errors
- Ensure all files are committed to GitHub
- Check that file names match imports
- Verify Python version compatibility

## 🔄 Updating Your App

To update your deployed app:
```bash
git add .
git commit -m "Update: description of changes"
git push origin main
```

Streamlit Cloud will automatically detect changes and redeploy.

## 💡 Tips

1. **Keep secrets.toml local** - Never commit API keys to GitHub
2. **Use .gitignore** - Already configured to exclude secrets
3. **Monitor usage** - Check OpenAI/OpenRouter dashboard for API usage
4. **Test locally first** - Run `streamlit run app.py` before deploying
5. **Check logs** - Use Streamlit Cloud logs for debugging

## 📊 Monitoring

- **Streamlit Cloud Dashboard**: View app analytics and logs
- **OpenAI Dashboard**: Monitor API usage and costs
- **GitHub Actions**: Set up CI/CD for automated testing (optional)

## 🆘 Support

- **Streamlit Docs**: [docs.streamlit.io](https://docs.streamlit.io)
- **Streamlit Community**: [discuss.streamlit.io](https://discuss.streamlit.io)
- **OpenAI Docs**: [platform.openai.com/docs](https://platform.openai.com/docs)

---

*"Cast all your anxiety on him because he cares for you." - 1 Peter 5:7*
