Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570663B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 16:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675267859; x=1706803859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWSY9fEBL/ggeoC893bZr3NSrJvYj++33stbG0a2AUQ=;
  b=ZLbX9p44WiAL/x6TvN+cuo/tV1S4yNMZaiW/GDuYV3LhEINHMctqJwAu
   tHiuFcAW3yVafsNPn1R+8hhrwfXFp86DZ+wRipTOTGhy/5G95+Xmsetj1
   KpRHGR+segGt5PB3mGRRqokhcsU1ovENpHdanYWO48lMmne2bRxkYPGsl
   +Zvvtvc8hBltVuph3S+nac6sQQzNV0PCBlMM9/R5pKiIXeprI0ogmZiOU
   zHOXuIZvo/KGBHjFIPw8jsBQITfH8dvF7/YrvOW8pODa/qJPiWhvIbBDL
   fk8jzcf0cFWe/ZTjppzWFkEnpLEVfMApL7w4dizsNBouFLAgeSbZTpR8B
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330319885"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="330319885"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 08:10:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658369621"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="658369621"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Feb 2023 08:10:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNFgu-0005Z9-2p;
	Wed, 01 Feb 2023 16:10:32 +0000
Date: Thu, 2 Feb 2023 00:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-stable-rc:queue/4.19 2/66]
 drivers/memory/mvebu-devbus.c:297:15: error: implicit declaration of
 function 'devm_clk_get_enabled'
Message-ID: <202302020048.ZsmUJDHo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
head:   923e939ad273761d537bc8b4e314e7fbac1d975d
commit: b02522d25ad5cbfe50424dd99a85f5486f407fa6 [2/66] memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230202/202302020048.ZsmUJDHo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b02522d25ad5cbfe50424dd99a85f5486f407fa6
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.19
        git checkout b02522d25ad5cbfe50424dd99a85f5486f407fa6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/memory/mvebu-devbus.c: In function 'mvebu_devbus_probe':
>> drivers/memory/mvebu-devbus.c:297:15: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
     297 |         clk = devm_clk_get_enabled(&pdev->dev, NULL);
         |               ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/mvebu-devbus.c:297:13: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     297 |         clk = devm_clk_get_enabled(&pdev->dev, NULL);
         |             ^
   cc1: some warnings being treated as errors


vim +/devm_clk_get_enabled +297 drivers/memory/mvebu-devbus.c

   274	
   275	static int mvebu_devbus_probe(struct platform_device *pdev)
   276	{
   277		struct device *dev = &pdev->dev;
   278		struct device_node *node = pdev->dev.of_node;
   279		struct devbus_read_params r;
   280		struct devbus_write_params w;
   281		struct devbus *devbus;
   282		struct resource *res;
   283		struct clk *clk;
   284		unsigned long rate;
   285		int err;
   286	
   287		devbus = devm_kzalloc(&pdev->dev, sizeof(struct devbus), GFP_KERNEL);
   288		if (!devbus)
   289			return -ENOMEM;
   290	
   291		devbus->dev = dev;
   292		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   293		devbus->base = devm_ioremap_resource(&pdev->dev, res);
   294		if (IS_ERR(devbus->base))
   295			return PTR_ERR(devbus->base);
   296	
 > 297		clk = devm_clk_get_enabled(&pdev->dev, NULL);
   298		if (IS_ERR(clk))
   299			return PTR_ERR(clk);
   300	
   301		/*
   302		 * Obtain clock period in picoseconds,
   303		 * we need this in order to convert timing
   304		 * parameters from cycles to picoseconds.
   305		 */
   306		rate = clk_get_rate(clk) / 1000;
   307		devbus->tick_ps = 1000000000 / rate;
   308	
   309		dev_dbg(devbus->dev, "Setting timing parameter, tick is %lu ps\n",
   310			devbus->tick_ps);
   311	
   312		if (!of_property_read_bool(node, "devbus,keep-config")) {
   313			/* Read the Device Tree node */
   314			err = devbus_get_timing_params(devbus, node, &r, &w);
   315			if (err < 0)
   316				return err;
   317	
   318			/* Set the new timing parameters */
   319			if (of_device_is_compatible(node, "marvell,orion-devbus"))
   320				devbus_orion_set_timing_params(devbus, node, &r, &w);
   321			else
   322				devbus_armada_set_timing_params(devbus, node, &r, &w);
   323		}
   324	
   325		/*
   326		 * We need to create a child device explicitly from here to
   327		 * guarantee that the child will be probed after the timing
   328		 * parameters for the bus are written.
   329		 */
   330		err = of_platform_populate(node, NULL, NULL, dev);
   331		if (err < 0)
   332			return err;
   333	
   334		return 0;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
