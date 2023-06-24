Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F17FC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 05:51:32 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qCvgi-006fz8-0O; Sat, 24 Jun 2023 13:19:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 24 Jun 2023 13:19:56 +0800
Date: Sat, 24 Jun 2023 13:19:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org
Subject: [PATCH] crypto: sm2 - Provide sm2_compute_z_digest when sm2 is
 disabled
Message-ID: <ZJZ8/JifEeygojAq@gondor.apana.org.au>
References: <202306231917.utO12sx8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306231917.utO12sx8-lkp@intel.com>

On Fri, Jun 23, 2023 at 07:22:29PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
> head:   b335f258e8ddafec0e8ae2201ca78d29ed8f85eb
> commit: e5221fa6a355112ddcc29dc82a94f7c3a1aacc0b [76/81] KEYS: asymmetric: Move sm2 code into x509_public_key
> config: nios2-randconfig-r031-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231917.utO12sx8-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231917.utO12sx8-lkp@intel.com/reproduce)

---8<---
When sm2 is disabled we need to provide an implementation of
sm2_compute_z_digest.

Fixes: e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into x509_public_key")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306231917.utO12sx8-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/crypto/sm2.h b/include/crypto/sm2.h
index 7094d75ed54c..04a92c1013c8 100644
--- a/include/crypto/sm2.h
+++ b/include/crypto/sm2.h
@@ -13,7 +13,16 @@
 
 struct shash_desc;
 
+#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
 int sm2_compute_z_digest(struct shash_desc *desc,
 			 const void *key, unsigned int keylen, void *dgst);
+#else
+static inline int sm2_compute_z_digest(struct shash_desc *desc,
+				       const void *key, unsigned int keylen,
+				       void *dgst)
+{
+	return -ENOTSUPP;
+}
+#endif
 
 #endif /* _CRYPTO_SM2_H */
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
