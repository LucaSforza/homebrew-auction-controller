class AuctionController < Formula
  desc "Controller to interact with Auction smart contract"
  homepage "https://github.com/LucaSforza/token"
  license "GPL-3.0-only" # You MUST add a LICENSE file to your repo for this to be valid
  
  # === THIS IS THE NEW PART ===
  # Use the URL you copied from GitHub
  url "https://github.com/LucaSforza/token/archive/refs/tags/v0.1.0.tar.gz"
  # Use the checksum you generated in your terminal
  sha256 "26621c02a2b0b2e3061a402d202100c8ffe90282e5e6f06b85b9623f2b2bb114"
  # ============================

  # This is your old `head` block, kept as an option
  head "https://github.com/LucaSforza/token.git", branch: "main"

  # depends_on "rust" => :build is cross-platform (works on macOS and Linux)
  depends_on "rust" => :build

  def install
    # The project is in the "auction_controller" subdirectory
    cd "auction_controller" do
      # `std_cargo_args` is a Homebrew helper that automatically provides
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


