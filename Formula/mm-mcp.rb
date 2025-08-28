class MmMcp < Formula
  desc "Personal Knowledge Management MCP Server"
  homepage "https://github.com/kecbigmt/homebrew-mm"
  url "https://github.com/kecbigmt/homebrew-mm/releases/download/v0.3.0/mm-mcp.tar.gz"
  sha256 "2b6f44981af557acee7208b2c4ab4b160776245f918556c70523ebf177b29432"
  version "0.3.0"

  def install
    bin.install "mm-mcp"
  end
end

