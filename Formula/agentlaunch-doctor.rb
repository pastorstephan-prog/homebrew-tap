class AgentlaunchDoctor < Formula
  desc "Read-only health and privacy diagnostics for macOS LaunchAgents"
  homepage "https://github.com/pastorstephan-prog/agentlaunch-doctor"
  url "https://github.com/pastorstephan-prog/agentlaunch-doctor/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7c5e10a4abecd8547c01b796f6787e3cd7322f95f406d45c36de4a7ee94ee051"
  license "ISC"
  head "https://github.com/pastorstephan-prog/agentlaunch-doctor.git", branch: "develop"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/agentlaunch-doctor"
  end

  test do
    assert_equal "0.3.0", shell_output("#{bin}/agentlaunch-doctor --version").strip
    assert_match "Read-only diagnostics", shell_output("#{bin}/agentlaunch-doctor --help")
  end
end
