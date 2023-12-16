Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1436358AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbwE1OQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702770725; x=1734306725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDvfikr62gezY4qMKkBQbtsOlVDvqJV3VXuHtSvovAU=;
  b=dbwE1OQIkR38kMB0L4QRXAqbN0zvm4XChq8mn5amsZiXKdt9mAq9As0o
   +MjDD39Wj4ms99ZD03lzzXqPwGHLUuB/+MbgIRmb4WQIwY991tZnyh7Ex
   MzqVPYY0N4VCXi+doA2Six/qjszd6MPqHgyph+wTgO0Ip0JAoP8b4WClm
   qgweKhYaw2chlPFIq4RTVrUxMF7NNosfk18FzGzNOmsNhSeaglo1ep2aB
   sqy7hLeQ6Ok5uRbWBE0fX1EmxSpEUEttWpBiTzXJvgK/jMoGhfFApw3A1
   9QIIJAeta7OzncHRx8PlcMCbuKgiXSh9jLRVreNKQPTZa1LU7U+oflUu7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="374891675"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="374891675"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 15:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="893346302"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="893346302"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2023 15:52:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEeRu-0002Lu-0W;
	Sat, 16 Dec 2023 23:52:02 +0000
Date: Sun, 17 Dec 2023 07:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 1605/16025]
 drivers/dma/mxs-dma.c:914:5: warning: no previous prototype for function
 'mxs_dma_runtime_suspend'
Message-ID: <202312170734.KG4t2Yp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Han,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 50d14ca2f9c2d0622fb58400ffad2e1a3d883504 [1605/16025] LF-251-1: dma: mxs-dma: enable runtime PM for mxs-dma
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170734.KG4t2Yp5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170734.KG4t2Yp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170734.KG4t2Yp5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c:879:2: error: call to undeclared function 'dma_pool_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
           ^
   drivers/dma/mxs-dma.c:879:41: error: no member named 'ccw_pool' in 'struct mxs_dma_chan'
           dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
                            ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/dma/mxs-dma.c:885:13: error: no member named 'ccw_pool' in 'struct mxs_dma_chan'
                   mxs_chan->ccw_pool = NULL;
                   ~~~~~~~~  ^
>> drivers/dma/mxs-dma.c:914:5: warning: no previous prototype for function 'mxs_dma_runtime_suspend' [-Wmissing-prototypes]
   int mxs_dma_runtime_suspend(struct device *dev)
       ^
   drivers/dma/mxs-dma.c:914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mxs_dma_runtime_suspend(struct device *dev)
   ^
   static 
>> drivers/dma/mxs-dma.c:923:5: warning: no previous prototype for function 'mxs_dma_runtime_resume' [-Wmissing-prototypes]
   int mxs_dma_runtime_resume(struct device *dev)
       ^
   drivers/dma/mxs-dma.c:923:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mxs_dma_runtime_resume(struct device *dev)
   ^
   static 
   2 warnings and 3 errors generated.


vim +/mxs_dma_runtime_suspend +914 drivers/dma/mxs-dma.c

   913	
 > 914	int mxs_dma_runtime_suspend(struct device *dev)
   915	{
   916		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   917	
   918		clk_disable_unprepare(mxs_dma->clk);
   919	
   920		return 0;
   921	}
   922	
 > 923	int mxs_dma_runtime_resume(struct device *dev)
   924	{
   925		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   926		int ret;
   927	
   928		ret = clk_prepare_enable(mxs_dma->clk);
   929		if (ret) {
   930			dev_err(&mxs_dma->pdev->dev, "failed to enable the clock\n");
   931			return ret;
   932		}
   933	
   934		return 0;
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
