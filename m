Content-Type: multipart/mixed; boundary="===============1869541834556760090=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH alibaba-cloud] HYGON: x86/pci, x86/amd_nb: hygon_nb_misc_ids[] can be static
Date: Tue, 11 Feb 2020 22:28:55 +0800
Message-ID: <20200211142855.GA5886@9560152b1213>
In-Reply-To: <202002112238.ndaAotte%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1869541834556760090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 7e43e8327881 ("HYGON: x86/pci, x86/amd_nb: Add Hygon Dhyana support =
to PCI and northbridge")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 amd_nb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index dbb5155a84e78..5cf139a678c6d 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -72,7 +72,7 @@ static const struct pci_device_id hygon_root_ids[] =3D {
 	{}
 };
 =

-const struct pci_device_id hygon_nb_misc_ids[] =3D {
+static const struct pci_device_id hygon_nb_misc_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
--===============1869541834556760090==--

