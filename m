Content-Type: multipart/mixed; boundary="===============4006539892380380188=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] KVM: CPUID: kvm_supported_xss() can be static
Date: Thu, 13 Feb 2020 18:09:29 +0800
Message-ID: <20200213100925.GA28399@9560152b1213>
In-Reply-To: <20200211065706.3462-1-weijiang.yang@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4006539892380380188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: c0a25f0ace60 ("KVM: CPUID: Enable supervisor XSAVE states in CPUID e=
numeration and XSS")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 cpuid.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 0f42df82e9a0f..04f80b3ec18a3 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -63,7 +63,7 @@ u64 kvm_supported_xcr0(void)
 }
 =

 extern int host_xss;
-u64 kvm_supported_xss(void)
+static u64 kvm_supported_xss(void)
 {
 	return KVM_SUPPORTED_XSS & host_xss;
 }
--===============4006539892380380188==--

