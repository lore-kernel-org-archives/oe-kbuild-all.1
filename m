Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019F111AC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2qIPUDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699527361; x=1731063361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHbCB0Tsd7vTQd+/m+4w3LeZBj2P3U5s5wl3JlDdSGI=;
  b=H2qIPUDbMZH3ocwZVMBCpstzq99p8zYnzpbMWcC7NYzqPalhwn+fGhaB
   3qBK5ZovtRkhfb+XE7M5FJybrccyUtgkkLHxH3cCB+LIXjr9UucrhVmGb
   Y/VhEtkE6/9If1zSEKCt6NmTDtD3bolsP2zlQPR3oAJDSfIqJRJNXU5/l
   dGOy1+/alNvJcs+FYzHZLiYNBOSBjmPAJOLKUuGEmO810ZbZw9JbvcCBJ
   hYOaCVAduvrfHh0fE2rw2+SttU1QJhocVZ+bECG7JkM42xh6eclZShhgf
   aIfIXKokn9FTEbzy9iFAION0FkU3L/AyhQ5g8GHKKVdyK6cWx1cAF+89J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="387125184"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="387125184"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 02:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886953315"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="886953315"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 02:55:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r12hF-0008fs-0e;
	Thu, 09 Nov 2023 10:55:37 +0000
Date: Thu, 9 Nov 2023 18:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [sverdlin:ep93xx-i2s-dma 10/45] drivers/dma/ep93xx_dma.c:195:
 warning: Function parameter or member 'dma_cfg' not described in
 'ep93xx_dma_chan'
Message-ID: <202311091804.kEegAihp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-i2s-dma
head:   db43a4982f02503f279651d9164f191695e4aa72
commit: 73e558c51814a3af3c3a6e9a77fc216444c5b93d [10/45] dma: cirrus: add DT support for Cirrus EP93xx
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231109/202311091804.kEegAihp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091804.kEegAihp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091804.kEegAihp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/ep93xx_dma.c:195: warning: Function parameter or member 'dma_cfg' not described in 'ep93xx_dma_chan'


vim +195 drivers/dma/ep93xx_dma.c

5fa29a17fabfe2 Mika Westerberg 2011-05-29  187  
5fa29a17fabfe2 Mika Westerberg 2011-05-29  188  	int				buffer;
5fa29a17fabfe2 Mika Westerberg 2011-05-29  189  	struct list_head		active;
5fa29a17fabfe2 Mika Westerberg 2011-05-29  190  	struct list_head		queue;
5fa29a17fabfe2 Mika Westerberg 2011-05-29  191  	struct list_head		free_list;
5fa29a17fabfe2 Mika Westerberg 2011-05-29  192  	u32				runtime_addr;
5fa29a17fabfe2 Mika Westerberg 2011-05-29  193  	u32				runtime_ctrl;
4e3c40408ab8dc Vinod Koul      2018-07-19  194  	struct dma_slave_config		slave_config;
5fa29a17fabfe2 Mika Westerberg 2011-05-29 @195  };
5fa29a17fabfe2 Mika Westerberg 2011-05-29  196  

:::::: The code at line 195 was first introduced by commit
:::::: 5fa29a17fabfe204fa9f20edd5fc81ab2364eb4b dmaengine: add ep93xx DMA support

:::::: TO: Mika Westerberg <mika.westerberg@iki.fi>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
