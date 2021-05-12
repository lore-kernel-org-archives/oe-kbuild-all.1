Content-Type: multipart/mixed; boundary="===============1155158642363555775=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/2] clocksource: Add support for Xilinx AXI Timer
Date: Wed, 12 May 2021 16:31:43 +0800
Message-ID: <202105121620.53PlsUyv-lkp@intel.com>
In-Reply-To: <20210511191239.774570-2-sean.anderson@seco.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1155158642363555775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sean,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on pwm/for-next linux/master linus/master v5.13-rc1 =
next-20210511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sean-Anderson/dt-bindings-=
pwm-Add-Xilinx-AXI-Timer/20210512-031347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 2d036df=
a5f10df9782f5278fc591d79d283c1fad
config: mips-randconfig-r012-20210512 (attached as .config)
compiler: mips64el-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8e9195e8da4d8ea7fd88d14fd=
95d95ba21008aef
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sean-Anderson/dt-bindings-pwm-Add-=
Xilinx-AXI-Timer/20210512-031347
        git checkout 8e9195e8da4d8ea7fd88d14fd95d95ba21008aef
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/clocksource/timer-xilinx.c: In function 'xilinx_ioread32be':
>> drivers/clocksource/timer-xilinx.c:136:20: warning: passing argument 1 o=
f 'ioread32be' discards 'volatile' qualifier from pointer target type [-Wdi=
scarded-qualifiers]
     136 |  return ioread32be(addr);
         |                    ^~~~
   In file included from arch/mips/include/asm/io.h:28,
                    from arch/mips/include/asm/mmiowb.h:5,
                    from include/linux/spinlock.h:61,
                    from include/linux/rwsem.h:16,
                    from include/linux/notifier.h:15,
                    from include/linux/clk.h:14,
                    from drivers/clocksource/timer-xilinx.c:16:
   include/asm-generic/iomap.h:33:32: note: expected 'const void *' but arg=
ument is of type 'const volatile void *'
      33 | extern unsigned int ioread32be(const void __iomem *);
         |                                ^~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-xilinx.c: In function 'xilinx_iowrite32be':
>> drivers/clocksource/timer-xilinx.c:141:21: warning: passing argument 2 o=
f 'iowrite32be' discards 'volatile' qualifier from pointer target type [-Wd=
iscarded-qualifiers]
     141 |  iowrite32be(value, addr);
         |                     ^~~~
   In file included from arch/mips/include/asm/io.h:28,
                    from arch/mips/include/asm/mmiowb.h:5,
                    from include/linux/spinlock.h:61,
                    from include/linux/rwsem.h:16,
                    from include/linux/notifier.h:15,
                    from include/linux/clk.h:14,
                    from drivers/clocksource/timer-xilinx.c:16:
   include/asm-generic/iomap.h:54:30: note: expected 'void *' but argument =
is of type 'volatile void *'
      54 | extern void iowrite32be(u32, void __iomem *);
         |                              ^~~~~~~~~~~~~~
   drivers/clocksource/timer-xilinx.c: In function 'xilinx_timer_init':
>> drivers/clocksource/timer-xilinx.c:447:13: error: assignment to 'u32 (*)=
(const volatile void *)' {aka 'unsigned int (*)(const volatile void *)'} fr=
om incompatible pointer type 'unsigned int (*)(const void *)' [-Werror=3Din=
compatible-pointer-types]
     447 |  priv->read =3D ioread32;
         |             ^
>> drivers/clocksource/timer-xilinx.c:448:14: error: assignment to 'void (*=
)(u32,  volatile void *)' {aka 'void (*)(unsigned int,  volatile void *)'} =
from incompatible pointer type 'void (*)(u32,  void *)' {aka 'void (*)(unsi=
gned int,  void *)'} [-Werror=3Dincompatible-pointer-types]
     448 |  priv->write =3D iowrite32;
         |              ^
   cc1: some warnings being treated as errors


