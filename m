Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDEF15A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 03:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693452661; x=1724988661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4q00ViNtP0R+WF64SX5yMWNaDxF4fFs6Bpsg32EbNnc=;
  b=eUoyKWWyYhRjs9sGosUI0wv+QsRhmwPYZE+uMHKUDlxTvdYxiSbaij7Z
   l/CN1qaQUyYWFMCntWNCv19kLaxOaTQCYa2UV73+2XeLc0RsB7F3oFPtb
   WCiPUtycz8ND5+IxmelPLGviEZ0NJABIqH25/WdB/I64uYpShUff70HiS
   C+YdQZ/jdIp4IQbQouWHuSeVakM8FBUnF+3AAGVb2dHm8VL1Psy5fJksd
   znTUoVidLNSt6eUAaGkk5SV+I4i3u1EyNl31PFm0XBzeOrOcV196d/ltD
   zFG0DV/4MwTXSiQI67WqcEWvxe4irtvtMVUvv9RalGY+cEkF10yh6K4G5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="406795129"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="406795129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 20:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="1070059726"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="1070059726"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2023 20:30:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbYOY-000AY1-2N;
	Thu, 31 Aug 2023 03:30:58 +0000
Date: Thu, 31 Aug 2023 11:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1629/24603] drivers/dma/mxs-dma.c:914:5:
 warning: no previous prototype for function 'mxs_dma_runtime_suspend'
Message-ID: <202308311158.94H1gN7O-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 1b639120f160cd2a1a0fa6528d4cb721b94708c3 [1629/24603] LF-251-1: dma: mxs-dma: enable runtime PM for mxs-dma
config: riscv-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311158.94H1gN7O-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311158.94H1gN7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311158.94H1gN7O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c:879:2: error: implicit declaration of function 'dma_pool_destroy' [-Werror,-Wimplicit-function-declaration]
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
