Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5918158A32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580096; cv=none; b=uc6ZJvUaZERAgvDegJA45X4WXWxI3cWbwQH+ITjGpucpkO59IoJxsMTFRd+kKq74mc9IgfUazyRFfOKIaH0rlN2yyuO2WBAL/DkA0X22dnFpmzTV6cM4OVyJLLmSzxR+cmYe+8zchSTx1GiePGkfbSUXnWJhXLAYZ5c9WCnvDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580096; c=relaxed/simple;
	bh=yFBifTojh8XyP9EOmKses8HD7xHaBZOeGehh9X+CDco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVt1w8uF424DcJinkVFDuL04gcWSv30GpBOcId55iHAf1IRkfI3gto3iFMxHzGbnjvdKJAVuEIywnOnv6R95bfVKPErqL2WdT18Nj1ZEButbek5kEd9BXWaCGA9J9hhZRr7UH/rTrQh55p4tMSrD055SPmYr3hlpidku7EV16Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwK31Lr7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwK31Lr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719580094; x=1751116094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFBifTojh8XyP9EOmKses8HD7xHaBZOeGehh9X+CDco=;
  b=MwK31Lr7Cfnf+eMlMFXZdaHAiuzWeiA7bAL//ZuPZU3q3Q2OxLIJ92VG
   OqCPmZcbscoxG07HYEh53toYAdO14vORX1mOIDpaw8Uo3Ab2bme+s7RNk
   frqk5XwfMVCJC5dWR5LUuho0DBYwcrocl7jZkDKsAw5fmthWUIj5sxV0Y
   YP8m6/r4g6lMh41k8x4kslv4OoeG0dm4CNxo/8vGUazMXeVDRWXo47KFT
   7VgdPUK6iGEenjwmcs5mWgykNUT1FhLzx86aK/Tns/f9jpTvoCNQaBAXj
   YAheYSxAY5tPwbZd5rtP19kNh/bg52gwJymmIn29M9pVDvdLmpeL+JnKU
   g==;
X-CSE-ConnectionGUID: lU4bBZC4QNCD1CWph5kMFQ==
X-CSE-MsgGUID: q2aPJgEhT/qjl91o5VmP4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16892576"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16892576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:08:13 -0700
X-CSE-ConnectionGUID: t2reWVBaS7eYGBPkTfXd5w==
X-CSE-MsgGUID: eggWCmkgSZm4P4vKnxjuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="75470673"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2024 06:08:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNBKj-000H7u-2C;
	Fri, 28 Jun 2024 13:08:09 +0000
Date: Fri, 28 Jun 2024 21:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [axboe-block:for-next 99/111] drivers/md/bcache/super.c:1419:47:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202406282128.3uJdit5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   bc512ae8cb934ac31470bc825fa25f9f5f99a720
commit: fcf865e357f80285af12c0c9a49f89d71acb7f4b [99/111] block: convert features and flags to __bitwise types
config: i386-randconfig-062-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282128.3uJdit5K-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282128.3uJdit5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282128.3uJdit5K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/bcache/super.c: note: in included file (through drivers/md/bcache/bcache.h):
   drivers/md/bcache/bset.h:231:36: sparse: sparse: array of flexible structures
   drivers/md/bcache/super.c: note: in included file (through drivers/md/bcache/bcache.h):
   drivers/md/bcache/bcache_ondisk.h:363:17: sparse: sparse: array of flexible structures
   drivers/md/bcache/super.c:208:24: sparse: sparse: cast from restricted __le16
   drivers/md/bcache/super.c:208:14: sparse: sparse: restricted __le64 degrades to integer
   drivers/md/bcache/super.c:322:21: sparse: sparse: cast from restricted __le16
   drivers/md/bcache/super.c:322:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] csum @@     got unsigned long long @@
   drivers/md/bcache/super.c:322:19: sparse:     expected restricted __le64 [usertype] csum
   drivers/md/bcache/super.c:322:19: sparse:     got unsigned long long
   drivers/md/bcache/super.c:651:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] prio @@     got restricted __le16 [usertype] @@
   drivers/md/bcache/super.c:651:33: sparse:     expected unsigned short [usertype] prio
   drivers/md/bcache/super.c:651:33: sparse:     got restricted __le16 [usertype]
   drivers/md/bcache/super.c:724:27: sparse: sparse: cast to restricted __le16
   drivers/md/bcache/super.c:835:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] invalidated @@     got restricted __le32 [usertype] @@
   drivers/md/bcache/super.c:835:32: sparse:     expected unsigned int [usertype] invalidated
   drivers/md/bcache/super.c:835:32: sparse:     got restricted __le32 [usertype]
   drivers/md/bcache/super.c:1191:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] rtime @@     got restricted __le32 [usertype] @@
   drivers/md/bcache/super.c:1191:26: sparse:     expected unsigned int [usertype] rtime
   drivers/md/bcache/super.c:1191:26: sparse:     got restricted __le32 [usertype]
   drivers/md/bcache/super.c:1233:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] invalidated @@     got restricted __le32 [usertype] @@
   drivers/md/bcache/super.c:1233:32: sparse:     expected unsigned int [usertype] invalidated
   drivers/md/bcache/super.c:1233:32: sparse:     got restricted __le32 [usertype]
