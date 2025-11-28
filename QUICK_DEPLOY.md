# ⚡ Quick Deploy to Streamlit Cloud

## 🚀 5-Minute Deployment

### Step 1: Push to GitHub (2 minutes)

```bash
cd streamlit_app

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: The Comforter app"

# Create repo on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/the-comforter-app.git
git branch -M main
git push -u origin main
```

### Step 2: Deploy to Streamlit Cloud (2 minutes)

1. Go to **[share.streamlit.io](https://share.streamlit.io)**
2. Click **"New app"**
3. Fill in:
   - **Repository:** `YOUR_USERNAME/the-comforter-app`
   - **Branch:** `main`
   - **Main file:** `app.py`
4. Click **"Advanced settings"** → **"Secrets"**
5. Add:
   ```toml
   OPENAI_API_KEY = "sk-your-actual-key-here"
   ```
6. Click **"Deploy"**!

### Step 3: Done! (1 minute)

Your app will be live at:
```
https://YOUR_USERNAME-the-comforter-app.streamlit.app
```

## 🔑 Get API Key

**OpenAI:** [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

**OpenRouter:** [openrouter.ai/keys](https://openrouter.ai/keys)

## 🎉 That's It!

Share your app URL with others to spread comfort and encouragement!

---

Need help? See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.
