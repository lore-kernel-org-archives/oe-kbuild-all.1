Content-Type: multipart/mixed; boundary="===============8915162430238159068=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH RFC leds + net-next 7/7] net: phy: marvell: support LEDs connected on Marvell PHYs
Date: Sat, 31 Oct 2020 00:04:42 +0800
Message-ID: <202010302349.EMj0ggKR-lkp@intel.com>
In-Reply-To: <20201030114435.20169-8-kabel@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8915162430238159068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Marek,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on cd29296fdfca919590e4004a7e4905544f4c4a32]

url:    https://github.com/0day-ci/linux/commits/Marek-Beh-n/netdev-trigger=
-offloading-and-LEDs-on-Marvell-PHYs/20201030-194640
base:    cd29296fdfca919590e4004a7e4905544f4c4a32
config: nds32-randconfig-r012-20201030 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
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
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/net/phy/marvell.c:885:13: warning: 'struct led_netdev_data' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
     885 |      struct led_netdev_data *trig)
         |             ^~~~~~~~~~~~~~~
   drivers/net/phy/marvell.c: In function 'marvell_find_led_mode':
>> drivers/net/phy/marvell.c:892:21: error: dereferencing pointer to incomp=
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
>> drivers/net/phy/marvell.c:941:28: error: 'netdev_led_trigger' undeclared=
 (first use in this function); did you mean 'phy_led_trigger'?
     941 |  if (led->cdev.trigger !=3D &netdev_led_trigger || !phydev->atta=
ched_dev ||
         |                            ^~~~~~~~~~~~~~~~~~
         |                            phy_led_trigger
   drivers/net/phy/marvell.c:941:28: note: each undeclared identifier is re=
ported only once for each function it appears in
   drivers/net/phy/marvell.c:942:34: error: dereferencing pointer to incomp=
lete type 'struct led_netdev_data'
     942 |      phydev->attached_dev !=3D trig->net_dev)
         |                                  ^~
>> drivers/net/phy/marvell.c:945:44: error: passing argument 3 of 'marvell_=
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

vim +892 drivers/net/phy/marvell.c

   831	=

 > 832	#define BITIF(i, cond)			((cond) ? BIT(i) : 0)
   833	#define LED_MODE(link, tx, rx)					\
   834		(BITIF(0, (link)) | BITIF(1, (tx)) | BITIF(2, (rx)))
   835	=

   836	struct marvell_led_mode_info {
   837		u32 key;
   838		s8 regval[6];
   839		enum {
   840			COMMON	=3D BIT(0),
   841			L1V0_RX	=3D BIT(1),
   842			L3V5_TX	=3D BIT(2),
   843		} flags;
   844	};
   845	=

   846	struct marvell_leds_info {
   847		u32 family;
   848		int nleds;
   849		u32 flags;
   850	};
   851	=

   852	#define LED(f, n, flg)							\
   853		{								\
   854			.family =3D MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E##f),	\
   855			.nleds =3D (n),						\
   856			.flags =3D (flg),						\
   857		}								\
   858	=

   859	static const struct marvell_leds_info marvell_leds_info[] =3D {
   860		LED(1112,  4, COMMON | L3V5_TX),
   861		LED(1116R, 3, COMMON),
   862		LED(1118,  3, COMMON),
   863		LED(1121R, 3, COMMON),
   864		LED(1149R, 4, COMMON | L3V5_TX),
   865		LED(1240,  6, COMMON | L3V5_TX),
   866		LED(1318S, 3, COMMON | L1V0_RX),
   867		LED(1340S, 6, COMMON),
   868		LED(1510,  3, COMMON | L1V0_RX),
   869		LED(1545,  6, COMMON),
   870		LED(1548P, 6, COMMON),
   871	};
   872	=

   873	static const struct marvell_led_mode_info marvell_led_mode_info[] =
