#!/bin/bash
# 🚀 Quick Deploy Script

echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║                                                                      ║"
echo "║         🕊️  THE COMFORTER - GITHUB DEPLOYMENT                       ║"
echo "║                                                                      ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""

# Get GitHub username
read -p "Enter your GitHub username: " github_username

if [ -z "$github_username" ]; then
    echo "❌ GitHub username is required."
    exit 1
fi

# Get repository name
read -p "Enter repository name (default: the-comforter-app): " repo_name
repo_name=${repo_name:-the-comforter-app}

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Configuration:"
echo "   GitHub User: $github_username"
echo "   Repository:  $repo_name"
echo "   Remote URL:  https://github.com/$github_username/$repo_name.git"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "⚠️  IMPORTANT: Create the repository on GitHub first!"
echo "   Go to: https://github.com/new"
echo "   Name: $repo_name"
echo "   DO NOT initialize with README, .gitignore, or license"
echo ""

read -p "Have you created the repository on GitHub? (y/n): " created
if [ "$created" != "y" ]; then
    echo ""
    echo "Please create the repository first, then run this script again."
    echo "Opening GitHub in browser..."
    open "https://github.com/new" 2>/dev/null || xdg-open "https://github.com/new" 2>/dev/null
    exit 0
fi

echo ""
echo "🚀 Pushing to GitHub..."

# Add remote
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/$github_username/$repo_name.git"

# Push
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ SUCCESS! Code pushed to GitHub!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📍 Repository: https://github.com/$github_username/$repo_name"
    echo ""
    echo "🎯 Next: Deploy to Streamlit Cloud"
    echo ""
    echo "1. Go to: https://share.streamlit.io"
    echo "2. Click 'New app'"
    echo "3. Repository: $github_username/$repo_name"
    echo "4. Branch: main"
    echo "5. Main file: app.py"
    echo "6. Add API key in Secrets:"
    echo "   OPENAI_API_KEY = \"sk-your-key-here\""
    echo "7. Click Deploy!"
    echo ""
    echo "Opening Streamlit Cloud..."
    open "https://share.streamlit.io" 2>/dev/null || xdg-open "https://share.streamlit.io" 2>/dev/null
    echo ""
else
    echo ""
    echo "❌ Failed to push to GitHub."
    echo ""
    echo "💡 Troubleshooting:"
    echo "1. Make sure the repository exists on GitHub"
    echo "2. Check your GitHub authentication"
    echo "3. Try: git push -u origin main"
    echo ""
fi
