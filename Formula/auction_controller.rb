class AuctionController < Formula
  desc "Controller to interact with Auction smart contract"
  homepage "https://github.com/LucaSforza/token"
  license "GPL-3.0-only"
  
  url "https://github.com/LucaSforza/token/archive/refs/tags/v0.1.1.tar.gz"
  # Use the checksum you generated in your terminal
  sha256 "972150f08291943a9e3c3ac69303d97169e63f0d9ad6e9cff5c54fcbbc175f43"
  # ============================
  # `head` block, kept as an option
  head "https://github.com/LucaSforza/token.git", branch: "main"

  # depends_on "rust" => :build is cross-platform (works on macOS and Linux)
  depends_on "rust" => :build

  def install
    # The project is in the "auction_controller" subdirectory
      # the correct installation path (`--root`) for both macOS and Linux.
      # This is the key to making your formula cross-platform.
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    # This test is also cross-platform
    system "#{bin}/auction_controller", "--version"
  end
end


