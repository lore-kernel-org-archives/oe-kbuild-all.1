Content-Type: multipart/mixed; boundary="===============6769667041034583858=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:306:26: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Mon, 10 May 2021 17:03:34 +0300
Message-ID: <CAHp75Ve556kxeqMQAOePTK8jt7--zRiqJHUi5-A=wWgcajAXMQ@mail.gmail.com>
In-Reply-To: <202105102120.WFbgbP3I-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6769667041034583858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 4:31 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   6efb943b8616ec53a5e444193dccf1af9ad627b5
> commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap ac=
cessors
> date:   5 months ago
> config: powerpc-randconfig-s032-20210510 (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dpowerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Okay, I will rebase on top of v5.13-rc1 my patch series and will add
the above line to certain patches in it.

> sparse warnings: (new ones prefixed by >>)
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:2135:41: sparse: =
sparse: incorrect type in argument 1 (different address spaces) @@     expe=
cted void *reg @@     got unsigned int [noderef] __iomem * @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:2135:41: sparse: =
    expected void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:2135:41: sparse: =
    got unsigned int [noderef] __iomem *
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:33: sparse: s=
parse: incorrect type in argument 2 (different base types) @@     expected =
unsigned short [usertype] uid_hi @@     got restricted __be16 [usertype] @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:33: sparse:  =
   expected unsigned short [usertype] uid_hi
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:33: sparse:  =
   got restricted __be16 [usertype]
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:45: sparse: s=
parse: incorrect type in argument 3 (different base types) @@     expected =
unsigned int [usertype] uid_lo @@     got restricted __be32 [usertype] @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:45: sparse:  =
   expected unsigned int [usertype] uid_lo
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:45: sparse:  =
   got restricted __be32 [usertype]
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:56: sparse: s=
parse: incorrect type in argument 4 (different base types) @@     expected =
unsigned short [usertype] seqid @@     got restricted __be16 [usertype] @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:56: sparse:  =
   expected unsigned short [usertype] seqid
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:157:56: sparse:  =
   got restricted __be16 [usertype]
> >> drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:306:26: sparse: s=
parse: incorrect type in argument 1 (different address spaces) @@     expec=
ted void const volatile [noderef] __iomem *addr @@     got void *reg @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:306:26: sparse:  =
   expected void const volatile [noderef] __iomem *addr
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:306:26: sparse:  =
   got void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:336:33: sparse: s=
parse: incorrect type in argument 1 (different address spaces) @@     expec=
ted void *reg @@     got unsigned int [noderef] __iomem * @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:336:33: sparse:  =
   expected void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:336:33: sparse:  =
   got unsigned int [noderef] __iomem *
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:343:33: sparse: s=
parse: incorrect type in argument 1 (different address spaces) @@     expec=
ted void *reg @@     got unsigned int [noderef] __iomem * @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:343:33: sparse:  =
   expected void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:343:33: sparse:  =
   got unsigned int [noderef] __iomem *
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:356:33: sparse: s=
parse: incorrect type in argument 1 (different address spaces) @@     expec=
ted void *reg @@     got unsigned int [noderef] __iomem * @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:356:33: sparse:  =
   expected void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:356:33: sparse:  =
   got unsigned int [noderef] __iomem *
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:397:33: sparse: s=
parse: incorrect type in argument 1 (different address spaces) @@     expec=
ted void *reg @@     got unsigned int [noderef] __iomem * @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:397:33: sparse:  =
   expected void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:397:33: sparse:  =
   got unsigned int [noderef] __iomem *
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:466:41: sparse: s=
parse: incorrect type in argument 1 (different address spaces) @@     expec=
ted void *reg @@     got unsigned int [noderef] __iomem * @@
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:466:41: sparse:  =
   expected void *reg
>    drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:466:41: sparse:  =
   got unsigned int [noderef] __iomem *
>
> vim +306 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
>
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  294
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  295  /**
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  296   * pch_gbe_wait_clr_bit - Wait to clear a bit
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  297   * @reg: Pointer of register
> d0ea5cbdc286de drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c Jesse=
 Brandeburg  2020-09-25  298   * @bit: Busy bit
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  299   */
> 191cc687740834 drivers/net/pch_gbe/pch_gbe_main.c                   steph=
en hemminger 2010-10-15  300  static void pch_gbe_wait_clr_bit(void *reg, u=
32 bit)
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  301  {
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  302   u32 tmp;
> 453ca931f51516 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c Andy =
Shevchenko   2013-06-28  303
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  304   /* wait busy */
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  305   tmp =3D 1000;
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21 @306   while ((ioread32(reg) & bit) && --tmp)
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  307           cpu_relax();
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  308   if (!tmp)
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  309           pr_err("Error: busy bit is not clear=
ed\n");
> 77555ee7228234 drivers/net/pch_gbe/pch_gbe_main.c                   Masay=
uki Ohtake   2010-09-21  310  }
> 124d770a6459be drivers/net/pch_gbe/pch_gbe_main.c                   Toshi=
haru Okada   2011-09-01  311
>
> :::::: The code at line 306 was first introduced by commit
> :::::: 77555ee7228234257957fd54daa0b69178906320 net: Add Gigabit Ethernet=
 driver of Topcliff PCH
>
> :::::: TO: Masayuki Ohtake <masa-korg@dsn.okisemi.com>
> :::::: CC: David S. Miller <davem@davemloft.net>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

With Best Regards,
Andy Shevchenko
--===============6769667041034583858==--

