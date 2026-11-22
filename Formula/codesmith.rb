# Homebrew formula for CodeSmith, installing the prebuilt release binaries.
class Codesmith < Formula
  desc "Terminal coding agent (a Rust port of OpenCode)"
  homepage "https://github.com/reka18/codesmith"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "24d36c55e4bb0857ddc55d82c7fe40e049272f053d0a161788e378987680db87"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "acc66e168e5f9d00e55145feb289acfdbe02634c6bf6cbd86b91968ef642327b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4640e36fa385de23cf40277ffeab2a7e75422e59851a4c5e40787b2da840416d"
    end
    on_intel do
      url "https://github.com/reka18/codesmith/releases/download/v#{version}/codesmith-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "227c04774cfda132b28bddf97edd7e28ede71177b64ce65faddebc2e1f6ab179"
    end
  end

  def install
    bin.install "codesmith"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codesmith --version")
  end
end
