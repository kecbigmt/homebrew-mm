class MmMcp < Formula
  desc "Personal Knowledge Management MCP Server"
  homepage "https://github.com/kecbigmt/homebrew-mm"
  url "https://github.com/kecbigmt/homebrew-mm/releases/download/v0.1.0/mm-mcp.tar.gz"
  sha256 "49253fe4645282ea789f6b3214d87afb3b3f58a922a315fb3f514ffd7f0eeabd"
  version "0.1.0"

  def install
    bin.install "mm-mcp"
  end
end

