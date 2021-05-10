Content-Type: multipart/mixed; boundary="===============7542005231649892631=="
MIME-Version: 1.0
From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/4] mailbox: imx: add xSR/xCR register array
Date: Mon, 10 May 2021 09:21:30 +0800
Message-ID: <a56ec818-9352-b88f-0fd4-756bb46b642b@oss.nxp.com>
In-Reply-To: <202105080008.OslMjdrl-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7542005231649892631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2021/5/8 0:08, kernel test robot wrote:
> Hi "Peng,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on shawnguo/for-next]
> [also build test WARNING on robh/for-next v5.12 next-20210507]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Peng-Fan-OSS/mailbox-imx=
-add-i-MX8ULP-MU-support/20210507-174948
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.gi=
t for-next
> config: powerpc-randconfig-r023-20210507 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a3a8=
a1a15b524d91b5308db68e9d293b34cd88dd)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://github.com/0day-ci/linux/commit/356d43252930991aad1353=
a96361380a7f17f98c
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Peng-Fan-OSS/mailbox-imx-add-i-=
MX8ULP-MU-support/20210507-174948
>          git checkout 356d43252930991aad1353a96361380a7f17f98c
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dpowerpc
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>     __do_insb
>     ^
>     arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do=
_insb'
>     #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from drivers/mailbox/imx-mailbox.c:8:
>     In file included from include/linux/interrupt.h:11:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:619:
>     arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;

This should be common powerpc issue?

Regards,
Peng.

                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:186:1: note: expanded from here
>     __do_insw
>     ^
>     arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do=
_insw'
>     #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from drivers/mailbox/imx-mailbox.c:8:
>     In file included from include/linux/interrupt.h:11:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:619:
>     arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:188:1: note: expanded from here
>     __do_insl
>     ^
>     arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do=
_insl'
>     #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from drivers/mailbox/imx-mailbox.c:8:
>     In file included from include/linux/interrupt.h:11:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:619:
>     arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned lon=
g c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>     arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:190:1: note: expanded from here
>     __do_outsb
>     ^
>     arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do=
_outsb'
>     #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>                                             ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from drivers/mailbox/imx-mailbox.c:8:
>     In file included from include/linux/interrupt.h:11:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:619:
>     arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned lon=
g c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>     arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:192:1: note: expanded from here
>     __do_outsw
>     ^
>     arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do=
_outsw'
>     #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>                                             ~~~~~~~~~~~~~~~~~~~~~^
>     In file included from drivers/mailbox/imx-mailbox.c:8:
>     In file included from include/linux/interrupt.h:11:
>     In file included from include/linux/hardirq.h:10:
>     In file included from arch/powerpc/include/asm/hardirq.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/powerpc/include/asm/io.h:619:
>     arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>     DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned lon=
g c),
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>     arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>                     __do_##name al;                                 \
>                     ^~~~~~~~~~~~~~
>     <scratch space>:194:1: note: expanded from here
>     __do_outsl
>     ^
>     arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do=
_outsl'
>     #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>                                             ~~~~~~~~~~~~~~~~~~~~~^
>>> drivers/mailbox/imx-mailbox.c:278:2: warning: variable 'val' is used un=
initialized whenever switch default is taken [-Wsometimes-uninitialized]
>             default:
>             ^~~~~~~
>     drivers/mailbox/imx-mailbox.c:282:7: note: uninitialized use occurs h=
ere
>             if (!val)
>                  ^~~
>     drivers/mailbox/imx-mailbox.c:257:9: note: initialize the variable 'v=
al' to silence this warning
>             u32 val, ctrl;
>                    ^
>                     =3D 0
>     drivers/mailbox/imx-mailbox.c:608:2: error: member reference base typ=
e 'int' is not a structure or union
>             .xRR    =3D 0x10
>             ^~~~
>     drivers/mailbox/imx-mailbox.c:609:2: error: member reference base typ=
e 'int' is not a structure or union
>             .xSR    =3D {0x20, 0x20, 0x20, 0x20},
>             ^~~~
>     drivers/mailbox/imx-mailbox.c:609:9: error: expected expression
>             .xSR    =3D {0x20, 0x20, 0x20, 0x20},
>                       ^
>     13 warnings and 3 errors generated.
> =

> =

> vim +/val +278 drivers/mailbox/imx-mailbox.c
> =

