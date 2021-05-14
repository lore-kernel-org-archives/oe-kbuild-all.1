Content-Type: multipart/mixed; boundary="===============8175231034550870488=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/phy/mediatek/phy-mtk-tphy.c:955 mtk_phy_init() warn: 'instance->da_ref_clk' not released on lines: 952.
Date: Fri, 14 May 2021 08:58:55 +0300
Message-ID: <202105140401.k3v4vTpW-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8175231034550870488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   adc12a7407b28c0f257227a508db83ab00911b74
commit: 133552bf03edbe3892767a4b64c56e3bed746374 phy: Remove CONFIG_ARCH_* =
check for related subdir in Makefile
config: powerpc-randconfig-m031-20210513 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/phy/mediatek/phy-mtk-tphy.c:955 mtk_phy_init() warn: 'instance->da_=
ref_clk' not released on lines: 952.
drivers/phy/mediatek/phy-mtk-tphy.c:955 mtk_phy_init() warn: 'instance->ref=
_clk' not released on lines: 952.

vim +955 drivers/phy/mediatek/phy-mtk-tphy.c

cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 917  static int mtk_phy_init(struct phy *phy)
dc7f190fd51f5c drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2015-09-29 =
 918  {
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 919  	struct mtk_phy_instance *instance =3D phy_get_drvdata(phy);
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 920  	struct mtk_tphy *tphy =3D dev_get_drvdata(phy->dev.parent);
dc7f190fd51f5c drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2015-09-29 =
 921  	int ret;
dc7f190fd51f5c drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2015-09-29 =
 922  =

15de15c6b45b87 drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2017-03-31 =
 923  	ret =3D clk_prepare_enable(instance->ref_clk);
15de15c6b45b87 drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2017-03-31 =
 924  	if (ret) {
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 925  		dev_err(tphy->dev, "failed to enable ref_clk\n");
15de15c6b45b87 drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2017-03-31 =
 926  		return ret;
15de15c6b45b87 drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2017-03-31 =
 927  	}
15de15c6b45b87 drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2017-03-31 =
 928  =

12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 929  	ret =3D clk_prepare_enable(instance->da_ref_clk);
12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 930  	if (ret) {
12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 931  		dev_err(tphy->dev, "failed to enable da_ref\n");
12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 932  		clk_disable_unprepare(instance->ref_clk);
12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 933  		return ret;
12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 934  	}
12d0c0bed3f473 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2020-02-11 =
 935  =

44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 936  	switch (instance->type) {
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 937  	case PHY_TYPE_USB2:
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 938  		u2_phy_instance_init(tphy, instance);
8158e917d91cb0 drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2018-06-29 =
 939  		u2_phy_props_set(tphy, instance);
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 940  		break;
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 941  	case PHY_TYPE_USB3:
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 942  		u3_phy_instance_init(tphy, instance);
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 943  		break;
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 944  	case PHY_TYPE_PCIE:
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 945  		pcie_phy_instance_init(tphy, instance);
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 946  		break;
4ab26cb66a8cb3 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 947  	case PHY_TYPE_SATA:
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 948  		sata_phy_instance_init(tphy, instance);
4ab26cb66a8cb3 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 949  		break;
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 950  	default:
cd4ec4b03dc15b drivers/phy/mediatek/phy-mtk-tphy.c Chunfeng Yun 2017-08-03 =
 951  		dev_err(tphy->dev, "incompatible PHY type\n");
44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 952  		return -EINVAL;

clk_disable_unprepare()?

44a6d6ce6436a2 drivers/phy/phy-mt65xx-usb3.c       Ryder Lee    2017-08-03 =
 953  	}
04466efca58f69 drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2017-03-31 =
 954  =

dc7f190fd51f5c drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2015-09-29 =
@955  	return 0;
dc7f190fd51f5c drivers/phy/phy-mt65xx-usb3.c       Chunfeng Yun 2015-09-29 =
 956  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8175231034550870488==--

