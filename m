Content-Type: multipart/mixed; boundary="===============5713825355129873873=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: ".crypto_skcipher_setkey" undefined!
Date: Mon, 04 Jan 2021 16:21:11 +1100
Message-ID: <20210104052111.GA18507@gondor.apana.org.au>
In-Reply-To: <202101030238.zELW4VPr-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5713825355129873873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 02:37:42AM +0800, kernel test robot wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    ERROR: ".kmem_cache_alloc" [net/nfc/nfc.ko] undefined!
>    ERROR: ".__ubsan_handle_type_mismatch_v1" [net/nfc/nfc.ko] undefined!
>    ERROR: ".find_next_zero_bit" [net/nfc/nfc.ko] undefined!

...

> >> ERROR: ".crypto_skcipher_setkey" [net/ceph/libceph.ko] undefined!

This looks like a bug in lkp.  Could you please have a look?

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============5713825355129873873==--

