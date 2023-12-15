Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B182ED7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glNNkkMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702661708; x=1734197708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/l2aqSYWBGzxKLvuWdFo29HbMJnt4OLKx5glftpckYs=;
  b=glNNkkMU8mzXj20i1s9WKyFybDbsMvvuOmlUeJ6famaMaL2po5qxynaP
   H8kJzfgqlNOsqNdGCBh2FfAYoQKkU7BuhtPWGUDnIeOvczH1yuaV6rCDw
   WOW9SXdnGCuRXwfdKMb89i7WigLqLV1qulz+HNVDO0JkTmkRL11eHKGpU
   YxhZbewdGGfp3uF6FFp7F/1TSSxqXHVsNqFIg/GroajE9IoFkzMgu0/zt
   J99nI5fpe2kV3G8xaTSoZsPxpyDKuiBXzFnJDMSwqJtxZWPHL/XIif7BI
   L1l07BrxpjdXRMeMMD7XE4DEzJ2UHLW5L4Bk1WHFsW6tbl4ZOOd8QXA0p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16857152"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="16857152"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778335985"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="778335985"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2023 09:35:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEC5X-0000YM-0Z;
	Fri, 15 Dec 2023 17:35:03 +0000
Date: Sat, 16 Dec 2023 01:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-remove-zone-aware 4/5] block/blk-settings.c:892:
 warning: Excess function parameter 'zoned' description in 'disk_set_zoned'
Message-ID: <202312160138.YvdlJaFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-remove-zone-aware
head:   e9c13463aabbb37d90e6d9b9e561815605133964
commit: 9e7417496812d88b740405f0ff9cec8a84d4662b [4/5] block: simplify disk_set_zoned
config: i386-buildonly-randconfig-003-20231215 (https://download.01.org/0day-ci/archive/20231216/202312160138.YvdlJaFJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160138.YvdlJaFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160138.YvdlJaFJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-settings.c:892: warning: Excess function parameter 'zoned' description in 'disk_set_zoned'


vim +892 block/blk-settings.c

45147fb522bb459 Yoshihiro Shimoda 2019-08-28  882  
27ba3e8ff3ab864 Damien Le Moal    2020-09-15  883  /**
6b2bd274744e645 Christoph Hellwig 2022-07-06  884   * disk_set_zoned - configure the zoned model for a disk
27ba3e8ff3ab864 Damien Le Moal    2020-09-15  885   * @disk:	the gendisk of the queue to configure
b2489c2f3342020 Christoph Hellwig 2023-12-15  886   * @zoned:	zoned or not.
6b2bd274744e645 Christoph Hellwig 2022-07-06  887   *
b2489c2f3342020 Christoph Hellwig 2023-12-15  888   * When @zoned is %true, this should be called only if zoned block device
b2489c2f3342020 Christoph Hellwig 2023-12-15  889   * support is enabled (CONFIG_BLK_DEV_ZONED option).
27ba3e8ff3ab864 Damien Le Moal    2020-09-15  890   */
9e7417496812d88 Christoph Hellwig 2023-12-15  891  void disk_set_zoned(struct gendisk *disk)
27ba3e8ff3ab864 Damien Le Moal    2020-09-15 @892  {
a805a4fa4fa376b Damien Le Moal    2021-01-28  893  	struct request_queue *q = disk->queue;
a805a4fa4fa376b Damien Le Moal    2021-01-28  894  
27ba3e8ff3ab864 Damien Le Moal    2020-09-15  895  	WARN_ON_ONCE(!IS_ENABLED(CONFIG_BLK_DEV_ZONED));
b2489c2f3342020 Christoph Hellwig 2023-12-15  896  
a805a4fa4fa376b Damien Le Moal    2021-01-28  897  	/*
a805a4fa4fa376b Damien Le Moal    2021-01-28  898  	 * Set the zone write granularity to the device logical block
a805a4fa4fa376b Damien Le Moal    2021-01-28  899  	 * size by default. The driver can change this value if needed.
a805a4fa4fa376b Damien Le Moal    2021-01-28  900  	 */
b2489c2f3342020 Christoph Hellwig 2023-12-15  901  	q->limits.zoned = true;
9e7417496812d88 Christoph Hellwig 2023-12-15  902  	blk_queue_zone_write_granularity(q, queue_logical_block_size(q));
27ba3e8ff3ab864 Damien Le Moal    2020-09-15  903  }
6b2bd274744e645 Christoph Hellwig 2022-07-06  904  EXPORT_SYMBOL_GPL(disk_set_zoned);
89098b075cb74a8 Christoph Hellwig 2022-04-15  905  

:::::: The code at line 892 was first introduced by commit
:::::: 27ba3e8ff3ab86449e63d38a8d623053591e65fa scsi: sd: sd_zbc: Fix handling of host-aware ZBC disks

:::::: TO: Damien Le Moal <damien.lemoal@wdc.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
