Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF91429F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 23:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693526114; x=1725062114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVTpYhvWnsP4lcrvqLLcXBTyRe4ljd/UBTJUDtBXB7o=;
  b=AHLgEDAH7lVtIREL8kGSlGCfmJjPvrclmBAt6qgWmlu8XLupVMm9ws3N
   XrNYw29Qtj8QHC/RX2ZA8FcBNRII5Bj8ix4v9k8SPhCrglo3dDP4I/CBl
   ZbZh42otEyqdjqWq5hE32MpYBSBLWLGyttS3DggUjDvyx26I3GD4t7DEI
   YVQWn4+dumsrHd76qZ3NDfiua5zG+xGl+KUiXpsTcO0VMYrNLPdid2kd9
   gQb3FfgD2xgR48a59iW/cCo6kj/ZiWhgbt6edTlQcBOgdEWKsPCzc/f9u
   6nmBVfEizAUuTRonZ7aYAPPKbsy55jssHGuwUSif7e5vNsgiQYLRyd2oO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366322695"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="366322695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 16:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805222049"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="805222049"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 16:55:13 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbrVG-0000fX-33;
	Thu, 31 Aug 2023 23:55:10 +0000
Date: Fri, 1 Sep 2023 07:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6078/24603]
 drivers/staging/media/imx/imx8-parallel-csi.c:797:12: warning:
 'parallel_csi_runtime_resume' defined but not used
Message-ID: <202309010721.UeZHN35G-lkp@intel.com>
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
commit: 310479f848ce2c9c9c3bb445e93638b5c9c41829 [6078/24603] Merge remote-tracking branch 'origin/capture/pi' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309010721.UeZHN35G-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010721.UeZHN35G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010721.UeZHN35G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/imx8-parallel-csi.c:797:12: warning: 'parallel_csi_runtime_resume' defined but not used [-Wunused-function]
     797 | static int parallel_csi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-parallel-csi.c:788:12: warning: 'parallel_csi_runtime_suspend' defined but not used [-Wunused-function]
     788 | static int parallel_csi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-parallel-csi.c:783:12: warning: 'parallel_csi_pm_resume' defined but not used [-Wunused-function]
     783 | static int parallel_csi_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-parallel-csi.c:778:12: warning: 'parallel_csi_pm_suspend' defined but not used [-Wunused-function]
     778 | static int parallel_csi_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/parallel_csi_runtime_resume +797 drivers/staging/media/imx/imx8-parallel-csi.c

183c4a76d3ef25 Guoniu.zhou 2019-04-24  777  
183c4a76d3ef25 Guoniu.zhou 2019-04-24 @778  static int parallel_csi_pm_suspend(struct device *dev)
183c4a76d3ef25 Guoniu.zhou 2019-04-24  779  {
183c4a76d3ef25 Guoniu.zhou 2019-04-24  780  	return pm_runtime_force_suspend(dev);
183c4a76d3ef25 Guoniu.zhou 2019-04-24  781  }
183c4a76d3ef25 Guoniu.zhou 2019-04-24  782  
183c4a76d3ef25 Guoniu.zhou 2019-04-24 @783  static int parallel_csi_pm_resume(struct device *dev)
183c4a76d3ef25 Guoniu.zhou 2019-04-24  784  {
183c4a76d3ef25 Guoniu.zhou 2019-04-24  785  	return pm_runtime_force_resume(dev);
183c4a76d3ef25 Guoniu.zhou 2019-04-24  786  }
183c4a76d3ef25 Guoniu.zhou 2019-04-24  787  
183c4a76d3ef25 Guoniu.zhou 2019-04-24 @788  static int parallel_csi_runtime_suspend(struct device *dev)
183c4a76d3ef25 Guoniu.zhou 2019-04-24  789  {
183c4a76d3ef25 Guoniu.zhou 2019-04-24  790  	struct mxc_parallel_csi_dev *pcsidev = dev_get_drvdata(dev);
183c4a76d3ef25 Guoniu.zhou 2019-04-24  791  
183c4a76d3ef25 Guoniu.zhou 2019-04-24  792  	mxc_pcsi_clk_disable(pcsidev);
183c4a76d3ef25 Guoniu.zhou 2019-04-24  793  
183c4a76d3ef25 Guoniu.zhou 2019-04-24  794  	return 0;
183c4a76d3ef25 Guoniu.zhou 2019-04-24  795  }
183c4a76d3ef25 Guoniu.zhou 2019-04-24  796  
183c4a76d3ef25 Guoniu.zhou 2019-04-24 @797  static int parallel_csi_runtime_resume(struct device *dev)
183c4a76d3ef25 Guoniu.zhou 2019-04-24  798  {
183c4a76d3ef25 Guoniu.zhou 2019-04-24  799  	struct mxc_parallel_csi_dev *pcsidev = dev_get_drvdata(dev);
183c4a76d3ef25 Guoniu.zhou 2019-04-24  800  	int ret;
183c4a76d3ef25 Guoniu.zhou 2019-04-24  801  
183c4a76d3ef25 Guoniu.zhou 2019-04-24  802  	ret = mxc_pcsi_clk_enable(pcsidev);
183c4a76d3ef25 Guoniu.zhou 2019-04-24  803  	if (ret < 0)
183c4a76d3ef25 Guoniu.zhou 2019-04-24  804  		return ret;
183c4a76d3ef25 Guoniu.zhou 2019-04-24  805  
183c4a76d3ef25 Guoniu.zhou 2019-04-24  806  	return 0;
183c4a76d3ef25 Guoniu.zhou 2019-04-24  807  }
183c4a76d3ef25 Guoniu.zhou 2019-04-24  808  

:::::: The code at line 797 was first introduced by commit
:::::: 183c4a76d3ef2589480d23994d9d906b2dca21c6 staging: media: imx: add parallel capture interface driver for imx8qxp

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
