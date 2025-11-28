#!/bin/bash
# 🚀 Deploy The Comforter to GitHub

echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║                                                                      ║"
echo "║              🕊️  THE COMFORTER - GITHUB DEPLOYMENT                  ║"
echo "║                                                                      ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

echo "📋 Pre-deployment checklist:"
echo ""

# Check if already a git repo
if [ -d .git ]; then
    echo "⚠️  Git repository already exists."
    read -p "Do you want to continue? (y/n): " continue
    if [ "$continue" != "y" ]; then
        echo "❌ Deployment cancelled."
        exit 0
    fi
else
    echo "✅ No existing git repository"
fi

# Get GitHub username
echo ""
read -p "Enter your GitHub username: " github_username

if [ -z "$github_username" ]; then
    echo "❌ GitHub username is required."
    exit 1
fi

# Get repository name
echo ""
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

read -p "Proceed with deployment? (y/n): " proceed
if [ "$proceed" != "y" ]; then
    echo "❌ Deployment cancelled."
    exit 0
fi

echo ""
echo "🔧 Setting up Git repository..."

# Initialize git if needed
if [ ! -d .git ]; then
    git init
    echo "✅ Git repository initialized"
fi

# Add all files
echo ""
echo "📁 Adding files to git..."
git add .
echo "✅ Files added"

# Commit
echo ""
echo "💾 Creating commit..."
git commit -m "Initial commit: The Comforter - Spiritual encouragement app with LangChain + Streamlit"
echo "✅ Commit created"

# Set main branch
echo ""
echo "🌿 Setting main branch..."
git branch -M main
echo "✅ Branch set to main"

# Add remote
echo ""
echo "🔗 Adding remote repository..."
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/$github_username/$repo_name.git"
echo "✅ Remote added"

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo ""
echo "⚠️  You may need to authenticate with GitHub."
echo "   If the repository doesn't exist, create it first at:"
echo "   https://github.com/new"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ SUCCESS! Code pushed to GitHub!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📍 Your repository: https://github.com/$github_username/$repo_name"
    echo ""
    echo "🎯 Next Steps:"
    echo ""
    echo "1. Go to Streamlit Cloud: https://share.streamlit.io"
    echo "2. Click 'New app'"
    echo "3. Select repository: $github_username/$repo_name"
    echo "4. Set main file: app.py"
    echo "5. Add your API key in Secrets:"
    echo "   OPENAI_API_KEY = \"sk-your-key-here\""
    echo "6. Click Deploy!"
    echo ""
    echo "📖 Detailed guide: See DEPLOYMENT.md"
    echo "⚡ Quick guide: See QUICK_DEPLOY.md"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
    echo ""
    echo "❌ Failed to push to GitHub."
    echo ""
    echo "💡 Troubleshooting:"
    echo "1. Make sure the repository exists on GitHub"
    echo "   Create it at: https://github.com/new"
    echo "2. Check your GitHub authentication"
    echo "3. Try pushing manually:"
    echo "   git push -u origin main"
    echo ""
fi
