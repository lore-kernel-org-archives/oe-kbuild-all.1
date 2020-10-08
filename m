Content-Type: multipart/mixed; boundary="===============8412761632070342301=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [v2 PATCH] crypto: sun4i-ss - Fix sparse endianness markers
Date: Thu, 08 Oct 2020 16:35:43 -0700
Message-ID: <20201008233543.GD1869638@gmail.com>
In-Reply-To: <20201008063623.GA17802@Red>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8412761632070342301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 08:36:23AM +0200, Corentin Labbe wrote:
> On Thu, Oct 08, 2020 at 04:52:38PM +1100, Herbert Xu wrote:
> > On Thu, Sep 24, 2020 at 03:27:38PM +0200, Corentin Labbe wrote:
> > >
> > > This is an example on next-20200923+BigEndian
> > > alg: ahash: sha1 test failed (wrong result) on test vector \"random: =
psize=3D194 ksize=3D0\", cfg=3D\"random: inplace may_sleep use_finup src_di=
vs=3D[98.25%@+1124, <flush>1.75%@+5] iv_offset=3D18\"

This failure is in one of the randomly generated test cases.  If it doesn't
reproduce reliably, you can set cryptomgr.fuzz_iterations=3D1000 on the ker=
nel
command line (increased from the default 100).

It is confusing that it says just "sha1".  This seems to be a quirk specifi=
c to
how tcrypt calls alg_test().  It's probably really testing "sha1-sun4i-ss".
I guess that testmgr.c should be using the actual cra_driver_name in the log
messages, not the 'driver' string that was passed into alg_test().

- Eric
--===============8412761632070342301==--

