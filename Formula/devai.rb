class Devai < Formula
  desc "DevAIccelerate CLI Toolkit for AI-powered developer workflows"
  homepage "https://github.com/msualp/DevAIccelerate"
  url "https://github.com/msualp/DevAIccelerate/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_TARBALL_SHA256"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "devai/bin/dai.sh" => "dai"
  end

  test do
    system "#{bin}/dai", "--version"
  end
end
