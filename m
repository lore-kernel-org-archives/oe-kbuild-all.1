Content-Type: multipart/mixed; boundary="===============1035000627802366170=="
MIME-Version: 1.0
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference of noderef expression
Date: Wed, 06 Jan 2021 15:52:14 +0000
Message-ID: <20210106155214.GA30892@arm.com>
In-Reply-To: <20210106152118.GA23403@gaia>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1035000627802366170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wednesday 06 Jan 2021 at 15:21:19 (+0000), Catalin Marinas wrote:
> On Wed, Jan 06, 2021 at 03:07:24PM +0000, Ionela Voinescu wrote:
> > On Friday 18 Dec 2020 at 10:44:10 (+0000), Catalin Marinas wrote:
> > > On Fri, Dec 18, 2020 at 05:00:16AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   74f602dc96dd854c7b2034947798c1e2a6b84066
> > > > commit: 68c5debcc06d6d24f15dbf978780fc5efc147d5e arm64: implement C=
PPC FFH support using AMUs
> > > > date:   5 weeks ago
> > > > config: arm64-randconfig-s032-20201217 (attached as .config)
> > > > compiler: aarch64-linux-gcc (GCC) 9.3.0
> > > > reproduce:
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/mast=
er/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # apt-get install sparse
> > > >         # sparse version: v0.6.3-184-g1b896707-dirty
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3D68c5debcc06d6d24f15dbf978780fc5efc147d5e
> > > >         git remote add linus https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git
> > > >         git fetch --no-tags linus master
> > > >         git checkout 68c5debcc06d6d24f15dbf978780fc5efc147d5e
> > > >         # save the attached .config to linux build tree
> > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 mak=
e.cross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64 =

> > > > =

> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > =

> > > > =

> > > > "sparse warnings: (new ones prefixed by >>)"
> > > > >> arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference=
 of noderef expression
> > > > =

> > > > vim +367 arch/arm64/kernel/topology.c
> > > > =

> > > >    362	=

> > > >    363	int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> > > >    364	{
> > > >    365		int ret =3D -EOPNOTSUPP;
> > > >    366	=

> > > >  > 367		switch ((u64)reg->address) {
> > > =

> > > That's not a dereference but I guess sparse complains of dropping the
> > > __iomem. We could change the cast to (__force u64) to silence sparse.
> > > =

> > > Thanks for the report.
> > > =

> > =

> > Nothing I've tried seemed to silence sparse here, including casting to
> > (__force u64).
> =

> Would it work if we changed the case lines to (u64 __iomem)0x0?
> =


No, it does not. We still get the same warning on the switch line even
if there is no cast. Same if we directly check for:

if (reg->address =3D=3D (u64 __iomem)0x0)

Ionela.

> -- =

> Catalin
--===============1035000627802366170==--

