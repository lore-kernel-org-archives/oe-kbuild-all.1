Content-Type: multipart/mixed; boundary="===============0391868227126625631=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [freescale-fslc:pr/218 11674/16341] drivers/irqchip/irq-imx-intmux.c:169:14: error: 'struct intmux_data' has no member named 'saved_reg'
Date: Tue, 19 Jan 2021 12:52:59 +0800
Message-ID: <202101191255.BVsu3ibf-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0391868227126625631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Freescale/linux-fslc pr/218
head:   873af59ba276f436bbba540788de331e222a31d7
commit: 89f28f28d76a0bc4a4d825818e2f50fbd4368235 [11674/16341] MLK-24382-1 =
irqchip: imx-intmux: add system PM support
config: arm-vf610m4_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/89f28f28d76a0bc4a4=
d825818e2f50fbd4368235
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc pr/218
        git checkout 89f28f28d76a0bc4a4d825818e2f50fbd4368235
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-imx-intmux.c: In function 'imx_intmux_probe':
>> drivers/irqchip/irq-imx-intmux.c:169:14: error: 'struct intmux_data' has=
 no member named 'saved_reg'
     169 |   intmux_data->saved_reg =3D devm_kzalloc(&pdev->dev,
         |              ^~
   drivers/irqchip/irq-imx-intmux.c:172:19: error: 'struct intmux_data' has=
 no member named 'saved_reg'
     172 |   if (!intmux_data->saved_reg)
         |                   ^~


vim +169 drivers/irqchip/irq-imx-intmux.c

   128	=

   129	static int imx_intmux_probe(struct platform_device *pdev)
   130	{
   131		struct device_node *np =3D pdev->dev.of_node;
   132		struct intmux_data *intmux_data;
   133		struct resource *res;
   134		int i;
   135		int channum;
   136		int ret;
   137	=

   138		ret =3D of_property_read_u32(np, "nxp,intmux_chans", &channum);
   139		if (ret)
   140			channum =3D 1;
   141	=

   142		intmux_data =3D devm_kzalloc(&pdev->dev, sizeof(*intmux_data) +
   143					     channum *
   144					     sizeof(intmux_data->irqchip_data[0]),
   145					     GFP_KERNEL);
   146		if (!intmux_data)
   147			return -ENOMEM;
   148	=

   149		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
   150		intmux_data->regs =3D devm_ioremap_resource(&pdev->dev, res);
   151		if (IS_ERR(intmux_data->regs)) {
   152			dev_err(&pdev->dev, "failed to initialize reg\n");
   153			return PTR_ERR(intmux_data->regs);
   154		}
   155	=

   156		intmux_data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
   157		if (IS_ERR(intmux_data->ipg_clk)) {
   158			ret =3D PTR_ERR(intmux_data->ipg_clk);
   159			dev_err(&pdev->dev, "failed to get ipg clk: %d\n", ret);
   160			return ret;
   161		}
   162	=

   163		intmux_data->channum =3D channum;
   164		intmux_data->pdev =3D pdev;
   165		spin_lock_init(&intmux_data->lock);
   166	=

   167		if (IS_ENABLED(CONFIG_PM)) {
   168			/* save CHANIER register */
 > 169			intmux_data->saved_reg =3D devm_kzalloc(&pdev->dev,
   170							      sizeof(u32) * channum,
   171							      GFP_KERNEL);
   172			if (!intmux_data->saved_reg)
   173				return -ENOMEM;
   174		}
   175	=

   176		ret =3D clk_prepare_enable(intmux_data->ipg_clk);
   177		if (ret) {
   178			dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
   179			return ret;
   180		}
   181	=

   182		for (i =3D 0; i < channum; i++) {
   183			intmux_data->irqchip_data[i].chanidx =3D i;
   184			intmux_data->irqchip_data[i].irq =3D platform_get_irq(pdev, i);
   185			if (intmux_data->irqchip_data[i].irq <=3D 0) {
   186				dev_err(&pdev->dev, "failed to get irq\n");
   187				return -ENODEV;
   188			}
   189	=

   190			intmux_data->irqchip_data[i].domain =3D irq_domain_add_linear(np,
   191							 32,
   192							 &imx_intmux_domain_ops,
   193							 &intmux_data->irqchip_data[i]);
   194			if (!intmux_data->irqchip_data[i].domain) {
   195				dev_err(&intmux_data->pdev->dev,
   196					"failed to create IRQ domain\n");
   197				return -ENOMEM;
   198			}
   199	=

   200			irq_set_chained_handler_and_data(intmux_data->irqchip_data[i].irq,
   201						 imx_intmux_irq_handler,
   202						 &intmux_data->irqchip_data[i]);
   203		}
   204	=

   205		platform_set_drvdata(pdev, intmux_data);
   206	=

   207		return 0;
   208	}
   209	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0391868227126625631==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0391868227126625631==--

