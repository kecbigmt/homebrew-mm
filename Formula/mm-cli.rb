class Mmcli < Formula
  desc "Personal Knowledge Management CLI Tool"
  homepage "https://github.com/kecbigmt/homebrew-mm"
  url "https://github.com/kecbigmt/mm/releases/download/v0.1.0/mm-cli.tar.gz"
  sha256 "3d401b5f290c11fc67fe41f1e15c008e98d57937628bd316514db2199a519193"
  version "0.1.0"

  def install
    bin.install "mm"
  end
end

