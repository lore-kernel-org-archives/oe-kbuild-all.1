Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD962FB2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677499692; x=1709035692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3khNgb8fzDdtiaVnoTKD+pY59/NA4+OtDdktREaFwXs=;
  b=cahlhh2NrgphWdELtOh3h6Gwnp93c92D+7A/Q6EPuOgDRl/khtUOr9qe
   GK2m4hAoFoXz6Ze3SYUBJBwDDzbvjcJgFSLvVkz6Umkrmi/fF+rSy0zlK
   lUe7lx0sea0P/UZIBm+2xfIu0pWXyZDKetTmT36mjIg2aYdkGYMRf/FLm
   ngA0+mMBEEE7uEF52aOG1m2i+o8Bs9HcCjIXMT61LZ8Y0Fm46M65X37ml
   ABSWg0fjfMsONjnzK3Cl161ZToN2cyNFHJRMNGCaU4eWoSwGnzYBmkFP0
   1HJLeK5uFRu6pDMNWPxDNYlTHlK5pAIJ3Jdbp/V8R8HZx+jdfEpdJ6yrl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361399922"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="361399922"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 04:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="783341923"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="783341923"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2023 04:07:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWcI8-0004OB-0i;
	Mon, 27 Feb 2023 12:07:40 +0000
Date: Mon, 27 Feb 2023 20:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 163/583]
 sound/soc/codecs/tas5713.c:209:9: error: call to undeclared function
 'i2c_master_send'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202302272052.ruzPdA9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: c5abbb8f699bfb53c0cba64c782345a48814b1a7 [163/583] Add support for all the downstream rpi sound card drivers
config: hexagon-randconfig-r015-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272052.ruzPdA9k-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/c5abbb8f699bfb53c0cba64c782345a48814b1a7
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout c5abbb8f699bfb53c0cba64c782345a48814b1a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272052.ruzPdA9k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas5713.c:22:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from sound/soc/codecs/tas5713.c:22:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/codecs/tas5713.c:22:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   sound/soc/codecs/tas5713.c:165:23: warning: variable 'tas5713' set but not used [-Wunused-but-set-variable]
           struct tas5713_priv *tas5713;
                                ^
