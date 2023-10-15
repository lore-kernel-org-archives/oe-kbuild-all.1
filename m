Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B351FDC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGevgFKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697350963; x=1728886963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XWvGIW7xmPQWsTPmVIRkIEXAbldCWzfDwa3pS3cHz78=;
  b=iGevgFKcVBqcbonqxnL+a4J/h2NAYYrHlZ2hPvdi5sT4AjZ8gAX03WXM
   9xTJmV+MsC8BKgVNfmJloqPPmchXJPizBMTYC1jECru1mt87IQ+CCZY30
   KHLEzincbhzUJnSmkml07JiRkrfVL0zzOUaPSM2GrjuEUZfiDz5g9zS5q
   8MdQdAU14wcNz2jYGGGel/SqEcPlOgCFb++Ubgskyy99a2msF6QAJCzao
   nI2cel+bpaKRiO9wfHGqnelRB0ypx34GT8BU2qMlifYD1Zf1y1xd7taMI
   R3EsAzQ132BWucWUnBCgR4G3+B6+iE1OYRnq8Ab32liY8VxI7WoWc1cB3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388226656"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388226656"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 23:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790388630"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790388630"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2023 23:22:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qruWK-00077X-1T;
	Sun, 15 Oct 2023 06:22:36 +0000
Date: Sun, 15 Oct 2023 14:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2326/30000] drivers/clk/imx/clk-scu.c:185:6:
 warning: no previous prototype for 'imx_scu_clk_is_valid'
Message-ID: <202310151455.uMJMHE0c-lkp@intel.com>
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
commit: 74c70feb0938218d46dfcb49df2a26918c279a76 [2326/30000] Merge branch 'firmware/next' into next
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151455.uMJMHE0c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151455.uMJMHE0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151455.uMJMHE0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-scu.c:185:6: warning: no previous prototype for 'imx_scu_clk_is_valid' [-Wmissing-prototypes]
     185 | bool imx_scu_clk_is_valid(u32 rsrc_id)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-scu.c:559:20: warning: no previous prototype for 'imx_clk_scu_suspend' [-Wmissing-prototypes]
     559 | int __maybe_unused imx_clk_scu_suspend(struct device *dev)
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-scu.c:594:20: warning: no previous prototype for 'imx_clk_scu_resume' [-Wmissing-prototypes]
     594 | int __maybe_unused imx_clk_scu_resume(struct device *dev)
         |                    ^~~~~~~~~~~~~~~~~~


vim +/imx_scu_clk_is_valid +185 drivers/clk/imx/clk-scu.c

4188a7474ec61b Dong Aisheng 2019-07-23  184  
4188a7474ec61b Dong Aisheng 2019-07-23 @185  bool imx_scu_clk_is_valid(u32 rsrc_id)
4188a7474ec61b Dong Aisheng 2019-07-23  186  {
4188a7474ec61b Dong Aisheng 2019-07-23  187  	void *p;
4188a7474ec61b Dong Aisheng 2019-07-23  188  
4188a7474ec61b Dong Aisheng 2019-07-23  189  	if (!rsrc_table)
4188a7474ec61b Dong Aisheng 2019-07-23  190  		return true;
4188a7474ec61b Dong Aisheng 2019-07-23  191  
4188a7474ec61b Dong Aisheng 2019-07-23  192          p = bsearch(&rsrc_id, rsrc_table->rsrc, rsrc_table->num,
4188a7474ec61b Dong Aisheng 2019-07-23  193  		    sizeof(rsrc_table->rsrc[0]), imx_scu_clk_search_cmp);
4188a7474ec61b Dong Aisheng 2019-07-23  194  	return p != NULL;
4188a7474ec61b Dong Aisheng 2019-07-23  195  }
4188a7474ec61b Dong Aisheng 2019-07-23  196  

:::::: The code at line 185 was first introduced by commit
:::::: 4188a7474ec61b2d915721e119f83de40ac8e931 clk: imx8qxp: add clock valid checking mechnism

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
