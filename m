Content-Type: multipart/mixed; boundary="===============2928750224910778262=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] x86/paravirt: kvm_sev_migration_hcall() can be static
Date: Fri, 01 May 2020 19:00:37 +0800
Message-ID: <20200501110036.GA54286@c61ca2aeffc5>
In-Reply-To: <d0e5e3227e24272ec5f277e6732c5e0a1276d4e1.1588234824.git.ashish.kalra@amd.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2928750224910778262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 kvm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 928ddb8a8cfc7..884ba9203d3b4 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -730,8 +730,8 @@ static void __init kvm_init_platform(void)
 }
 =

 #if defined(CONFIG_AMD_MEM_ENCRYPT)
-long kvm_sev_migration_hcall(unsigned long physaddr, unsigned long npages,
-			     bool enc)
+static long kvm_sev_migration_hcall(unsigned long physaddr, unsigned long =
npages,
+				    bool enc)
 {
 	return kvm_sev_hypercall3(KVM_HC_PAGE_ENC_STATUS, physaddr, npages,
 				  enc);
--===============2928750224910778262==--

