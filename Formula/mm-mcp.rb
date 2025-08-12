class MmMcp < Formula
  desc "Personal Knowledge Management MCP Server"
  homepage "https://github.com/kecbigmt/homebrew-mm"
  url "https://github.com/kecbigmt/homebrew-mm/releases/download/v0.2.0/mm-mcp.tar.gz"
  sha256 "f160898d1bf4f53781af4e8933a06dc33ab629688501a1e345cb12309d9f8c74"
  version "0.2.0"

  def install
    bin.install "mm-mcp"
  end
end

