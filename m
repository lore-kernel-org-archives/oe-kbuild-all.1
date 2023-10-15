Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D5063AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+Avf2b/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697368536; x=1728904536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gc2GWdlLsmU4JbASSbm7LoWyiloWlO7b8Z/8ZqQygQQ=;
  b=L+Avf2b/Ch+eBUjXFJ2USOI9cIM85o2gq1DjAL/A/MCO2xqW7v5Jptq+
   hVDPxxAnDPtA/b33q6ksvV/k+cFsK48oCnYj3cFLcsZtUPLwVV100OgUq
   LC2gkfeKJyuxURL0Tye6XsDY/ILog+aecbwNyBNbYwV0jBIrC8PwCkAxB
   aF4HQcpzDOO0ptUhpZCz/J8vEoYD+slk9WgTh7ICVq5UvZCSWwPMv2lp7
   cN7mIxVp1ZqosZk7H2tqkvspNr9ElyTguxg+wkPVjYa++VYgmZ8Acn6bW
   F5LXMmJh8KEic8f1c0b088X44O6sExsto7EOS/O7tkhKC2V38Oz/UHGHb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6946458"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6946458"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 04:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790470509"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790470509"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 04:15:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrz5k-0007M3-0V;
	Sun, 15 Oct 2023 11:15:28 +0000
Date: Sun, 15 Oct 2023 19:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2218/30000]
 drivers/staging/media/imx/imx8-parallel-csi.c:786:12: warning:
 'parallel_csi_runtime_resume' defined but not used
Message-ID: <202310151909.XNFGygbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 3d8281ed475da278506c51396766da3161942f28 [2218/30000] Merge remote-tracking branch 'origin/capture/pi' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151909.XNFGygbn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151909.XNFGygbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151909.XNFGygbn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/imx8-parallel-csi.c:786:12: warning: 'parallel_csi_runtime_resume' defined but not used [-Wunused-function]
     786 | static int parallel_csi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-parallel-csi.c:777:12: warning: 'parallel_csi_runtime_suspend' defined but not used [-Wunused-function]
     777 | static int parallel_csi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-parallel-csi.c:772:12: warning: 'parallel_csi_pm_resume' defined but not used [-Wunused-function]
     772 | static int parallel_csi_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-parallel-csi.c:767:12: warning: 'parallel_csi_pm_suspend' defined but not used [-Wunused-function]
     767 | static int parallel_csi_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/parallel_csi_runtime_resume +786 drivers/staging/media/imx/imx8-parallel-csi.c

86bb022020d2a0 Guoniu.zhou 2019-04-24  766  
86bb022020d2a0 Guoniu.zhou 2019-04-24 @767  static int parallel_csi_pm_suspend(struct device *dev)
86bb022020d2a0 Guoniu.zhou 2019-04-24  768  {
86bb022020d2a0 Guoniu.zhou 2019-04-24  769  	return pm_runtime_force_suspend(dev);
86bb022020d2a0 Guoniu.zhou 2019-04-24  770  }
86bb022020d2a0 Guoniu.zhou 2019-04-24  771  
86bb022020d2a0 Guoniu.zhou 2019-04-24 @772  static int parallel_csi_pm_resume(struct device *dev)
86bb022020d2a0 Guoniu.zhou 2019-04-24  773  {
86bb022020d2a0 Guoniu.zhou 2019-04-24  774  	return pm_runtime_force_resume(dev);
86bb022020d2a0 Guoniu.zhou 2019-04-24  775  }
86bb022020d2a0 Guoniu.zhou 2019-04-24  776  
86bb022020d2a0 Guoniu.zhou 2019-04-24 @777  static int parallel_csi_runtime_suspend(struct device *dev)
86bb022020d2a0 Guoniu.zhou 2019-04-24  778  {
86bb022020d2a0 Guoniu.zhou 2019-04-24  779  	struct mxc_parallel_csi_dev *pcsidev = dev_get_drvdata(dev);
86bb022020d2a0 Guoniu.zhou 2019-04-24  780  
86bb022020d2a0 Guoniu.zhou 2019-04-24  781  	mxc_pcsi_clk_disable(pcsidev);
86bb022020d2a0 Guoniu.zhou 2019-04-24  782  
86bb022020d2a0 Guoniu.zhou 2019-04-24  783  	return 0;
86bb022020d2a0 Guoniu.zhou 2019-04-24  784  }
86bb022020d2a0 Guoniu.zhou 2019-04-24  785  
86bb022020d2a0 Guoniu.zhou 2019-04-24 @786  static int parallel_csi_runtime_resume(struct device *dev)
86bb022020d2a0 Guoniu.zhou 2019-04-24  787  {
86bb022020d2a0 Guoniu.zhou 2019-04-24  788  	struct mxc_parallel_csi_dev *pcsidev = dev_get_drvdata(dev);
86bb022020d2a0 Guoniu.zhou 2019-04-24  789  	int ret;
86bb022020d2a0 Guoniu.zhou 2019-04-24  790  
86bb022020d2a0 Guoniu.zhou 2019-04-24  791  	ret = mxc_pcsi_clk_enable(pcsidev);
86bb022020d2a0 Guoniu.zhou 2019-04-24  792  	if (ret < 0)
86bb022020d2a0 Guoniu.zhou 2019-04-24  793  		return ret;
86bb022020d2a0 Guoniu.zhou 2019-04-24  794  
86bb022020d2a0 Guoniu.zhou 2019-04-24  795  	return 0;
86bb022020d2a0 Guoniu.zhou 2019-04-24  796  }
86bb022020d2a0 Guoniu.zhou 2019-04-24  797  

:::::: The code at line 786 was first introduced by commit
:::::: 86bb022020d2a02f9502ab83423270fb20f63de2 staging: media: imx: add parallel capture interface driver for imx8qxp

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
