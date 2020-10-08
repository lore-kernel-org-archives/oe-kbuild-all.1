Content-Type: multipart/mixed; boundary="===============8236691308350599086=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kbuild-all@lists.01.org
Subject: Re: [v2 PATCH] crypto: sun4i-ss - Fix sparse endianness markers
Date: Thu, 08 Oct 2020 16:52:38 +1100
Message-ID: <20201008055238.GA9813@gondor.apana.org.au>
In-Reply-To: <20200924132738.GA24386@Red>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8236691308350599086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 03:27:38PM +0200, Corentin Labbe wrote:
>
> This is an example on next-20200923+BigEndian
> alg: ahash: sha1 test failed (wrong result) on test vector \"random: psiz=
e=3D194 ksize=3D0\", cfg=3D\"random: inplace may_sleep use_finup src_divs=
=3D[98.25%@+1124, <flush>1.75%@+5] iv_offset=3D18\"

Hmm, the only way I can see this happening is if it was triggered
by tcrypt.  Were you using tcrypt by any chance?

Ccing Eric in case he has any insight.

> =3D=3D=3D DUMP /proc/crypto =3D=3D=3D
> name         : sha1
> driver       : sha1-sun4i-ss
> module       : kernel
> priority     : 300
> refcnt       : 1
> selftest     : passed
> internal     : no
> type         : ahash
> async        : no
> blocksize    : 64
> digestsize   : 20

...

> name         : sha1
> driver       : sha1-generic
> module       : kernel
> priority     : 100
> refcnt       : 1
> selftest     : passed
> internal     : no
> type         : shash
> blocksize    : 64
> digestsize   : 20

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============8236691308350599086==--

