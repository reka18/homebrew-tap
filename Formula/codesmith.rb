# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent (a Rust port of OpenCode)"
  homepage "https://github.com/reka18/codesmith"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c82fc1807f91eef8c6e2a67ce52f1ba6a520f254b5744380059f4509f81faaf2"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "486100296c928129554a3ccd944c91795db4a5863ef59230c184aea8f33f57be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "917f4e66fa61b4c4b400ed6b4a3d3de7923a14c6906b976260db019c11b9db47"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bdd1df829e67b9ca5afa87b963723107881931f48b8d38782a117f578f39f751"
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
