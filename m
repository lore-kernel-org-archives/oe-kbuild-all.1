Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302C20E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689316482; x=1720852482;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yTVAo5ZaoHDHASt/Huo3rPwltwbWzM38KgboRhCaRqA=;
  b=ZN8UPTQFigQeProInBIOEeuP5oTOowEU1CKI3mWJqe+cY7icmRH82YuP
   3bCe9akIEUCPy3BAgiZMPWU66zSHUGu9E3Kxd1pT7C+QvWT2aaUaO0msJ
   jwg+iCjNMJTDpcr33Y/GNxSiJ6/4dxr5XaJnbXUzj35lfdpQs7jHosUC+
   X3Y6iN6SqBGfGh91hSD86XvbDbBRr1ax7JVhwBDmYsvfGOGn7cJoX/fGV
   J9khHH+ncX4Aleb2W8ibFutURLPkpiIf7frZ9VlpLcekyLH5+B72HSBFa
   RjJYfTNnYLtp2RZ1oRngjPkJOdffBMu2IizwqAga6R4lzc04Uvj8NtGw4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429168179"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="429168179"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 23:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722282126"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="722282126"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 23:33:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKCMl-0007EX-1P;
	Fri, 14 Jul 2023 06:33:23 +0000
Date: Fri, 14 Jul 2023 14:32:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>,
	Brandon Brnich <b-brnich@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/26]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:49: warning: right
 shift count >= width of type
Message-ID: <202307141412.NckAs4or-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   886714a557fc02fabdd121117fae14878cb9d3f3
commit: 30bcc25e7cb1b25667db88d61828728f0f0b5f4b [1/26] wave5: Support 48bit memory address.
config: csky-randconfig-r032-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141412.NckAs4or-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141412.NckAs4or-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141412.NckAs4or-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:9:
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:37: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     274 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:17: note: in expansion of macro 'dev_dbg'
     274 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                 ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:274:70: note: format string is defined here
     274 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long unsigned int
         |                                                                    %x
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     284 |         dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
         |                                                 ^~
--
   drivers/media/platform/chips-media/wave5/wave5-hw.c: In function 'wave5_read_reg_for_mem_addr':
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     122 |         addr = ((high_addr << 32) | val);
         |                            ^~


vim +284 drivers/media/platform/chips-media/wave5/wave5-vpu.c

   215	
   216	static int wave5_vpu_probe(struct platform_device *pdev)
   217	{
   218		int ret;
   219		struct vpu_device *dev;
   220		struct device_node *np;
   221		const struct wave5_match_data *match_data;
   222		struct resource sram;
   223	
   224		match_data = device_get_match_data(&pdev->dev);
   225		if (!match_data) {
   226			dev_err(&pdev->dev, "missing device match data\n");
   227			return -EINVAL;
   228		}
   229	
   230		/* physical addresses limited to 48  bits */
   231		dma_set_mask(&pdev->dev, DMA_BIT_MASK(48));
   232		dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(48));
   233	
   234		dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
   235		if (!dev)
   236			return -ENOMEM;
   237	
   238		dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
   239		if (IS_ERR(dev->vdb_register))
   240			return PTR_ERR(dev->vdb_register);
   241		ida_init(&dev->inst_ida);
   242	
   243		mutex_init(&dev->dev_lock);
   244		mutex_init(&dev->hw_lock);
   245		dev_set_drvdata(&pdev->dev, dev);
   246		dev->dev = &pdev->dev;
   247	
   248		ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
   249	
   250		/* continue without clock, assume externally managed */
   251		if (ret < 0) {
   252			dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
   253			ret = 0;
   254		}
   255		dev->num_clks = ret;
   256	
   257		ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
   258		if (ret) {
   259			dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
   260			return ret;
   261		}
   262	
   263		np = of_parse_phandle(pdev->dev.of_node, "sram", 0);
   264		if (!np) {
   265			dev_warn(&pdev->dev, "sram node not found\n");
   266		} else {
   267			ret = of_address_to_resource(np, 0, &sram);
   268			if (ret) {
   269				dev_err(&pdev->dev, "sram resource not available\n");
   270				goto err_put_node;
   271			}
   272			dev->sram_buf.daddr = sram.start;
   273			dev->sram_buf.size = resource_size(&sram);
   274			dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
   275				__func__, &dev->sram_buf.daddr, dev->sram_buf.size);
   276		}
   277	
   278		dev->product_code = wave5_vdi_readl(dev, VPU_PRODUCT_CODE_REGISTER);
   279		ret = wave5_vdi_init(&pdev->dev);
   280		if (ret < 0) {
   281			dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
   282			goto err_clk_dis;
   283		}
 > 284		dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
   285		dev->product = wave5_vpu_get_product_id(dev);
   286	
   287		dev->irq = platform_get_irq(pdev, 0);
   288		if (dev->irq < 0) {
   289			dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
   290			hrtimer_init(&dev->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
   291			dev->hrtimer.function = &wave5_vpu_timer_callback;
   292			dev->worker = kthread_create_worker(0, "vpu_irq_thread");
   293			if (IS_ERR(dev->worker)) {
   294				dev_err(&pdev->dev, "failed to create vpu irq worker\n");
   295				ret = PTR_ERR(dev->worker);
   296				goto err_vdi_release;
   297			}
   298			dev->vpu_poll_interval = vpu_poll_interval;
   299			kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
   300		} else {
   301			ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
   302							wave5_vpu_irq_thread, 0, "vpu_irq", dev);
   303			if (ret) {
   304				dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
   305				goto err_vdi_release;
   306			}
   307		}
   308	
   309		INIT_LIST_HEAD(&dev->instances);
   310		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
   311		if (ret) {
   312			dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
   313			goto err_vdi_release;
   314		}
   315	
   316		if (match_data->flags & WAVE5_IS_DEC) {
   317			ret = wave5_vpu_dec_register_device(dev);
   318			if (ret) {
   319				dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
   320				goto err_v4l2_unregister;
   321			}
   322		}
   323		if (match_data->flags & WAVE5_IS_ENC) {
   324			ret = wave5_vpu_enc_register_device(dev);
   325			if (ret) {
   326				dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
   327				goto err_dec_unreg;
   328			}
   329		}
   330	
   331	
   332		ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name);
   333		if (ret) {
   334			dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
   335			goto err_enc_unreg;
   336		}
   337	
   338		dev_dbg(&pdev->dev, "Added wave5 driver with caps: %s %s and product code: 0x%x\n",
   339			(match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
   340			(match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "",
   341			dev->product_code);
   342		return 0;
   343	
   344	err_enc_unreg:
   345		if (match_data->flags & WAVE5_IS_ENC)
   346			wave5_vpu_enc_unregister_device(dev);
   347	err_dec_unreg:
   348		if (match_data->flags & WAVE5_IS_DEC)
   349			wave5_vpu_dec_unregister_device(dev);
   350	err_v4l2_unregister:
   351		v4l2_device_unregister(&dev->v4l2_dev);
   352	err_vdi_release:
   353		wave5_vdi_release(&pdev->dev);
   354	err_clk_dis:
   355		clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
   356	err_put_node:
   357		of_node_put(np);
   358	
   359		return ret;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
