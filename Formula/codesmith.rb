# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent (a Rust port of OpenCode)"
  homepage "https://github.com/reka18/codesmith"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b70a5d3b552195224d1fcfd90bc382ddf9bf28440d430a3d2b26f183b7042456"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "007b61b109fce45809b46a3201e91323f62984de3b2554eef0b81ae98f908aba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3028707064e2f79ad97fdd5cd6c537b155aac216bd75ef96af2080f0b48f39bb"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9d067e076ede8891d9df8710ef60d68d187886c99972f92a65a860b6027fcc4f"
    end
  end

  def install
    bin.install "codesmith"
  end

  # The banner every installer shows (packaging/banner.txt, without the
  # Enter prompt: Homebrew shows caveats after it has finished).
  def caveats
    <<~EOS
      ╔════════════════════════════════════════════════════════════╗
      ║                                                            ║
      ║   ⚒︎  CodeSmith forged successfully                         ║
      ║                                                            ║
      ║         ██████╗ ██████╗ ██████╗ ███████╗                   ║
      ║        ██╔════╝██╔═══██╗██╔══██╗██╔════╝                   ║
      ║        ██║     ██║   ██║██║  ██║█████╗                     ║
      ║        ██║     ██║   ██║██║  ██║██╔══╝                     ║
      ║        ╚██████╗╚██████╔╝██████╔╝███████╗                   ║
      ║         ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                   ║
      ║                                                            ║
      ║                 ███████╗███╗   ███╗██╗████████╗██╗  ██╗    ║
      ║                 ██╔════╝████╗ ████║██║╚══██╔══╝██║  ██║    ║
      ║                 ███████╗██╔████╔██║██║   ██║   ███████║    ║
      ║                 ╚════██║██║╚██╔╝██║██║   ██║   ██╔══██║    ║
      ║                 ███████║██║ ╚═╝ ██║██║   ██║   ██║  ██║    ║
      ║                 ╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝    ║
      ║                                                            ║
      ║       🔥 Golden fire → mithril code. Ready to forge.       ║
      ║                                                            ║
      ║                                                            ║
      ║                                                            ║
      ╚════════════════════════════════════════════════════════════╝
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codesmith --version")
  end
end
