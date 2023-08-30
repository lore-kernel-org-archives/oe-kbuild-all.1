Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9A37482
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693423898; x=1724959898;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hrn4W0AjrJZpcN4yy6YOB2SjXkh4Hx94tl+8DBq74ks=;
  b=S1FtrjXS96CvYV75EMaHl46iPpDf1NystI0gTUim1SCogaj6IGQypyzX
   yax4lz+nprWchYsSLdz3MDJ7miyW335FmNrOq/C9xlnXvmNuORYBr9bM7
   TLWsWB6UeoQA4yIyO3frswAbiprUVQFMFXzzSqEjPlEqWgI6EReToyyX7
   zT4FhMTh12cW4inmdu3XFzelXaxhBGnkSo38L1oQXpfVgH4jC1QSYEmf2
   NaatHeB3uHp6JTzfTLcM7//LNsNeQ5YlX/aI8JDMXawpDH/fU+sDS5QRM
   eqyu0xqLBGVJZA994tUP3oC1NjlTMttzuR0RBB7c5KjvenIbV0evNpfin
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360723236"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="360723236"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853843714"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="853843714"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2023 12:31:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbQsB-000A9j-2v;
	Wed, 30 Aug 2023 19:30:41 +0000
Date: Thu, 31 Aug 2023 03:27:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 79/107]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:339:34: warning:
 'wave5_dt_ids' defined but not used
