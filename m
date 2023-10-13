Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB963CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqYsFFUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697201896; x=1728737896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aiHFyPxKQITM13AQSkR3Mg1mrezIidRIescuDOmiWLk=;
  b=fqYsFFUsmTeD9kXS2nGH3mVhncru5oUXuUmxCLwVITePd6/JvcXH66rY
   JUcvV8o3iQMSE7KDIrxyhscdRHLOFJ0G2W68/V362UO8xGKFggXzN6dI7
   6ghTxx++m0YmKBILfiH4P3V1rsas4FHLlZYMmSGqBEkch5CXWiz/kAwkP
   6n4oNtGVA+UjcDeYxHvQS2bsGm0cu8VXNtYpqa/ueo5MwuskCQcg2izV4
   q6G0GTajZsUaad+l8e+nhLWLB1P51SK30FMWOQoqiYzdGCLjRQ+lkWM8R
   6Z6EoAGyIMfAJ79W3pUNKnus43ZzC1FHgj8/W7Co7K8fNVLFkTqLc5qB5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370239419"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370239419"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784149958"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="784149958"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 05:58:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrHk3-0004mp-2w;
	Fri, 13 Oct 2023 12:58:11 +0000
Date: Fri, 13 Oct 2023 20:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 615/24603]
 drivers/clk/imx/clk-blk-ctrl.c:291:12: warning:
 'imx_blk_ctrl_runtime_resume' defined but not used
Message-ID: <202310132042.zs0e89Ue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 75921c395c22cf9a3d9ff9af0e9962fc2b62105a [615/24603] clk: imx: Add blk_ctrl combo driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310132042.zs0e89Ue-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132042.zs0e89Ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132042.zs0e89Ue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-blk-ctrl.c:291:12: warning: 'imx_blk_ctrl_runtime_resume' defined but not used [-Wunused-function]
     291 | static int imx_blk_ctrl_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-blk-ctrl.c:284:12: warning: 'imx_blk_ctrl_runtime_suspend' defined but not used [-Wunused-function]
     284 | static int imx_blk_ctrl_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx_blk_ctrl_runtime_resume +291 drivers/clk/imx/clk-blk-ctrl.c

   283	
 > 284	static int imx_blk_ctrl_runtime_suspend(struct device *dev)
   285	{
   286		imx_blk_ctrl_read_write(dev, false);
   287	
   288		return 0;
   289	}
   290	
 > 291	static int imx_blk_ctrl_runtime_resume(struct device *dev)
   292	{
   293		imx_blk_ctrl_read_write(dev, true);
   294	
   295		return 0;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
