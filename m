Content-Type: multipart/mixed; boundary="===============8783041908731714536=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 12485/12912] cc1: error: arch/um/include/uapi: No such file or directory
Date: Thu, 28 May 2020 09:37:14 +0800
Message-ID: <20200528013714.GF12984@intel.com>
In-Reply-To: <20200527150004.8a7daf78ee736503f0a437a0@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8783041908731714536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 03:00:04PM -0700, Andrew Morton wrote:
> On Wed, 27 May 2020 20:02:15 +0800 kbuild test robot <lkp@intel.com> wr=
ote:
> =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> > commit: cb6c014b5a3f9082ef4ff45684d7bf17e5441b36 [12485/12912] lib: mak=
e a test module with set/clear bit
> > config: um-allmodconfig (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         git checkout cb6c014b5a3f9082ef4ff45684d7bf17e5441b36
> >         # save the attached .config to linux build tree
> >         make W=3D1 ARCH=3Dum =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > =

> > >> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=
=3Dmissing-include-dirs]
> > cc1: all warnings being treated as errors
> =

> Thanks.    I don't think this patch could cause this error.  I suspect th=
e um
> Makefiles are having problems.
Got it, thanks for the input, we will double check this. Sorry for the nois=
e.

> =

> When I do
> =

> make allmodconfig
> make -j20 W=3D1 M=3Dlib
> =

> I get a screenful of these warnings.
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============8783041908731714536==--

