Content-Type: multipart/mixed; boundary="===============5441448818506845849=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 12485/12912] cc1: error: arch/um/include/uapi: No such file or directory
Date: Wed, 27 May 2020 15:00:04 -0700
Message-ID: <20200527150004.8a7daf78ee736503f0a437a0@linux-foundation.org>
In-Reply-To: <202005272012.4IvWDLWv%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5441448818506845849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 27 May 2020 20:02:15 +0800 kbuild test robot <lkp@intel.com> wrot=
e:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> commit: cb6c014b5a3f9082ef4ff45684d7bf17e5441b36 [12485/12912] lib: make =
a test module with set/clear bit
> config: um-allmodconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> reproduce (this is a W=3D1 build):
>         git checkout cb6c014b5a3f9082ef4ff45684d7bf17e5441b36
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Dum =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=
=3Dmissing-include-dirs]
> cc1: all warnings being treated as errors

Thanks.    I don't think this patch could cause this error.  I suspect the =
um
Makefiles are having problems.

When I do

make allmodconfig
make -j20 W=3D1 M=3Dlib

I get a screenful of these warnings.

--===============5441448818506845849==--

