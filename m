Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B047F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 04:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676003244; x=1707539244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wxz0s+vgLZzTI5InokUSdNaPsLa2/5T1ruudttxV1+8=;
  b=IjwZbj4p80cap/06k9L32BtU8TyEL9BgLrVV4V0H8X6MHgzxAjg1CpLr
   DolLrQqBNnZF5dDcyjm2Tl9PcksmkWAd/RiNiWXB17ZDoSu4ndT3sDbbF
   jNE0F59Sns3J/3g++dw2BjItdZtVuqC0Hqy1XM5pUuztyPG1pI4s72x6X
   ePNmj1PQVwSUzsJk+h1lMORbhbQPcyvBYp4dvD3pFkf/obxQGk/SncaRz
   X4NnIu6Jd411i7fdu8/oYnC/mznL6xV5OK+ZjDw4C9DRyiFngNe6hxr+8
   YWvmoiCT/Xer1rfRR2nzQQlWxXJQK/rNwxDjYozy1rsZGnCgbGgj/TOXY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318350074"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="318350074"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 20:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="700332228"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="700332228"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2023 20:27:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQL0K-0005YE-0z;
	Fri, 10 Feb 2023 04:27:20 +0000
Date: Fri, 10 Feb 2023 12:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 20049/21442]
 drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:37: warning: format
 '%lx' expects argument of type 'long unsigned int', but argument 6 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202302101249.Sfi4nEXh-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: f32fe9062e71fc67e8247319c55ff53584757347 [20049/21442] media: platform: Updating config to build CnM Wave5 VPU
