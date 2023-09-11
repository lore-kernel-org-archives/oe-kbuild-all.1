Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B564E554
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694434873; x=1725970873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nwifj3QZPTBhAtia8klKFNb88Tbo5yFt/Vfp+yPm1I=;
  b=gCmAOonnUumuqOmn6rZ3wwJN0OnUpZrPL0ATCeOF3+dbuUxcdn5VCLM3
   UVTassHwD/0Ks3yc2JRWEV6ki47Nr9YJn1mewAehJNkbCIevSktEKJ8Un
   D/18pM9Va0KfpyqvWcEAUFKGuj+L8zq5N22Boko8qnzHAU1UqqwmbvCMs
   bkQmHXMYNBKjcWk5x1K3/0ue4lRjgsuYpMrpUHOPILye9LO8qDTfANA/N
   FEf6tdVa/ZAD8sBP4G+SRarWByiEOC99IgdQQd6mSw6AHAzadu67okoTb
   urMJhv4kY32hD6Qrvek4k6FY3fHjw7qie6TqaPS6ZGGyeSyv92/B1HdtG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363087624"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363087624"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 05:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833485284"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833485284"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 05:21:09 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qffud-0006Ck-2K;
	Mon, 11 Sep 2023 12:21:07 +0000
Date: Mon, 11 Sep 2023 20:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Subject: kernel/power/swap.c:1570: warning: Function parameter or member
 'snapshot_test' not described in 'swsusp_close'
Message-ID: <202309112011.MJzjBMxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 2736e8eeb0ccdc71d1f4256c9c9a28f58cc43307 block: use the holder as indication for exclusive opens
date:   3 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230911/202309112011.MJzjBMxT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309112011.MJzjBMxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309112011.MJzjBMxT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/swap.c:543: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:543: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:543: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:890: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1061: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1061: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1061: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
   kernel/power/swap.c:1520: warning: Function parameter or member 'snapshot_test' not described in 'swsusp_check'
>> kernel/power/swap.c:1570: warning: Function parameter or member 'snapshot_test' not described in 'swsusp_close'


vim +1570 kernel/power/swap.c

61159a314bca64 Rafael J. Wysocki 2006-03-23  1564  
61159a314bca64 Rafael J. Wysocki 2006-03-23  1565  /**
61159a314bca64 Rafael J. Wysocki 2006-03-23  1566   *	swsusp_close - close swap device.
61159a314bca64 Rafael J. Wysocki 2006-03-23  1567   */
61159a314bca64 Rafael J. Wysocki 2006-03-23  1568  
2736e8eeb0ccdc Christoph Hellwig 2023-06-08  1569  void swsusp_close(bool snapshot_test)
61159a314bca64 Rafael J. Wysocki 2006-03-23 @1570  {
8a0d613fa12e1b Jiri Slaby        2010-05-01  1571  	if (IS_ERR(hib_resume_bdev)) {
64ec72a1ece37d Joe Perches       2017-09-27  1572  		pr_debug("Image device not initialised\n");
61159a314bca64 Rafael J. Wysocki 2006-03-23  1573  		return;
61159a314bca64 Rafael J. Wysocki 2006-03-23  1574  	}
61159a314bca64 Rafael J. Wysocki 2006-03-23  1575  
2736e8eeb0ccdc Christoph Hellwig 2023-06-08  1576  	blkdev_put(hib_resume_bdev, snapshot_test ? &swsusp_holder : NULL);
61159a314bca64 Rafael J. Wysocki 2006-03-23  1577  }
1b29c1643c0d82 Vivek Goyal       2007-05-02  1578  

:::::: The code at line 1570 was first introduced by commit
:::::: 61159a314bca6408320c3173c1282c64f5cdaa76 [PATCH] swsusp: separate swap-writing/reading code

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
