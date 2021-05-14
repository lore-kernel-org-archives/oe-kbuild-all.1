Content-Type: multipart/mixed; boundary="===============2947170322885021503=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: kbuild-all@lists.01.org
Subject: [PATCH 1/2] KVM: arm64: Mark pkvm_pgtable_mm_ops static
Date: Fri, 14 May 2021 08:56:39 +0000
Message-ID: <20210514085640.3917886-2-qperret@google.com>
In-Reply-To: <20210514085640.3917886-1-qperret@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2947170322885021503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It is not used outside of setup.c, mark it static.

Fixes:f320bc742bc2 ("KVM: arm64: Prepare the creation of s1 mappings at EL2=
")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setu=
p.c
index 7488f53b0aa2..a3d3a275344e 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -17,7 +17,6 @@
 #include <nvhe/trap_handler.h>
 =

 struct hyp_pool hpool;
-struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 unsigned long hyp_nr_cpus;
 =

 #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
@@ -27,6 +26,7 @@ static void *vmemmap_base;
 static void *hyp_pgt_base;
 static void *host_s2_mem_pgt_base;
 static void *host_s2_dev_pgt_base;
+static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 =

 static int divide_memory_pool(void *virt, unsigned long size)
 {
-- =

2.31.1.751.gd2f1c929bd-goog

--===============2947170322885021503==--

