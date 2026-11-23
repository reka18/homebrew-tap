# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent (a Rust port of OpenCode)"
  homepage "https://github.com/reka18/codesmith"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3dd487910287818727807aea91330af0944b202b78893a86f69d512edfa567f5"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9e0be28aabd72f87e67e7142a1e8a7d4f980404f4a23a265b60eabcc1ba151fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e298199ff8c5f7f28c280bc74e5ac294c97a172d2f0e704ea6d3089d6586b29a"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ed562a08f18bc3eea148432ae8dcfb30c812f6e41bdb771e88a60cd482dd8433"
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
