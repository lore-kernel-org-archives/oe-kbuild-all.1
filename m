Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C01A702
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1r3vzo-000bhM-Dy; Fri, 17 Nov 2023 18:22:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Nov 2023 18:22:52 +0800
Date: Fri, 17 Nov 2023 18:22:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: Danny Tsen <dtsen@linux.ibm.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: error:
 'gcm_init_htable' accessing 256 bytes in a region of size 224
Message-ID: <ZVc+/IXxz7VgY3jO@gondor.apana.org.au>
References: <202310290004.TQsw1iN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310290004.TQsw1iN1-lkp@intel.com>

On Sun, Oct 29, 2023 at 12:54:22AM +0800, kernel test robot wrote:
>
>    arch/powerpc/crypto/aes-gcm-p10-glue.c: In function 'gcmp10_init':
> >> arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: error: 'gcm_init_htable' accessing 256 bytes in a region of size 224 [-Werror=stringop-overflow=]
>      121 |         gcm_init_htable(hash->Htable+32, hash->H);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: note: referencing argument 1 of type 'unsigned char[256]'
>    arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: note: referencing argument 2 of type 'unsigned char[16]'
>    arch/powerpc/crypto/aes-gcm-p10-glue.c:41:17: note: in a call to function 'gcm_init_htable'
>       41 | asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
>          |                 ^~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors

Danny, can you please look into this error?

Perhaps htable should be changed to 224?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
