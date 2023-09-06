Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B98101F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012057; x=1725548057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KDAKUrnxBFhRqqc18HymwhA6c9+2Lc8wiU+q+xq8Jg=;
  b=Tzlhdj7llDqslepQIig4YZyLLFk3c1+7/PosxBQIhkKKYnA3mkj3emLn
   5WQPMhPtKEvf3Z65WO0u1/cCZoqtjpsgdYs2jE5siMCYpX3wjWIJnnBXD
   rG8wlzLSep3f70J6zVUauaJgeGSGCVOEfK64Edy3UmST96u/bQGbvLXr6
   UQxDl4TDbMoRNrSTNB2vu+v02YsqyFGvHWCNrd6a4rCma0gw9nIzwi7U6
   q3w+DjcheCJvWy+L+qKuPZ9bc0R6rENOs2R2SR7R5kd7vlUPfQQom3xue
   Fz64/fWPxbus6/GB8egKgUIZba4Ylen33cLptd8IbaXTq6Tng6OzjStS3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357395605"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="357395605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718295370"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="718295370"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 07:54:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdtv2-0000Ip-2m;
	Wed, 06 Sep 2023 14:54:12 +0000
Date: Wed, 6 Sep 2023 22:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/640 615/24604]
 drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: unused variable
 'imx_blk_ctrl_of_match'
Message-ID: <202309062212.C5OAQP8l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/640
head:   20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c
commit: 75921c395c22cf9a3d9ff9af0e9962fc2b62105a [615/24604] clk: imx: Add blk_ctrl combo driver
config: hexagon-randconfig-001-20230906 (https://download.01.org/0day-ci/archive/20230906/202309062212.C5OAQP8l-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062212.C5OAQP8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062212.C5OAQP8l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-blk-ctrl.c:284:12: warning: unused function 'imx_blk_ctrl_runtime_suspend' [-Wunused-function]
     284 | static int imx_blk_ctrl_runtime_suspend(struct device *dev)
         |            ^
   drivers/clk/imx/clk-blk-ctrl.c:291:12: warning: unused function 'imx_blk_ctrl_runtime_resume' [-Wunused-function]
     291 | static int imx_blk_ctrl_runtime_resume(struct device *dev)
         |            ^
>> drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: unused variable 'imx_blk_ctrl_of_match' [-Wunused-const-variable]
     305 | static const struct of_device_id imx_blk_ctrl_of_match[] = {
         |                                  ^
   3 warnings generated.


vim +/imx_blk_ctrl_of_match +305 drivers/clk/imx/clk-blk-ctrl.c

   304	
 > 305	static const struct of_device_id imx_blk_ctrl_of_match[] = {
   306	       { /* Sentinel */ }
   307	};
   308	MODULE_DEVICE_TABLE(of, imx_blk_ctrl_of_match);
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
