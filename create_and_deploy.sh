#!/bin/bash
# 🚀 Create GitHub Repo and Deploy The Comforter

echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║                                                                      ║"
echo "║         🕊️  THE COMFORTER - AUTO GITHUB DEPLOYMENT                  ║"
echo "║                                                                      ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed."
    echo ""
    echo "📦 Install GitHub CLI:"
    echo "   macOS:   brew install gh"
    echo "   Linux:   See https://cli.github.com/manual/installation"
    echo ""
    echo "After installing, run: gh auth login"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "🔐 Not authenticated with GitHub. Let's log in..."
    gh auth login
fi

echo "✅ GitHub CLI authenticated"
echo ""

# Get repository name
read -p "Enter repository name (default: the-comforter-app): " repo_name
repo_name=${repo_name:-the-comforter-app}

# Get repository description
repo_desc="🕊️ The Comforter - Spiritual encouragement app with Bible verses using LangChain + Streamlit"

# Ask for public or private
echo ""
echo "Repository visibility:"
echo "1. Public (anyone can see)"
echo "2. Private (only you can see)"
read -p "Choose (1 or 2, default: 1): " visibility_choice
visibility_choice=${visibility_choice:-1}

if [ "$visibility_choice" = "2" ]; then
    visibility="--private"
else
    visibility="--public"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Configuration:"
echo "   Repository:  $repo_name"
echo "   Visibility:  $([ "$visibility_choice" = "2" ] && echo "Private" || echo "Public")"
echo "   Description: $repo_desc"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

read -p "Proceed with deployment? (y/n): " proceed
if [ "$proceed" != "y" ]; then
    echo "❌ Deployment cancelled."
    exit 0
fi

echo ""
echo "🔧 Initializing Git repository..."

# Initialize git if needed
if [ ! -d .git ]; then
    git init
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already exists"
fi

# Add all files
echo ""
echo "📁 Adding files to git..."
git add .
echo "✅ Files added"

# Commit
echo ""
echo "💾 Creating commit..."
git commit -m "Initial commit: The Comforter - Spiritual encouragement app

Features:
- 4 support modes (General, Dating, Developer, Spiritual)
- AI-powered responses with LangChain + GPT-3.5-turbo
- Smart Bible verse selection
- Beautiful Streamlit UI
- 24 carefully selected Bible verses
- Fallback mode for offline use"

echo "✅ Commit created"

# Create GitHub repository
echo ""
echo "🌐 Creating GitHub repository..."
gh repo create "$repo_name" $visibility --description "$repo_desc" --source=. --remote=origin --push

if [ $? -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ SUCCESS! Repository created and code pushed!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    # Get the repo URL
    repo_url=$(gh repo view --json url -q .url)
    echo "📍 Your repository: $repo_url"
    echo ""
    echo "🎯 Next Steps for Streamlit Cloud Deployment:"
    echo ""
    echo "1. Go to: https://share.streamlit.io"
    echo "2. Click 'New app'"
    echo "3. Select your repository: $repo_name"
    echo "4. Set main file: app.py"
    echo "5. Click 'Advanced settings' → 'Secrets'"
    echo "6. Add your API key:"
    echo "   OPENAI_API_KEY = \"sk-your-key-here\""
    echo "7. Click 'Deploy'!"
    echo ""
    echo "📖 Your app will be live at:"
    echo "   https://YOUR_USERNAME-$(echo $repo_name | tr '[:upper:]' '[:lower:]').streamlit.app"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "🔑 Get API Keys:"
    echo "   OpenAI:     https://platform.openai.com/api-keys"
    echo "   OpenRouter: https://openrouter.ai/keys"
    echo ""
else
    echo ""
    echo "❌ Failed to create repository."
    echo ""
    echo "💡 Try manual deployment:"
    echo "   ./deploy_to_github.sh"
    echo ""
fi
