Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656015AC9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 23:20:33 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qj6UY-00GYrX-T8; Thu, 21 Sep 2023 07:20:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 21 Sep 2023 07:20:25 +0800
Date: Thu, 21 Sep 2023 07:20:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org
Subject: [PATCH] ipsec: Select CRYPTO_AEAD
Message-ID: <ZQt+OWt0squwZr+z@gondor.apana.org.au>
References: <202309202112.33V1Ezb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309202112.33V1Ezb1-lkp@intel.com>

On Wed, Sep 20, 2023 at 09:57:20PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> head:   1c43c0f1f84aa59dfc98ce66f0a67b2922aa7f9d
> commit: a1383e2ab102c4e0d25304c07c66232c23ee0d9b [47/64] ipsec: Stop using crypto_has_alg
> config: arc-defconfig (https://download.01.org/0day-ci/archive/20230920/202309202112.33V1Ezb1-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202112.33V1Ezb1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309202112.33V1Ezb1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arc-elf-ld: net/xfrm/xfrm_algo.o: in function `xfrm_aead_get_byname':
> >> xfrm_algo.c:(.text+0x46c): undefined reference to `crypto_has_aead'
> >> arc-elf-ld: xfrm_algo.c:(.text+0x46c): undefined reference to `crypto_has_aead'

---8<---
Select CRYPTO_AEAD so that crypto_has_aead is available.

Fixes: 1383e2ab102c ("ipsec: Stop using crypto_has_alg")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309202112.33V1Ezb1-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/net/xfrm/Kconfig b/net/xfrm/Kconfig
index 3adf31a83a79..d7b16f2c23e9 100644
--- a/net/xfrm/Kconfig
+++ b/net/xfrm/Kconfig
@@ -15,6 +15,7 @@ config XFRM_ALGO
 	tristate
 	select XFRM
 	select CRYPTO
+	select CRYPTO_AEAD
 	select CRYPTO_HASH
 	select CRYPTO_SKCIPHER
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
