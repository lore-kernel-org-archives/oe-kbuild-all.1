Content-Type: multipart/mixed; boundary="===============4738069647052634922=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] mm: memcg/slab: fix slab statistics in !SMP configuration
Date: Fri, 02 Oct 2020 13:34:06 +0800
Message-ID: <20201002053405.GA30771@intel.com>
In-Reply-To: <20201002005559.GF2706729@carbon.DHCP.thefacebook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4738069647052634922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:55:59PM -0700, Roman Gushchin wrote:
> On Fri, Oct 02, 2020 at 08:08:40AM +0800, kbuild test robot wrote:
> > Hi Roman,
> > =

> > Thank you for the patch! Yet something to improve:
> > =

> > [auto build test ERROR on mmotm/master]
> =

> It's a bogus error, the patch was applied onto mmotm/master, which doesn't
> contain necessary slab controller patches.
sorry for the wrong report, and thanks for the input, we will check
this to see whether we can find an appropriate base for this case.
Meanwhile, you can give a try to use --base option when git format patch, w=
hich
helps us to have more clue when looking for base info.

> =

> Thanks!
> =

> > =

> > url:    https://github.com/0day-ci/linux/commits/Roman-Gushchin/mm-memc=
g-slab-fix-slab-statistics-in-SMP-configuration/20201002-044114
> > base:   git://git.cmpxchg.org/linux-mmotm.git master
> > config: i386-randconfig-s002-20200930 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > reproduce:
> >         # apt-get install sparse
> >         # sparse version: v0.6.2-201-g24bdaac6-dirty
> >         # https://github.com/0day-ci/linux/commit/3e4248734433fea1624e4=
971258042af2f231e02
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Roman-Gushchin/mm-memcg-slab-f=
ix-slab-statistics-in-SMP-configuration/20201002-044114
> >         git checkout 3e4248734433fea1624e4971258042af2f231e02
> >         # save the attached .config to linux build tree
> >         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' =
ARCH=3Di386 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> > =

> >    In file included from include/linux/mm.h:1317,
> >                     from include/linux/memcontrol.h:20,
> >                     from include/linux/swap.h:9,
> >                     from include/linux/suspend.h:5,
> >                     from arch/x86/kernel/asm-offsets.c:13:
> >    include/linux/vmstat.h: In function '__mod_node_page_state':
> > >> include/linux/vmstat.h:295:6: error: implicit declaration of functio=
n 'vmstat_item_in_bytes' [-Werror=3Dimplicit-function-declaration]
> >      295 |  if (vmstat_item_in_bytes(item)) {
> >          |      ^~~~~~~~~~~~~~~~~~~~
> >    cc1: some warnings being treated as errors
> >    make[2]: *** [scripts/Makefile.build:99: arch/x86/kernel/asm-offsets=
.s] Error 1
> >    make[2]: Target '__build' not remade because of errors.
> >    make[1]: *** [Makefile:1139: prepare0] Error 2
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:179: sub-make] Error 2
> >    make: Target 'prepare' not remade because of errors.
> > =

> > vim +/vmstat_item_in_bytes +295 include/linux/vmstat.h
> > =

> >    291	=

> >    292	static inline void __mod_node_page_state(struct pglist_data *pgd=
at,
> >    293				enum node_stat_item item, int delta)
> >    294	{
> >  > 295		if (vmstat_item_in_bytes(item)) {
> >    296			VM_WARN_ON_ONCE(delta & (PAGE_SIZE - 1));
> >    297			delta >>=3D PAGE_SHIFT;
> >    298		}
> >    299	=

> >    300		node_page_state_add(delta, pgdat, item);
> >    301	}
> >    302	=

> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_hyp=
erkitty_list_kbuild-2Dall-40lists.01.org&d=3DDwIBAg&c=3D5VD0RTtNlTh3ycd41b3=
MUw&r=3DjJYgtDM7QT-W-Fz_d29HYQ&m=3Da91mqnAqjcA0iLpnhkpBXCmVqE_BuOIny-YmkB8j=
p2U&s=3D4EiiISKLS8YORtIb2rqP7oxVeqhBmKzMHqJzWhDAuMw&e=3D =

> =

> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============4738069647052634922==--

