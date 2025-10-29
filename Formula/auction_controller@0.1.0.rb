class AuctionControllerAT010 < Formula
  desc "Controller to interact with Auction smart contract"
  homepage "https://github.com/LucaSforza/token"
  license "GPL-3.0-only"
  head "https://github.com/LucaSforza/token"

  depends_on "rust" => :build

  def install
    system "cargo", "install","--root=/opt/homebrew/Cellar/auction_controller@0.1.0/HEAD", "--git", "https://github.com/LucaSforza/token" 
  end

  test do
    system "true"
  end
end
