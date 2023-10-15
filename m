Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AE1C03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgurnmql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697339603; x=1728875603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFj1Zc7SXv98Je6p5vraJjG6IypWuAyOITffdw7KD5Q=;
  b=Xgurnmql9g/K7SJ+yjW2R7TxX8fpyLL0mV5U2zXd6pDvbt4tLOOxkvXo
   QJVmIjcii9lh6c5MakYd3iE/uWc9KzqyVx3dBmoQxf/nA0uVANuJh6tup
   4qubkmYGbWbRRQa5q3Q+Z60s3dQGO7xYO/IK2q0TLe0jb2r4Q+b/sn1j3
   ZO9bWM3vSCBUYbppg3NuCcYW5WMr+ZWy/kY51dakMT2OrIzeoqZxDeIaH
   44weveIkAc5SkTSwg0lHhba2z8cpnOxHgAFz7G/yfTnDe/9AeNPZC8REk
   9orLSMMWZ/weeclszU741cMclptMPRE8+KdsP0+U9TPCNqbu9/Bp9ni4w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471592118"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="471592118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 20:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705148033"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705148033"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 20:13:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrZ8-0006yV-0B;
	Sun, 15 Oct 2023 03:13:18 +0000
Date: Sun, 15 Oct 2023 11:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1502/30000]
 drivers/clk/imx/clk-lpcg-scu.c:124:20: warning: no previous prototype for
 'imx_clk_lpcg_scu_suspend'
Message-ID: <202310151154.K2VXkKw5-lkp@intel.com>
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
commit: d85732be35dcd85b6ada68191c34c8f3258774db [1502/30000] clk: imx: lpcg: add suspend/resume support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151154.K2VXkKw5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151154.K2VXkKw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151154.K2VXkKw5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-lpcg-scu.c:124:20: warning: no previous prototype for 'imx_clk_lpcg_scu_suspend' [-Wmissing-prototypes]
     124 | int __maybe_unused imx_clk_lpcg_scu_suspend(struct device *dev)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-lpcg-scu.c:134:20: warning: no previous prototype for 'imx_clk_lpcg_scu_resume' [-Wmissing-prototypes]
     134 | int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/imx_clk_lpcg_scu_suspend +124 drivers/clk/imx/clk-lpcg-scu.c

   123	
 > 124	int __maybe_unused imx_clk_lpcg_scu_suspend(struct device *dev)
   125	{
   126		struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
   127	
   128		clk->state = readl_relaxed(clk->reg);
   129		dev_dbg(dev, "save lpcg state 0x%x\n", clk->state);
   130	
   131		return 0;
   132	}
   133	
 > 134	int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
   135	{
   136		struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
   137	
   138		/* FIXME: double write in case a failure */
   139		writel(clk->state, clk->reg);
   140		writel(clk->state, clk->reg);
   141		dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
   142	
   143		return 0;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
