Content-Type: multipart/mixed; boundary="===============8968608300942637331=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH rppt] pti: pti_pgt can be static
Date: Sun, 02 Feb 2020 15:53:04 +0800
Message-ID: <20200202075304.sc6dh3xs6ekzyw5b@f53c9c00458a>
In-Reply-To: <202002021505.A0z7h8Wr%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8968608300942637331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: fd150c5a9ef6 ("pti: use ASI for page table cloning")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 pti.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index f009ab52595e3..e13b8c82ed334 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -59,7 +59,7 @@
 #define	PTI_LEVEL_KERNEL_IMAGE	ASI_LEVEL_PTE
 #endif
 =

-struct pg_table pti_pgt =3D {
+static struct pg_table pti_pgt =3D {
 	.cpu_bitmap =3D CPU_BITS_NONE,
 };
=20
--===============8968608300942637331==--

