class AuctionController < Formula
  desc "Controller to interact with Auction smart contract"
  homepage "https://github.com/LucaSforza/token"
  license "GPL-3.0-only"
  
  url "https://github.com/LucaSforza/token/archive/refs/tags/v1.0.0.tar.gz"
  # Use the checksum you generated in your terminal
  sha256 "731c453a4bf6abdd4f4cbc60af63156612369896c91cc00bab7e81f068bd3940"
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

  test do
    # This test is also cross-platform
    system "#{bin}/auction_controller", "--version"
  end
end