>> drivers/md/bcache/super.c:1419:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int partial_stripes_expensive:1 @@     got restricted blk_features_t @@
   drivers/md/bcache/super.c:1419:47: sparse:     expected unsigned int partial_stripes_expensive:1
   drivers/md/bcache/super.c:1419:47: sparse:     got restricted blk_features_t
   drivers/md/bcache/super.c:1594:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] last_reg @@     got restricted __le32 [usertype] @@
   drivers/md/bcache/super.c:1594:36: sparse:     expected unsigned int [usertype] last_reg
   drivers/md/bcache/super.c:1594:36: sparse:     got restricted __le32 [usertype]
   drivers/md/bcache/super.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> drivers/mmc/core/queue.c:351:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted blk_features_t [usertype] features @@     got unsigned int features @@
   drivers/mmc/core/queue.c:351:43: sparse:     expected restricted blk_features_t [usertype] features
   drivers/mmc/core/queue.c:351:43: sparse:     got unsigned int features
--
>> drivers/mmc/core/block.c:2513:26: sparse: sparse: invalid assignment: |=
   drivers/mmc/core/block.c:2513:26: sparse:    left side has type unsigned int
   drivers/mmc/core/block.c:2513:26: sparse:    right side has type restricted blk_features_t
   drivers/mmc/core/block.c:2515:26: sparse: sparse: invalid assignment: |=
   drivers/mmc/core/block.c:2515:26: sparse:    left side has type unsigned int
   drivers/mmc/core/block.c:2515:26: sparse:    right side has type restricted blk_features_t
   drivers/mmc/core/block.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1419 drivers/md/bcache/super.c

