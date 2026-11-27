# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent, fully local and careful with your machine"
  homepage "https://github.com/reka18/codesmith"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b8a79c6f3664ed30c4af243ba08d3187ca286fff18490dd3096ee2bd4801cacd"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3a64419b0a6c2ffb28095a7a7af17a10ae78ae033ebce61f449d66c8f07d159e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "827f2e331bffc23ceedd3fa16535682f792ac14343de12dcc1b722b3de34ccc4"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7fdd310d8615937d2342bcbf7c5036f13be794b5a3605d171ac3b975d6345ab8"
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
