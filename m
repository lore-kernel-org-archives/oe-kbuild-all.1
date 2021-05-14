Content-Type: multipart/mixed; boundary="===============9020973240079212432=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c:393 phy_meson_axg_mipi_dphy_probe() warn: 'priv->clk' not released on lines: 386.
Date: Fri, 14 May 2021 09:04:15 +0300
Message-ID: <202105140611.0pGD90Qg-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9020973240079212432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   315d99318179b9cd5077ccc9f7f26a164c9fa998
commit: 76aefb221146dbe0de124f566329c76d5dcf118a phy: amlogic: Add AXG MIPI=
 D-PHY driver
config: powerpc-randconfig-m031-20210513 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c:393 phy_meson_axg_mipi_dphy_p=
robe() warn: 'priv->clk' not released on lines: 386.

vim +393 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c

76aefb221146db Neil Armstrong 2020-11-16  333  static int phy_meson_axg_mip=
i_dphy_probe(struct platform_device *pdev)
76aefb221146db Neil Armstrong 2020-11-16  334  {
76aefb221146db Neil Armstrong 2020-11-16  335  	struct device *dev =3D &pde=
v->dev;
76aefb221146db Neil Armstrong 2020-11-16  336  	struct phy_provider *phy_pr=
ovider;
76aefb221146db Neil Armstrong 2020-11-16  337  	struct resource *res;
76aefb221146db Neil Armstrong 2020-11-16  338  	struct phy_meson_axg_mipi_d=
phy_priv *priv;
76aefb221146db Neil Armstrong 2020-11-16  339  	struct phy *phy;
76aefb221146db Neil Armstrong 2020-11-16  340  	void __iomem *base;
76aefb221146db Neil Armstrong 2020-11-16  341  	int ret;
76aefb221146db Neil Armstrong 2020-11-16  342  =

76aefb221146db Neil Armstrong 2020-11-16  343  	priv =3D devm_kzalloc(dev, =
sizeof(*priv), GFP_KERNEL);
76aefb221146db Neil Armstrong 2020-11-16  344  	if (!priv)
76aefb221146db Neil Armstrong 2020-11-16  345  		return -ENOMEM;
76aefb221146db Neil Armstrong 2020-11-16  346  =

76aefb221146db Neil Armstrong 2020-11-16  347  	priv->dev =3D dev;
76aefb221146db Neil Armstrong 2020-11-16  348  	platform_set_drvdata(pdev, =
priv);
76aefb221146db Neil Armstrong 2020-11-16  349  =

76aefb221146db Neil Armstrong 2020-11-16  350  	res =3D platform_get_resour=
ce(pdev, IORESOURCE_MEM, 0);
76aefb221146db Neil Armstrong 2020-11-16  351  	base =3D devm_ioremap_resou=
rce(dev, res);
76aefb221146db Neil Armstrong 2020-11-16  352  	if (IS_ERR(base))
76aefb221146db Neil Armstrong 2020-11-16  353  		return PTR_ERR(base);
76aefb221146db Neil Armstrong 2020-11-16  354  =

76aefb221146db Neil Armstrong 2020-11-16  355  	priv->regmap =3D devm_regma=
p_init_mmio(dev, base,
76aefb221146db Neil Armstrong 2020-11-16  356  					&phy_meson_axg_mipi_dph=
y_regmap_conf);
76aefb221146db Neil Armstrong 2020-11-16  357  	if (IS_ERR(priv->regmap))
76aefb221146db Neil Armstrong 2020-11-16  358  		return PTR_ERR(priv->regma=
p);
76aefb221146db Neil Armstrong 2020-11-16  359  =

76aefb221146db Neil Armstrong 2020-11-16  360  	priv->clk =3D devm_clk_get(=
dev, "pclk");
76aefb221146db Neil Armstrong 2020-11-16  361  	if (IS_ERR(priv->clk))
76aefb221146db Neil Armstrong 2020-11-16  362  		return PTR_ERR(priv->clk);
76aefb221146db Neil Armstrong 2020-11-16  363  =

76aefb221146db Neil Armstrong 2020-11-16  364  	priv->reset =3D devm_reset_=
control_get(dev, "phy");
76aefb221146db Neil Armstrong 2020-11-16  365  	if (IS_ERR(priv->reset))
76aefb221146db Neil Armstrong 2020-11-16  366  		return PTR_ERR(priv->reset=
);
76aefb221146db Neil Armstrong 2020-11-16  367  =

76aefb221146db Neil Armstrong 2020-11-16  368  	priv->analog =3D devm_phy_g=
et(dev, "analog");
76aefb221146db Neil Armstrong 2020-11-16  369  	if (IS_ERR(priv->analog))
76aefb221146db Neil Armstrong 2020-11-16  370  		return PTR_ERR(priv->analo=
g);
76aefb221146db Neil Armstrong 2020-11-16  371  =

76aefb221146db Neil Armstrong 2020-11-16  372  	ret =3D clk_prepare_enable(=
priv->clk);
76aefb221146db Neil Armstrong 2020-11-16  373  	if (ret)
76aefb221146db Neil Armstrong 2020-11-16  374  		return ret;
76aefb221146db Neil Armstrong 2020-11-16  375  =

76aefb221146db Neil Armstrong 2020-11-16  376  	ret =3D reset_control_deass=
ert(priv->reset);
76aefb221146db Neil Armstrong 2020-11-16  377  	if (ret)
76aefb221146db Neil Armstrong 2020-11-16  378  		return ret;
76aefb221146db Neil Armstrong 2020-11-16  379  =

76aefb221146db Neil Armstrong 2020-11-16  380  	phy =3D devm_phy_create(dev=
, NULL, &phy_meson_axg_mipi_dphy_ops);
76aefb221146db Neil Armstrong 2020-11-16  381  	if (IS_ERR(phy)) {
76aefb221146db Neil Armstrong 2020-11-16  382  		ret =3D PTR_ERR(phy);
76aefb221146db Neil Armstrong 2020-11-16  383  		if (ret !=3D -EPROBE_DEFER)
76aefb221146db Neil Armstrong 2020-11-16  384  			dev_err(dev, "failed to c=
reate PHY\n");
76aefb221146db Neil Armstrong 2020-11-16  385  =

76aefb221146db Neil Armstrong 2020-11-16  386  		return ret;

Should we disable unprepare the clk?  I don't know, btw.  It seems like
a lot of people don't bother with that.

76aefb221146db Neil Armstrong 2020-11-16  387  	}
76aefb221146db Neil Armstrong 2020-11-16  388  =

76aefb221146db Neil Armstrong 2020-11-16  389  	phy_set_drvdata(phy, priv);
76aefb221146db Neil Armstrong 2020-11-16  390  =

76aefb221146db Neil Armstrong 2020-11-16  391  	phy_provider =3D devm_of_ph=
y_provider_register(dev, of_phy_simple_xlate);

Same if devm_of_phy_provider_register() fails I guess.

76aefb221146db Neil Armstrong 2020-11-16  392  =

76aefb221146db Neil Armstrong 2020-11-16 @393  	return PTR_ERR_OR_ZERO(phy_=
provider);
76aefb221146db Neil Armstrong 2020-11-16  394  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9020973240079212432==--

