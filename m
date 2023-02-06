Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB0256C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675673454; x=1707209454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pftfVBREzrJpWvSEPwT+auqKHio6yt+tlmu68tBL2A0=;
  b=fQa4ecaFqHxxDscxfX/5D5+7z7RtQVOf4LfK8gTK1RrtI3z6sleTS4Sq
   dbwJtCo0nkWDTsWVwLdPpeXM5g/teSK+QMpczxX6fOJRXSsmDKuayEKnA
   bfQ6C/Auz7AJOvZ31GHTmgI1nBbD6rzyttMLkHZglj7HZj2OZo6IjdHOv
   DmCL5scbGt1PT9EskZC3/54sJaTIw17WYqHbbVD124U27S6KdpSBFFlMk
   /KcAtrwnagzqAIE+3XVPVbUqPkSj2C5hr4GljM7pq33qiKyVyv7Ow7P45
   2Nu2tIKyFeJ0UHTpZemnqql+u4NA5lbSH5yykgEkJwbllFleHt1ujh1T8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393757836"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393757836"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 00:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="735049199"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="735049199"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 00:50:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOxD9-0002Sa-2w;
	Mon, 06 Feb 2023 08:50:51 +0000
Date: Mon, 6 Feb 2023 16:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6175/20208]
 drivers/mxc/mipi/mxc_mipi_csi2.c:358: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202302061642.rlTb0NWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/20208] Merge branch 'mxc/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302061642.rlTb0NWZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b83a99edcb3eb46360f4b4470a51e0f0749bd73e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout b83a99edcb3eb46360f4b4470a51e0f0749bd73e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/ drivers/media/platform/mxc/capture/ drivers/mxc/ipu3/ drivers/mxc/mipi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mxc/ipu3/ipu_device.c:1485:5: warning: no previous prototype for 'create_split_child_task' [-Wmissing-prototypes]
    1485 | int create_split_child_task(struct ipu_split_task *sp_task)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/ipu3/ipu_device.c: In function 'init_tiled_buf':
>> drivers/mxc/ipu3/ipu_device.c:1816:25: warning: variable 'obuf_size' set but not used [-Wunused-but-set-variable]
    1816 |         u32 ipu_stride, obuf_size;
         |                         ^~~~~~~~~
   drivers/mxc/ipu3/ipu_device.c: In function 'vdi_split_process':
>> drivers/mxc/ipu3/ipu_device.c:2418:13: warning: variable 'task_no' set but not used [-Wunused-but-set-variable]
    2418 |         u32 task_no;
         |             ^~~~~~~
--
>> drivers/mxc/mipi/mxc_mipi_csi2.c:30:6: warning: no previous prototype for '_mipi_csi2_lock' [-Wmissing-prototypes]
      30 | void _mipi_csi2_lock(struct mipi_csi2_info *info)
         |      ^~~~~~~~~~~~~~~
>> drivers/mxc/mipi/mxc_mipi_csi2.c:36:6: warning: no previous prototype for '_mipi_csi2_unlock' [-Wmissing-prototypes]
      36 | void _mipi_csi2_unlock(struct mipi_csi2_info *info)
         |      ^~~~~~~~~~~~~~~~~
   drivers/mxc/mipi/mxc_mipi_csi2.c: In function 'mipi_csi2_enable':
>> drivers/mxc/mipi/mxc_mipi_csi2.c:71:57: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
      71 |                 mipi_dbg("mipi csi2 already enabled!\n");
         |                                                         ^
   drivers/mxc/mipi/mxc_mipi_csi2.c: In function 'mipi_csi2_disable':
   drivers/mxc/mipi/mxc_mipi_csi2.c:98:58: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
      98 |                 mipi_dbg("mipi csi2 already disabled!\n");
         |                                                          ^
--
>> drivers/mxc/mipi/mxc_mipi_csi2.c:358: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This function is called by the driver framework to initialize the MIPI CSI2


