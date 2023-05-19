Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D07C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 12:35:18 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pzzK5-00Aszm-Pp; Fri, 19 May 2023 20:35:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 May 2023 20:35:05 +0800
Date: Fri, 19 May 2023 20:35:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org
Subject: [PATCH] crypto: api - Include moduleparam.h in algapi.h
Message-ID: <ZGds+aqCYGDXoEQc@gondor.apana.org.au>
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

The header file algapi.h uses __MODULE_INFO but doesn't include
its definition.  Fix this by including moduleparam.h.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 016d5a302b84..2d414b130e26 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -11,6 +11,7 @@
 #include <linux/align.h>
 #include <linux/cache.h>
 #include <linux/crypto.h>
+#include <linux/moduleparam.h>
 #include <linux/types.h>
 
 /*
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
