# 🧪 Homebrew Tap for DevAIccelerate

This is the official [Homebrew](https://brew.sh) tap for installing [DevAIccelerate](https://github.com/msualp/DevAIccelerate) — a modular, AI-powered CLI toolkit that enhances developer workflows with smart automation, shell functions, and secure secrets management.

---

## 🚀 Install

To install DevAIccelerate via Homebrew:

```bash
brew tap msualp/devai
brew install devai
```

Then restart your terminal or run:

```bash
source ~/.zshrc
```

---

## 📦 Formula

This tap provides the formula for:

- `devai`: Shell CLI that links to `dai.sh`, the main DevAIccelerate wrapper.

Formula file: [`Formula/devai.rb`](./Formula/devai.rb)

---

## 🧠 Requirements

- `zsh` (recommended)
- `curl`, `git`
- macOS (tested), Linux support unofficial
- Homebrew installed and functional

---

## 🔧 Updating the Formula

To publish a new version:

1. Tag a release in the main repo (e.g. `v1.1.0`)
2. Generate a tarball:

```bash
git archive --prefix=DevAIccelerate/ v1.1.0 | gzip > devai-v1.1.0.tar.gz
shasum -a 256 devai-v1.1.0.tar.gz
```

3. Upload to GitHub Releases.
4. Update the `devai.rb` formula with:
   - New `url`
   - Updated `sha256`
   - New `version`

5. Commit + push the changes to this repo.

---

## 📘 Resources

- [DevAIccelerate GitHub](https://github.com/msualp/DevAIccelerate)
- [Getting Started Guide](https://github.com/msualp/DevAIccelerate/blob/main/GETTING_STARTED.md)
- [Doctor / Diagnostics](https://github.com/msualp/DevAIccelerate#dai-doctor)

---

## 🧹 Uninstall

To uninstall:

```bash
brew uninstall devai
```

For full cleanup, you may also run:

```bash
~/.devai/uninstall.sh
```

---

## 👾 Bug Reports

Please open issues in the main repo:  
👉 [msualp/DevAIccelerate/issues](https://github.com/msualp/DevAIccelerate/issues)

---

## © License

MIT License — © Mustafa Sualp