cafe563591446c Kent Overstreet   2013-03-23  1393  
6f10f7d1b02b1b Coly Li           2018-08-11  1394  static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
cafe563591446c Kent Overstreet   2013-03-23  1395  {
f59fce847fc848 Kent Overstreet   2013-05-15  1396  	int ret;
cafe563591446c Kent Overstreet   2013-03-23  1397  	struct io *io;
f59fce847fc848 Kent Overstreet   2013-05-15  1398  	struct request_queue *q = bdev_get_queue(dc->bdev);
cafe563591446c Kent Overstreet   2013-03-23  1399  
cafe563591446c Kent Overstreet   2013-03-23  1400  	__module_get(THIS_MODULE);
cafe563591446c Kent Overstreet   2013-03-23  1401  	INIT_LIST_HEAD(&dc->list);
f59fce847fc848 Kent Overstreet   2013-05-15  1402  	closure_init(&dc->disk.cl, NULL);
f59fce847fc848 Kent Overstreet   2013-05-15  1403  	set_closure_fn(&dc->disk.cl, cached_dev_flush, system_wq);
cafe563591446c Kent Overstreet   2013-03-23  1404  	kobject_init(&dc->disk.kobj, &bch_cached_dev_ktype);
cafe563591446c Kent Overstreet   2013-03-23  1405  	INIT_WORK(&dc->detach, cached_dev_detach_finish);
cb7a583e6a6ace Kent Overstreet   2013-12-16  1406  	sema_init(&dc->sb_write_mutex, 1);
f59fce847fc848 Kent Overstreet   2013-05-15  1407  	INIT_LIST_HEAD(&dc->io_lru);
f59fce847fc848 Kent Overstreet   2013-05-15  1408  	spin_lock_init(&dc->io_lock);
f59fce847fc848 Kent Overstreet   2013-05-15  1409  	bch_cache_accounting_init(&dc->accounting, &dc->disk.cl);
cafe563591446c Kent Overstreet   2013-03-23  1410  
cafe563591446c Kent Overstreet   2013-03-23  1411  	dc->sequential_cutoff		= 4 << 20;
cafe563591446c Kent Overstreet   2013-03-23  1412  
cafe563591446c Kent Overstreet   2013-03-23  1413  	for (io = dc->io; io < dc->io + RECENT_IO; io++) {
cafe563591446c Kent Overstreet   2013-03-23  1414  		list_add(&io->lru, &dc->io_lru);
cafe563591446c Kent Overstreet   2013-03-23  1415  		hlist_add_head(&io->hash, dc->io_hash + RECENT_IO);
cafe563591446c Kent Overstreet   2013-03-23  1416  	}
cafe563591446c Kent Overstreet   2013-03-23  1417  
34a2cf3fbef17d Christoph Hellwig 2024-02-26  1418  	if (bdev_io_opt(dc->bdev))
7d4dec525f5fd5 Christoph Hellwig 2024-06-19 @1419  		dc->partial_stripes_expensive = q->limits.features &
7d4dec525f5fd5 Christoph Hellwig 2024-06-19  1420  			BLK_FEAT_RAID_PARTIAL_STRIPES_EXPENSIVE;
c78afc6261b09f Kent Overstreet   2013-07-11  1421  
279afbad4e54ac Kent Overstreet   2013-06-05  1422  	ret = bcache_device_init(&dc->disk, block_size,
a782483cc1f875 Christoph Hellwig 2020-11-26  1423  			 bdev_nr_sectors(dc->bdev) - dc->sb.data_offset,
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  1424  			 dc->bdev, &bcache_cached_ops);
f59fce847fc848 Kent Overstreet   2013-05-15  1425  	if (ret)
f59fce847fc848 Kent Overstreet   2013-05-15  1426  		return ret;
f59fce847fc848 Kent Overstreet   2013-05-15  1427  
c7b7bd07404c52 Coly Li           2018-03-18  1428  	atomic_set(&dc->io_errors, 0);
c7b7bd07404c52 Coly Li           2018-03-18  1429  	dc->io_disable = false;
c7b7bd07404c52 Coly Li           2018-03-18  1430  	dc->error_limit = DEFAULT_CACHED_DEV_ERROR_LIMIT;
7e027ca4b534b6 Coly Li           2018-03-18  1431  	/* default to auto */
7e027ca4b534b6 Coly Li           2018-03-18  1432  	dc->stop_when_cache_set_failed = BCH_CACHED_DEV_STOP_AUTO;
7e027ca4b534b6 Coly Li           2018-03-18  1433  
f59fce847fc848 Kent Overstreet   2013-05-15  1434  	bch_cached_dev_request_init(dc);
f59fce847fc848 Kent Overstreet   2013-05-15  1435  	bch_cached_dev_writeback_init(dc);
cafe563591446c Kent Overstreet   2013-03-23  1436  	return 0;
cafe563591446c Kent Overstreet   2013-03-23  1437  }
cafe563591446c Kent Overstreet   2013-03-23  1438  

:::::: The code at line 1419 was first introduced by commit
:::::: 7d4dec525f5fd555037486af4d02dd3682655ba1 block: move the raid_partial_stripes_expensive flag into the features field

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
