Content-Type: multipart/mixed; boundary="===============3541551960760766429=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH RFC leds + net-next 7/7] net: phy: marvell: support LEDs connected on Marvell PHYs
Date: Fri, 30 Oct 2020 23:04:38 +0800
Message-ID: <202010302227.P5H8ImKh-lkp@intel.com>
In-Reply-To: <20201030114435.20169-8-kabel@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3541551960760766429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Marek,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on cd29296fdfca919590e4004a7e4905544f4c4a32]

url:    https://github.com/0day-ci/linux/commits/Marek-Beh-n/netdev-trigger=
-offloading-and-LEDs-on-Marvell-PHYs/20201030-194640
base:    cd29296fdfca919590e4004a7e4905544f4c4a32
config: nios2-defconfig (attached as .config)
compiler: nios2-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0cfca88266cb524576ecb45f5=
2c9f40c177f1560
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Beh-n/netdev-trigger-offload=
ing-and-LEDs-on-Marvell-PHYs/20201030-194640
        git checkout 0cfca88266cb524576ecb45f52c9f40c177f1560
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnios2 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/marvell.c:885:13: warning: 'struct led_netdev_data' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
     885 |      struct led_netdev_data *trig)
         |             ^~~~~~~~~~~~~~~
   drivers/net/phy/marvell.c: In function 'marvell_find_led_mode':
   drivers/net/phy/marvell.c:892:21: error: dereferencing pointer to incomp=
lete type 'struct led_netdev_data'
     892 |  key =3D LED_MODE(trig->link, trig->tx, trig->rx);
         |                     ^~
   drivers/net/phy/marvell.c:832:28: note: in definition of macro 'BITIF'
     832 | #define BITIF(i, cond)   ((cond) ? BIT(i) : 0)
         |                            ^~~~
   drivers/net/phy/marvell.c:892:8: note: in expansion of macro 'LED_MODE'
     892 |  key =3D LED_MODE(trig->link, trig->tx, trig->rx);
         |        ^~~~~~~~
   drivers/net/phy/marvell.c: In function 'marvell_led_trigger_offload':
   drivers/net/phy/marvell.c:941:28: error: 'netdev_led_trigger' undeclared=
 (first use in this function); did you mean 'module_led_trigger'?
     941 |  if (led->cdev.trigger !=3D &netdev_led_trigger || !phydev->atta=
ched_dev ||
         |                            ^~~~~~~~~~~~~~~~~~
         |                            module_led_trigger
   drivers/net/phy/marvell.c:941:28: note: each undeclared identifier is re=
ported only once for each function it appears in
   drivers/net/phy/marvell.c:942:34: error: dereferencing pointer to incomp=
lete type 'struct led_netdev_data'
     942 |      phydev->attached_dev !=3D trig->net_dev)
         |                                  ^~
   drivers/net/phy/marvell.c:945:44: error: passing argument 3 of 'marvell_=
find_led_mode' from incompatible pointer type [-Werror=3Dincompatible-point=
er-types]
     945 |  mode =3D marvell_find_led_mode(phydev, led, trig);
         |                                            ^~~~
         |                                            |
         |                                            struct led_netdev_dat=
a *
   drivers/net/phy/marvell.c:885:30: note: expected 'struct led_netdev_data=
 *' but argument is of type 'struct led_netdev_data *'
     885 |      struct led_netdev_data *trig)
         |      ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors

vim +885 drivers/net/phy/marvell.c

   883	=

   884	static int marvell_find_led_mode(struct phy_device *phydev, struct p=
hy_led *led,
 > 885					 struct led_netdev_data *trig)
   886	{
   887		const struct marvell_leds_info *info =3D led->priv;
   888		const struct marvell_led_mode_info *mode;
   889		u32 key;
   890		int i;
   891	=

   892		key =3D LED_MODE(trig->link, trig->tx, trig->rx);
   893	=

   894		for (i =3D 0; i < ARRAY_SIZE(marvell_led_mode_info); ++i) {
   895			mode =3D &marvell_led_mode_info[i];
   896	=

   897			if (key !=3D mode->key || mode->regval[led->addr] =3D=3D -1 ||
   898			    !(info->flags & mode->flags))
   899				continue;
   900	=

   901			return mode->regval[led->addr];
   902		}
   903	=

   904		dev_dbg(led->cdev.dev,
   905			"cannot offload trigger configuration (%s, link=3D%i, tx=3D%i, rx=
=3D%i)\n",
   906			netdev_name(trig->net_dev), trig->link, trig->tx, trig->rx);
   907	=

   908		return -1;
   909	}
   910	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3541551960760766429==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
yPQ4yfjAQKD1Xv8DgonfaqWZAAA=
--===============3541551960760766429==--

