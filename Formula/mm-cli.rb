class MmCli < Formula
  desc "Personal Knowledge Management CLI Tool"
  homepage "https://github.com/kecbigmt/homebrew-mm"
  url "https://github.com/kecbigmt/homebrew-mm/releases/download/v0.2.0/mm-cli.tar.gz"
  sha256 "28b8d1364ddafd0d1e18ebf3f8c3d4bb703516ecf9ff7b32e75d35a83c60eab3"
  version "0.2.0"

  def install
    bin.install "mm"
  end
end