vim +447 drivers/clocksource/timer-xilinx.c

   425	=

   426	static struct xilinx_timer_priv *xilinx_timer_init(struct device *de=
v,
   427							   struct device_node *np)
   428	{
   429		bool pwm;
   430		int i, ret;
   431		struct xilinx_timer_priv *priv;
   432		u32 one_timer, tcsr0;
   433	=

   434		priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
   435		if (!priv)
   436			return ERR_PTR(-ENOMEM);
   437	=

   438		priv->regs =3D of_iomap(np, 0);
   439		if (!priv->regs) {
   440			ret =3D -ENXIO;
   441			goto err_priv;
   442		} else if (IS_ERR(priv->regs)) {
   443			ret =3D PTR_ERR(priv->regs);
   444			goto err_priv;
   445		}
   446	=

 > 447		priv->read =3D ioread32;
 > 448		priv->write =3D iowrite32;
   449		/*
   450		 * We aren't using the interrupts yet, so use ENIT to detect endian=
ness
   451		 */
   452		tcsr0 =3D xilinx_timer_read(priv, TCSR0);
   453		if (swab32(tcsr0) & TCSR_ENIT) {
   454			ret =3D xilinx_timer_err(np, -EOPNOTSUPP,
   455					       "cannot determine endianness\n");
   456			goto err_priv;
   457		}
   458	=

   459		xilinx_timer_write(priv, tcsr0 | TCSR_ENIT, TCSR0);
   460		if (!(xilinx_timer_read(priv, TCSR0) & TCSR_ENIT)) {
   461			priv->read =3D xilinx_ioread32be;
   462			priv->write =3D xilinx_iowrite32be;
   463		}
   464	=

   465		/*
   466		 * For backwards compatibility, allow xlnx,one-timer-only =3D <bool=
>;
   467		 * However, the preferred way is to use the xlnx,single-timer flag.
   468		 */
   469		one_timer =3D of_property_read_bool(np, "xlnx,single-timer");
   470		if (!one_timer) {
   471			ret =3D of_property_read_u32(np, "xlnx,one-timer-only", &one_timer=
);
   472			if (ret) {
   473				ret =3D xilinx_timer_err(np, ret, "xlnx,one-timer-only");
   474				goto err_priv;
   475			}
   476		}
   477	=

   478		pwm =3D of_property_read_bool(np, "xlnx,pwm");
   479		if (one_timer && pwm) {
   480			ret =3D xilinx_timer_err(np, -EINVAL,
   481					       "pwm mode not possible with one timer\n");
   482			goto err_priv;
   483		}
   484	=

   485		priv->flags =3D FIELD_PREP(XILINX_TIMER_ONE, one_timer) |
   486			      FIELD_PREP(XILINX_TIMER_PWM, pwm);
   487	=

   488		for (i =3D 0; pwm && i < 2; i++) {
   489			char int_fmt[] =3D "xlnx,gen%u-assert";
   490			char bool_fmt[] =3D "xlnx,gen%u-active-low";
   491			char buf[max(sizeof(int_fmt), sizeof(bool_fmt))];
   492			u32 gen;
   493	=

   494			/*
   495			 * Allow xlnx,gen?-assert =3D <bool>; for backwards
   496			 * compatibility. However, the preferred way is to use the
   497			 * xlnx,gen?-active-low flag.
   498			 */
   499			snprintf(buf, sizeof(buf), bool_fmt, i);
   500			gen =3D !of_property_read_bool(np, buf);
   501			if (gen) {
   502				snprintf(buf, sizeof(buf), int_fmt, i);
   503				ret =3D of_property_read_u32(np, buf, &gen);
   504				if (ret && ret !=3D -EINVAL) {
   505					xilinx_timer_err(np, ret, "%s\n", buf);
   506					goto err_priv;
   507				}
   508			}
   509	=

   510			if (!gen) {
   511				ret =3D xilinx_timer_err(np, -EINVAL,
   512						       "generateout%u must be active high\n",
   513						       i);
   514				goto err_priv;
   515			}
   516		}
   517	=

   518		ret =3D of_property_read_u32(np, "xlnx,count-width", &priv->width);
   519		if (ret) {
   520			xilinx_timer_err(np, ret, "xlnx,count-width\n");
   521			goto err_priv;
   522		} else if (priv->width < 8 || priv->width > 32) {
   523			ret =3D xilinx_timer_err(np, -EINVAL, "invalid counter width\n");
   524			goto err_priv;
   525		}
   526	=

   527		priv->clk =3D xilinx_timer_clock_init(np, priv);
   528		if (IS_ERR(priv->clk)) {
   529			ret =3D xilinx_timer_err(np, PTR_ERR(priv->clk), "clock\n");
   530			goto err_priv;
   531		}
   532	=

   533		ret =3D clk_prepare_enable(priv->clk);
   534		if (ret) {
   535			xilinx_timer_err(np, ret, "clock enable failed\n");
   536			goto err_clk;
   537		}
   538		clk_rate_exclusive_get(priv->clk);
   539	=

   540		if (pwm) {
   541			ret =3D xilinx_pwm_init(dev, priv);
   542		} else {
   543			ret =3D xilinx_clocksource_init(priv);
   544			if (!ret && !one_timer) {
   545				ret =3D xilinx_clockevent_init(np, priv);
   546				if (ret)
   547					priv->flags |=3D XILINX_TIMER_ONE;
   548			}
   549		}
   550	=

   551		if (!ret)
   552			return priv;
   553	=

   554		clk_rate_exclusive_put(priv->clk);
   555		clk_disable_unprepare(priv->clk);
   556	err_clk:
   557		if (priv->flags & XILINX_TIMER_CLK)
   558			clk_unregister_fixed_rate(priv->clk);
   559		else
   560			clk_put(priv->clk);
   561	err_priv:
   562		kfree(priv);
   563		return ERR_PTR(ret);
   564	}
   565	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1155158642363555775==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1155158642363555775==--

