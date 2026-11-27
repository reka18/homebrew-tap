# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent, fully local and careful with your machine"
  homepage "https://github.com/reka18/codesmith"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "43b92f834d085591e81b0cddda616c63697bfb46bb7b469b69f3e8725c6c0043"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fa7c8464c29d969be3fde7a07d27dd56feffff8d4f5295cfc19cd7a3068bbf1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "21e04aa1c9ea5d8c414b97a23c560068409080a25d03beaf52a168169d6baaeb"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f337d0514a044509b791c89497d5db68a463e325ab834b25ce8b31ee4017aa34"
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
