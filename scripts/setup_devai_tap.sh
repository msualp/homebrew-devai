
#!/bin/bash

echo "👋 Welcome to the DevAIccelerate Homebrew Tap Setup Wizard"
echo "-----------------------------------------------------------"
echo

pause() {
  echo
  read -p "👉 Press ENTER to continue..."
  echo
}

run_or_skip() {
  echo
  read -p "🔧 Do you want to run this command now? (y/n): $1 " choice
  if [[ "$choice" == "y" ]]; then
    eval "$1"
  else
    echo "➡️  You can copy and run it later:"
    echo "$1"
  fi
  echo
  pause
}

# Step 1: Create the Tap Repo
echo "📦 Step 1: Create the GitHub repo named 'homebrew-devai' under your GitHub account 'msualp'"
echo "You can do this at: https://github.com/new?name=homebrew-devai"
pause

# Step 2: Clone the repo locally
echo "📁 Step 2: Clone your new tap repo locally"
run_or_skip "git clone https://github.com/msualp/homebrew-devai.git"

# Step 3: Add Formula directory and placeholder
echo "📂 Step 3: Create the Formula directory and a basic devai.rb formula file"
run_or_skip "mkdir -p homebrew-devai/Formula"

echo "✍️  Creating placeholder formula (edit it after)"
cat > homebrew-devai/Formula/devai.rb <<EOF
class Devai < Formula
  desc "DevAIccelerate CLI Toolkit for AI-powered developer workflows"
  homepage "https://github.com/msualp/DevAIccelerate"
  url "https://github.com/msualp/DevAIccelerate/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256"
  license "MIT"
  version "0.9.0"

  def install
    bin.install "devai/bin/dai.sh" => "dai"
  end

  test do
    system "#{bin}/dai", "--version"
  end
end
EOF
echo "✅ Placeholder devai.rb created"
pause

# Step 4: Calculate SHA256 of the release tarball
echo "📥 Step 4: Download your GitHub release tarball and calculate SHA256"
echo "⚠️  Make sure you have tagged a release like v0.9.0"
run_or_skip "curl -L -o devai.tar.gz https://github.com/msualp/DevAIccelerate/archive/refs/tags/v0.9.0.tar.gz"
run_or_skip "shasum -a 256 devai.tar.gz"

echo "✏️  Copy the SHA256 into your devai.rb file where it says REPLACE_WITH_SHA256"
pause

# Step 5: Commit and push formula
echo "📤 Step 5: Commit and push your formula"
run_or_skip "cd homebrew-devai && git add Formula/devai.rb && git commit -m 'Add initial devai formula' && git push"

# Step 6: Tap and install
echo "🧪 Step 6: Test it by tapping and installing"
run_or_skip "brew tap msualp/devai"
run_or_skip "brew install msualp/devai/devai"

echo "🎉 All done! Your Homebrew tap is now live and ready to distribute 'devai'!"
