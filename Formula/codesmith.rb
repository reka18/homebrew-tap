# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent (a Rust port of OpenCode)"
  homepage "https://github.com/reka18/codesmith"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "daea6d30f70322f371aea9784734c07d0394e279f58508608aeddcd314930a4e"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e29e31a747729d7b703600eb6a28dbc79c0f03d291468055ab6293094dd8d324"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ea3bcf04b476133c8316ad475f28e0a2dbc8fde4f68b04d161ab001b98d09841"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2229a43093d161deeb79198c2c61e84a938476e976a61f705703c3ec738f0651"
    end
  end

  def install
    bin.install "codesmith"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codesmith --version")
  end
end
