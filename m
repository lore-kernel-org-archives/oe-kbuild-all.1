Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B022619
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 00:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730334827; cv=none; b=DRyrGbqilp1TI7J9r7ZUGjosS/EmT6h3DW/RPzmwVoV2wb9UIkev3ErQU3ItlIKx3PLWDEWxjbdDsziFdFRwI6i5OZ1UpOFX9fYZa5KSVmxTA+T2vt+okDDwhO2oZGEx7+43Ua8vzWuA7ogx8LnQczxgTYNN2MMEJ1g0GbYey/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730334827; c=relaxed/simple;
	bh=7T7ETE5i4Mea7sC7uZFafKXnXJRs6gn/p9LZZyN+Gfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GB/CAGam4SS+hd+t6W2Xh99dxPLsyBu+vjMAbzZZtPOdUdA/xs8zjb+ABPVbLFLM9Lnetn3Y8X3nXdRyAbwZHautEcw8PmN5UxylxyWEy9na4bvcnOAX+DzyKgylf4ZBaUF3nqXZvhV6yRnxC309sAFt62rgighanhVYYpXjkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f20SDBFg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f20SDBFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730334825; x=1761870825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7T7ETE5i4Mea7sC7uZFafKXnXJRs6gn/p9LZZyN+Gfs=;
  b=f20SDBFgBRwgid6MRl02RE7jUF149C2WhoUL+/TGZbNq6Sn5LQPGwliy
   BGJ4pDqIIeTQJ0aeWsREwC4fB9YH2sJDPHvBMh+KdIShUfZ6a5J6LnUqQ
   nQfIzsqqv/23b+l1t2hmzh2VRCw+u3R5uCdNWuMmiDpWnHdqhQ71E9nrV
   e4ZUTMcdGS5ZNQoIiNHB1Js1iws+y0fgn005eyrYg05ztNvRDMTnd7jXH
   j9LmYRTLgAr0OOCTTy8ALzQnTILI2DML6JUlNXMOH1O+7Zw3BKAx8Q8sy
   pugZOuuMmIGxrshPf2LhA1/ykgvWzMvbmUZGnoQ+nK1EpOsx956ehwdzb
   Q==;
X-CSE-ConnectionGUID: tClDCAu1Rha1Yo3Q8eZpwg==
X-CSE-MsgGUID: wU3OIFrvTkakQZ2y+A7B+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47537643"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="47537643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 17:33:44 -0700
X-CSE-ConnectionGUID: nW4yibkBQu+zpVuzaCgamA==
X-CSE-MsgGUID: +JYhAdmfSOeZ2G0q0j6ZPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="113332153"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2024 17:33:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6J88-000fSa-1C;
	Thu, 31 Oct 2024 00:33:40 +0000
Date: Thu, 31 Oct 2024 08:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 52/53] include/linux/blkdev.h:1398:1: warning:
 control reaches end of non-void function
Message-ID: <202410310829.K2M4g8wU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   feb9371f18af51326c82c6d16cacb9db79717f98
commit: 9379c8cd5191b6afe843e3c3449aa030ed93d9d8 [52/53] iomap/xfs: split bios to zone append limits in the submission handlers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241031/202410310829.K2M4g8wU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310829.K2M4g8wU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310829.K2M4g8wU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_linux.h:28,
                    from fs/xfs/xfs.h:26,
                    from fs/xfs/xfs_aops.c:7:
   include/linux/blkdev.h: In function 'bdev_zone_is_seq':
   include/linux/blkdev.h:1395:18: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1395 |         if (!disk->conv_zones_bitmap)
         |                  ^~
   In file included from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/semaphore.h:12,
                    from fs/xfs/xfs_linux.h:24:
   include/linux/blkdev.h:1397:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/blkdev.h:1397:17: note: in expansion of macro 'test_bit'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1397:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/blkdev.h:1397:17: note: in expansion of macro 'test_bit'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1397:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/blkdev.h:1397:17: note: in expansion of macro 'test_bit'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1397:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/blkdev.h:1397:17: note: in expansion of macro 'test_bit'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1397:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/blkdev.h:1397:17: note: in expansion of macro 'test_bit'
    1397 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
>> include/linux/blkdev.h:1398:1: warning: control reaches end of non-void function [-Wreturn-type]
    1398 | }
         | ^


vim +1398 include/linux/blkdev.h

e29b210021dcf8e Pankaj Raghav     2023-01-10  1383  
8b88887562ef993 Christoph Hellwig 2024-10-15  1384  /**
8b88887562ef993 Christoph Hellwig 2024-10-15  1385   * bdev_zone_is_seq - check if a sector is on a sequential write zone
8b88887562ef993 Christoph Hellwig 2024-10-15  1386   * @bdev:	block device to check
8b88887562ef993 Christoph Hellwig 2024-10-15  1387   * @sector:	sector number
8b88887562ef993 Christoph Hellwig 2024-10-15  1388   *
8b88887562ef993 Christoph Hellwig 2024-10-15  1389   * Check if @sector on @bdev is on sequential write required zone.
8b88887562ef993 Christoph Hellwig 2024-10-15  1390   */
8b88887562ef993 Christoph Hellwig 2024-10-15  1391  static inline bool bdev_zone_is_seq(struct block_device *bdev, sector_t sector)
8b88887562ef993 Christoph Hellwig 2024-10-15  1392  {
8b88887562ef993 Christoph Hellwig 2024-10-15  1393  	struct gendisk *disk = bdev->bd_disk;
8b88887562ef993 Christoph Hellwig 2024-10-15  1394  
8b88887562ef993 Christoph Hellwig 2024-10-15  1395  	if (!disk->conv_zones_bitmap)
8b88887562ef993 Christoph Hellwig 2024-10-15  1396  		return bdev_is_zoned(bdev);
8b88887562ef993 Christoph Hellwig 2024-10-15  1397  	return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
8b88887562ef993 Christoph Hellwig 2024-10-15 @1398  }
8b88887562ef993 Christoph Hellwig 2024-10-15  1399  

:::::: The code at line 1398 was first introduced by commit
:::::: 8b88887562ef99311b5d6846095076ef74d3870f block: add a public bdev_zone_is_seq helper

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
