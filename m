Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16207AD22
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680897426; x=1712433426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oayvfEL1ajweA8DnVy+sa6WPnUu9EJhTzEvMZIWcidc=;
  b=PEiV1HWWP7+hiQ3ZWTDifVNuNJP2hIwduxM4FORwRHiAhnX1e75EGSYp
   mpn1rmg2iibpVkaGrGHagFtnis2UJcaR04/nmoCXJAaKw4MqDId369In4
   ECJZUlAAJdWz9H8iaL5kcjF6NVRaRFqrcSN5f+iokBiayROjApVOZNGSF
   2c7gzjXZfJhiLY1yzIlNeTcvPr8XWnYTvSPiFipWr10eEeRn7jpj50dY4
   48rY+RsipN/emuvthIpSYbVzt+1sddeeTftQOmnw3Wz4IOtkYMoS0hQrm
   66gsPbBOFvsG5SSi3g9pFZ3k63y8IMiiv1I9M61hEciJNdzUalrHvSqVv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327146259"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="327146259"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 12:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="861870919"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="861870919"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Apr 2023 12:57:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pksCk-000Spy-2n;
	Fri, 07 Apr 2023 19:57:02 +0000
Date: Sat, 8 Apr 2023 03:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 19418/22025]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:37: warning: format
 '%lx' expects argument of type 'long unsigned int', but argument 6 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202304080355.dcOxND1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brandon,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: f32fe9062e71fc67e8247319c55ff53584757347 [19418/22025] media: platform: Updating config to build CnM Wave5 VPU
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230408/202304080355.dcOxND1H-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout f32fe9062e71fc67e8247319c55ff53584757347
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/chips-media/wave5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080355.dcOxND1H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:16,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:7:
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:37: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     228 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:129:29: note: in definition of macro '__dynamic_func_call'
     129 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:161:9: note: in expansion of macro '_dynamic_func_call'
     161 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:9: note: in expansion of macro 'dynamic_dev_dbg'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:30: note: in expansion of macro 'dev_fmt'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:17: note: in expansion of macro 'dev_dbg'
     228 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                 ^~~~~~~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:70: note: format string is defined here
     228 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long unsigned int
         |                                                                    %x


vim +228 drivers/media/platform/chips-media/wave5/wave5-vpu.c

