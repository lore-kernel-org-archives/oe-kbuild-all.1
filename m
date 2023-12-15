Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860AC3A8DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwrKhyzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702666219; x=1734202219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1k9Lgc47Ckd8ri9LN03yrIWTzZkKDZ+dafIRKmH6qIs=;
  b=EwrKhyzn6IOqH8aCcZlhobI0tspIloPdOba2cbUm/cP/KRrWGXvoIDru
   Qlnj5kKHTvytWHQXJjIhLTvTMBe0nT32rW3ORAkSdf79eb1c2bIei/m0T
   A9vnJSSAPclAoA1rZQueeULlCly4YcBYPo4WoIq4iDFOyu36ARYdL0Zrb
   QioDAO+jHdik9yiZBdK4fZB9isJYxsbsdamfv++NNFVBfB0PNxTwSO4E8
   fb1/FD8OMI4LV8Tj6KGcvmLxA9g5kp6EubY09+yh+tB3VTBhCxuKkfk71
   6vnZ2F6HofpOlk04zXUPvbMrF5T0YDbWEuP6CtoBIKmulilYYW3gcNY6n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="399151997"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="399151997"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 10:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="892992473"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="892992473"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2023 10:50:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEDGJ-0000dF-1D;
	Fri, 15 Dec 2023 18:50:15 +0000
Date: Sat, 16 Dec 2023 02:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-remove-zone-aware 3/5] drivers/scsi/sd.c:3120:5:
 warning: variable 'zoned' set but not used
