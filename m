Content-Type: multipart/mixed; boundary="===============9076513880102765376=="
MIME-Version: 1.0
From: Sander Vanheule <sander@svanheule.net>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] mfd: Add RTL8231 core device
Date: Wed, 19 May 2021 17:11:32 +0200
Message-ID: <19bf02ddf94ae37384331ccf3e614ac9cdb6cd1b.camel@svanheule.net>
In-Reply-To: <20210519145809.GI2549456@dell>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9076513880102765376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-05-19 at 15:58 +0100, Lee Jones wrote:
> On Wed, 12 May 2021, kernel test robot wrote:
> =

> > Hi Sander,
> > =

> > Thank you for the patch! Yet something to improve:
> > =

> > [auto build test ERROR on pavel-linux-leds/for-next]
> > [also build test ERROR on lee-mfd/for-mfd-next pinctrl/devel v5.13-rc1]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > =

> > url:=C2=A0=C2=A0=C2=A0
> > https://github.com/0day-ci/linux/commits/Sander-Vanheule/RTL8231-GPIO-e=
xpander-support/20210511-202618
> > base:=C2=A0=C2=A0 git://git.kernel.org/pub/scm/linux/kernel/git/pavel/l=
inux-leds.git
> > for-next
> > config: h8300-randconfig-r012-20210512 (attached as .config)
> > compiler: h8300-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cros=
s=C2=A0-O
> > ~/bin/make.cross
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cross
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
> > https://github.com/0day-ci/linux/commit/e031cc2da2c2948230bacd1ca56cfe9=
990e1aefd
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linux-review =
https://github.com/0day-ci/linux
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags linux-re=
view Sander-Vanheule/RTL8231-GPIO-
> > expander-support/20210511-202618
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout e031cc2da2c2948=
230bacd1ca56cfe9990e1aefd
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .config =
to linux build tree
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=3D$HOM=
E/0day COMPILER=3Dgcc-9.3.0 make.cross W=3D1
> > ARCH=3Dh8300 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> > =

> > =C2=A0=C2=A0 h8300-linux-ld: drivers/mfd/rtl8231.o: in function
> > `rtl8231_mdio_reg_write':
> > > > rtl8231.c:(.text+0x4f): undefined reference to `mdiobus_write'
> > =C2=A0=C2=A0 h8300-linux-ld: drivers/mfd/rtl8231.o: in function `rtl823=
1_mdio_reg_read':
> > > > rtl8231.c:(.text+0x75): undefined reference to `mdiobus_read'
> > =C2=A0=C2=A0 h8300-linux-ld: drivers/mfd/rtl8231.o: in function `mdio_m=
odule_init':
> > > > rtl8231.c:(.init.text+0xd): undefined reference to `mdio_driver_reg=
ister'
> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

> Please could you take a look at these failures.
> =

> Either fix them up or report a false positive.

Hi Lee,

These were caused by a missing dependency on MDIO_BUS. This should be resol=
ved
in the v2 series.

https://lore.kernel.org/lkml/f1ca940216c0accfc804afee2dbe46d260d890ae.16212=
79162.git.sander(a)svanheule.net/

I wasn't sure how to attribute this to the test bot, since the depedency was
partly resolved through another patch.

Best,
Sander

--===============9076513880102765376==--