775bc9870068a0 Nas Chung 2022-10-31  169  
775bc9870068a0 Nas Chung 2022-10-31  170  static int wave5_vpu_probe(struct platform_device *pdev)
775bc9870068a0 Nas Chung 2022-10-31  171  {
775bc9870068a0 Nas Chung 2022-10-31  172  	int ret;
775bc9870068a0 Nas Chung 2022-10-31  173  	struct vpu_device *dev;
775bc9870068a0 Nas Chung 2022-10-31  174  	struct device_node *np;
775bc9870068a0 Nas Chung 2022-10-31  175  	const struct wave5_match_data *match_data;
775bc9870068a0 Nas Chung 2022-10-31  176  	struct resource sram;
775bc9870068a0 Nas Chung 2022-10-31  177  
775bc9870068a0 Nas Chung 2022-10-31  178  	match_data = device_get_match_data(&pdev->dev);
775bc9870068a0 Nas Chung 2022-10-31  179  	if (!match_data) {
775bc9870068a0 Nas Chung 2022-10-31  180  		dev_err(&pdev->dev, "missing device match data\n");
775bc9870068a0 Nas Chung 2022-10-31  181  		return -EINVAL;
775bc9870068a0 Nas Chung 2022-10-31  182  	}
775bc9870068a0 Nas Chung 2022-10-31  183  
775bc9870068a0 Nas Chung 2022-10-31  184  	/* physical addresses limited to 32 bits */
775bc9870068a0 Nas Chung 2022-10-31  185  	dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
775bc9870068a0 Nas Chung 2022-10-31  186  	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
775bc9870068a0 Nas Chung 2022-10-31  187  
775bc9870068a0 Nas Chung 2022-10-31  188  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
775bc9870068a0 Nas Chung 2022-10-31  189  	if (!dev)
775bc9870068a0 Nas Chung 2022-10-31  190  		return -ENOMEM;
775bc9870068a0 Nas Chung 2022-10-31  191  
775bc9870068a0 Nas Chung 2022-10-31  192  	dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
775bc9870068a0 Nas Chung 2022-10-31  193  	if (IS_ERR(dev->vdb_register))
775bc9870068a0 Nas Chung 2022-10-31  194  		return PTR_ERR(dev->vdb_register);
775bc9870068a0 Nas Chung 2022-10-31  195  	ida_init(&dev->inst_ida);
775bc9870068a0 Nas Chung 2022-10-31  196  
775bc9870068a0 Nas Chung 2022-10-31  197  	mutex_init(&dev->dev_lock);
775bc9870068a0 Nas Chung 2022-10-31  198  	mutex_init(&dev->hw_lock);
775bc9870068a0 Nas Chung 2022-10-31  199  	dev_set_drvdata(&pdev->dev, dev);
775bc9870068a0 Nas Chung 2022-10-31  200  	dev->dev = &pdev->dev;
775bc9870068a0 Nas Chung 2022-10-31  201  
775bc9870068a0 Nas Chung 2022-10-31  202  	ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
775bc9870068a0 Nas Chung 2022-10-31  203  
775bc9870068a0 Nas Chung 2022-10-31  204  	/* continue without clock, assume externally managed */
775bc9870068a0 Nas Chung 2022-10-31  205  	if (ret < 0) {
775bc9870068a0 Nas Chung 2022-10-31  206  		dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  207  		ret = 0;
775bc9870068a0 Nas Chung 2022-10-31  208  	}
775bc9870068a0 Nas Chung 2022-10-31  209  	dev->num_clks = ret;
775bc9870068a0 Nas Chung 2022-10-31  210  
775bc9870068a0 Nas Chung 2022-10-31  211  	ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
775bc9870068a0 Nas Chung 2022-10-31  212  	if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  213  		dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  214  		return ret;
775bc9870068a0 Nas Chung 2022-10-31  215  	}
775bc9870068a0 Nas Chung 2022-10-31  216  
775bc9870068a0 Nas Chung 2022-10-31  217  	np = of_parse_phandle(pdev->dev.of_node, "sram", 0);
775bc9870068a0 Nas Chung 2022-10-31  218  	if (!np) {
775bc9870068a0 Nas Chung 2022-10-31  219  		dev_warn(&pdev->dev, "sram node not found\n");
775bc9870068a0 Nas Chung 2022-10-31  220  	} else {
775bc9870068a0 Nas Chung 2022-10-31  221  		ret = of_address_to_resource(np, 0, &sram);
775bc9870068a0 Nas Chung 2022-10-31  222  		if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  223  			dev_err(&pdev->dev, "sram resource not available\n");
775bc9870068a0 Nas Chung 2022-10-31  224  			goto err_put_node;
775bc9870068a0 Nas Chung 2022-10-31  225  		}
775bc9870068a0 Nas Chung 2022-10-31  226  		dev->sram_buf.daddr = sram.start;
775bc9870068a0 Nas Chung 2022-10-31  227  		dev->sram_buf.size = resource_size(&sram);
775bc9870068a0 Nas Chung 2022-10-31 @228  		dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
775bc9870068a0 Nas Chung 2022-10-31  229  			__func__, &dev->sram_buf.daddr, dev->sram_buf.size);
775bc9870068a0 Nas Chung 2022-10-31  230  	}
775bc9870068a0 Nas Chung 2022-10-31  231  
775bc9870068a0 Nas Chung 2022-10-31  232  	dev->product_code = wave5_vdi_readl(dev, VPU_PRODUCT_CODE_REGISTER);
775bc9870068a0 Nas Chung 2022-10-31  233  	ret = wave5_vdi_init(&pdev->dev);
775bc9870068a0 Nas Chung 2022-10-31  234  	if (ret < 0) {
775bc9870068a0 Nas Chung 2022-10-31  235  		dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  236  		goto err_clk_dis;
775bc9870068a0 Nas Chung 2022-10-31  237  	}
775bc9870068a0 Nas Chung 2022-10-31  238  	dev->product = wave5_vpu_get_product_id(dev);
775bc9870068a0 Nas Chung 2022-10-31  239  
775bc9870068a0 Nas Chung 2022-10-31  240  	INIT_LIST_HEAD(&dev->instances);
775bc9870068a0 Nas Chung 2022-10-31  241  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
775bc9870068a0 Nas Chung 2022-10-31  242  	if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  243  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  244  		goto err_vdi_release;
775bc9870068a0 Nas Chung 2022-10-31  245  	}
775bc9870068a0 Nas Chung 2022-10-31  246  
775bc9870068a0 Nas Chung 2022-10-31  247  	if (match_data->flags & WAVE5_IS_DEC) {
775bc9870068a0 Nas Chung 2022-10-31  248  		ret = wave5_vpu_dec_register_device(dev);
775bc9870068a0 Nas Chung 2022-10-31  249  		if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  250  			dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  251  			goto err_v4l2_unregister;
775bc9870068a0 Nas Chung 2022-10-31  252  		}
775bc9870068a0 Nas Chung 2022-10-31  253  	}
775bc9870068a0 Nas Chung 2022-10-31  254  	if (match_data->flags & WAVE5_IS_ENC) {
775bc9870068a0 Nas Chung 2022-10-31  255  		ret = wave5_vpu_enc_register_device(dev);
775bc9870068a0 Nas Chung 2022-10-31  256  		if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  257  			dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  258  			goto err_dec_unreg;
775bc9870068a0 Nas Chung 2022-10-31  259  		}
775bc9870068a0 Nas Chung 2022-10-31  260  	}
775bc9870068a0 Nas Chung 2022-10-31  261  
775bc9870068a0 Nas Chung 2022-10-31  262  	dev->irq = platform_get_irq(pdev, 0);
775bc9870068a0 Nas Chung 2022-10-31  263  	if (dev->irq < 0) {
775bc9870068a0 Nas Chung 2022-10-31  264  		dev_err(&pdev->dev, "failed to get irq resource\n");
775bc9870068a0 Nas Chung 2022-10-31  265  		ret = -ENXIO;
775bc9870068a0 Nas Chung 2022-10-31  266  		goto err_enc_unreg;
775bc9870068a0 Nas Chung 2022-10-31  267  	}
775bc9870068a0 Nas Chung 2022-10-31  268  
775bc9870068a0 Nas Chung 2022-10-31  269  	ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
775bc9870068a0 Nas Chung 2022-10-31  270  					wave5_vpu_irq_thread, 0, "vpu_irq", dev);
775bc9870068a0 Nas Chung 2022-10-31  271  	if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  272  		dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  273  		goto err_enc_unreg;
775bc9870068a0 Nas Chung 2022-10-31  274  	}
775bc9870068a0 Nas Chung 2022-10-31  275  
775bc9870068a0 Nas Chung 2022-10-31  276  	ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name);
775bc9870068a0 Nas Chung 2022-10-31  277  	if (ret) {
775bc9870068a0 Nas Chung 2022-10-31  278  		dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
775bc9870068a0 Nas Chung 2022-10-31  279  		goto err_enc_unreg;
775bc9870068a0 Nas Chung 2022-10-31  280  	}
775bc9870068a0 Nas Chung 2022-10-31  281  
775bc9870068a0 Nas Chung 2022-10-31  282  	dev_dbg(&pdev->dev, "Added wave5 driver with caps: %s %s and product code: 0x%x\n",
775bc9870068a0 Nas Chung 2022-10-31  283  		(match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
775bc9870068a0 Nas Chung 2022-10-31  284  		(match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "",
775bc9870068a0 Nas Chung 2022-10-31  285  		dev->product_code);
775bc9870068a0 Nas Chung 2022-10-31  286  	return 0;
775bc9870068a0 Nas Chung 2022-10-31  287  
775bc9870068a0 Nas Chung 2022-10-31  288  err_enc_unreg:
775bc9870068a0 Nas Chung 2022-10-31  289  	if (match_data->flags & WAVE5_IS_ENC)
775bc9870068a0 Nas Chung 2022-10-31  290  		wave5_vpu_enc_unregister_device(dev);
775bc9870068a0 Nas Chung 2022-10-31  291  err_dec_unreg:
775bc9870068a0 Nas Chung 2022-10-31  292  	if (match_data->flags & WAVE5_IS_DEC)
775bc9870068a0 Nas Chung 2022-10-31  293  		wave5_vpu_dec_unregister_device(dev);
775bc9870068a0 Nas Chung 2022-10-31  294  err_v4l2_unregister:
775bc9870068a0 Nas Chung 2022-10-31  295  	v4l2_device_unregister(&dev->v4l2_dev);
775bc9870068a0 Nas Chung 2022-10-31  296  err_vdi_release:
775bc9870068a0 Nas Chung 2022-10-31  297  	wave5_vdi_release(&pdev->dev);
775bc9870068a0 Nas Chung 2022-10-31  298  err_clk_dis:
775bc9870068a0 Nas Chung 2022-10-31  299  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
775bc9870068a0 Nas Chung 2022-10-31  300  err_put_node:
775bc9870068a0 Nas Chung 2022-10-31  301  	of_node_put(np);
775bc9870068a0 Nas Chung 2022-10-31  302  
775bc9870068a0 Nas Chung 2022-10-31  303  	return ret;
775bc9870068a0 Nas Chung 2022-10-31  304  }
775bc9870068a0 Nas Chung 2022-10-31  305  

:::::: The code at line 228 was first introduced by commit
:::::: 775bc9870068a017c3a987c584df3d7f102d1e7c media: chips-media: wave5: Add the v4l2 layer

:::::: TO: Nas Chung <nas.chung@chipsnmedia.com>
:::::: CC: Brandon Brnich <b-brnich@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