vim +358 drivers/mxc/mipi/mxc_mipi_csi2.c

975602c318a1f0 Robby Cai 2019-09-27  356  
975602c318a1f0 Robby Cai 2019-09-27  357  /**
975602c318a1f0 Robby Cai 2019-09-27 @358   * This function is called by the driver framework to initialize the MIPI CSI2
975602c318a1f0 Robby Cai 2019-09-27  359   * device.
975602c318a1f0 Robby Cai 2019-09-27  360   *
975602c318a1f0 Robby Cai 2019-09-27  361   * @param	pdev	The device structure for the MIPI CSI2 passed in by the
975602c318a1f0 Robby Cai 2019-09-27  362   *			driver framework.
975602c318a1f0 Robby Cai 2019-09-27  363   *
975602c318a1f0 Robby Cai 2019-09-27  364   * @return      Returns 0 on success or negative error code on error
975602c318a1f0 Robby Cai 2019-09-27  365   */
975602c318a1f0 Robby Cai 2019-09-27  366  static int mipi_csi2_probe(struct platform_device *pdev)
975602c318a1f0 Robby Cai 2019-09-27  367  {
975602c318a1f0 Robby Cai 2019-09-27  368  	struct device *dev = &pdev->dev;
975602c318a1f0 Robby Cai 2019-09-27  369  	struct device_node *np = pdev->dev.of_node;
975602c318a1f0 Robby Cai 2019-09-27  370  	struct resource *res;
975602c318a1f0 Robby Cai 2019-09-27  371  	u32 mipi_csi2_dphy_ver;
975602c318a1f0 Robby Cai 2019-09-27  372  	int ret;
975602c318a1f0 Robby Cai 2019-09-27  373  
975602c318a1f0 Robby Cai 2019-09-27  374  	gmipi_csi2 = kmalloc(sizeof(struct mipi_csi2_info), GFP_KERNEL);
975602c318a1f0 Robby Cai 2019-09-27  375  	if (!gmipi_csi2) {
975602c318a1f0 Robby Cai 2019-09-27  376  		ret = -ENOMEM;
975602c318a1f0 Robby Cai 2019-09-27  377  		goto alloc_failed;
975602c318a1f0 Robby Cai 2019-09-27  378  	}
975602c318a1f0 Robby Cai 2019-09-27  379  
975602c318a1f0 Robby Cai 2019-09-27  380  	ret = of_property_read_u32(np, "ipu_id", &(gmipi_csi2->ipu_id));
975602c318a1f0 Robby Cai 2019-09-27  381  	if (ret) {
975602c318a1f0 Robby Cai 2019-09-27  382  		dev_err(&pdev->dev, "ipu_id missing or invalid\n");
975602c318a1f0 Robby Cai 2019-09-27  383  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  384  	}
975602c318a1f0 Robby Cai 2019-09-27  385  
975602c318a1f0 Robby Cai 2019-09-27  386  	ret = of_property_read_u32(np, "csi_id", &(gmipi_csi2->csi_id));
975602c318a1f0 Robby Cai 2019-09-27  387  	if (ret) {
975602c318a1f0 Robby Cai 2019-09-27  388  		dev_err(&pdev->dev, "csi_id missing or invalid\n");
975602c318a1f0 Robby Cai 2019-09-27  389  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  390  	}
975602c318a1f0 Robby Cai 2019-09-27  391  
975602c318a1f0 Robby Cai 2019-09-27  392  	ret = of_property_read_u32(np, "v_channel", &(gmipi_csi2->v_channel));
975602c318a1f0 Robby Cai 2019-09-27  393  	if (ret) {
975602c318a1f0 Robby Cai 2019-09-27  394  		dev_err(&pdev->dev, "v_channel missing or invalid\n");
975602c318a1f0 Robby Cai 2019-09-27  395  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  396  	}
975602c318a1f0 Robby Cai 2019-09-27  397  
975602c318a1f0 Robby Cai 2019-09-27  398  	ret = of_property_read_u32(np, "lanes", &(gmipi_csi2->lanes));
975602c318a1f0 Robby Cai 2019-09-27  399  	if (ret) {
975602c318a1f0 Robby Cai 2019-09-27  400  		dev_err(&pdev->dev, "lanes missing or invalid\n");
975602c318a1f0 Robby Cai 2019-09-27  401  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  402  	}
975602c318a1f0 Robby Cai 2019-09-27  403  
975602c318a1f0 Robby Cai 2019-09-27  404  	if ((gmipi_csi2->ipu_id < 0) || (gmipi_csi2->ipu_id > 1) ||
975602c318a1f0 Robby Cai 2019-09-27  405  		(gmipi_csi2->csi_id > 1) || (gmipi_csi2->v_channel > 3) ||
975602c318a1f0 Robby Cai 2019-09-27  406  		(gmipi_csi2->lanes > 4)) {
975602c318a1f0 Robby Cai 2019-09-27  407  		dev_err(&pdev->dev, "invalid param for mipi csi2!\n");
975602c318a1f0 Robby Cai 2019-09-27  408  		ret = -EINVAL;
975602c318a1f0 Robby Cai 2019-09-27  409  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  410  	}
975602c318a1f0 Robby Cai 2019-09-27  411  
975602c318a1f0 Robby Cai 2019-09-27  412  	/* initialize mutex */
975602c318a1f0 Robby Cai 2019-09-27  413  	mutex_init(&gmipi_csi2->mutex_lock);
975602c318a1f0 Robby Cai 2019-09-27  414  
975602c318a1f0 Robby Cai 2019-09-27  415  	/* get mipi csi2 informaiton */
975602c318a1f0 Robby Cai 2019-09-27  416  	gmipi_csi2->pdev = pdev;
975602c318a1f0 Robby Cai 2019-09-27  417  	gmipi_csi2->mipi_en = false;
975602c318a1f0 Robby Cai 2019-09-27  418  
975602c318a1f0 Robby Cai 2019-09-27  419  	gmipi_csi2->cfg_clk = devm_clk_get(dev, "cfg_clk");
975602c318a1f0 Robby Cai 2019-09-27  420  	if (IS_ERR(gmipi_csi2->cfg_clk)) {
975602c318a1f0 Robby Cai 2019-09-27  421  		dev_err(&pdev->dev, "failed to get cfg_clk\n");
975602c318a1f0 Robby Cai 2019-09-27  422  		ret = PTR_ERR(gmipi_csi2->cfg_clk);
975602c318a1f0 Robby Cai 2019-09-27  423  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  424  	}
975602c318a1f0 Robby Cai 2019-09-27  425  
975602c318a1f0 Robby Cai 2019-09-27  426  	/* get mipi dphy clk */
975602c318a1f0 Robby Cai 2019-09-27  427  	gmipi_csi2->dphy_clk = devm_clk_get(dev, "dphy_clk");
975602c318a1f0 Robby Cai 2019-09-27  428  	if (IS_ERR(gmipi_csi2->dphy_clk)) {
975602c318a1f0 Robby Cai 2019-09-27  429  		dev_err(&pdev->dev, "failed to get dphy pll_ref_clk\n");
975602c318a1f0 Robby Cai 2019-09-27  430  		ret = PTR_ERR(gmipi_csi2->dphy_clk);
975602c318a1f0 Robby Cai 2019-09-27  431  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  432  	}
975602c318a1f0 Robby Cai 2019-09-27  433  
975602c318a1f0 Robby Cai 2019-09-27  434  	/* get mipi to ipu pixel clk */
975602c318a1f0 Robby Cai 2019-09-27  435  	gmipi_csi2->pixel_clk = devm_clk_get(dev, "pixel_clk");
975602c318a1f0 Robby Cai 2019-09-27  436  	if (IS_ERR(gmipi_csi2->pixel_clk)) {
975602c318a1f0 Robby Cai 2019-09-27  437  		dev_err(&pdev->dev, "failed to get mipi pixel clk\n");
975602c318a1f0 Robby Cai 2019-09-27  438  		ret = PTR_ERR(gmipi_csi2->pixel_clk);
975602c318a1f0 Robby Cai 2019-09-27  439  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  440  	}
975602c318a1f0 Robby Cai 2019-09-27  441  
975602c318a1f0 Robby Cai 2019-09-27  442  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
975602c318a1f0 Robby Cai 2019-09-27  443  	if (!res) {
975602c318a1f0 Robby Cai 2019-09-27  444  		ret = -ENODEV;
975602c318a1f0 Robby Cai 2019-09-27  445  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  446  	}
975602c318a1f0 Robby Cai 2019-09-27  447  
975602c318a1f0 Robby Cai 2019-09-27  448  	/* mipi register mapping */
975602c318a1f0 Robby Cai 2019-09-27  449  	gmipi_csi2->mipi_csi2_base = ioremap(res->start, PAGE_SIZE);
975602c318a1f0 Robby Cai 2019-09-27  450  	if (!gmipi_csi2->mipi_csi2_base) {
975602c318a1f0 Robby Cai 2019-09-27  451  		ret = -ENOMEM;
975602c318a1f0 Robby Cai 2019-09-27  452  		goto err;
975602c318a1f0 Robby Cai 2019-09-27  453  	}
975602c318a1f0 Robby Cai 2019-09-27  454  
975602c318a1f0 Robby Cai 2019-09-27  455  	/* mipi dphy clk enable for register access */
975602c318a1f0 Robby Cai 2019-09-27  456  	clk_prepare_enable(gmipi_csi2->dphy_clk);
975602c318a1f0 Robby Cai 2019-09-27  457  	/* get mipi csi2 dphy version */
975602c318a1f0 Robby Cai 2019-09-27  458  	mipi_csi2_dphy_ver = mipi_csi2_read(gmipi_csi2, MIPI_CSI2_VERSION);
975602c318a1f0 Robby Cai 2019-09-27  459  
975602c318a1f0 Robby Cai 2019-09-27  460  	clk_disable_unprepare(gmipi_csi2->dphy_clk);
975602c318a1f0 Robby Cai 2019-09-27  461  
975602c318a1f0 Robby Cai 2019-09-27  462  	platform_set_drvdata(pdev, gmipi_csi2);
975602c318a1f0 Robby Cai 2019-09-27  463  
975602c318a1f0 Robby Cai 2019-09-27  464  	dev_info(&pdev->dev, "i.MX MIPI CSI2 driver probed\n");
975602c318a1f0 Robby Cai 2019-09-27  465  	dev_info(&pdev->dev, "i.MX MIPI CSI2 dphy version is 0x%x\n",
975602c318a1f0 Robby Cai 2019-09-27  466  						mipi_csi2_dphy_ver);
975602c318a1f0 Robby Cai 2019-09-27  467  
975602c318a1f0 Robby Cai 2019-09-27  468  	return 0;
975602c318a1f0 Robby Cai 2019-09-27  469  
975602c318a1f0 Robby Cai 2019-09-27  470  err:
975602c318a1f0 Robby Cai 2019-09-27  471  	kfree(gmipi_csi2);
975602c318a1f0 Robby Cai 2019-09-27  472  alloc_failed:
975602c318a1f0 Robby Cai 2019-09-27  473  	dev_err(&pdev->dev, "i.MX MIPI CSI2 driver probed -  error\n");
975602c318a1f0 Robby Cai 2019-09-27  474  	return ret;
975602c318a1f0 Robby Cai 2019-09-27  475  }
975602c318a1f0 Robby Cai 2019-09-27  476  

:::::: The code at line 358 was first introduced by commit
:::::: 975602c318a1f0e66ad15213bf06cc7d38ab4745 media: mipi csi: add IPU CSI driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
