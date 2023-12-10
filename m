Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3AE11C9C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjRUqAVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702214703; x=1733750703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qgA9sHUCpCBRdTVsZcv1YtwlGzitGNqqpRctmc0bWaQ=;
  b=IjRUqAVXQc/APRK7XWtb8lh4L61oOVjNN4WAoNRjqI0yl7rJc5ujip5c
   997OKvoWU02dxZYDbjDHWrB+pCsUjYxmGg3sQ/wQkAe42aF1qBveMQyr9
   97xAG5p4K9IuMkLkKSvT8y0oxGErAh+jK8L+YCsfzMzTDoC+0Hbjzq1UN
   UFgFMu+IWFqYwUDrr0DQCdk1deLP6Pd6JViQstHmQhLSctBaT9wNwIY74
   mLvv2IcMlTiB2GGoJtTqF6VzXJVIXiWgCMmtjQNOBFUTec0lTM9of2Yh8
   WWgAwjy83FTvwR1p0P9M4+N5jCSixGMpXKxbksYZdfqFUqF8/GK8EQwPr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="374060334"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="374060334"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 05:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="776337372"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="776337372"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2023 05:25:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCJnd-000GsA-1J;
	Sun, 10 Dec 2023 13:24:54 +0000
Date: Sun, 10 Dec 2023 21:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/mtd/nand/raw/pl35x-nand-controller.c:147: warning: Function
 parameter or member 'chips' not described in 'pl35x_nandc'
Message-ID: <202312102130.geZ4dqyN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 08d8c62164a322eb923034acacf25246b775593a mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller
date:   2 years, 6 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231210/202312102130.geZ4dqyN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102130.geZ4dqyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102130.geZ4dqyN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/pl35x-nand-controller.c:147: warning: Function parameter or member 'chips' not described in 'pl35x_nandc'


vim +147 drivers/mtd/nand/raw/pl35x-nand-controller.c

   126	
   127	/**
   128	 * struct pl35x_nandc - NAND flash controller driver structure
   129	 * @dev: Kernel device
   130	 * @conf_regs: SMC configuration registers for command phase
   131	 * @io_regs: NAND data registers for data phase
   132	 * @controller: Core NAND controller structure
   133	 * @chip: NAND chip information structure
   134	 * @selected_chip: NAND chip currently selected by the controller
   135	 * @assigned_cs: List of assigned CS
   136	 * @ecc_buf: Temporary buffer to extract ECC bytes
   137	 */
   138	struct pl35x_nandc {
   139		struct device *dev;
   140		void __iomem *conf_regs;
   141		void __iomem *io_regs;
   142		struct nand_controller controller;
   143		struct list_head chips;
   144		struct nand_chip *selected_chip;
   145		unsigned long assigned_cs;
   146		u8 *ecc_buf;
 > 147	};
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
