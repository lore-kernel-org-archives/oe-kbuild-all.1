Content-Type: multipart/mixed; boundary="===============6385637953191540450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH freescale-fslc] PCI: mobiveil: __program_ob_windows() can be static
Date: Thu, 28 Jan 2021 14:31:21 +0800
Message-ID: <20210128063121.GA8306@be2581ec6a45>
In-Reply-To: <202101281443.2ZDOgxqh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6385637953191540450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: b2765d55823b ("PCI: mobiveil: Add the EP driver support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 pcie-mobiveil.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.c b/drivers/pci/=
controller/mobiveil/pcie-mobiveil.c
index 6d47164e5eeb3..0565754b3b04e 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.c
@@ -168,8 +168,8 @@ void program_ib_windows(struct mobiveil_pcie *pcie, int=
 win_num, u64 cpu_addr,
 /*
  * routine to program the outbound windows
  */
-void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, int win_=
num,
-			  u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
+static void __program_ob_windows(struct mobiveil_pcie *pcie, u8 func_no, i=
nt win_num,
+				 u64 cpu_addr, u64 pci_addr, u32 type, u64 size)
 {
 	u32 value;
 	u64 size64 =3D ~(size - 1);
--===============6385637953191540450==--

