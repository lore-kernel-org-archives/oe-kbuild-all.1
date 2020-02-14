Content-Type: multipart/mixed; boundary="===============3716744041107949026=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH joro] x86/sev-es: __pcpu_scope_sev_es_in_nmi can be static
Date: Fri, 14 Feb 2020 08:03:49 +0800
Message-ID: <20200214000348.GA37167@9560152b1213>
In-Reply-To: <202002140844.zh7IfsiN%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3716744041107949026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: c4e912b6ad8a ("x86/sev-es: Add NMI state tracking")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sev-es.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index fa65e60ebc0813..b9fd28db1c5f71 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -36,7 +36,7 @@ struct ghcb boot_ghcb_page __bss_decrypted __aligned(PAGE=
_SIZE);
  */
 struct ghcb __initdata *boot_ghcb;
 static DEFINE_PER_CPU(unsigned long, cached_dr7) =3D DR7_RESET_VALUE;
-DEFINE_PER_CPU(bool, sev_es_in_nmi) =3D false;
+static DEFINE_PER_CPU(bool, sev_es_in_nmi) =3D false;
 /* Needed before per-cpu access is set up */
 static unsigned long early_dr7 =3D DR7_RESET_VALUE;
=20
--===============3716744041107949026==--

