Content-Type: multipart/mixed; boundary="===============7872708235311758913=="
MIME-Version: 1.0
From: Lee Jones <lee.jones@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] mfd: Add RTL8231 core device
Date: Wed, 19 May 2021 15:58:09 +0100
Message-ID: <20210519145809.GI2549456@dell>
In-Reply-To: <202105122140.ZFyj5hQy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7872708235311758913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021, kernel test robot wrote:

> Hi Sander,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on pavel-linux-leds/for-next]
> [also build test ERROR on lee-mfd/for-mfd-next pinctrl/devel v5.13-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Sander-Vanheule/RTL8231-=
GPIO-expander-support/20210511-202618
> base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.gi=
t for-next
> config: h8300-randconfig-r012-20210512 (attached as .config)
> compiler: h8300-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e031cc2da2c2948230bacd1=
ca56cfe9990e1aefd
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sander-Vanheule/RTL8231-GPIO-exp=
ander-support/20210511-202618
>         git checkout e031cc2da2c2948230bacd1ca56cfe9990e1aefd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dh8300 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `rtl8231_mdio_reg_w=
rite':
> >> rtl8231.c:(.text+0x4f): undefined reference to `mdiobus_write'
>    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `rtl8231_mdio_reg_r=
ead':
> >> rtl8231.c:(.text+0x75): undefined reference to `mdiobus_read'
>    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `mdio_module_init':
> >> rtl8231.c:(.init.text+0xd): undefined reference to `mdio_driver_regist=
er'
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Please could you take a look at these failures.

Either fix them up or report a false positive.

-- =

Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Senior Technical Lead - Developer Services
Linaro.org =E2=94=82 Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
--===============7872708235311758913==--

