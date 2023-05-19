Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47627C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 12:41:59 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pzzQh-00At9I-1i; Fri, 19 May 2023 20:41:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 May 2023 20:41:55 +0800
Date: Fri, 19 May 2023 20:41:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [PATCH] crypto: arm64/sha256-glue - Include module.h
Message-ID: <ZGduk24+8jfDPgcr@gondor.apana.org.au>
References: <202305191953.PIB1w80W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305191953.PIB1w80W-lkp@intel.com>

Include module.h in arch/arm64/crypto/sha256-glue.c as it uses
various macros (such as MODULE_AUTHOR) that are defined there.

Also fix the ordering of types.h.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305191953.PIB1w80W-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm64/crypto/sha256-glue.c b/arch/arm64/crypto/sha256-glue.c
index 9462f6088b3f..9b5c86e07a9a 100644
--- a/arch/arm64/crypto/sha256-glue.c
+++ b/arch/arm64/crypto/sha256-glue.c
@@ -12,8 +12,9 @@
 #include <crypto/internal/simd.h>
 #include <crypto/sha2.h>
 #include <crypto/sha256_base.h>
-#include <linux/types.h>
+#include <linux/module.h>
 #include <linux/string.h>
+#include <linux/types.h>
 
 MODULE_DESCRIPTION("SHA-224/SHA-256 secure hash for arm64");
 MODULE_AUTHOR("Andy Polyakov <appro@openssl.org>");
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
