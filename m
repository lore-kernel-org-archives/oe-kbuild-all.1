Content-Type: multipart/mixed; boundary="===============0203645312561153871=="
MIME-Version: 1.0
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [v2 PATCH] crypto: sun4i-ss - Fix sparse endianness markers
Date: Thu, 08 Oct 2020 08:36:23 +0200
Message-ID: <20201008063623.GA17802@Red>
In-Reply-To: <20201008055238.GA9813@gondor.apana.org.au>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0203645312561153871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 04:52:38PM +1100, Herbert Xu wrote:
> On Thu, Sep 24, 2020 at 03:27:38PM +0200, Corentin Labbe wrote:
> >
> > This is an example on next-20200923+BigEndian
> > alg: ahash: sha1 test failed (wrong result) on test vector \"random: ps=
ize=3D194 ksize=3D0\", cfg=3D\"random: inplace may_sleep use_finup src_divs=
=3D[98.25%@+1124, <flush>1.75%@+5] iv_offset=3D18\"
> =

> Hmm, the only way I can see this happening is if it was triggered
> by tcrypt.  Were you using tcrypt by any chance?
> =

> Ccing Eric in case he has any insight.
> =

> > =3D=3D=3D DUMP /proc/crypto =3D=3D=3D
> > name         : sha1
> > driver       : sha1-sun4i-ss
> > module       : kernel
> > priority     : 300
> > refcnt       : 1
> > selftest     : passed
> > internal     : no
> > type         : ahash
> > async        : no
> > blocksize    : 64
> > digestsize   : 20
> =

> ...
> =

> > name         : sha1
> > driver       : sha1-generic
> > module       : kernel
> > priority     : 100
> > refcnt       : 1
> > selftest     : passed
> > internal     : no
> > type         : shash
> > blocksize    : 64
> > digestsize   : 20
> =

> Thanks,

Yes I use tcrypt to force all algos to be tested.
--===============0203645312561153871==--

