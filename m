Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DAD53AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 22:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693521613; x=1725057613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYVmDlgPnUwMP5hEOJAR0TbNPK2fl4+xQTSfnFehxOU=;
  b=Z1LUUQcZ+2n9iPSvUoquPRfxmxM2dCuZs2+cxxR8PwjD2GLu54WqWrtZ
   YRZqR4J4Nhm5PJTdVpM8cJNTlXbZx9p8Ud7H/madxBe1tZ0F7u9myBALB
   dYzGl3BPSBeklIxxWkoHUe3BVjtkDNaVvtMC+SN4SzJrNyqOmXyPxh0M6
   QTgeauUhoTboOdwyf8EXPoHwciRelXywerL6fH1lE4tQUONx7mZ2yINRr
   ajUtsbQyjEoLvTcIhxdwoq8vdSjmnfara0GQhMeoosUQ/Dby82iLOsTpU
   52vojv9LdQCoED0E+Zi10ZIlgXQPzD4UPvYoM/DEMSBbcc4f7xG7BcvJC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355580132"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="355580132"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 15:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742896460"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="742896460"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2023 15:40:11 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbqKf-0000cd-0h;
	Thu, 31 Aug 2023 22:40:09 +0000
Date: Fri, 1 Sep 2023 06:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1629/24603] drivers/dma/mxs-dma.c:914:5:
 warning: no previous declaration for 'mxs_dma_runtime_suspend'
Message-ID: <202309010652.npy3mDe5-lkp@intel.com>
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
commit: 1b639120f160cd2a1a0fa6528d4cb721b94708c3 [1629/24603] LF-251-1: dma: mxs-dma: enable runtime PM for mxs-dma
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010652.npy3mDe5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010652.npy3mDe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010652.npy3mDe5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c: In function 'mxs_dma_remove':
   drivers/dma/mxs-dma.c:879:2: error: implicit declaration of function 'dma_pool_destroy'; did you mean 'device_destroy'? [-Werror=implicit-function-declaration]
     dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
     ^~~~~~~~~~~~~~~~
     device_destroy
   drivers/dma/mxs-dma.c:879:41: error: 'struct mxs_dma_chan' has no member named 'ccw_pool'; did you mean 'ccw_phys'?
     dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
                                            ^~~~~~~~
                                            ccw_phys
   drivers/dma/mxs-dma.c:885:13: error: 'struct mxs_dma_chan' has no member named 'ccw_pool'; did you mean 'ccw_phys'?
      mxs_chan->ccw_pool = NULL;
                ^~~~~~~~
                ccw_phys
   drivers/dma/mxs-dma.c: At top level:
>> drivers/dma/mxs-dma.c:914:5: warning: no previous declaration for 'mxs_dma_runtime_suspend' [-Wmissing-declarations]
    int mxs_dma_runtime_suspend(struct device *dev)
        ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/mxs-dma.c:923:5: warning: no previous declaration for 'mxs_dma_runtime_resume' [-Wmissing-declarations]
    int mxs_dma_runtime_resume(struct device *dev)
        ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mxs_dma_runtime_suspend +914 drivers/dma/mxs-dma.c

   872	
   873	static int mxs_dma_remove(struct platform_device *pdev)
   874	{
   875		struct mxs_dma_engine *mxs_dma = platform_get_drvdata(pdev);
   876		int i;
   877	
   878		dma_async_device_unregister(&mxs_dma->dma_device);
 > 879		dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
   880	
   881		for (i = 0; i < MXS_DMA_CHANNELS; i++) {
   882			struct mxs_dma_chan *mxs_chan = &mxs_dma->mxs_chans[i];
   883	
   884			tasklet_kill(&mxs_chan->tasklet);
 > 885			mxs_chan->ccw_pool = NULL;
   886		}
   887	
   888		return 0;
   889	}
   890	
   891	#ifdef CONFIG_PM_SLEEP
   892	static int mxs_dma_pm_suspend(struct device *dev)
   893	{
   894		int ret;
   895	
   896		ret = pm_runtime_force_suspend(dev);
   897	
   898		return ret;
   899	}
   900	
   901	static int mxs_dma_pm_resume(struct device *dev)
   902	{
   903		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   904		int ret;
   905	
   906		ret = mxs_dma_init(mxs_dma);
   907		if (ret)
   908			return ret;
   909	
   910		return 0;
   911	}
   912	#endif
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
