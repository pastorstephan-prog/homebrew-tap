class AgentlaunchDoctor < Formula
  desc "Read-only health and privacy diagnostics for macOS LaunchAgents"
  homepage "https://github.com/pastorstephan-prog/agentlaunch-doctor"
  url "https://github.com/pastorstephan-prog/agentlaunch-doctor/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0bcd787a28c981f2a4e38b8a41b7c84dffb1401491b4465bc7a9a4eb94cc6ee7"
  license "ISC"
  head "https://github.com/pastorstephan-prog/agentlaunch-doctor.git", branch: "develop"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/agentlaunch-doctor"
  end

  test do
    assert_equal "0.2.0", shell_output("#{bin}/agentlaunch-doctor --version").strip
    assert_match "Read-only diagnostics", shell_output("#{bin}/agentlaunch-doctor --help")
  end
end
