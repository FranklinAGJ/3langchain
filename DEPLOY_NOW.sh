#!/bin/bash
# 🚀 One-Click Deploy to GitHub and Streamlit Cloud

echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║                                                                      ║"
echo "║         🕊️  THE COMFORTER - ONE-CLICK DEPLOYMENT                    ║"
echo "║                                                                      ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""

# Repository name
REPO_NAME="the-comforter-app"

echo "📋 This script will:"
echo "   1. Create a new GitHub repository: $REPO_NAME"
echo "   2. Initialize git and commit all files"
echo "   3. Push to GitHub"
echo "   4. Give you the Streamlit Cloud deployment link"
echo ""

# Check if GitHub CLI is installed
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI detected"
    USE_GH_CLI=true
else
    echo "⚠️  GitHub CLI not found"
    echo "   Install it from: https://cli.github.com/"
    echo "   Or we'll use manual method"
    USE_GH_CLI=false
fi

echo ""
read -p "Continue? (y/n): " continue
if [ "$continue" != "y" ]; then
    echo "❌ Cancelled"
    exit 0
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔧 Step 1: Setting up Git repository..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Initialize git if needed
if [ ! -d .git ]; then
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Add all files
git add .
echo "✅ Files staged"

# Commit
git commit -m "Initial commit: The Comforter - AI-powered spiritual encouragement app

Features:
- 4 support modes (General, Dating, Developer, Spiritual)
- LangChain + GPT-3.5-turbo integration
- Smart Bible verse selection
- Beautiful Streamlit UI
- 24 KJV Bible verses

Built with Streamlit, LangChain, and OpenAI" 2>/dev/null || echo "✅ Already committed"

# Set main branch
git branch -M main
echo "✅ Branch set to main"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 Step 2: Creating GitHub repository..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ "$USE_GH_CLI" = true ]; then
    # Use GitHub CLI
    echo "Creating repository with GitHub CLI..."
    gh repo create "$REPO_NAME" --public --source=. --remote=origin --push --description "🕊️ The Comforter - AI-powered spiritual encouragement through Bible verses. Built with Streamlit, LangChain, and OpenAI."
    
    if [ $? -eq 0 ]; then
        echo "✅ Repository created and pushed!"
        GITHUB_USER=$(gh api user -q .login)
        REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME"
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "✅ SUCCESS! Repository created and code pushed!"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "📍 Your repository: $REPO_URL"
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "🎯 Step 3: Deploy to Streamlit Cloud"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "1. Go to: https://share.streamlit.io/deploy"
        echo ""
        echo "2. Fill in:"
        echo "   Repository: $GITHUB_USER/$REPO_NAME"
        echo "   Branch: main"
        echo "   Main file: app.py"
        echo ""
        echo "3. Click 'Advanced settings' → 'Secrets' and add:"
        echo "   OPENAI_API_KEY = \"sk-your-actual-key-here\""
        echo ""
        echo "4. Click 'Deploy'!"
        echo ""
        echo "Your app will be live at:"
        echo "https://$GITHUB_USER-$REPO_NAME.streamlit.app"
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        
        # Open browser
        read -p "Open Streamlit Cloud deploy page in browser? (y/n): " open_browser
        if [ "$open_browser" = "y" ]; then
            open "https://share.streamlit.io/deploy" 2>/dev/null || xdg-open "https://share.streamlit.io/deploy" 2>/dev/null || echo "Please open: https://share.streamlit.io/deploy"
        fi
    else
        echo "❌ Failed to create repository"
        exit 1
    fi
else
    # Manual method
    echo ""
    echo "⚠️  GitHub CLI not available. Using manual method..."
    echo ""
    echo "Please run these commands:"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "# 1. Create repository on GitHub:"
    echo "   Go to: https://github.com/new"
    echo "   Repository name: $REPO_NAME"
    echo "   Description: 🕊️ The Comforter - AI spiritual encouragement app"
    echo "   Make it Public"
    echo "   Don't initialize with README"
    echo "   Click 'Create repository'"
    echo ""
    echo "# 2. Get your GitHub username and run:"
    read -p "Enter your GitHub username: " GITHUB_USER
    
    if [ -n "$GITHUB_USER" ]; then
        REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"
        
        echo ""
        echo "# 3. Push to GitHub:"
        git remote remove origin 2>/dev/null
        git remote add origin "$REPO_URL"
        
        echo "Pushing to $REPO_URL..."
        git push -u origin main
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "✅ SUCCESS! Code pushed to GitHub!"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
            echo "📍 Your repository: https://github.com/$GITHUB_USER/$REPO_NAME"
            echo ""
            echo "🎯 Next: Deploy to Streamlit Cloud"
            echo ""
            echo "1. Go to: https://share.streamlit.io/deploy"
            echo "2. Repository: $GITHUB_USER/$REPO_NAME"
            echo "3. Branch: main"
            echo "4. Main file: app.py"
            echo "5. Add API key in Secrets"
            echo "6. Deploy!"
            echo ""
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        else
            echo ""
            echo "❌ Failed to push. Make sure:"
            echo "   1. Repository exists on GitHub"
            echo "   2. You're authenticated with GitHub"
            echo "   3. Repository URL is correct"
        fi
    fi
fi

echo ""
echo "🕊️ May your app bring comfort to many!"
