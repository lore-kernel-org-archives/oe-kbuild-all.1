Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723228F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675087527; x=1706623527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jh3rNLZ9cIk5D0DptlTikgYXUDFB9kPMcmVBrjlJjkg=;
  b=LKttj2CMVq6ioIf1nRDbNT12eV8xRqggU6mGeHqdwoW0Hq92RMYNhPrc
   vhh16ju0IKeqCsbjpQoIq5oC2ZfVQGP2+ONGZmoZmJc/t8yjGpwaN8aIL
   rDJMVFgpJLYOOQlFTXzg7X1caDiCStOHLiBpaBbfabTYAhYkDcjEPC0OQ
   W5s+cDZQy2RamQG1bk1k0YSNcqddnmzt2CaP2k3YCkvUBJRf1ZogwFOFh
   3gib3VnyO6QjaGggM5O5olkRghdoIZB8/vUgWV6Vxwr4nB/QJqX3nci4b
   12PNc+p/t9Sql8+MHJFruO3gMGaipID8DEBaWgCrADThwzU7kU3HoxpJ4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="328838635"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="328838635"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 06:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732715047"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="732715047"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2023 06:05:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMUmN-0003em-2v;
	Mon, 30 Jan 2023 14:05:03 +0000
Date: Mon, 30 Jan 2023 22:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 2/62]
 drivers/memory/mvebu-devbus.c:297:15: error: implicit declaration of
 function 'devm_clk_get_enabled'
Message-ID: <202301302220.mnCT7hkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   6c45fd8472ed235c0a8d400ca5733f12301560f3
commit: cb5dbf04ed7ea9d7b7fd0b77232773a91a716541 [2/62] memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301302220.mnCT7hkU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=cb5dbf04ed7ea9d7b7fd0b77232773a91a716541
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout cb5dbf04ed7ea9d7b7fd0b77232773a91a716541
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