>> sound/soc/codecs/tas5713.c:209:9: error: call to undeclared function 'i2c_master_send'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = i2c_master_send(i2c,
                         ^
   sound/soc/codecs/tas5713.c:173:23: warning: variable 'tas5713' set but not used [-Wunused-but-set-variable]
           struct tas5713_priv *tas5713;
                                ^
>> sound/soc/codecs/tas5713.c:341:8: error: call to undeclared function 'i2c_add_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ret = i2c_add_driver(&tas5713_i2c_driver);
                 ^
>> sound/soc/codecs/tas5713.c:354:2: error: call to undeclared function 'i2c_del_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           i2c_del_driver(&tas5713_i2c_driver);
           ^
   8 warnings and 3 errors generated.


vim +/i2c_master_send +209 sound/soc/codecs/tas5713.c

   151	
   152	
   153	
   154	
   155	/*
   156	 *   ___         _          ___      _
   157	 *  / __|___  __| |___ __  |   \ _ _(_)_ _____ _ _
   158	 * | (__/ _ \/ _` / -_) _| | |) | '_| \ V / -_) '_|
   159	 *  \___\___/\__,_\___\__| |___/|_| |_|\_/\___|_|
   160	 *
   161	 */
   162	
   163	static void tas5713_remove(struct snd_soc_component *component)
   164	{
 > 165		struct tas5713_priv *tas5713;
   166	
   167		tas5713 = snd_soc_component_get_drvdata(component);
   168	}
   169	
   170	
   171	static int tas5713_probe(struct snd_soc_component *component)
   172	{
   173		struct tas5713_priv *tas5713;
   174		int i, ret;
   175	
   176		i2c = container_of(component->dev, struct i2c_client, dev);
   177	
   178		tas5713 = snd_soc_component_get_drvdata(component);
   179	
   180		// Reset error
   181		ret = snd_soc_component_write(component, TAS5713_ERROR_STATUS, 0x00);
   182		if (ret < 0) return ret;
   183	
   184		// Trim oscillator
   185		ret = snd_soc_component_write(component, TAS5713_OSC_TRIM, 0x00);
   186		if (ret < 0) return ret;
   187		msleep(1000);
   188	
   189		// Reset error
   190		ret = snd_soc_component_write(component, TAS5713_ERROR_STATUS, 0x00);
   191		if (ret < 0) return ret;
   192	
   193		// I2S 24bit
   194		ret = snd_soc_component_write(component, TAS5713_SERIAL_DATA_INTERFACE, 0x05);
   195		if (ret < 0) return ret;
   196	
   197		// Unmute
   198		ret = snd_soc_component_write(component, TAS5713_SYSTEM_CTRL2, 0x00);
   199		if (ret < 0) return ret;
   200		ret = snd_soc_component_write(component, TAS5713_SOFT_MUTE, 0x00);
   201		if (ret < 0) return ret;
   202	
   203		// Set volume to 0db
   204		ret = snd_soc_component_write(component, TAS5713_VOL_MASTER, 0x00);
   205		if (ret < 0) return ret;
   206	
   207		// Now start programming the default initialization sequence
   208		for (i = 0; i < ARRAY_SIZE(tas5713_init_sequence); ++i) {
 > 209			ret = i2c_master_send(i2c,
   210					     tas5713_init_sequence[i].data,
   211					     tas5713_init_sequence[i].size);
   212			if (ret < 0) {
   213				printk(KERN_INFO "TAS5713 CODEC PROBE: InitSeq returns: %d\n", ret);
   214			}
   215		}
   216	
   217		// Unmute
   218		ret = snd_soc_component_write(component, TAS5713_SYSTEM_CTRL2, 0x00);
   219		if (ret < 0) return ret;
   220	
   221		return 0;
   222	}
   223	
   224	
   225	static struct snd_soc_component_driver soc_codec_dev_tas5713 = {
   226		.probe = tas5713_probe,
   227		.remove = tas5713_remove,
   228		.controls = tas5713_snd_controls,
   229		.num_controls = ARRAY_SIZE(tas5713_snd_controls),
   230	};
   231	
   232	
   233	
   234	
   235	/*
   236	 *   ___ ___ ___   ___      _
   237	 *  |_ _|_  ) __| |   \ _ _(_)_ _____ _ _
   238	 *   | | / / (__  | |) | '_| \ V / -_) '_|
   239	 *  |___/___\___| |___/|_| |_|\_/\___|_|
   240	 *
   241	 */
   242	
   243	static const struct reg_default tas5713_reg_defaults[] = {
   244		{ 0x07 ,0x80 },     // R7  - VOL_MASTER    - -40dB
   245		{ 0x08 ,  30 },     // R8  - VOL_CH1	   -   0dB
   246		{ 0x09 ,  30 },     // R9  - VOL_CH2       -   0dB
   247		{ 0x0A ,0x80 },     // R10 - VOL_HEADPHONE - -40dB
   248	};
   249	
   250	
   251	static bool tas5713_reg_volatile(struct device *dev, unsigned int reg)
   252	{
   253		switch (reg) {
   254			case TAS5713_DEVICE_ID:
   255			case TAS5713_ERROR_STATUS:
   256			case TAS5713_CLOCK_CTRL:
   257				return true;
   258		default:
   259				return false;
   260		}
   261	}
   262	
   263	
   264	static const struct of_device_id tas5713_of_match[] = {
   265		{ .compatible = "ti,tas5713", },
   266		{ }
   267	};
   268	MODULE_DEVICE_TABLE(of, tas5713_of_match);
   269	
   270	
   271	static struct regmap_config tas5713_regmap_config = {
   272		.reg_bits = 8,
   273		.val_bits = 8,
   274	
   275		.max_register = TAS5713_MAX_REGISTER,
   276		.volatile_reg = tas5713_reg_volatile,
   277	
   278		.cache_type = REGCACHE_RBTREE,
   279		.reg_defaults = tas5713_reg_defaults,
   280		.num_reg_defaults = ARRAY_SIZE(tas5713_reg_defaults),
   281	};
   282	
   283	
   284	static int tas5713_i2c_probe(struct i2c_client *i2c,
   285				    const struct i2c_device_id *id)
   286	{
   287		int ret;
   288	
   289		priv_data = devm_kzalloc(&i2c->dev, sizeof *priv_data, GFP_KERNEL);
   290		if (!priv_data)
   291			return -ENOMEM;
   292	
   293		priv_data->regmap = devm_regmap_init_i2c(i2c, &tas5713_regmap_config);
   294		if (IS_ERR(priv_data->regmap)) {
   295			ret = PTR_ERR(priv_data->regmap);
   296			return ret;
   297		}
   298	
   299		i2c_set_clientdata(i2c, priv_data);
   300	
   301		ret = snd_soc_register_component(&i2c->dev,
   302					     &soc_codec_dev_tas5713, &tas5713_dai, 1);
   303	
   304		return ret;
   305	}
   306	
   307	
   308	static void tas5713_i2c_remove(struct i2c_client *i2c)
   309	{
   310		snd_soc_unregister_component(&i2c->dev);
   311		i2c_set_clientdata(i2c, NULL);
   312	
   313		kfree(priv_data);
   314	}
   315	
   316	
   317	static const struct i2c_device_id tas5713_i2c_id[] = {
   318		{ "tas5713", 0 },
   319		{ }
   320	};
   321	
   322	MODULE_DEVICE_TABLE(i2c, tas5713_i2c_id);
   323	
   324	
   325	static struct i2c_driver tas5713_i2c_driver = {
   326		.driver = {
   327			.name = "tas5713",
   328			.owner = THIS_MODULE,
   329			.of_match_table = tas5713_of_match,
   330		},
   331		.probe = tas5713_i2c_probe,
   332		.remove = tas5713_i2c_remove,
   333		.id_table = tas5713_i2c_id
   334	};
   335	
   336	
   337	static int __init tas5713_modinit(void)
   338	{
   339		int ret = 0;
   340	
 > 341		ret = i2c_add_driver(&tas5713_i2c_driver);
   342		if (ret) {
   343			printk(KERN_ERR "Failed to register tas5713 I2C driver: %d\n",
   344			       ret);
   345		}
   346	
   347		return ret;
   348	}
   349	module_init(tas5713_modinit);
   350	
   351	
   352	static void __exit tas5713_exit(void)
   353	{
 > 354		i2c_del_driver(&tas5713_i2c_driver);
   355	}
   356	module_exit(tas5713_exit);
   357	
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
