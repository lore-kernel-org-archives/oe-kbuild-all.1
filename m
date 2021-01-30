Content-Type: multipart/mixed; boundary="===============7633869978323674832=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: kbuild-all@lists.01.org
Subject: [PATCH 2/2] crypto: crypto4xx - Avoid linking failure with HW_RANDOM=m
Date: Sat, 30 Jan 2021 14:55:38 -0800
Message-ID: <20210130225540.1639-2-f.fainelli@gmail.com>
In-Reply-To: <20210130225540.1639-1-f.fainelli@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7633869978323674832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It is currently possible to build CONFIG_HW_RANDOM_PPC4XX=3Dy with
CONFIG_HW_RANDOM=3Dm which would lead to the inability of linking with
devm_hwrng_{register,unregister}. We cannot have the framework modular
and the consumer of that framework built-in, so make that dependency
explicit.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index e535f28a8028..c833ac08ea81 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -348,7 +348,7 @@ config CRYPTO_DEV_PPC4XX
 =

 config HW_RANDOM_PPC4XX
 	bool "PowerPC 4xx generic true random number generator support"
-	depends on CRYPTO_DEV_PPC4XX && HW_RANDOM
+	depends on CRYPTO_DEV_PPC4XX && HW_RANDOM=3Dy
 	default y
 	help
 	 This option provides the kernel-side support for the TRNG hardware
-- =

2.25.1

--===============7633869978323674832==--

