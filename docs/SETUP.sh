# DevAIccelerate Homebrew Tap Setup Guide

This guide walks you through setting up your custom Homebrew tap so users can install the `devai` CLI via:

```bash
brew tap msualp/devai
brew install devai
```

---

## 🔧 Prerequisites
- A GitHub account with a public repo: `msualp/homebrew-devai`
- A tagged release (e.g. `v0.9.0`) in the main DevAIccelerate repo
- A CLI file like `devai/bin/dai.sh` that can be installed as an executable

---

## 📦 1. Create Your Homebrew Tap Repo
1. Go to https://github.com/new
2. Name it exactly: `homebrew-devai`
3. Make it public
4. Clone it locally:
```bash
git clone https://github.com/msualp/homebrew-devai.git
cd homebrew-devai
mkdir -p Formula
```

---

## ✍️ 2. Create Your Formula File
Inside `Formula/`, create a file named `devai.rb`:

```ruby
class Devai < Formula
  desc "DevAIccelerate CLI Toolkit for AI-powered developer workflows"
  homepage "https://github.com/msualp/DevAIccelerate"
  url "https://github.com/msualp/DevAIccelerate/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256"
  license "MIT"
  version "0.9.0"

  depends_on "bash"
  depends_on "gum"
  depends_on "yq"
  depends_on "go-task/tap/go-task"

  def install
    bin.install "devai/bin/dai.sh" => "dai"
  end

  test do
    system "#{bin}/dai", "--version"
  end
end
```

---

## 🔢 3. Generate SHA256
1. Download the tagged release archive:
```bash
curl -L -o devai.tar.gz https://github.com/msualp/DevAIccelerate/archive/refs/tags/v0.9.0.tar.gz
```
2. Calculate its checksum:
```bash
shasum -a 256 devai.tar.gz
```
3. Replace the `sha256` field in your `devai.rb` with the result.

---

## 🚀 4. Push the Formula
```bash
git add Formula/devai.rb
git commit -m "Add initial devai formula"
git push origin main
```

---

## 🧪 5. Test the Tap & Installation
```bash
brew untap msualp/devai 2>/dev/null
brew tap msualp/devai
brew install msualp/devai/devai
```

---

## ✅ Done!
Your users can now install DevAIccelerate CLI using Homebrew:
```bash
brew tap msualp/devai
brew install devai
```

---

Need an automated GitHub Actions workflow for formula publishing? See `publish-brew-formula.yml` in `.github/workflows/` or reach out in Issues.

