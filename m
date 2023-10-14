Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7408134C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyeJvSw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697297769; x=1728833769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NOmxOJm+7CJuQMZ4hsJDf+FQcLjSl1ZKl53tBWOM04=;
  b=MyeJvSw92pUs4biNW0RB5fte129FNiF7SDWyZmuvylH6QrjeE6A3UqM/
   IL+bHSzfAvMUX8bHDO1i+wWWVgekDUvK7gn/mmj4/y8RgVForIgJvsc0y
   1tD0sfIh/p9wMJer3BtUbUB3IuHP6360u02etWOduugfjks0VAQSAzPXE
   79tpB5T/QNiUd+/1W8eUNzKBp8jqFwcIhmfxd0dk8k9KGVqTf9iL6kVGQ
   tvEGxPIpjUu8iEvEbV0wQI4xwYBt66LDsdjWcUQ1DirBA63AkZLW47ccC
   UmsAc0jY/wbkvHZAZphCDk0WWuJiz3A+iLlPpTAqahRbdZeT7PljFDAtz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3943244"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3943244"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755058309"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="755058309"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2023 08:36:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrggL-0006JV-1l;
	Sat, 14 Oct 2023 15:36:01 +0000
Date: Sat, 14 Oct 2023 23:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6176/24603]
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:2890:12: warning:
 'gpmi_runtime_resume' defined but not used
Message-ID: <202310142351.NKIjwwvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 069390cf1885392613428599244b700f8682e8b1 [6176/24603] Merge branch 'nand/next' into next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310142351.NKIjwwvi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142351.NKIjwwvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142351.NKIjwwvi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:714:5: warning: no previous prototype for 'bch_create_debugfs' [-Wmissing-prototypes]
     714 | int bch_create_debugfs(struct gpmi_nand_data *this)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:2890:12: warning: 'gpmi_runtime_resume' defined but not used [-Wunused-function]
    2890 | static int gpmi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:2879:12: warning: 'gpmi_runtime_suspend' defined but not used [-Wunused-function]
    2879 | static int gpmi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/gpmi_runtime_resume +2890 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c

544a38dbd5c69a Han Xu       2019-11-08  2878  
544a38dbd5c69a Han Xu       2019-11-08 @2879  static int gpmi_runtime_suspend(struct device *dev)
041414682b0daa Sascha Hauer 2019-05-21  2880  {
041414682b0daa Sascha Hauer 2019-05-21  2881  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
041414682b0daa Sascha Hauer 2019-05-21  2882  
544a38dbd5c69a Han Xu       2019-11-08  2883  	gpmi_disable_clk(this);
544a38dbd5c69a Han Xu       2019-11-08  2884  	release_bus_freq(BUS_FREQ_HIGH);
544a38dbd5c69a Han Xu       2019-11-08  2885  	release_dma_channels(this);
544a38dbd5c69a Han Xu       2019-11-08  2886  
544a38dbd5c69a Han Xu       2019-11-08  2887  	return 0;
041414682b0daa Sascha Hauer 2019-05-21  2888  }
041414682b0daa Sascha Hauer 2019-05-21  2889  
544a38dbd5c69a Han Xu       2019-11-08 @2890  static int gpmi_runtime_resume(struct device *dev)
041414682b0daa Sascha Hauer 2019-05-21  2891  {
041414682b0daa Sascha Hauer 2019-05-21  2892  	struct gpmi_nand_data *this = dev_get_drvdata(dev);
544a38dbd5c69a Han Xu       2019-11-08  2893  	int ret;
544a38dbd5c69a Han Xu       2019-11-08  2894  
544a38dbd5c69a Han Xu       2019-11-08  2895  	ret = gpmi_enable_clk(this);
544a38dbd5c69a Han Xu       2019-11-08  2896  	if (ret)
544a38dbd5c69a Han Xu       2019-11-08  2897  		return ret;
544a38dbd5c69a Han Xu       2019-11-08  2898  
544a38dbd5c69a Han Xu       2019-11-08  2899  	request_bus_freq(BUS_FREQ_HIGH);
544a38dbd5c69a Han Xu       2019-11-08  2900  
544a38dbd5c69a Han Xu       2019-11-08  2901  	ret = acquire_dma_channels(this);
544a38dbd5c69a Han Xu       2019-11-08  2902  	if (ret < 0)
544a38dbd5c69a Han Xu       2019-11-08  2903  		return ret;
544a38dbd5c69a Han Xu       2019-11-08  2904  
544a38dbd5c69a Han Xu       2019-11-08  2905  	return 0;
041414682b0daa Sascha Hauer 2019-05-21  2906  

:::::: The code at line 2890 was first introduced by commit
:::::: 544a38dbd5c69a43fff911f92ae9ca775fa10b03 mtd: nand: raw: gpmi-nand: fix the suspend/resume issue

:::::: TO: Han Xu <han.xu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
