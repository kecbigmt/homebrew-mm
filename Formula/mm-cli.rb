class MmCli < Formula
  desc "Personal Knowledge Management CLI Tool"
  homepage "https://github.com/kecbigmt/homebrew-mm"
  url "https://github.com/kecbigmt/homebrew-mm/releases/download/v0.3.0/mm-cli.tar.gz"
  sha256 "0a4dd5efbe8d1c78ac134371dbf0565fefc32bb1ec1fd12b36743635728b703a"
  version "0.3.0"

  def install
    bin.install "mm"
  end
end

