Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B958C376
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 05:53:44 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pcgBi-0050Ka-Qi; Thu, 16 Mar 2023 13:30:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 16 Mar 2023 13:30:06 +0800
Date: Thu, 16 Mar 2023 13:30:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: Yang Li <yang.lee@linux.alibaba.com>, oe-kbuild-all@lists.linux.dev,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [PATCH] crypto: ccree - Depend on HAS_IOMEM
Message-ID: <ZBKpXuRuEz3IRCZf@gondor.apana.org.au>
References: <202303161354.T2OZFUFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303161354.T2OZFUFZ-lkp@intel.com>

Add dependency on HAS_IOMEM as the build will fail without it.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303161354.T2OZFUFZ-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 351d05db39cf..ea0a1036c6e3 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -774,7 +774,7 @@ config CRYPTO_DEV_ARTPEC6
 config CRYPTO_DEV_CCREE
 	tristate "Support for ARM TrustZone CryptoCell family of security processors"
 	depends on CRYPTO && CRYPTO_HW && OF && HAS_DMA
-	default n
+	depends on HAS_IOMEM
 	select CRYPTO_HASH
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_DES
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