config: microblaze-randconfig-r011-20230210 (https://download.01.org/0day-ci/archive/20230210/202302101249.Sfi4nEXh-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout f32fe9062e71fc67e8247319c55ff53584757347
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/media/platform/chips-media/wave5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101249.Sfi4nEXh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/chips-media/wave5/wave5-vpu.c:9:
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:228:37: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     228 |                 dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
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

775bc9870068a01 Nas Chung 2022-10-31  169  
775bc9870068a01 Nas Chung 2022-10-31  170  static int wave5_vpu_probe(struct platform_device *pdev)
775bc9870068a01 Nas Chung 2022-10-31  171  {
775bc9870068a01 Nas Chung 2022-10-31  172  	int ret;
775bc9870068a01 Nas Chung 2022-10-31  173  	struct vpu_device *dev;
775bc9870068a01 Nas Chung 2022-10-31  174  	struct device_node *np;
775bc9870068a01 Nas Chung 2022-10-31  175  	const struct wave5_match_data *match_data;
775bc9870068a01 Nas Chung 2022-10-31  176  	struct resource sram;
775bc9870068a01 Nas Chung 2022-10-31  177  
775bc9870068a01 Nas Chung 2022-10-31  178  	match_data = device_get_match_data(&pdev->dev);
775bc9870068a01 Nas Chung 2022-10-31  179  	if (!match_data) {
775bc9870068a01 Nas Chung 2022-10-31  180  		dev_err(&pdev->dev, "missing device match data\n");
775bc9870068a01 Nas Chung 2022-10-31  181  		return -EINVAL;
775bc9870068a01 Nas Chung 2022-10-31  182  	}
775bc9870068a01 Nas Chung 2022-10-31  183  
775bc9870068a01 Nas Chung 2022-10-31  184  	/* physical addresses limited to 32 bits */
775bc9870068a01 Nas Chung 2022-10-31  185  	dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
775bc9870068a01 Nas Chung 2022-10-31  186  	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
775bc9870068a01 Nas Chung 2022-10-31  187  
775bc9870068a01 Nas Chung 2022-10-31  188  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
775bc9870068a01 Nas Chung 2022-10-31  189  	if (!dev)
775bc9870068a01 Nas Chung 2022-10-31  190  		return -ENOMEM;
775bc9870068a01 Nas Chung 2022-10-31  191  
775bc9870068a01 Nas Chung 2022-10-31  192  	dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
775bc9870068a01 Nas Chung 2022-10-31  193  	if (IS_ERR(dev->vdb_register))
775bc9870068a01 Nas Chung 2022-10-31  194  		return PTR_ERR(dev->vdb_register);
775bc9870068a01 Nas Chung 2022-10-31  195  	ida_init(&dev->inst_ida);
775bc9870068a01 Nas Chung 2022-10-31  196  
775bc9870068a01 Nas Chung 2022-10-31  197  	mutex_init(&dev->dev_lock);
775bc9870068a01 Nas Chung 2022-10-31  198  	mutex_init(&dev->hw_lock);
775bc9870068a01 Nas Chung 2022-10-31  199  	dev_set_drvdata(&pdev->dev, dev);
775bc9870068a01 Nas Chung 2022-10-31  200  	dev->dev = &pdev->dev;
775bc9870068a01 Nas Chung 2022-10-31  201  
775bc9870068a01 Nas Chung 2022-10-31  202  	ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
775bc9870068a01 Nas Chung 2022-10-31  203  
775bc9870068a01 Nas Chung 2022-10-31  204  	/* continue without clock, assume externally managed */
775bc9870068a01 Nas Chung 2022-10-31  205  	if (ret < 0) {
775bc9870068a01 Nas Chung 2022-10-31  206  		dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  207  		ret = 0;
775bc9870068a01 Nas Chung 2022-10-31  208  	}
775bc9870068a01 Nas Chung 2022-10-31  209  	dev->num_clks = ret;
775bc9870068a01 Nas Chung 2022-10-31  210  
775bc9870068a01 Nas Chung 2022-10-31  211  	ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
775bc9870068a01 Nas Chung 2022-10-31  212  	if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  213  		dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  214  		return ret;
775bc9870068a01 Nas Chung 2022-10-31  215  	}
775bc9870068a01 Nas Chung 2022-10-31  216  
775bc9870068a01 Nas Chung 2022-10-31  217  	np = of_parse_phandle(pdev->dev.of_node, "sram", 0);
775bc9870068a01 Nas Chung 2022-10-31  218  	if (!np) {
775bc9870068a01 Nas Chung 2022-10-31  219  		dev_warn(&pdev->dev, "sram node not found\n");
775bc9870068a01 Nas Chung 2022-10-31  220  	} else {
775bc9870068a01 Nas Chung 2022-10-31  221  		ret = of_address_to_resource(np, 0, &sram);
775bc9870068a01 Nas Chung 2022-10-31  222  		if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  223  			dev_err(&pdev->dev, "sram resource not available\n");
775bc9870068a01 Nas Chung 2022-10-31  224  			goto err_put_node;
775bc9870068a01 Nas Chung 2022-10-31  225  		}
775bc9870068a01 Nas Chung 2022-10-31  226  		dev->sram_buf.daddr = sram.start;
775bc9870068a01 Nas Chung 2022-10-31  227  		dev->sram_buf.size = resource_size(&sram);
775bc9870068a01 Nas Chung 2022-10-31 @228  		dev_dbg(&pdev->dev, "%s: sram daddr: %pad, size: 0x%lx\n",
775bc9870068a01 Nas Chung 2022-10-31  229  			__func__, &dev->sram_buf.daddr, dev->sram_buf.size);
775bc9870068a01 Nas Chung 2022-10-31  230  	}
775bc9870068a01 Nas Chung 2022-10-31  231  
775bc9870068a01 Nas Chung 2022-10-31  232  	dev->product_code = wave5_vdi_readl(dev, VPU_PRODUCT_CODE_REGISTER);
775bc9870068a01 Nas Chung 2022-10-31  233  	ret = wave5_vdi_init(&pdev->dev);
775bc9870068a01 Nas Chung 2022-10-31  234  	if (ret < 0) {
775bc9870068a01 Nas Chung 2022-10-31  235  		dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  236  		goto err_clk_dis;
775bc9870068a01 Nas Chung 2022-10-31  237  	}
775bc9870068a01 Nas Chung 2022-10-31  238  	dev->product = wave5_vpu_get_product_id(dev);
775bc9870068a01 Nas Chung 2022-10-31  239  
775bc9870068a01 Nas Chung 2022-10-31  240  	INIT_LIST_HEAD(&dev->instances);
775bc9870068a01 Nas Chung 2022-10-31  241  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
775bc9870068a01 Nas Chung 2022-10-31  242  	if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  243  		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  244  		goto err_vdi_release;
775bc9870068a01 Nas Chung 2022-10-31  245  	}
775bc9870068a01 Nas Chung 2022-10-31  246  
775bc9870068a01 Nas Chung 2022-10-31  247  	if (match_data->flags & WAVE5_IS_DEC) {
775bc9870068a01 Nas Chung 2022-10-31  248  		ret = wave5_vpu_dec_register_device(dev);
775bc9870068a01 Nas Chung 2022-10-31  249  		if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  250  			dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  251  			goto err_v4l2_unregister;
775bc9870068a01 Nas Chung 2022-10-31  252  		}
775bc9870068a01 Nas Chung 2022-10-31  253  	}
775bc9870068a01 Nas Chung 2022-10-31  254  	if (match_data->flags & WAVE5_IS_ENC) {
775bc9870068a01 Nas Chung 2022-10-31  255  		ret = wave5_vpu_enc_register_device(dev);
775bc9870068a01 Nas Chung 2022-10-31  256  		if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  257  			dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  258  			goto err_dec_unreg;
775bc9870068a01 Nas Chung 2022-10-31  259  		}
775bc9870068a01 Nas Chung 2022-10-31  260  	}
775bc9870068a01 Nas Chung 2022-10-31  261  
775bc9870068a01 Nas Chung 2022-10-31  262  	dev->irq = platform_get_irq(pdev, 0);
775bc9870068a01 Nas Chung 2022-10-31  263  	if (dev->irq < 0) {
775bc9870068a01 Nas Chung 2022-10-31  264  		dev_err(&pdev->dev, "failed to get irq resource\n");
775bc9870068a01 Nas Chung 2022-10-31  265  		ret = -ENXIO;
775bc9870068a01 Nas Chung 2022-10-31  266  		goto err_enc_unreg;
775bc9870068a01 Nas Chung 2022-10-31  267  	}
775bc9870068a01 Nas Chung 2022-10-31  268  
775bc9870068a01 Nas Chung 2022-10-31  269  	ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
775bc9870068a01 Nas Chung 2022-10-31  270  					wave5_vpu_irq_thread, 0, "vpu_irq", dev);
775bc9870068a01 Nas Chung 2022-10-31  271  	if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  272  		dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  273  		goto err_enc_unreg;
775bc9870068a01 Nas Chung 2022-10-31  274  	}
775bc9870068a01 Nas Chung 2022-10-31  275  
775bc9870068a01 Nas Chung 2022-10-31  276  	ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name);
775bc9870068a01 Nas Chung 2022-10-31  277  	if (ret) {
775bc9870068a01 Nas Chung 2022-10-31  278  		dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
775bc9870068a01 Nas Chung 2022-10-31  279  		goto err_enc_unreg;
775bc9870068a01 Nas Chung 2022-10-31  280  	}
775bc9870068a01 Nas Chung 2022-10-31  281  
775bc9870068a01 Nas Chung 2022-10-31  282  	dev_dbg(&pdev->dev, "Added wave5 driver with caps: %s %s and product code: 0x%x\n",
775bc9870068a01 Nas Chung 2022-10-31  283  		(match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
775bc9870068a01 Nas Chung 2022-10-31  284  		(match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "",
775bc9870068a01 Nas Chung 2022-10-31  285  		dev->product_code);
775bc9870068a01 Nas Chung 2022-10-31  286  	return 0;
775bc9870068a01 Nas Chung 2022-10-31  287  
775bc9870068a01 Nas Chung 2022-10-31  288  err_enc_unreg:
775bc9870068a01 Nas Chung 2022-10-31  289  	if (match_data->flags & WAVE5_IS_ENC)
775bc9870068a01 Nas Chung 2022-10-31  290  		wave5_vpu_enc_unregister_device(dev);
775bc9870068a01 Nas Chung 2022-10-31  291  err_dec_unreg:
775bc9870068a01 Nas Chung 2022-10-31  292  	if (match_data->flags & WAVE5_IS_DEC)
775bc9870068a01 Nas Chung 2022-10-31  293  		wave5_vpu_dec_unregister_device(dev);
775bc9870068a01 Nas Chung 2022-10-31  294  err_v4l2_unregister:
775bc9870068a01 Nas Chung 2022-10-31  295  	v4l2_device_unregister(&dev->v4l2_dev);
775bc9870068a01 Nas Chung 2022-10-31  296  err_vdi_release:
775bc9870068a01 Nas Chung 2022-10-31  297  	wave5_vdi_release(&pdev->dev);
775bc9870068a01 Nas Chung 2022-10-31  298  err_clk_dis:
775bc9870068a01 Nas Chung 2022-10-31  299  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
775bc9870068a01 Nas Chung 2022-10-31  300  err_put_node:
775bc9870068a01 Nas Chung 2022-10-31  301  	of_node_put(np);
775bc9870068a01 Nas Chung 2022-10-31  302  
775bc9870068a01 Nas Chung 2022-10-31  303  	return ret;
775bc9870068a01 Nas Chung 2022-10-31  304  }
775bc9870068a01 Nas Chung 2022-10-31  305  

:::::: The code at line 228 was first introduced by commit
:::::: 775bc9870068a017c3a987c584df3d7f102d1e7c media: chips-media: wave5: Add the v4l2 layer

:::::: TO: Nas Chung <nas.chung@chipsnmedia.com>
:::::: CC: Brandon Brnich <b-brnich@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
