Content-Type: multipart/mixed; boundary="===============3624537968019876948=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linux-stable-rc] mmc: sdhci-pci: amd_sdhci_reset() can be static
Date: Wed, 05 Feb 2020 07:19:08 +0800
Message-ID: <20200204231852.7454ydh6bdxie72h@f53c9c00458a>
In-Reply-To: <202002050744.h2qH0Mph%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3624537968019876948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: ac342e0a1f18 ("mmc: sdhci-pci: Quirk for AMD SDHC Device 0x7906")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sdhci-pci-core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci=
-core.c
index 96a163f36a395..8c064348ea106 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -1604,7 +1604,7 @@ static u32 sdhci_read_present_state(struct sdhci_host=
 *host)
 	return sdhci_readl(host, SDHCI_PRESENT_STATE);
 }
 =

-void amd_sdhci_reset(struct sdhci_host *host, u8 mask)
+static void amd_sdhci_reset(struct sdhci_host *host, u8 mask)
 {
 	struct sdhci_pci_slot *slot =3D sdhci_priv(host);
 	struct pci_dev *pdev =3D slot->chip->pdev;
--===============3624537968019876948==--

