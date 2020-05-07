Content-Type: multipart/mixed; boundary="===============1224166467339754350=="
MIME-Version: 1.0
From: Leon Romanovsky <leon@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v14 23/25] block/rnbd: include client and server modules into kernel compilation
Date: Thu, 07 May 2020 10:12:56 +0300
Message-ID: <20200507071256.GD78674@unreal>
In-Reply-To: <CAMGffE=58PZSp3B14d_jCCKwPDr_YHoWxJs9gsmg-2Af60vnrw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1224166467339754350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 09:05:26AM +0200, Jinpu Wang wrote:
> Hi, Kbuild test robot,
>
> On Tue, May 5, 2020 at 11:34 PM kbuild test robot <lkp@intel.com> wrote:
> >
> > Hi Danil,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on block/for-next]
> > [also build test ERROR on driver-core/driver-core-testing rdma/for-next=
 linus/master v5.7-rc4 next-20200505]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to help
> > improve the system. BTW, we also suggest to use '--base' option to spec=
ify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/3=
7406982]
> >
> > url:    https://github.com/0day-ci/linux/commits/Danil-Kipnis/RTRS-form=
er-IBTRS-RDMA-Transport-Library-and-RNBD-former-IBNBD-RDMA-Network-Block-De=
vice/20200505-072234
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-blo=
ck.git for-next
> > config: c6x-allyesconfig (attached as .config)
> > compiler: c6x-elf-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cro=
ss ARCH=3Dc6x
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from drivers/block/rnbd/rnbd-clt.c:19:
> > >> drivers/block/rnbd/rnbd-clt.h:19:10: fatal error: rtrs.h: No such fi=
le or directory
> >       19 | #include <rtrs.h>
> >          |          ^~~~~~~~
> >    compilation terminated.
> > --
> >    In file included from drivers/block/rnbd/rnbd-srv.c:15:
> > >> drivers/block/rnbd/rnbd-srv.h:16:10: fatal error: rtrs.h: No such fi=
le or directory
> >       16 | #include <rtrs.h>
> >          |          ^~~~~~~~
> >    compilation terminated.
> >
> > vim +19 drivers/block/rnbd/rnbd-clt.h
> looks somehow the "ccflags-y :=3D -Idrivers/infiniband/ulp/rtrs " was
> ignored in your case
>
> We'll try to repro on ourside, can you also check on your side why
> ccflags is ignored?

It should be ccflags-y :=3D -I $(srctree)/drivers/infiniband/ulp/rtrs

Thanks

>
> Thanks!
> Jinpu
--===============1224166467339754350==--

