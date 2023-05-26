Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99F2A9EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685144208; x=1716680208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhPhAuiAHnHAJGpXa87vuQ1UUvYyD5mry9+mNr1JFJ8=;
  b=GmdNtCTaOfTpi8hzYpDdwiqLtCdrnpR+1bFoyYpNBdncYLWGgoC1Gvtj
   R1/8ug5gxLZXxJV/doqE/GjfseOWCC86ddTUCu2/C9xj0bu+h5mB/uvzH
   ZiK8uhJRBYGvCVtm9qXf/iCUZa1cbWY3NhQqcS5mxqtVZPfExKk/UGuki
   kEAgHuWUTgJZ3Ag6uei5UczKdPr+bGCsv6n0wKBn+PbVrJ5Yxr+9VWtZn
   2RkX9yRQC+NsrhThruRo7xyeMcoAUchuBpDW8UEds8Xr4Y2h7nqnziR9u
   pMRJN90tdsKQ27tUn/ajYs/T5HX4QVHDyLlt8Fokw9uwJRnSVDNGRiwHt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343829684"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="343829684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 16:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849708974"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="849708974"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 May 2023 16:36:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2gzG-000JfQ-20;
	Fri, 26 May 2023 23:36:46 +0000
Date: Sat, 27 May 2023 07:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] HACK: i2c: aspeed: Comment the clock and reset
 out.
Message-ID: <202305270648.LyxZ5g9R-lkp@intel.com>
References: <20230525152203.32190-6-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525152203.32190-6-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/i2c-acpi-set-slave-mode-flag/20230525-233511
base:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
patch link:    https://lore.kernel.org/r/20230525152203.32190-6-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH 5/6] HACK: i2c: aspeed: Comment the clock and reset out.
config: mips-randconfig-s042-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270648.LyxZ5g9R-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d400cf85e735f50ef4afd3c3aabf377926a6506a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/i2c-acpi-set-slave-mode-flag/20230525-233511
        git checkout d400cf85e735f50ef4afd3c3aabf377926a6506a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270648.LyxZ5g9R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-aspeed.c:1000:28: sparse: sparse: Using plain integer as NULL pointer

vim +1000 drivers/i2c/busses/i2c-aspeed.c

   974	
   975	static int aspeed_i2c_probe_bus(struct platform_device *pdev)
   976	{
   977		struct aspeed_i2c_bus *bus;
   978		struct clk *parent_clk;
   979		int irq, ret;
   980	
   981		bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
   982		if (!bus)
   983			return -ENOMEM;
   984	
   985		bus->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
   986		if (IS_ERR(bus->base))
   987			return PTR_ERR(bus->base);
   988	
   989		//	parent_clk = devm_clk_get(&pdev->dev, NULL);
   990		//	if (IS_ERR(parent_clk))//
   991		//		return PTR_ERR(parent_clk);
   992		bus->parent_clk_frequency = 1000000;//clk_get_rate(parent_clk);
   993		/* We just need the clock rate, we don't actually use the clk object. */
   994		//devm_clk_put(&pdev->dev, parent_clk);
   995	
   996		bus->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
   997		if (IS_ERR(bus->rst)) {
   998			dev_warn(&pdev->dev,
   999				"missing or invalid reset controller device tree entry\n");
> 1000			bus->rst = 0;
  1001		} else {
  1002			reset_control_deassert(bus->rst);
  1003		}
  1004	
  1005		ret = device_property_read_u32(&pdev->dev,
  1006					   "bus-frequency", &bus->bus_frequency);
  1007		if (ret < 0) {
  1008			dev_err(&pdev->dev,
  1009				"Could not read bus-frequency property\n");
  1010			bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
  1011		}
  1012	
  1013		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
  1014			device_get_match_data(&pdev->dev);
  1015		if (!bus->get_clk_reg_val)
  1016			bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
  1017	
  1018		/* Initialize the I2C adapter */
  1019		spin_lock_init(&bus->lock);
  1020		init_completion(&bus->cmd_complete);
  1021		bus->adap.owner = THIS_MODULE;
  1022		bus->adap.retries = 0;
  1023		bus->adap.algo = &aspeed_i2c_algo;
  1024		bus->adap.dev.parent = &pdev->dev;
  1025		bus->adap.dev.of_node = pdev->dev.of_node;
  1026		strscpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
  1027		i2c_set_adapdata(&bus->adap, bus);
  1028	
  1029		bus->dev = &pdev->dev;
  1030	
  1031		/* Clean up any left over interrupt state. */
  1032		writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
  1033		writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
  1034		/*
  1035		 * bus.lock does not need to be held because the interrupt handler has
  1036		 * not been enabled yet.
  1037		 */
  1038		ret = aspeed_i2c_init(bus, pdev);
  1039		if (ret < 0)
  1040			return ret;
  1041	
  1042		irq = platform_get_irq(pdev, 0);
  1043		ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
  1044				       0, dev_name(&pdev->dev), bus);
  1045		if (ret < 0)
  1046			return ret;
  1047	
  1048		device_set_node(&bus->adap.dev, dev_fwnode(&pdev->dev));
  1049	
  1050		ret = i2c_add_adapter(&bus->adap);
  1051		if (ret < 0)
  1052			return ret;
  1053	
  1054		platform_set_drvdata(pdev, bus);
  1055	
  1056		dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
  1057			 bus->adap.nr, irq);
  1058	
  1059		return 0;
  1060	}
  1061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