Message-ID: <202308310311.RLpdoI3P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: edd2c4feec914122a91c898836255213fa0acab7 [79/107] media: chips-media: wave5: Add the v4l2 layer
config: sh-randconfig-r005-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310311.RLpdoI3P-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310311.RLpdoI3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310311.RLpdoI3P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/linux/kernel.h:29,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:7:
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:227:37: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     227 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:227:17: note: in expansion of macro 'dev_dbg'
     227 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                 ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:227:70: note: format string is defined here
     227 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long unsigned int
         |                                                                    %x
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: At top level:
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:339:34: warning: 'wave5_dt_ids' defined but not used [-Wunused-const-variable=]
     339 | static const struct of_device_id wave5_dt_ids[] = {
         |                                  ^~~~~~~~~~~~


vim +/wave5_dt_ids +339 drivers/media/platform/chips-media/wave5/wave5-vpu.c

   168	
   169	static int wave5_vpu_probe(struct platform_device *pdev)
   170	{
   171		int ret;
   172		struct vpu_device *dev;
   173		struct device_node *np;
   174		const struct wave5_match_data *match_data;
   175		struct resource sram;
   176	
   177		match_data = device_get_match_data(&pdev->dev);
   178		if (!match_data) {
   179			dev_err(&pdev->dev, "missing device match data\n");
   180			return -EINVAL;
   181		}
   182	
   183		/* physical addresses limited to 32 bits */
   184		dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
   185		dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
   186	
   187		dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
   188		if (!dev)
   189			return -ENOMEM;
   190	
   191		dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
   192		if (IS_ERR(dev->vdb_register))
   193			return PTR_ERR(dev->vdb_register);
   194		ida_init(&dev->inst_ida);
   195	
   196		mutex_init(&dev->dev_lock);
   197		mutex_init(&dev->hw_lock);
   198		dev_set_drvdata(&pdev->dev, dev);
   199		dev->dev = &pdev->dev;
   200	
   201		ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
   202	
   203		/* continue without clock, assume externally managed */
   204		if (ret < 0) {
   205			dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
   206			ret = 0;
   207		}
   208		dev->num_clks = ret;
   209	
   210		ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
   211		if (ret) {
   212			dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
   213			return ret;
   214		}
   215	
   216		np = of_parse_phandle(pdev->dev.of_node, "sram", 0);
   217		if (!np) {
   218			dev_warn(&pdev->dev, "sram node not found\n");
   219		} else {
   220			ret = of_address_to_resource(np, 0, &sram);
   221			if (ret) {
   222				dev_err(&pdev->dev, "sram resource not available\n");
   223				goto err_put_node;
   224			}
   225			dev->sram_buf.daddr = sram.start;
   226			dev->sram_buf.size = resource_size(&sram);
 > 227			dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
   228				__func__, &dev->sram_buf.daddr, dev->sram_buf.size);
   229		}
   230	
   231		dev->product_code = wave5_vdi_readl(dev, VPU_PRODUCT_CODE_REGISTER);
   232		ret = wave5_vdi_init(&pdev->dev);
   233		if (ret < 0) {
   234			dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
   235			goto err_clk_dis;
   236		}
   237		dev->product = wave5_vpu_get_product_id(dev);
   238	
   239		INIT_LIST_HEAD(&dev->instances);
   240		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
   241		if (ret) {
   242			dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
   243			goto err_vdi_release;
   244		}
   245	
   246		if (match_data->flags & WAVE5_IS_DEC) {
   247			ret = wave5_vpu_dec_register_device(dev);
   248			if (ret) {
   249				dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
   250				goto err_v4l2_unregister;
   251			}
   252		}
   253		if (match_data->flags & WAVE5_IS_ENC) {
   254			ret = wave5_vpu_enc_register_device(dev);
   255			if (ret) {
   256				dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
   257				goto err_dec_unreg;
   258			}
   259		}
   260	
   261		dev->irq = platform_get_irq(pdev, 0);
   262		if (dev->irq < 0) {
   263			dev_err(&pdev->dev, "failed to get irq resource\n");
   264			ret = -ENXIO;
   265			goto err_enc_unreg;
   266		}
   267	
   268		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
   269						wave5_vpu_irq_thread, 0, "vpu_irq", dev);
   270		if (ret) {
   271			dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
   272			goto err_enc_unreg;
   273		}
   274	
   275		ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name);
   276		if (ret) {
   277			dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
   278			goto err_enc_unreg;
   279		}
   280	
   281		dev_dbg(&pdev->dev, "Added wave5 driver with caps: %s %s and product code: 0x%x\n",
   282			(match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
   283			(match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "",
   284			dev->product_code);
   285		return 0;
   286	
   287	err_enc_unreg:
   288		if (match_data->flags & WAVE5_IS_ENC)
   289			wave5_vpu_enc_unregister_device(dev);
   290	err_dec_unreg:
   291		if (match_data->flags & WAVE5_IS_DEC)
   292			wave5_vpu_dec_unregister_device(dev);
   293	err_v4l2_unregister:
   294		v4l2_device_unregister(&dev->v4l2_dev);
   295	err_vdi_release:
   296		wave5_vdi_release(&pdev->dev);
   297	err_clk_dis:
   298		clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
   299	err_put_node:
   300		of_node_put(np);
   301	
   302		return ret;
   303	}
   304	
   305	static int wave5_vpu_remove(struct platform_device *pdev)
   306	{
   307		struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
   308	
   309		clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
   310		wave5_vpu_enc_unregister_device(dev);
   311		wave5_vpu_dec_unregister_device(dev);
   312		v4l2_device_unregister(&dev->v4l2_dev);
   313		wave5_vdi_release(&pdev->dev);
   314		ida_destroy(&dev->inst_ida);
   315	
   316		return 0;
   317	}
   318	
   319	static const struct wave5_match_data wave511_data = {
   320		.flags = WAVE5_IS_DEC,
   321		.fw_name = "wave511_dec_fw.bin",
   322	};
   323	
   324	static const struct wave5_match_data wave521_data = {
   325		.flags = WAVE5_IS_ENC,
   326		.fw_name = "wave521_enc_fw.bin",
   327	};
   328	
   329	static const struct wave5_match_data wave521c_data = {
   330		.flags = WAVE5_IS_ENC | WAVE5_IS_DEC,
   331		.fw_name = "wave521c_codec_fw.bin",
   332	};
   333	
   334	static const struct wave5_match_data default_match_data = {
   335		.flags = WAVE5_IS_ENC | WAVE5_IS_DEC,
   336		.fw_name = "chagall.bin",
   337	};
   338	
 > 339	static const struct of_device_id wave5_dt_ids[] = {
   340		{ .compatible = "cnm,cm511-vpu", .data = &wave511_data },
   341		{ .compatible = "cnm,cm517-vpu", .data = &default_match_data },
   342		{ .compatible = "cnm,cm521-vpu", .data = &wave521_data },
   343		{ .compatible = "cnm,cm521c-vpu", .data = &wave521c_data },
   344		{ .compatible = "cnm,cm521c-dual-vpu", .data = &wave521c_data },
   345		{ .compatible = "cnm,cm521e1-vpu", .data = &default_match_data },
   346		{ .compatible = "cnm,cm537-vpu", .data = &default_match_data },
   347		{ /* sentinel */ }
   348	};
   349	MODULE_DEVICE_TABLE(of, wave5_dt_ids);
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
