Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DFC10965
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnXa0Mj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697188083; x=1728724083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3aFcSp775og5glgbcCnpo8GTXiXIEcKgO61zqK62od8=;
  b=DnXa0Mj272tgX2ktdDeKefMOuRSvvJtIxHoAcLRHBrh9OOMxkoV6oTsO
   eI9hkiWx4tHEoBjx8/AEJL3v7K/Pj04IqwwgCqL1LiD46q/BQrG2PJuPO
   obD9EKyf2g3z0ihR1knktn8tnFiZzffeZRcXcqPazGb5qlowCI7+jyfX+
   2zIUaWNkrufX8eTKTjiPGgXVX74NuF38Yv9ONrtleEB2JX5pUyW3dCp3A
   Av7R4T8+oW9tpqCFjH4EAZV3YwsUX3QM/Vuxt4z0sA3NtNRd4WfI5vnrf
   +L7Wq3xyAMSjQUulSPSQ2Rc34EOnBsQPLXcjjQ5WY1ks5bCf6SyUQSVIp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6696307"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6696307"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 02:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845390395"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="845390395"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 02:08:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrE9F-0004Yp-1r;
	Fri, 13 Oct 2023 09:07:57 +0000
Date: Fri, 13 Oct 2023 17:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6078/24603]
 drivers/staging/media/imx/imx8-parallel-csi.c:797:12: warning:
 'parallel_csi_runtime_resume' defined but not used
Message-ID: <202310131719.zZkHK4xI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 310479f848ce2c9c9c3bb445e93638b5c9c41829 [6078/24603] Merge remote-tracking branch 'origin/capture/pi' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131719.zZkHK4xI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131719.zZkHK4xI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131719.zZkHK4xI-lkp@intel.com/

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
