Content-Type: multipart/mixed; boundary="===============4118688290705154779=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [ti:ti-rt-linux-5.10.y 4403/5211] drivers/pci/controller/cadence/pci-j721e.c:417 j721e_pcie_probe() warn: missing error code 'ret'
Date: Tue, 25 May 2021 16:12:27 +0300
Message-ID: <202105252048.BzNMEGwA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4118688290705154779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   9608f5b0459eb05d15bf5ac2945b0750d050fd57
commit: d6c94541065433e99c45a5ba4280f2af08bd329a [4403/5211] PCI: j721e: Ad=
d support to provide refclk to PCIe connector
config: x86_64-randconfig-m001-20210525 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/controller/cadence/pci-j721e.c:417 j721e_pcie_probe() warn: mis=
sing error code 'ret'

vim +/ret +417 drivers/pci/controller/cadence/pci-j721e.c

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  303  static int j721e_pci=
e_probe(struct platform_device *pdev)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  304  {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  305  	struct device *dev =
=3D &pdev->dev;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  306  	struct device_node =
*node =3D dev->of_node;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  307  	struct pci_host_bri=
dge *bridge;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  308  	struct j721e_pcie_d=
ata *data;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  309  	struct cdns_pcie *c=
dns_pcie;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  310  	struct j721e_pcie *=
pcie;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  311  	struct cdns_pcie_rc=
 *rc;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  312  	struct cdns_pcie_ep=
 *ep;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  313  	struct gpio_desc *g=
piod;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  314  	void __iomem *base;
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  315  	struct clk *clk;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  316  	u32 num_lanes;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  317  	u32 mode;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  318  	int ret;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  319  	int irq;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  320  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  321  	data =3D (struct j7=
21e_pcie_data *)of_device_get_match_data(dev);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  322  	if (!data)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  323  		return -EINVAL;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  324  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  325  	mode =3D (u32)data-=
>mode;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  326  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  327  	pcie =3D devm_kzall=
oc(dev, sizeof(*pcie), GFP_KERNEL);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  328  	if (!pcie)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  329  		return -ENOMEM;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  330  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  331  	pcie->dev =3D dev;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  332  	pcie->mode =3D mode;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  333  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  334  	base =3D devm_platf=
orm_ioremap_resource_byname(pdev, "intd_cfg");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  335  	if (IS_ERR(base))
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  336  		return PTR_ERR(bas=
e);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  337  	pcie->intd_cfg_base=
 =3D base;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  338  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  339  	base =3D devm_platf=
orm_ioremap_resource_byname(pdev, "user_cfg");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  340  	if (IS_ERR(base))
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  341  		return PTR_ERR(bas=
e);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  342  	pcie->user_cfg_base=
 =3D base;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  343  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  344  	ret =3D of_property=
_read_u32(node, "num-lanes", &num_lanes);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  345  	if (ret || num_lane=
s > MAX_LANES)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  346  		num_lanes =3D 1;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  347  	pcie->num_lanes =3D=
 num_lanes;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  348  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  349  	if (dma_set_mask_an=
d_coherent(dev, DMA_BIT_MASK(48)))
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  350  		return -EINVAL;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  351  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  352  	irq =3D platform_ge=
t_irq_byname(pdev, "link_state");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  353  	if (irq < 0)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  354  		return irq;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  355  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  356  	dev_set_drvdata(dev=
, pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  357  	pm_runtime_enable(d=
ev);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  358  	ret =3D pm_runtime_=
get_sync(dev);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  359  	if (ret < 0) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  360  		dev_err(dev, "pm_r=
untime_get_sync failed\n");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  361  		goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  362  	}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  363  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  364  	ret =3D j721e_pcie_=
ctrl_init(pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  365  	if (ret < 0) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  366  		dev_err(dev, "pm_r=
untime_get_sync failed\n");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  367  		goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  368  	}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  369  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  370  	ret =3D devm_reques=
t_irq(dev, irq, j721e_pcie_link_irq_handler, 0,
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  371  			       "j721e-pci=
e-link-down-irq", pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  372  	if (ret < 0) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  373  		dev_err(dev, "fail=
ed to request link state IRQ %d\n", irq);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  374  		goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  375  	}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  376  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  377  	j721e_pcie_config_l=
ink_irq(pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  378  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  379  	switch (mode) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  380  	case PCI_MODE_RC:
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  381  		if (!IS_ENABLED(CO=
NFIG_PCIE_CADENCE_HOST)) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  382  			ret =3D -ENODEV;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  383  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  384  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  385  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  386  		bridge =3D devm_pc=
i_alloc_host_bridge(dev, sizeof(*rc));
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  387  		if (!bridge) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  388  			ret =3D -ENOMEM;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  389  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  390  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  391  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  392  		bridge->ops =3D &c=
dns_ti_pcie_host_ops;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  393  		rc =3D pci_host_br=
idge_priv(bridge);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  394  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  395  		cdns_pcie =3D &rc-=
>pcie;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  396  		cdns_pcie->dev =3D=
 dev;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  397  		cdns_pcie->ops =3D=
 &j721e_pcie_ops;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  398  		pcie->cdns_pcie =
=3D cdns_pcie;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  399  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  400  		gpiod =3D devm_gpi=
od_get_optional(dev, "reset", GPIOD_OUT_LOW);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  401  		if (IS_ERR(gpiod))=
 {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  402  			ret =3D PTR_ERR(g=
piod);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  403  			if (ret !=3D -EPR=
OBE_DEFER)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  404  				dev_err(dev, "Fa=
iled to get reset GPIO\n");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  405  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  406  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  407  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  408  		ret =3D cdns_pcie_=
init_phy(dev, cdns_pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  409  		if (ret) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  410  			dev_err(dev, "Fai=
led to init phy\n");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  411  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  412  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  413  =

d6c94541065433 Kishon Vijay Abraham I 2021-03-30  414  		clk =3D devm_clk_g=
et_optional(dev, "pcie_refclk");
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  415  		if (IS_ERR(clk)) {
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  416  			dev_err(dev, "fai=
led to get pcie_refclk\n");
d6c94541065433 Kishon Vijay Abraham I 2021-03-30 @417  			goto err_pcie_set=
up;

ret =3D PTR_ERR(clk);

d6c94541065433 Kishon Vijay Abraham I 2021-03-30  418  		}
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  419  =

d6c94541065433 Kishon Vijay Abraham I 2021-03-30  420  		ret =3D clk_prepar=
e_enable(clk);
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  421  		if (ret) {
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  422  			dev_err(dev, "fai=
led to enable pcie_refclk\n");
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  423  			goto err_get_sync;
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  424  		}
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  425  		pcie->refclk =3D c=
lk;
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  426  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  427  		/*
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  428  		 * "Power Sequenci=
ng and Reset Signal Timings" table in
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  429  		 * PCI EXPRESS CAR=
D ELECTROMECHANICAL SPECIFICATION, REV. 3.0
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  430  		 * indicates PERST=
# should be deasserted after minimum of 100us
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  431  		 * once REFCLK is =
stable. The REFCLK to the connector in RC
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  432  		 * mode is selecte=
d while enabling the PHY. So deassert PERST#
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  433  		 * after 100 us.
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  434  		 */
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  435  		if (gpiod) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  436  			usleep_range(100,=
 200);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  437  			gpiod_set_value_c=
ansleep(gpiod, 1);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  438  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  439  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  440  		ret =3D cdns_pcie_=
host_setup(rc);
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  441  		if (ret < 0) {
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  442  			clk_disable_unpre=
pare(pcie->refclk);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  443  			goto err_pcie_set=
up;
d6c94541065433 Kishon Vijay Abraham I 2021-03-30  444  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  445  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  446  		break;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  447  	case PCI_MODE_EP:
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  448  		if (!IS_ENABLED(CO=
NFIG_PCIE_CADENCE_EP)) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  449  			ret =3D -ENODEV;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  450  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  451  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  452  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  453  		ep =3D devm_kzallo=
c(dev, sizeof(*ep), GFP_KERNEL);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  454  		if (!ep) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  455  			ret =3D -ENOMEM;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  456  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  457  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  458  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  459  		cdns_pcie =3D &ep-=
>pcie;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  460  		cdns_pcie->dev =3D=
 dev;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  461  		cdns_pcie->ops =3D=
 &j721e_pcie_ops;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  462  		pcie->cdns_pcie =
=3D cdns_pcie;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  463  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  464  		ret =3D cdns_pcie_=
init_phy(dev, cdns_pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  465  		if (ret) {
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  466  			dev_err(dev, "Fai=
led to init phy\n");
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  467  			goto err_get_sync;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  468  		}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  469  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  470  		ret =3D cdns_pcie_=
ep_setup(ep);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  471  		if (ret < 0)
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  472  			goto err_pcie_set=
up;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  473  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  474  		break;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  475  	default:
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  476  		dev_err(dev, "INVA=
LID device type %d\n", mode);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  477  	}
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  478  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  479  	return 0;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  480  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  481  err_pcie_setup:
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  482  	cdns_pcie_disable_p=
hy(cdns_pcie);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  483  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  484  err_get_sync:
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  485  	pm_runtime_put(dev);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  486  	pm_runtime_disable(=
dev);
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  487  =

f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  488  	return ret;
f3e25911a430ed Kishon Vijay Abraham I 2020-07-22  489  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============4118688290705154779==--

