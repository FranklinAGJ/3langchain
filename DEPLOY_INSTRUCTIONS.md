# 🚀 Deploy to GitHub - Step by Step

## ✅ Bug Fixed!

The import error has been fixed. The app now uses:
- `langchain-core>=0.3.0` (updated)
- `from langchain_core.messages import HumanMessage, AIMessage` (fixed import)

## 📋 Quick Deploy Steps

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `the-comforter-app` (or your choice)
3. Description: `🕊️ Spiritual encouragement app with Bible verses`
4. Choose Public or Private
5. **DO NOT** initialize with README, .gitignore, or license
6. Click "Create repository"

### Step 2: Push Code to GitHub

```bash
cd streamlit_app

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: The Comforter app"

# Add your GitHub repo as remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/the-comforter-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Deploy to Streamlit Cloud

1. Go to https://share.streamlit.io
2. Sign in with GitHub
3. Click "New app"
4. Fill in:
   - **Repository:** `YOUR_USERNAME/the-comforter-app`
   - **Branch:** `main`
   - **Main file path:** `app.py`
5. Click "Advanced settings"
6. In "Secrets" section, add:
   ```toml
   OPENAI_API_KEY = "sk-your-actual-key-here"
   ```
7. Click "Deploy"!

### Step 4: Wait for Deployment

- First deployment takes 2-3 minutes
- Watch the logs for any errors
- Once complete, your app will be live!

## 🔑 Get API Key

**OpenAI:** https://platform.openai.com/api-keys

**OpenRouter:** https://openrouter.ai/keys

## 🎉 Your App URL

After deployment, your app will be at:
```
https://YOUR_USERNAME-the-comforter-app.streamlit.app
```

## 🐛 Troubleshooting

### Import Error Fixed
✅ Changed from `langchain.schema` to `langchain_core.messages`
✅ Updated requirements.txt with correct versions

### If deployment fails:
1. Check Streamlit Cloud logs
2. Verify API key is set in Secrets
3. Ensure all files are pushed to GitHub
4. Check requirements.txt has correct versions

### If API key issues:
1. Make sure key starts with `sk-` (OpenAI) or `sk-or-v1-` (OpenRouter)
2. Verify key has credits/is active
3. Check key is in Secrets, not in code

## 📞 Need Help?

- Streamlit Docs: https://docs.streamlit.io
- Streamlit Community: https://discuss.streamlit.io
- Check app logs in Streamlit Cloud dashboard
