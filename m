Content-Type: multipart/mixed; boundary="===============1943827157092222125=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [tip:locking/kcsan 12/12] /bin/bash: line 1: 61526 Segmentation fault sparse ...
Date: Thu, 28 May 2020 09:55:53 +0200
Message-ID: <20200528075553.GC706478@hirez.programming.kicks-ass.net>
In-Reply-To: <20200527235442.GC1805@zn.tnic>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1943827157092222125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 01:54:42AM +0200, Borislav Petkov wrote:
> On Thu, May 28, 2020 at 07:39:31AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git loc=
king/kcsan
> > head:   a5dead405f6be1fb80555bdcb77c406bf133fdc8
> > commit: a5dead405f6be1fb80555bdcb77c406bf133fdc8 [12/12] compiler_types=
.h: Optimize __unqual_scalar_typeof compilation time
> > config: i386-randconfig-s002-20200527 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > reproduce:
> >         # apt-get install sparse
> >         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
> >         git checkout a5dead405f6be1fb80555bdcb77c406bf133fdc8
> >         # save the attached .config to linux build tree
> >         make W=3D1 C=3D1 ARCH=3Di386 CF=3D'-fdiagnostic-prefix -D__CHEC=
K_ENDIAN__'
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> I'll say.
> =

> Looking at the subject, that broke the 0day bot too. :-)
> =

> /me trims it.
> =

> Looks like we need __CHECKER__ ifdeffery somewhere but it is too late
> for me to think straight so tomorrow...

I think the problem is that sparse can't parse the C11 _Generic thing.
Someone needs to teach it new tricks.
--===============1943827157092222125==--

