Content-Type: multipart/mixed; boundary="===============6663899712107348486=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 4/6] ceph: convert readpage to fscache read helper
Date: Wed, 27 Jan 2021 14:18:21 -0500
Message-ID: <c6418843ae3aaeed513b113b4f6ff5bb729661f4.camel@kernel.org>
In-Reply-To: <202101280215.a8qmcnML-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6663899712107348486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-28 at 02:46 +0800, kernel test robot wrote:
> Hi Jeff,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on ceph-client/for-linus]
> [also build test ERROR on linux/master v5.11-rc5 next-20210125]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =


Ahh yes, wrong trees. This is layered on top of David Howells' patches
that add the new netfs library. linux-next should get both soon.

> url:    https://github.com/0day-ci/linux/commits/Jeff-Layton/ceph-convert=
-to-new-netfs-read-helpers/20210127-083827
> base:   https://github.com/ceph/ceph-client.git for-linus
> config: x86_64-rhel-7.6-kselftests (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# https://github.com/0day=
-ci/linux/commit/3cb698f4d19ac0add50a4d8b9ddda40d463c56eb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git remote add linux-revi=
ew https://github.com/0day-ci/linux
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git fetch --no-tags linux=
-review Jeff-Layton/ceph-convert-to-new-netfs-read-helpers/20210127-083827
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git checkout 3cb698f4d19a=
c0add50a4d8b9ddda40d463c56eb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# save the attached .conf=
ig to linux build tree
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0make W=3D1 ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> =C2=A0=C2=A0=C2=A0In file included from fs/ceph/super.c:22:
> > > fs/ceph/cache.h:12:10: fatal error: linux/netfs.h: No such file or di=
rectory
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A012 | #include <linux/netfs.h>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|          ^~~~~~~~=
~~~~~~~
> =C2=A0=C2=A0=C2=A0compilation terminated.
> --
> > > fs/ceph/addr.c:15:10: fatal error: linux/netfs.h: No such file or dir=
ectory
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A015 | #include <linux/netfs.h>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|          ^~~~~~~~=
~~~~~~~
> =C2=A0=C2=A0=C2=A0compilation terminated.
> =

> =

> vim +12 fs/ceph/cache.h
> =

> =C2=A0=C2=A0=C2=A0=C2=A011	=

> =C2=A0=C2=A0> 12	#include <linux/netfs.h>
> =C2=A0=C2=A0=C2=A0=C2=A013	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

-- =

Jeff Layton <jlayton@kernel.org>

--===============6663899712107348486==--

