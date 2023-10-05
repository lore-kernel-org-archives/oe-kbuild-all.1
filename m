Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D6566E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adkhFqco"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696490411; x=1728026411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PAHt8lQqmO072wK81UpLYfW4AT8razs3y9JDhmHp2Vo=;
  b=adkhFqcolw6AuxpTSZfnbv3pb2pI23bmpx+Yy1IFLIIPo+tfhRu4DcMc
   t968RZp91USfqHw4gxxhbQ1rWRq3jnh+tmUOfAXZUmfLMcnTxZNybQwQu
   16Zz17SceN2e0lZZso7MquOpy799bc3qJ/M3mVtRg1cS9ONPi+4tuZMF8
   0BjDW2+ZllDOZhDykmUX4p6CUxdEH5oKoLYQSi12h17swRoy5jkyuCqem
   wcjRkeFY7vVOIKXapcfbnndtv6FeoLrFIcFPiTCr6hd8XxcB3I9q0oymE
   VqBsKX9pP8eOmTXYehZ0xZnQCk20WLNKLfu7i81MfWAYhzTjxIYSOsNw7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368494020"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="368494020"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 00:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895329013"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="895329013"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2023 00:18:39 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoIeA-000LAS-2T;
	Thu, 05 Oct 2023 07:19:58 +0000
Date: Thu, 5 Oct 2023 15:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kris Chaplin <kris.chaplin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 2/6] drivers/w1/masters/amd_w1.c:372:21:
 error: implicit declaration of function 'FIELD_GET'
Message-ID: <202310051506.odMr504c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   d81a4120bd209b0103e37eae6f5cceada1eda492
commit: 4e93fa1a4708500f0c532c44e9d35b34d223b59c [2/6] w1: Add 1-wire master driver for AMD programmable logic IP Core
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231005/202310051506.odMr504c-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051506.odMr504c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051506.odMr504c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/w1/masters/amd_w1.c: In function 'amd_w1_probe':
>> drivers/w1/masters/amd_w1.c:372:21: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     372 |         ver_major = FIELD_GET(AXIW1_MAJORVER_MASK, val);
         |                     ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +372 drivers/w1/masters/amd_w1.c

   319	
   320	static int amd_w1_probe(struct platform_device *pdev)
   321	{
   322		struct device *dev = &pdev->dev;
   323		struct amd_w1_local *lp;
   324		u32 ver_major, ver_minor;
   325		int val, rc = 0;
   326	
   327		/* Get iospace for the device */
   328		lp = devm_kzalloc(dev, sizeof(*lp), GFP_KERNEL);
   329		if (!lp)
   330			return -ENOMEM;
   331	
   332		lp->dev = dev;
   333		lp->base_addr = devm_platform_ioremap_resource(pdev, 0);
   334		if (IS_ERR(lp->base_addr))
   335			return PTR_ERR(lp->base_addr);
   336	
   337		/* Get IRQ for the device */
   338		lp->irq = platform_get_irq(pdev, 0);
   339		if (lp->irq <= 0)
   340			return lp->irq;
   341	
   342		rc = devm_request_irq(dev, lp->irq, &amd_w1_irq, IRQF_TRIGGER_HIGH, DRIVER_NAME, lp);
   343		if (rc) {
   344			dev_err(dev, "Could not allocate interrupt %d.\n", lp->irq);
   345			return rc;
   346		}
   347	
   348		/* Initialize wait queue and flag */
   349		init_waitqueue_head(&lp->wait_queue);
   350	
   351		lp->clk = devm_clk_get_enabled(dev, NULL);
   352		if (IS_ERR(lp->clk))
   353			return PTR_ERR(lp->clk);
   354	
   355		/* Verify IP presence in HW */
   356		if (amd_w1_read_register(lp, AXIW1_IPID_REG) != AXIW1_IPID) {
   357			dev_err(dev, "AMD 1-wire IP not detected in hardware\n");
   358			return -ENODEV;
   359		}
   360	
   361		/*
   362		 * Allow for future driver expansion supporting new hardware features
   363		 * This driver currently only supports hardware 1.x, but include logic
   364		 * to detect if a potentially incompatible future version is used
   365		 * by reading major version ID. It is highly undesirable for new IP versions
   366		 * to break the API, but this code will at least allow for graceful failure
   367		 * should that happen. Future new features can be enabled by hardware
   368		 * incrementing the minor version and augmenting the driver to detect capability
   369		 * using the minor version number
   370		 */
   371		val = amd_w1_read_register(lp, AXIW1_IPVER_REG);
 > 372		ver_major = FIELD_GET(AXIW1_MAJORVER_MASK, val);
   373		ver_minor = FIELD_GET(AXIW1_MINORVER_MASK, val);
   374	
   375		if (ver_major != 1) {
   376			dev_err(dev, "AMD AXI W1 Master version %u.%u is not supported by this driver",
   377				ver_major, ver_minor);
   378			return -ENODEV;
   379		}
   380	
   381		amd_w1_master.data = (void *)lp;
   382		amd_w1_reset(lp);
   383	
   384		platform_set_drvdata(pdev, lp);
   385		rc = w1_add_master_device(&amd_w1_master);
   386		if (rc) {
   387			dev_err(dev, "Could not add master device\n");
   388			amd_w1_reset(lp);
   389			return rc;
   390		}
   391	
   392		return 0;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
