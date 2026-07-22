class AgentlaunchDoctor < Formula
  desc "Read-only health and privacy diagnostics for macOS LaunchAgents"
  homepage "https://github.com/pastorstephan-prog/agentlaunch-doctor"
  url "https://github.com/pastorstephan-prog/agentlaunch-doctor/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "931f43bed83e3343b5a64f04ab52c29047390689b4b3f87a85a05c112b69d26c"
  license "ISC"
  head "https://github.com/pastorstephan-prog/agentlaunch-doctor.git", branch: "develop"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/agentlaunch-doctor"
  end

  test do
    assert_equal "0.2.2", shell_output("#{bin}/agentlaunch-doctor --version").strip
    assert_match "Read-only diagnostics", shell_output("#{bin}/agentlaunch-doctor --help")
  end
end
