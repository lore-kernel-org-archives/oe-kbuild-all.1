Content-Type: multipart/mixed; boundary="===============1696792613443327456=="
MIME-Version: 1.0
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference of noderef expression
Date: Wed, 06 Jan 2021 15:07:24 +0000
Message-ID: <20210106150724.GA16591@arm.com>
In-Reply-To: <20201218104410.GB5258@gaia>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1696792613443327456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Friday 18 Dec 2020 at 10:44:10 (+0000), Catalin Marinas wrote:
> On Fri, Dec 18, 2020 at 05:00:16AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   74f602dc96dd854c7b2034947798c1e2a6b84066
> > commit: 68c5debcc06d6d24f15dbf978780fc5efc147d5e arm64: implement CPPC =
FFH support using AMUs
> > date:   5 weeks ago
> > config: arm64-randconfig-s032-20201217 (attached as .config)
> > compiler: aarch64-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # apt-get install sparse
> >         # sparse version: v0.6.3-184-g1b896707-dirty
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D68c5debcc06d6d24f15dbf978780fc5efc147d5e
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 68c5debcc06d6d24f15dbf978780fc5efc147d5e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > =

> > "sparse warnings: (new ones prefixed by >>)"
> > >> arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference of =
noderef expression
> > =

> > vim +367 arch/arm64/kernel/topology.c
> > =

> >    362	=

> >    363	int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> >    364	{
> >    365		int ret =3D -EOPNOTSUPP;
> >    366	=

> >  > 367		switch ((u64)reg->address) {
> =

> That's not a dereference but I guess sparse complains of dropping the
> __iomem. We could change the cast to (__force u64) to silence sparse.
> =

> Thanks for the report.
> =


Nothing I've tried seemed to silence sparse here, including casting to
(__force u64). I think all error checks in the kernel for __iomem
addresses result in the same warning, or at least the ones in
cppc_acpi.c, which I've checked at the time. I'm not sure if this is
something that should be improved in sparse or that can be made better
in the kernel. I'll take another look.

Thank you,
Ionela.

> -- =

> Catalin
--===============1696792613443327456==--