> 2bb7005696e224 Oleksij Rempel 2018-08-03  251
> 2bb7005696e224 Oleksij Rempel 2018-08-03  252  static irqreturn_t imx_mu_=
isr(int irq, void *p)
> 2bb7005696e224 Oleksij Rempel 2018-08-03  253  {
> 2bb7005696e224 Oleksij Rempel 2018-08-03  254  	struct mbox_chan *chan =
=3D p;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  255  	struct imx_mu_priv *priv =
=3D to_imx_mu_priv(chan->mbox);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  256  	struct imx_mu_con_priv *c=
p =3D chan->con_priv;
> 63b383575c388f Peng Fan       2020-03-19  257  	u32 val, ctrl;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  258
> 2bb7005696e224 Oleksij Rempel 2018-08-03  259  	switch (cp->type) {
> 2bb7005696e224 Oleksij Rempel 2018-08-03  260  	case IMX_MU_TYPE_TX:
> 356d4325293099 Peng Fan       2021-05-07  261  		ctrl =3D imx_mu_read(pri=
v, priv->dcfg->xCR[IMX_MU_TCR]);
> 356d4325293099 Peng Fan       2021-05-07  262  		val =3D imx_mu_read(priv=
, priv->dcfg->xSR[IMX_MU_TSR]);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  263  		val &=3D IMX_MU_xSR_TEn(=
cp->idx) &
> 2bb7005696e224 Oleksij Rempel 2018-08-03  264  			(ctrl & IMX_MU_xCR_TIEn=
(cp->idx));
> 2bb7005696e224 Oleksij Rempel 2018-08-03  265  		break;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  266  	case IMX_MU_TYPE_RX:
> 356d4325293099 Peng Fan       2021-05-07  267  		ctrl =3D imx_mu_read(pri=
v, priv->dcfg->xCR[IMX_MU_RCR]);
> 356d4325293099 Peng Fan       2021-05-07  268  		val =3D imx_mu_read(priv=
, priv->dcfg->xSR[IMX_MU_RSR]);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  269  		val &=3D IMX_MU_xSR_RFn(=
cp->idx) &
> 2bb7005696e224 Oleksij Rempel 2018-08-03  270  			(ctrl & IMX_MU_xCR_RIEn=
(cp->idx));
> 2bb7005696e224 Oleksij Rempel 2018-08-03  271  		break;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  272  	case IMX_MU_TYPE_RXDB:
> 356d4325293099 Peng Fan       2021-05-07  273  		ctrl =3D imx_mu_read(pri=
v, priv->dcfg->xCR[IMX_MU_GCR]);
> 356d4325293099 Peng Fan       2021-05-07  274  		val =3D imx_mu_read(priv=
, priv->dcfg->xSR[IMX_MU_GSR]);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  275  		val &=3D IMX_MU_xSR_GIPn=
(cp->idx) &
> 2bb7005696e224 Oleksij Rempel 2018-08-03  276  			(ctrl & IMX_MU_xCR_GIEn=
(cp->idx));
> 2bb7005696e224 Oleksij Rempel 2018-08-03  277  		break;
> 2bb7005696e224 Oleksij Rempel 2018-08-03 @278  	default:
> 2bb7005696e224 Oleksij Rempel 2018-08-03  279  		break;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  280  	}
> 2bb7005696e224 Oleksij Rempel 2018-08-03  281
> 2bb7005696e224 Oleksij Rempel 2018-08-03  282  	if (!val)
> 2bb7005696e224 Oleksij Rempel 2018-08-03  283  		return IRQ_NONE;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  284
> 2bb7005696e224 Oleksij Rempel 2018-08-03  285  	if (val =3D=3D IMX_MU_xSR=
_TEn(cp->idx)) {
> 356d4325293099 Peng Fan       2021-05-07  286  		imx_mu_xcr_rmw(priv, IMX=
_MU_TCR, 0, IMX_MU_xCR_TIEn(cp->idx));
> 2bb7005696e224 Oleksij Rempel 2018-08-03  287  		mbox_chan_txdone(chan, 0=
);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  288  	} else if (val =3D=3D IMX=
_MU_xSR_RFn(cp->idx)) {
> 63b383575c388f Peng Fan       2020-03-19  289  		priv->dcfg->rx(priv, cp);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  290  	} else if (val =3D=3D IMX=
_MU_xSR_GIPn(cp->idx)) {
> 356d4325293099 Peng Fan       2021-05-07  291  		imx_mu_write(priv, IMX_M=
U_xSR_GIPn(cp->idx), priv->dcfg->xSR[IMX_MU_GSR]);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  292  		mbox_chan_received_data(=
chan, NULL);
> 2bb7005696e224 Oleksij Rempel 2018-08-03  293  	} else {
> 2bb7005696e224 Oleksij Rempel 2018-08-03  294  		dev_warn_ratelimited(pri=
v->dev, "Not handled interrupt\n");
> 2bb7005696e224 Oleksij Rempel 2018-08-03  295  		return IRQ_NONE;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  296  	}
> 2bb7005696e224 Oleksij Rempel 2018-08-03  297
> 2bb7005696e224 Oleksij Rempel 2018-08-03  298  	return IRQ_HANDLED;
> 2bb7005696e224 Oleksij Rempel 2018-08-03  299  }
> 2bb7005696e224 Oleksij Rempel 2018-08-03  300
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============7542005231649892631==--

