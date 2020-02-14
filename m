Content-Type: multipart/mixed; boundary="===============4835074071763369518=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [asoc:for-5.7 65/70] sound/soc/meson/aiu.c:186:31-37: ERROR: application of sizeof to pointer
Date: Fri, 14 Feb 2020 13:11:31 +0800
Message-ID: <202002141324.cUMWV44e%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4835074071763369518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-5.7
head:   e37a0c313a0f8ba0b8de9c30db98fbc77bd8d446
commit: 6ae9ca9ce986bffe71fd0fbf9595de8500891b52 [65/70] ASoC: meson: aiu: =
add i2s and spdif support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> sound/soc/meson/aiu.c:186:31-37: ERROR: application of sizeof to pointer
--
>> sound/soc/meson/aiu.c:298:2-9: line 298 is redundant because platform_ge=
t_irq() already prints an error
   sound/soc/meson/aiu.c:304:2-9: line 304 is redundant because platform_ge=
t_irq() already prints an error
--
>> sound/soc/meson/aiu.c:297:5-17: WARNING: Unsigned expression compared wi=
th zero: aiu -> i2s . irq < 0
>> sound/soc/meson/aiu.c:303:5-19: WARNING: Unsigned expression compared wi=
th zero: aiu -> spdif . irq < 0

vim +186 sound/soc/meson/aiu.c

   177	=

   178	static int aiu_clk_bulk_get(struct device *dev,
   179				    const char * const *ids,
   180				    unsigned int num,
   181				    struct aiu_interface *interface)
   182	{
   183		struct clk_bulk_data *clks;
   184		int i, ret;
   185	=

 > 186		clks =3D devm_kcalloc(dev, num, sizeof(clks), GFP_KERNEL);
   187		if (!clks)
   188			return -ENOMEM;
   189	=

   190		for (i =3D 0; i < num; i++)
   191			clks[i].id =3D ids[i];
   192	=

   193		ret =3D devm_clk_bulk_get(dev, num, clks);
   194		if (ret < 0)
   195			return ret;
   196	=

   197		interface->clks =3D clks;
   198		interface->clk_num =3D num;
   199		return 0;
   200	}
   201	=

   202	static const char * const aiu_i2s_ids[] =3D {
   203		[PCLK]	=3D "i2s_pclk",
   204		[AOCLK]	=3D "i2s_aoclk",
   205		[MCLK]	=3D "i2s_mclk",
   206		[MIXER]	=3D "i2s_mixer",
   207	};
   208	=

   209	static const char * const aiu_spdif_ids[] =3D {
   210		[PCLK]	=3D "spdif_pclk",
   211		[AOCLK]	=3D "spdif_aoclk",
   212		[MCLK]	=3D "spdif_mclk_sel"
   213	};
   214	=

   215	static int aiu_clk_get(struct device *dev)
   216	{
   217		struct aiu *aiu =3D dev_get_drvdata(dev);
   218		int ret;
   219	=

   220		aiu->pclk =3D devm_clk_get(dev, "pclk");
   221		if (IS_ERR(aiu->pclk)) {
   222			if (PTR_ERR(aiu->pclk) !=3D -EPROBE_DEFER)
   223				dev_err(dev, "Can't get the aiu pclk\n");
   224			return PTR_ERR(aiu->pclk);
   225		}
   226	=

   227		aiu->spdif_mclk =3D devm_clk_get(dev, "spdif_mclk");
   228		if (IS_ERR(aiu->spdif_mclk)) {
   229			if (PTR_ERR(aiu->spdif_mclk) !=3D -EPROBE_DEFER)
   230				dev_err(dev, "Can't get the aiu spdif master clock\n");
   231			return PTR_ERR(aiu->spdif_mclk);
   232		}
   233	=

   234		ret =3D aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
   235				       &aiu->i2s);
   236		if (ret) {
   237			if (ret !=3D -EPROBE_DEFER)
   238				dev_err(dev, "Can't get the i2s clocks\n");
   239			return ret;
   240		}
   241	=

   242		ret =3D aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_i=
ds),
   243				       &aiu->spdif);
   244		if (ret) {
   245			if (ret !=3D -EPROBE_DEFER)
   246				dev_err(dev, "Can't get the spdif clocks\n");
   247			return ret;
   248		}
   249	=

   250		ret =3D clk_prepare_enable(aiu->pclk);
   251		if (ret) {
   252			dev_err(dev, "peripheral clock enable failed\n");
   253			return ret;
   254		}
   255	=

   256		ret =3D devm_add_action_or_reset(dev,
   257					       (void(*)(void *))clk_disable_unprepare,
   258					       aiu->pclk);
   259		if (ret)
   260			dev_err(dev, "failed to add reset action on pclk");
   261	=

   262		return ret;
   263	}
   264	=

   265	static int aiu_probe(struct platform_device *pdev)
   266	{
   267		struct device *dev =3D &pdev->dev;
   268		void __iomem *regs;
   269		struct regmap *map;
   270		struct aiu *aiu;
   271		int ret;
   272	=

   273		aiu =3D devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
   274		if (!aiu)
   275			return -ENOMEM;
   276		platform_set_drvdata(pdev, aiu);
   277	=

   278		ret =3D device_reset(dev);
   279		if (ret) {
   280			if (ret !=3D -EPROBE_DEFER)
   281				dev_err(dev, "Failed to reset device\n");
   282			return ret;
   283		}
   284	=

   285		regs =3D devm_platform_ioremap_resource(pdev, 0);
   286		if (IS_ERR(regs))
   287			return PTR_ERR(regs);
   288	=

   289		map =3D devm_regmap_init_mmio(dev, regs, &aiu_regmap_cfg);
   290		if (IS_ERR(map)) {
   291			dev_err(dev, "failed to init regmap: %ld\n",
   292				PTR_ERR(map));
   293			return PTR_ERR(map);
   294		}
   295	=

   296		aiu->i2s.irq =3D platform_get_irq_byname(pdev, "i2s");
 > 297		if (aiu->i2s.irq < 0) {
 > 298			dev_err(dev, "Can't get i2s irq\n");
   299			return aiu->i2s.irq;
   300		}
   301	=

   302		aiu->spdif.irq =3D platform_get_irq_byname(pdev, "spdif");
 > 303		if (aiu->spdif.irq < 0) {
   304			dev_err(dev, "Can't get spdif irq\n");
   305			return aiu->spdif.irq;
   306		}
   307	=

   308		ret =3D aiu_clk_get(dev);
   309		if (ret)
   310			return ret;
   311	=

   312		/* Register the cpu component of the aiu */
   313		ret =3D snd_soc_register_component(dev, &aiu_cpu_component,
   314						 aiu_cpu_dai_drv,
   315						 ARRAY_SIZE(aiu_cpu_dai_drv));
   316		if (ret)
   317			dev_err(dev, "Failed to register cpu component\n");
   318	=

   319		return ret;
   320	}
   321	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4835074071763369518==--

