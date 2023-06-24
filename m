Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB199A45
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 07:47:08 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qCxyu-006hCq-Kf; Sat, 24 Jun 2023 15:46:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 24 Jun 2023 15:46:52 +0800
Date: Sat, 24 Jun 2023 15:46:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH] crypto: sm2 - Provide sm2_compute_z_digest when sm2 is
 disabled
Message-ID: <ZJafbEJ4SOYPEo1N@gondor.apana.org.au>
References: <202306231917.utO12sx8-lkp@intel.com>
 <ZJZ8/JifEeygojAq@gondor.apana.org.au>
 <CAMj1kXGKnusvWDV8rSUhQexeKy1e2+x2-ZXw6_6RiExvtiR_8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGKnusvWDV8rSUhQexeKy1e2+x2-ZXw6_6RiExvtiR_8A@mail.gmail.com>

On Sat, Jun 24, 2023 at 09:40:59AM +0200, Ard Biesheuvel wrote:
>
> How is this supposed to work when
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y but SM2 is configured as a
> module?

It will fail as it did previously.  I'm just rearranging the code.
Perhaps when another algorithm that requires a non-standard digest
comes up we can think up of a proper abstraction.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
