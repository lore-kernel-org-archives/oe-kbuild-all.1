Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21262134CA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695670068; x=1727206068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C37a/zE9Mke7SMjeUtC/p15U46lF51Z2EdA/MeVP+rs=;
  b=jTCuYclGMjmG2KOmaDmH/BaLU4Yx6C7AFql5ngKtGTwUXhBMR5UPT+J7
   t7ntCakHLRMR/BLiOmZUCmUvbPH7vza62kCavtgu657oYFQR0QbkmMAOl
   qvYcC/6ey2MwC9aK3ZKUAGWTu2/Qmmwyp0fz3ghuYts+gRkxS6m/+AFQ2
   za6tF2fIizhNKbMkRBpCntoUVmdbmo8tt+cCpPGRrZjcGw/i3Zfu9e2Xu
   FZ9LGvdRz/MkpL+dIl8y4sSlCFEIdDb557grN3XwJ2iHPsvfvpXi6H7+c
   W8cSQxPSPokdbbrmGfEhdZKZFJx71w4sBdTWkpYdTGcAYL+HwUGuHP2Q0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360735012"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="360735012"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="864060832"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="864060832"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2023 12:27:46 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkrFA-0001xc-0X;
	Mon, 25 Sep 2023 19:27:44 +0000
Date: Tue, 26 Sep 2023 03:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [xilinx-xlnx:lkp_test 2/3] drivers/edac/versal_edac.c:1035:9: error:
 implicit declaration of function 'disable_intr'; did you mean 'disable_irq'?
Message-ID: <202309260312.65zY2qX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   c929411a0d169d9bfb85707a7c4ea41fe54f314e
commit: 3f37f6b6b159a78feef56792fe5caf67f9f4e310 [2/3] EDAC/versal: Add a Xilinx Versal memory controller driver
config: x86_64-buildonly-randconfig-004-20230926 (https://download.01.org/0day-ci/archive/20230926/202309260312.65zY2qX3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260312.65zY2qX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260312.65zY2qX3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/edac/versal_edac.c: In function 'mc_remove':
>> drivers/edac/versal_edac.c:1035:9: error: implicit declaration of function 'disable_intr'; did you mean 'disable_irq'? [-Werror=implicit-function-declaration]
    1035 |         disable_intr(priv);
         |         ^~~~~~~~~~~~
         |         disable_irq
   cc1: some warnings being treated as errors


vim +1035 drivers/edac/versal_edac.c

  1029	
  1030	static int mc_remove(struct platform_device *pdev)
  1031	{
  1032		struct mem_ctl_info *mci = platform_get_drvdata(pdev);
  1033		struct edac_priv *priv = mci->pvt_info;
  1034	
> 1035		disable_intr(priv);
  1036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
