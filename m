Content-Type: multipart/mixed; boundary="===============1230727915100023985=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: kbuild-all@lists.01.org
Subject: [PATCH 1/2] powerpc/Kconfig: Fix unmet direct dependency on NET
Date: Sat, 30 Jan 2021 14:55:37 -0800
Message-ID: <20210130225540.1639-1-f.fainelli@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1230727915100023985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kbuild test robot was able to generate a configuration where
ETHERNET and NETDEVICES was selected by the Akenobo platform but not
NET, which resulted in various build failures and these Kconfig
warnings:

WARNING: unmet direct dependencies detected for NETDEVICES
  Depends on [n]: NET [=3Dn]
  Selected by [y]:
  - AKEBONO [=3Dy] && PPC_47x [=3Dy]

WARNING: unmet direct dependencies detected for ETHERNET
  Depends on [n]: NETDEVICES [=3Dy] && NET [=3Dn]
  Selected by [y]:
  - AKEBONO [=3Dy] && PPC_47x [=3Dy]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/powerpc/platforms/44x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44=
x/Kconfig
index 78ac6d67a935..68bd647c878f 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -206,6 +206,7 @@ config AKEBONO
 	select PPC4xx_HSTA_MSI
 	select I2C
 	select I2C_IBM_IIC
+	select NET
 	select NETDEVICES
 	select ETHERNET
 	select NET_VENDOR_IBM
-- =

2.25.1

--===============1230727915100023985==--

