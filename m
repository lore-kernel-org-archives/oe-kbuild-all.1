Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9C7D2F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692260273; x=1723796273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYZa3PoCuppwCeKMvv+HdhO8rkJ2HvfaxcwLoQqTRsM=;
  b=V2n3Gvjr8xhIRhAm3rqv2U3HbliJaGogoc92BKKuRBr8FaNulMzdl3vM
   zvR09Xmci+9egzazOfxeYV2KBQ62it4P7n7Ptw9JOhxKl74xRSzbLRO+S
   8jKmHT/m4+4uqtdL51e8VwF3yYmsuQHkVhsHhWEj8mnjVNn6DDAYJDY3w
   O+CdxOdKs7eVO+nCCJNl/52aQaIZJzCMAMLuHkfXsCqkidJwEJZ2mASih
   tiDt6DadepH47rIYtpwRsTNPWW4q/zzwpirdUZuonQchATQpIEnaQs/FX
   s63ekKLYPqz+NgcG7EgYHyKnFRV+5QKYZHsVxJzL15VvMNDaVRBXVcrxf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353063410"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353063410"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769524777"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="769524777"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 01:17:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWYCU-0000wV-1Q;
	Thu, 17 Aug 2023 08:17:50 +0000
Date: Thu, 17 Aug 2023 16:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Subject: kernel/power/swap.c:1570: warning: Function parameter or member
 'snapshot_test' not described in 'swsusp_close'
Message-ID: <202308171645.cgBSXD7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 2736e8eeb0ccdc71d1f4256c9c9a28f58cc43307 block: use the holder as indication for exclusive opens
date:   9 weeks ago
config: powerpc-randconfig-r023-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171645.cgBSXD7v-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171645.cgBSXD7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171645.cgBSXD7v-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +1570 kernel/power/swap.c

61159a314bca640 Rafael J. Wysocki 2006-03-23  1564  
61159a314bca640 Rafael J. Wysocki 2006-03-23  1565  /**
61159a314bca640 Rafael J. Wysocki 2006-03-23  1566   *	swsusp_close - close swap device.
61159a314bca640 Rafael J. Wysocki 2006-03-23  1567   */
61159a314bca640 Rafael J. Wysocki 2006-03-23  1568  
2736e8eeb0ccdc7 Christoph Hellwig 2023-06-08  1569  void swsusp_close(bool snapshot_test)
61159a314bca640 Rafael J. Wysocki 2006-03-23 @1570  {
8a0d613fa12e1b7 Jiri Slaby        2010-05-01  1571  	if (IS_ERR(hib_resume_bdev)) {
64ec72a1ece37d9 Joe Perches       2017-09-27  1572  		pr_debug("Image device not initialised\n");
61159a314bca640 Rafael J. Wysocki 2006-03-23  1573  		return;
61159a314bca640 Rafael J. Wysocki 2006-03-23  1574  	}
61159a314bca640 Rafael J. Wysocki 2006-03-23  1575  
2736e8eeb0ccdc7 Christoph Hellwig 2023-06-08  1576  	blkdev_put(hib_resume_bdev, snapshot_test ? &swsusp_holder : NULL);
61159a314bca640 Rafael J. Wysocki 2006-03-23  1577  }
1b29c1643c0d825 Vivek Goyal       2007-05-02  1578  

:::::: The code at line 1570 was first introduced by commit
:::::: 61159a314bca6408320c3173c1282c64f5cdaa76 [PATCH] swsusp: separate swap-writing/reading code

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