Message-ID: <202312160225.a3L2ZXWa-lkp@intel.com>
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
commit: b2489c2f3342020db846f6beafe5df29b72c8765 [3/5] block: remove support for the host aware zone model
config: i386-buildonly-randconfig-002-20231215 (https://download.01.org/0day-ci/archive/20231216/202312160225.a3L2ZXWa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160225.a3L2ZXWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160225.a3L2ZXWa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sd.c:3120:5: warning: variable 'zoned' set but not used [-Wunused-but-set-variable]
           u8 zoned;
              ^
   1 warning generated.


vim +/zoned +3120 drivers/scsi/sd.c

d11b6916961d6e Martin K. Petersen   2009-05-23  3110  
3821d768912a47 Martin K. Petersen   2009-05-23  3111  /**
3821d768912a47 Martin K. Petersen   2009-05-23  3112   * sd_read_block_characteristics - Query block dev. characteristics
7529fbb0080d67 Damien Le Moal       2017-04-24  3113   * @sdkp: disk to query
3821d768912a47 Martin K. Petersen   2009-05-23  3114   */
3821d768912a47 Martin K. Petersen   2009-05-23  3115  static void sd_read_block_characteristics(struct scsi_disk *sdkp)
3821d768912a47 Martin K. Petersen   2009-05-23  3116  {
89d9475610771b Hannes Reinecke      2016-10-18  3117  	struct request_queue *q = sdkp->disk->queue;
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3118  	struct scsi_vpd *vpd;
3821d768912a47 Martin K. Petersen   2009-05-23  3119  	u16 rot;
7fb019c46eeea4 Martin K. Petersen   2022-03-02 @3120  	u8 zoned;
3821d768912a47 Martin K. Petersen   2009-05-23  3121  
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3122  	rcu_read_lock();
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3123  	vpd = rcu_dereference(sdkp->device->vpd_pgb1);
3821d768912a47 Martin K. Petersen   2009-05-23  3124  
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3125  	if (!vpd || vpd->len < 8) {
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3126  		rcu_read_unlock();
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3127  	        return;
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3128  	}
3821d768912a47 Martin K. Petersen   2009-05-23  3129  
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3130  	rot = get_unaligned_be16(&vpd->data[4]);
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3131  	zoned = (vpd->data[8] >> 4) & 3;
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3132  	rcu_read_unlock();
3821d768912a47 Martin K. Petersen   2009-05-23  3133  
b277da0a8a5943 Mike Snitzer         2014-10-04  3134  	if (rot == 1) {
8b904b5b6b58b9 Bart Van Assche      2018-03-07  3135  		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
8b904b5b6b58b9 Bart Van Assche      2018-03-07  3136  		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
b277da0a8a5943 Mike Snitzer         2014-10-04  3137  	}
3821d768912a47 Martin K. Petersen   2009-05-23  3138  
68af412c7713b5 Damien Le Moal       2017-01-12  3139  	if (sdkp->device->type == TYPE_ZBC) {
288b3271d920c9 Shin'ichiro Kawasaki 2023-03-06  3140  		/*
b2489c2f334202 Christoph Hellwig    2023-12-15  3141  		 * Host-managed.
b2489c2f334202 Christoph Hellwig    2023-12-15  3142  		 */
b2489c2f334202 Christoph Hellwig    2023-12-15  3143  		disk_set_zoned(sdkp->disk, true);
b2489c2f334202 Christoph Hellwig    2023-12-15  3144  
b2489c2f334202 Christoph Hellwig    2023-12-15  3145  		/*
b2489c2f334202 Christoph Hellwig    2023-12-15  3146  		 * Per ZBC and ZAC specifications, writes in sequential write
b2489c2f334202 Christoph Hellwig    2023-12-15  3147  		 * required zones of host-managed devices must be aligned to
b2489c2f334202 Christoph Hellwig    2023-12-15  3148  		 * the device physical block size.
288b3271d920c9 Shin'ichiro Kawasaki 2023-03-06  3149  		 */
288b3271d920c9 Shin'ichiro Kawasaki 2023-03-06  3150  		blk_queue_zone_write_granularity(q, sdkp->physical_block_size);
68af412c7713b5 Damien Le Moal       2017-01-12  3151  	} else {
b2489c2f334202 Christoph Hellwig    2023-12-15  3152  		/*
b2489c2f334202 Christoph Hellwig    2023-12-15  3153  		 * Anything else.  This includes host-aware device that we treat
b2489c2f334202 Christoph Hellwig    2023-12-15  3154  		 * as conventional.
b2489c2f334202 Christoph Hellwig    2023-12-15  3155  		 */
b2489c2f334202 Christoph Hellwig    2023-12-15  3156  		disk_set_zoned(sdkp->disk, false);
b72053072c0bbe Christoph Hellwig    2020-01-26  3157  	}
27ba3e8ff3ab86 Damien Le Moal       2020-09-15  3158  
27ba3e8ff3ab86 Damien Le Moal       2020-09-15  3159  	if (!sdkp->first_scan)
7fb019c46eeea4 Martin K. Petersen   2022-03-02  3160  		return;
27ba3e8ff3ab86 Damien Le Moal       2020-09-15  3161  
b2489c2f334202 Christoph Hellwig    2023-12-15  3162  	if (blk_queue_is_zoned(q))
b2489c2f334202 Christoph Hellwig    2023-12-15  3163  		sd_printk(KERN_NOTICE, sdkp, "Host-managed zoned block device\n");
b2489c2f334202 Christoph Hellwig    2023-12-15  3164  	else if (sdkp->zoned == 1)
b2489c2f334202 Christoph Hellwig    2023-12-15  3165  		sd_printk(KERN_NOTICE, sdkp, "Host-aware SMR disk used as regular disk\n");
27ba3e8ff3ab86 Damien Le Moal       2020-09-15  3166  	else if (sdkp->zoned == 2)
b2489c2f334202 Christoph Hellwig    2023-12-15  3167  		sd_printk(KERN_NOTICE, sdkp, "Drive-managed SMR disk\n");
3821d768912a47 Martin K. Petersen   2009-05-23  3168  }
3821d768912a47 Martin K. Petersen   2009-05-23  3169  

:::::: The code at line 3120 was first introduced by commit
:::::: 7fb019c46eeea4e3cc3ddfd3e01a24e610f34fac scsi: sd: Switch to using scsi_device VPD pages

:::::: TO: Martin K. Petersen <martin.petersen@oracle.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
