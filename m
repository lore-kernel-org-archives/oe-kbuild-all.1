Content-Type: multipart/mixed; boundary="===============2786229111640519202=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/mtd/nand/raw/intel-nand-controller.c:683 ebu_nand_probe() warn: 'ebu_host->clk' not released on lines: 644.
Date: Sat, 15 May 2021 13:40:00 +0300
Message-ID: <202105150822.OE5z5WCY-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2786229111640519202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   25a1298726e97b9d25379986f5d54d9e62ad6e93
commit: 0b1039f016e8a37c779a4aee362cb2100ebb1cfd mtd: rawnand: Add NAND con=
troller support on Intel LGM SoC
config: arm-randconfig-m031-20210515 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/nand/raw/intel-nand-controller.c:683 ebu_nand_probe() warn: 'eb=
u_host->clk' not released on lines: 644.

vim +683 drivers/mtd/nand/raw/intel-nand-controller.c

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  577  static int ebu_n=
and_probe(struct platform_device *pdev)
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  578  {
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  579  	struct device *=
dev =3D &pdev->dev;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  580  	struct ebu_nand=
_controller *ebu_host;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  581  	struct nand_chi=
p *nand;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  582  	struct mtd_info=
 *mtd =3D NULL;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  583  	struct resource=
 *res;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  584  	char *resname;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  585  	int ret;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  586  	u32 cs;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  587  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  588  	ebu_host =3D de=
vm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  589  	if (!ebu_host)
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  590  		return -ENOMEM;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  591  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  592  	ebu_host->dev =
=3D dev;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  593  	nand_controller=
_init(&ebu_host->controller);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  594  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  595  	res =3D platfor=
m_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  596  	ebu_host->ebu =
=3D devm_ioremap_resource(&pdev->dev, res);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  597  	if (IS_ERR(ebu_=
host->ebu))
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  598  		return PTR_ERR=
(ebu_host->ebu);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  599  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  600  	res =3D platfor=
m_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  601  	ebu_host->hsnan=
d =3D devm_ioremap_resource(&pdev->dev, res);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  602  	if (IS_ERR(ebu_=
host->hsnand))
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  603  		return PTR_ERR=
(ebu_host->hsnand);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  604  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  605  	ret =3D device_=
property_read_u32(dev, "reg", &cs);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  606  	if (ret) {
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  607  		dev_err(dev, "=
failed to get chip select: %d\n", ret);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  608  		return ret;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  609  	}
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  610  	ebu_host->cs_nu=
m =3D cs;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  611  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  612  	resname =3D dev=
m_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  613  	res =3D platfor=
m_get_resource_byname(pdev, IORESOURCE_MEM, resname);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  614  	ebu_host->cs[cs=
].chipaddr =3D devm_ioremap_resource(dev, res);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  615  	ebu_host->cs[cs=
].nand_pa =3D res->start;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  616  	if (IS_ERR(ebu_=
host->cs[cs].chipaddr))
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  617  		return PTR_ERR=
(ebu_host->cs[cs].chipaddr);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  618  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  619  	ebu_host->clk =
=3D devm_clk_get(dev, NULL);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  620  	if (IS_ERR(ebu_=
host->clk))
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  621  		return dev_err=
_probe(dev, PTR_ERR(ebu_host->clk),
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  622  				     "failed=
 to get clock\n");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  623  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  624  	ret =3D clk_pre=
pare_enable(ebu_host->clk);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  625  	if (ret) {
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  626  		dev_err(dev, "=
failed to enable clock: %d\n", ret);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  627  		return ret;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  628  	}
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  629  	ebu_host->clk_r=
ate =3D clk_get_rate(ebu_host->clk);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  630  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  631  	ebu_host->dma_t=
x =3D dma_request_chan(dev, "tx");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  632  	if (IS_ERR(ebu_=
host->dma_tx))
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  633  		return dev_err=
_probe(dev, PTR_ERR(ebu_host->dma_tx),
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  634  				     "failed=
 to request DMA tx chan!.\n");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  635  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  636  	ebu_host->dma_r=
x =3D dma_request_chan(dev, "rx");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  637  	if (IS_ERR(ebu_=
host->dma_rx))
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  638  		return dev_err=
_probe(dev, PTR_ERR(ebu_host->dma_rx),
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  639  				     "failed=
 to request DMA rx chan!.\n");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  640  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  641  	resname =3D dev=
m_kasprintf(dev, GFP_KERNEL, "addr_sel%d", cs);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  642  	res =3D platfor=
m_get_resource_byname(pdev, IORESOURCE_MEM, resname);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  643  	if (!res)
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  644  		return -EINVAL;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  645  	ebu_host->cs[cs=
].addr_sel =3D res->start;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  646  	writel(ebu_host=
->cs[cs].addr_sel | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  647  	       ebu_host=
->ebu + EBU_ADDR_SEL(cs));
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  648  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  649  	nand_set_flash_=
node(&ebu_host->chip, dev->of_node);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  650  	if (!mtd->name)=
 {
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  651  		dev_err(ebu_ho=
st->dev, "NAND label property is mandatory\n");
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  652  		return -EINVAL;

goto to cleanup code?

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  653  	}
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  654  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  655  	mtd =3D nand_to=
_mtd(&ebu_host->chip);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  656  	mtd->dev.parent=
 =3D dev;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  657  	ebu_host->dev =
=3D dev;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  658  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  659  	platform_set_dr=
vdata(pdev, ebu_host);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  660  	nand_set_contro=
ller_data(&ebu_host->chip, ebu_host);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  661  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  662  	nand =3D &ebu_h=
ost->chip;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  663  	nand->controlle=
r =3D &ebu_host->controller;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  664  	nand->controlle=
r->ops =3D &ebu_nand_controller_ops;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  665  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  666  	/* Scan to find=
 existence of the device */
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  667  	ret =3D nand_sc=
an(&ebu_host->chip, 1);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  668  	if (ret)
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  669  		goto err_clean=
up_dma;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  670  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  671  	ret =3D mtd_dev=
ice_register(mtd, NULL, 0);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  672  	if (ret)
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  673  		goto err_clean=
_nand;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  674  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  675  	return 0;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  676  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  677  err_clean_nand:
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  678  	nand_cleanup(&e=
bu_host->chip);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  679  err_cleanup_dma:
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  680  	ebu_dma_cleanup=
(ebu_host);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  681  	clk_disable_unp=
repare(ebu_host->clk);
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  682  =

0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10 @683  	return ret;
0b1039f016e8a3 Ramuthevar Vadivel Murugan 2020-11-10  684  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2786229111640519202==--

