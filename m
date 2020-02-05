Content-Type: multipart/mixed; boundary="===============7920017147620586524=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/6] net: bcmgenet: refactor phy mode configuration
Date: Thu, 06 Feb 2020 05:05:10 +0800
Message-ID: <202002060443.937aTdBH%lkp@intel.com>
In-Reply-To: <20200201074625.8698-3-jeremy.linton@arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7920017147620586524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.5]
[also build test WARNING on next-20200205]
[cannot apply to net/master net-next/master linus/master ipvs/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Jeremy-Linton/Add-ACPI-bin=
dings-to-the-genet/20200203-101928
base:    d5226fa6dbae0569ee43ecfc08bdcd6770fc4755

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

smatch warnings:
drivers/net/ethernet/broadcom/genet/bcmmii.c:485 bcmgenet_phy_interface_ini=
t() warn: unsigned 'priv->phy_interface' is never less than zero.

vim +485 drivers/net/ethernet/broadcom/genet/bcmmii.c

   479	=

   480	static int bcmgenet_phy_interface_init(struct bcmgenet_priv *priv)
   481	{
   482		struct device *kdev =3D &priv->pdev->dev;
   483	=

   484		priv->phy_interface =3D device_get_phy_mode(kdev);
 > 485		if (priv->phy_interface < 0) {
   486			dev_dbg(kdev, "invalid PHY mode property\n");
   487			priv->phy_interface =3D PHY_INTERFACE_MODE_RGMII;
   488		}
   489	=

   490		/* We need to specifically look up whether this PHY interface is in=
ternal
   491		 * or not *before* we even try to probe the PHY driver over MDIO as=
 we
   492		 * may have shut down the internal PHY for power saving purposes.
   493		 */
   494		if (priv->phy_interface =3D=3D PHY_INTERFACE_MODE_INTERNAL)
   495			priv->internal_phy =3D true;
   496	=

   497		return 0;
   498	}
   499	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============7920017147620586524==--

