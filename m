Content-Type: multipart/mixed; boundary="===============6807012698118418359=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:master 11920/12212] drivers/soc/xilinx/xlnx_vcu.c:661 xvcu_probe() warn: 'xvcu->aclk' not released on lines: 631.
Date: Mon, 17 May 2021 16:17:31 +0300
Message-ID: <202105171946.bKsakVLz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6807012698118418359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx master
head:   69b34cdcc637efc5238a230132f8a5a2e2fad625
commit: 6d72adc5a6e6088ae976bd7f0c23d668ad963111 [11920/12212] soc: xilinx:=
 vcu: Update vcu init/reset sequence
config: x86_64-randconfig-m031-20210517 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/soc/xilinx/xlnx_vcu.c:661 xvcu_probe() warn: 'xvcu->aclk' not relea=
sed on lines: 631.
drivers/soc/xilinx/xlnx_vcu.c:661 xvcu_probe() warn: 'xvcu->pll_ref' not re=
leased on lines: 631.

Old smatch warnings:
drivers/soc/xilinx/xlnx_vcu.c:482 xvcu_set_vcu_pll_info() warn: 'xvcu->pll_=
ref' not released on lines: 389,421.

vim +661 drivers/soc/xilinx/xlnx_vcu.c

cee8113a295acf Dhaval Shah       2017-12-21  544  static int xvcu_probe(str=
uct platform_device *pdev)
cee8113a295acf Dhaval Shah       2017-12-21  545  {
cee8113a295acf Dhaval Shah       2017-12-21  546  	struct resource *res;
cee8113a295acf Dhaval Shah       2017-12-21  547  	struct xvcu_device *xvcu;
816934060798dc Michael Tretter   2020-11-09  548  	void __iomem *regs;
cee8113a295acf Dhaval Shah       2017-12-21  549  	int ret;
cee8113a295acf Dhaval Shah       2017-12-21  550  =

cee8113a295acf Dhaval Shah       2017-12-21  551  	xvcu =3D devm_kzalloc(&p=
dev->dev, sizeof(*xvcu), GFP_KERNEL);
cee8113a295acf Dhaval Shah       2017-12-21  552  	if (!xvcu)
cee8113a295acf Dhaval Shah       2017-12-21  553  		return -ENOMEM;
cee8113a295acf Dhaval Shah       2017-12-21  554  =

cee8113a295acf Dhaval Shah       2017-12-21  555  	xvcu->dev =3D &pdev->dev;
cee8113a295acf Dhaval Shah       2017-12-21  556  	res =3D platform_get_res=
ource_byname(pdev, IORESOURCE_MEM, "vcu_slcr");
cee8113a295acf Dhaval Shah       2017-12-21  557  	if (!res) {
cee8113a295acf Dhaval Shah       2017-12-21  558  		dev_err(&pdev->dev, "ge=
t vcu_slcr memory resource failed.\n");
cee8113a295acf Dhaval Shah       2017-12-21  559  		return -ENODEV;
cee8113a295acf Dhaval Shah       2017-12-21  560  	}
cee8113a295acf Dhaval Shah       2017-12-21  561  =

4bdc0d676a6431 Christoph Hellwig 2020-01-06  562  	xvcu->vcu_slcr_ba =3D de=
vm_ioremap(&pdev->dev, res->start,
cee8113a295acf Dhaval Shah       2017-12-21  563  						 resource_size(res)=
);
cee8113a295acf Dhaval Shah       2017-12-21  564  	if (!xvcu->vcu_slcr_ba) {
cee8113a295acf Dhaval Shah       2017-12-21  565  		dev_err(&pdev->dev, "vc=
u_slcr register mapping failed.\n");
cee8113a295acf Dhaval Shah       2017-12-21  566  		return -ENOMEM;
cee8113a295acf Dhaval Shah       2017-12-21  567  	}
cee8113a295acf Dhaval Shah       2017-12-21  568  =

816934060798dc Michael Tretter   2020-11-09  569  	xvcu->logicore_reg_ba =
=3D
816934060798dc Michael Tretter   2020-11-09  570  		syscon_regmap_lookup_by=
_compatible("xlnx,vcu-settings");
816934060798dc Michael Tretter   2020-11-09  571  	if (IS_ERR(xvcu->logicor=
e_reg_ba)) {
816934060798dc Michael Tretter   2020-11-09  572  		dev_info(&pdev->dev,
816934060798dc Michael Tretter   2020-11-09  573  			 "could not find xlnx,=
vcu-settings: trying direct register access\n");
816934060798dc Michael Tretter   2020-11-09  574  =

816934060798dc Michael Tretter   2020-11-09  575  		res =3D platform_get_re=
source_byname(pdev,
816934060798dc Michael Tretter   2020-11-09  576  						   IORESOURCE_MEM, =
"logicore");
cee8113a295acf Dhaval Shah       2017-12-21  577  		if (!res) {
cee8113a295acf Dhaval Shah       2017-12-21  578  			dev_err(&pdev->dev, "g=
et logicore memory resource failed.\n");
cee8113a295acf Dhaval Shah       2017-12-21  579  			return -ENODEV;
cee8113a295acf Dhaval Shah       2017-12-21  580  		}
cee8113a295acf Dhaval Shah       2017-12-21  581  =

816934060798dc Michael Tretter   2020-11-09  582  		regs =3D devm_ioremap(&=
pdev->dev, res->start, resource_size(res));
816934060798dc Michael Tretter   2020-11-09  583  		if (!regs) {
cee8113a295acf Dhaval Shah       2017-12-21  584  			dev_err(&pdev->dev, "l=
ogicore register mapping failed.\n");
cee8113a295acf Dhaval Shah       2017-12-21  585  			return -ENOMEM;
cee8113a295acf Dhaval Shah       2017-12-21  586  		}
cee8113a295acf Dhaval Shah       2017-12-21  587  =

816934060798dc Michael Tretter   2020-11-09  588  		xvcu->logicore_reg_ba =
=3D
816934060798dc Michael Tretter   2020-11-09  589  			devm_regmap_init_mmio(=
&pdev->dev, regs,
816934060798dc Michael Tretter   2020-11-09  590  					      &vcu_settings_=
regmap_config);
816934060798dc Michael Tretter   2020-11-09  591  		if (IS_ERR(xvcu->logico=
re_reg_ba)) {
816934060798dc Michael Tretter   2020-11-09  592  			dev_err(&pdev->dev, "f=
ailed to init regmap\n");
816934060798dc Michael Tretter   2020-11-09  593  			return PTR_ERR(xvcu->l=
ogicore_reg_ba);
816934060798dc Michael Tretter   2020-11-09  594  		}
816934060798dc Michael Tretter   2020-11-09  595  	}
816934060798dc Michael Tretter   2020-11-09  596  =

cee8113a295acf Dhaval Shah       2017-12-21  597  	xvcu->aclk =3D devm_clk_=
get(&pdev->dev, "aclk");
cee8113a295acf Dhaval Shah       2017-12-21  598  	if (IS_ERR(xvcu->aclk)) {
cee8113a295acf Dhaval Shah       2017-12-21  599  		dev_err(&pdev->dev, "Co=
uld not get aclk clock\n");
cee8113a295acf Dhaval Shah       2017-12-21  600  		return PTR_ERR(xvcu->ac=
lk);
cee8113a295acf Dhaval Shah       2017-12-21  601  	}
cee8113a295acf Dhaval Shah       2017-12-21  602  =

cee8113a295acf Dhaval Shah       2017-12-21  603  	xvcu->pll_ref =3D devm_c=
lk_get(&pdev->dev, "pll_ref");
cee8113a295acf Dhaval Shah       2017-12-21  604  	if (IS_ERR(xvcu->pll_ref=
)) {
cee8113a295acf Dhaval Shah       2017-12-21  605  		dev_err(&pdev->dev, "Co=
uld not get pll_ref clock\n");
cee8113a295acf Dhaval Shah       2017-12-21  606  		return PTR_ERR(xvcu->pl=
l_ref);
cee8113a295acf Dhaval Shah       2017-12-21  607  	}
cee8113a295acf Dhaval Shah       2017-12-21  608  =

cee8113a295acf Dhaval Shah       2017-12-21  609  	ret =3D clk_prepare_enab=
le(xvcu->aclk);
cee8113a295acf Dhaval Shah       2017-12-21  610  	if (ret) {
cee8113a295acf Dhaval Shah       2017-12-21  611  		dev_err(&pdev->dev, "ac=
lk clock enable failed\n");
cee8113a295acf Dhaval Shah       2017-12-21  612  		return ret;
cee8113a295acf Dhaval Shah       2017-12-21  613  	}
cee8113a295acf Dhaval Shah       2017-12-21  614  =

cee8113a295acf Dhaval Shah       2017-12-21  615  	ret =3D clk_prepare_enab=
le(xvcu->pll_ref);
cee8113a295acf Dhaval Shah       2017-12-21  616  	if (ret) {
cee8113a295acf Dhaval Shah       2017-12-21  617  		dev_err(&pdev->dev, "pl=
l_ref clock enable failed\n");
cee8113a295acf Dhaval Shah       2017-12-21  618  		goto error_aclk;
cee8113a295acf Dhaval Shah       2017-12-21  619  	}
cee8113a295acf Dhaval Shah       2017-12-21  620  =

cee8113a295acf Dhaval Shah       2017-12-21  621  	/*
cee8113a295acf Dhaval Shah       2017-12-21  622  	 * Do the Gasket isolati=
on and put the VCU out of reset
cee8113a295acf Dhaval Shah       2017-12-21  623  	 * Bit 0 : Gasket isolat=
ion
cee8113a295acf Dhaval Shah       2017-12-21  624  	 * Bit 1 : put VCU out o=
f reset
cee8113a295acf Dhaval Shah       2017-12-21  625  	 */
6d72adc5a6e608 Dhaval Shah       2021-01-29  626  	xvcu->reset_gpio =3D dev=
m_gpiod_get_optional(&pdev->dev, "reset",
6d72adc5a6e608 Dhaval Shah       2021-01-29  627  						   GPIOD_OUT_LOW);
6d72adc5a6e608 Dhaval Shah       2021-01-29  628  	if (IS_ERR(xvcu->reset_g=
pio)) {
6d72adc5a6e608 Dhaval Shah       2021-01-29  629  		ret =3D PTR_ERR(xvcu->r=
eset_gpio);
6d72adc5a6e608 Dhaval Shah       2021-01-29  630  		dev_err(&pdev->dev, "fa=
iled to get reset gpio for vcu.\n");
6d72adc5a6e608 Dhaval Shah       2021-01-29  631  		return ret;

goto error_pll_ref;

6d72adc5a6e608 Dhaval Shah       2021-01-29  632  	}
6d72adc5a6e608 Dhaval Shah       2021-01-29  633  =

6d72adc5a6e608 Dhaval Shah       2021-01-29  634  	if (xvcu->reset_gpio) {
6d72adc5a6e608 Dhaval Shah       2021-01-29  635  		gpiod_set_value(xvcu->r=
eset_gpio, 0);
6d72adc5a6e608 Dhaval Shah       2021-01-29  636  		/* min 2 clock cycle of=
 vcu pll_ref, slowest freq is 33.33KHz */
6d72adc5a6e608 Dhaval Shah       2021-01-29  637  		usleep_range(60, 120);
6d72adc5a6e608 Dhaval Shah       2021-01-29  638  		gpiod_set_value(xvcu->r=
eset_gpio, 1);
6d72adc5a6e608 Dhaval Shah       2021-01-29  639  		usleep_range(60, 120);
6d72adc5a6e608 Dhaval Shah       2021-01-29  640  	} else {
6d72adc5a6e608 Dhaval Shah       2021-01-29  641  		dev_warn(&pdev->dev, "N=
o reset gpio info from dts for vcu. This may lead to incorrect functionalit=
y if VCU isolation is removed post initialization.\n");
6d72adc5a6e608 Dhaval Shah       2021-01-29  642  	}
6d72adc5a6e608 Dhaval Shah       2021-01-29  643  =

816934060798dc Michael Tretter   2020-11-09  644  	regmap_write(xvcu->logic=
ore_reg_ba, VCU_GASKET_INIT, VCU_GASKET_VALUE);
cee8113a295acf Dhaval Shah       2017-12-21  645  =

cee8113a295acf Dhaval Shah       2017-12-21  646  	/* Do the PLL Settings b=
ased on the ref clk,core and mcu clk freq */
cee8113a295acf Dhaval Shah       2017-12-21  647  	ret =3D xvcu_set_pll(xvc=
u);
cee8113a295acf Dhaval Shah       2017-12-21  648  	if (ret) {
cee8113a295acf Dhaval Shah       2017-12-21  649  		dev_err(&pdev->dev, "Fa=
iled to set the pll\n");
cee8113a295acf Dhaval Shah       2017-12-21  650  		goto error_pll_ref;
cee8113a295acf Dhaval Shah       2017-12-21  651  	}
cee8113a295acf Dhaval Shah       2017-12-21  652  =

cee8113a295acf Dhaval Shah       2017-12-21  653  	dev_set_drvdata(&pdev->d=
ev, xvcu);
cee8113a295acf Dhaval Shah       2017-12-21  654  =

cee8113a295acf Dhaval Shah       2017-12-21  655  	return 0;
cee8113a295acf Dhaval Shah       2017-12-21  656  =

cee8113a295acf Dhaval Shah       2017-12-21  657  error_pll_ref:
cee8113a295acf Dhaval Shah       2017-12-21  658  	clk_disable_unprepare(xv=
cu->pll_ref);
cee8113a295acf Dhaval Shah       2017-12-21  659  error_aclk:
cee8113a295acf Dhaval Shah       2017-12-21  660  	clk_disable_unprepare(xv=
cu->aclk);
cee8113a295acf Dhaval Shah       2017-12-21 @661  	return ret;
cee8113a295acf Dhaval Shah       2017-12-21  662  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6807012698118418359==--

