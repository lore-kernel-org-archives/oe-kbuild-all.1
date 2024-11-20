Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403592E3FE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732079997; cv=none; b=qz/TVY/pUkFSSMp4OeSRPkmOaa6iCoIEebvapcli4XmcBcWSM5d5b0+SCm5CMIRbMe8eTnQnAPLcIu289ro4oaTMnklNm+tFM18ZJwh8J07OidC1kXZ3A3Y/Buv+VhNGRE/4uce3W3ZHvDJewy7IfNL5rBZIwUHzybA0Aj3E0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732079997; c=relaxed/simple;
	bh=EA5D/7Gi1xOdYC2jqfX+VvAE2BgV8zrcBIIIr6xgfck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IalQDAt0GDxOLQKWvQidzI3bGs5GNxkTvhriiLftGBbdT3WgMOqgZHKWwa4b9sgBywxVqVLLmMFqBmRTo/aC0RFvOobHpb3mCQGJ2+1//i16YC/XDIoj0BAKAKCZThQbGGlbnhBknVOmcWFP8gbCuy+n7GRVv49fOTIP1JMm/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHsrzSj+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHsrzSj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732079995; x=1763615995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EA5D/7Gi1xOdYC2jqfX+VvAE2BgV8zrcBIIIr6xgfck=;
  b=AHsrzSj+9qpFRBI3DduAX3DCSRR8OHPfn47o9JBWLuzLMafmIiC2rmdz
   CF1jDcdVyBVpIPkfoYnkzycOmAHcLdQfs3hpqWukMxE59kBeYoTqouRAk
   UJsO6474CsZ4ZlB18u/EtIbBxA3pN1UyX6kEYCDcwBVUehfvH1hFkjXgv
   sgABWDB3EREwzMALIy/IZu6DuwlX14TfeDU+FrbvFDH93+wzSOY8PpRQx
   B0LdnVVF+eacKBnlNpqt9CERwaeHOikMmb9dySgr/p+JL8Dc3U/DT40pw
   XIY6ROpTJTc/9JY+6cEKpw96FeFq2vYbdJfw4BloyaiMeTvSszD+inmXz
   w==;
X-CSE-ConnectionGUID: 91vptwL7Q/Klji6vbJGwKQ==
X-CSE-MsgGUID: qpt8HNvhTk+a/EyWVgKR4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32177754"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="32177754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 21:19:52 -0800
X-CSE-ConnectionGUID: az8NDulURRiQfan/3e8ITg==
X-CSE-MsgGUID: qCMVZJ1uQBaf+MW0hFatgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="120743996"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2024 21:19:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDd81-0000Un-0D;
	Wed, 20 Nov 2024 05:19:49 +0000
Date: Wed, 20 Nov 2024 13:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 4/60] include/linux/blkdev.h:1401:26: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202411201319.qmplzmb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   3cb765742058ecc19642d410a3e8cc3a8473fd9e
commit: 72734f9439ea03102673d6ef7e7dbe01aacf83cc [4/60] block: Add a public bdev_zone_is_seq() helper
config: x86_64-randconfig-122-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201319.qmplzmb0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201319.qmplzmb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201319.qmplzmb0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-zoned.c:1461:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long const *src @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   block/blk-zoned.c:1461:51: sparse:     expected unsigned long const *src
   block/blk-zoned.c:1461:51: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c:493:30: sparse: sparse: context imbalance in 'disk_get_and_lock_zone_wplug' - wrong count at exit
   block/blk-zoned.c: note: in included file:
>> include/linux/blkdev.h:1401:26: sparse: sparse: cast removes address space '__rcu' of expression
>> include/linux/blkdev.h:1401:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   include/linux/blkdev.h:1401:26: sparse:     expected unsigned long const volatile *addr
   include/linux/blkdev.h:1401:26: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
>> include/linux/blkdev.h:1401:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   include/linux/blkdev.h:1401:26: sparse:     expected unsigned long const volatile *addr
   include/linux/blkdev.h:1401:26: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   block/blk-zoned.c: note: in included file:
>> include/linux/blkdev.h:1401:26: sparse: sparse: cast removes address space '__rcu' of expression
>> include/linux/blkdev.h:1401:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   include/linux/blkdev.h:1401:26: sparse:     expected unsigned long const volatile *addr
   include/linux/blkdev.h:1401:26: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
>> include/linux/blkdev.h:1401:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   include/linux/blkdev.h:1401:26: sparse:     expected unsigned long const volatile *addr
   include/linux/blkdev.h:1401:26: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:529:9: sparse: sparse: context imbalance in 'blk_zone_wplug_handle_write' - unexpected unlock
   block/blk-zoned.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   block/blk-zoned.c:1675:31: sparse: sparse: context imbalance in 'blk_revalidate_seq_zone' - unexpected unlock

vim +/__rcu +1401 include/linux/blkdev.h

  1383	
  1384	/**
  1385	 * bdev_zone_is_seq - check if a sector belongs to a sequential write zone
  1386	 * @bdev:	block device to check
  1387	 * @sector:	sector number
  1388	 *
  1389	 * Check if @sector on @bdev is contained in a sequential write required zone.
  1390	 */
  1391	static inline bool bdev_zone_is_seq(struct block_device *bdev, sector_t sector)
  1392	{
  1393		bool is_seq = false;
  1394	
  1395	#if IS_ENABLED(CONFIG_BLK_DEV_ZONED)
  1396		if (bdev_is_zoned(bdev)) {
  1397			struct gendisk *disk = bdev->bd_disk;
  1398	
  1399			rcu_read_lock();
  1400			is_seq = !disk->conv_zones_bitmap ||
> 1401				!test_bit(disk_zone_no(disk, sector),
  1402					  disk->conv_zones_bitmap);
  1403			rcu_read_unlock();
  1404		}
  1405	#endif
  1406	
  1407		return is_seq;
  1408	}
  1409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