=3D {
   874		{ LED_MODE(1, 0, 0), { 0x0,  -1, 0x0,  -1,  -1,  -1, }, COMMON },
   875		{ LED_MODE(1, 1, 1), { 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, }, COMMON },
   876		{ LED_MODE(0, 1, 1), { 0x4, 0x4, 0x4, 0x4, 0x4, 0x4, }, COMMON },
   877		{ LED_MODE(1, 0, 1), {  -1, 0x2,  -1, 0x2, 0x2, 0x2, }, COMMON },
   878		{ LED_MODE(0, 1, 0), { 0x5,  -1, 0x5,  -1, 0x5, 0x5, }, COMMON },
   879		{ LED_MODE(0, 1, 0), {  -1,  -1,  -1, 0x5,  -1,  -1, }, L3V5_TX },
   880		{ LED_MODE(0, 0, 1), {  -1,  -1,  -1,  -1, 0x0, 0x0, }, COMMON },
   881		{ LED_MODE(0, 0, 1), {  -1, 0x0,  -1,  -1,  -1,  -1, }, L1V0_RX },
   882	};
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

 > 892		key =3D LED_MODE(trig->link, trig->tx, trig->rx);
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

   911	/* FIXME: Blinking rate is shared by all LEDs on a PHY. Should we ch=
eck whether
   912	 * another LED is currently blinking with incompatible rate? It woul=
d be cleaner
   913	 * if we in this case failed to offload blinking this LED.
   914	 * But consider this situation:
   915	 *   1. user sets LED[1] to blink with period 500ms for some reason.=
 This would
   916	 *      start blinking LED[1] with perion 670ms here
   917	 *   2. user sets netdev trigger to LED[0] to blink on activity, def=
ault there
   918	 *      is 100ms period, which would translate here to 84ms. This is
   919	 *      incompatible with the already blinking LED, so we fail to of=
fload to HW,
   920	 *      and netdev trigger does software offloading instead.
   921	 *   3. user unsets blinking od LED[1], so now we theoretically can =
offload
   922	 *      netdev trigger to LED[0], but we don't know about it, and so=
 it is left
   923	 *      in SW triggering until user writes the settings again
   924	 * This could be solved by the netdev trigger periodically trying to=
 offload to
   925	 * HW if we reported that it is theoretically possible (by returning=
 -EAGAIN
   926	 * instead of -EOPNOTSUPP, for example). Do we want to do this?
   927	 */
   928	static int marvell_led_trigger_offload(struct phy_device *phydev,
   929					       struct phy_led *led, bool enable)
   930	{
   931		struct led_netdev_data *trig =3D led_get_trigger_data(&led->cdev);
   932		struct device *dev =3D led->cdev.dev;
   933		unsigned long period;
   934		int mode;
   935		int ret;
   936	=

   937		if (!enable)
   938			goto offload_disable;
   939	=

   940		/* Sanity checks first */
 > 941		if (led->cdev.trigger !=3D &netdev_led_trigger || !phydev->attached=
_dev ||
   942		    phydev->attached_dev !=3D trig->net_dev)
   943			goto offload_disable;
   944	=

 > 945		mode =3D marvell_find_led_mode(phydev, led, trig);
   946		if (mode < 0)
   947			goto offload_disable;
   948	=

   949		/* TODO: this should only be checked if blinking is needed */
   950		period =3D jiffies_to_msecs(atomic_read(&trig->interval)) * 2;
   951		ret =3D marvell_leds_set_blink_rate(phydev, &period);
   952		if (ret) {
   953			dev_dbg(dev, "cannot offload trigger (unsupported blinking period)=
\n");
   954			goto offload_disable;
   955		}
   956	=

   957		ret =3D marvell_led_set_regval(phydev, led->addr, mode);
   958		if (!ret) {
   959			atomic_set(&trig->interval, msecs_to_jiffies(period / 2));
   960			dev_dbg(led->cdev.dev, "netdev trigger offloaded\n");
   961		}
   962	=

   963		return ret;
   964	=

   965	offload_disable:
   966		ret =3D marvell_led_set_regval(phydev, led->addr, MII_PHY_LED_CTRL_=
OFF);
   967		if (ret)
   968			return ret;
   969	=

   970		return -EOPNOTSUPP;
   971	}
   972	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8915162430238159068==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8915162430238159068==--

