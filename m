Content-Type: multipart/mixed; boundary="===============0319483166174773652=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: kbuild-all@lists.01.org
Subject: [PATCH 2/2] KVM: arm64: Mark the host stage-2 memory pools static
Date: Fri, 14 May 2021 08:56:40 +0000
Message-ID: <20210514085640.3917886-3-qperret@google.com>
In-Reply-To: <20210514085640.3917886-1-qperret@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0319483166174773652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The host stage-2 memory pools are not used outside of mem_protect.c,
mark them static.

Fixes: 1025c8c0c6ac ("KVM: arm64: Wrap the host with a stage 2")
Reported-by: Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index e342f7f4f4fb..4b60c0056c04 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -23,8 +23,8 @@
 extern unsigned long hyp_nr_cpus;
 struct host_kvm host_kvm;
 =

-struct hyp_pool host_s2_mem;
-struct hyp_pool host_s2_dev;
+static struct hyp_pool host_s2_mem;
+static struct hyp_pool host_s2_dev;
 =

 /*
  * Copies of the host's CPU features registers holding sanitized values.
-- =

2.31.1.751.gd2f1c929bd-goog

--===============0319483166174773652==--

