Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5A1925AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730327924; cv=none; b=WBHZhooe3aydMlJcwqtl7zavBIBcJnNssR3XlKd6TQv68x5eSr/E7W/NBKzId4JTGQ8elAqludXEieuPMgG79AprMyg1nLZ6T21lXQF+8qjh2w8V/v1oI/FJ05ONc16iRYgTKxPzh6Ijbh0jSCZVNhZJp28tt/+7Y4AmsHsjwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730327924; c=relaxed/simple;
	bh=efev1ajDId2X/RSwWcKutHudEWtsFOm0zje75MYofoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltJnuV57CC3zbyRgOwxcD8B6de7y0RlkrxIZTc/kMl3er765JNPpDthqJ6cuNBSj90twIkfi5pSeJ/ET5W3+vBFMkP4PE2Oad5Vw2lGmK9kkSJhpKohiX680A0C3qHCY2tqXRLTJis73Sd/2xa0hvV7xQIe4YilhJW4gQnQz/T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEUaArU2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEUaArU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730327921; x=1761863921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efev1ajDId2X/RSwWcKutHudEWtsFOm0zje75MYofoU=;
  b=FEUaArU2YwfDAhewUODvFKooUfrf3ebtrlWPc9NFl3my++RVmSAN/Z2Y
   g/Mft+J/iSHmhRZvpiNEUZsCx1nKPhmLPWUYSh1maqZ7PDYk47FxJ7YPq
   lyURiMZGJMBFMZWtdN+9jgeKdyqdBmTslbxj40dV4NfsEbzgRwcFt9E7C
   wzpMBJoaeHJCx++RipFIJ6wsYE5ff40MjWltWo050iBKmqrhke4DOOAFo
   oHlzjzaYSqQ6Nk631bi69BAzQAoxEEg18urqUBN9RbN/fFxD0jJxZTCWE
   r/lKldcvFrGLQVI89sM0LR++vEn50g7avGV9pIXKSUB3u30zD3b3EgZMF
   w==;
X-CSE-ConnectionGUID: LaYB+8X8Rs6JDaD3tY3PKw==
X-CSE-MsgGUID: /Vtsoi6qSkmK6mrpAFRiUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30266142"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="30266142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 15:38:39 -0700
X-CSE-ConnectionGUID: bQAXuYkURrqUmSPAqbsrYw==
X-CSE-MsgGUID: GmzEn74EQG2U14LHWye59A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="105774934"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Oct 2024 15:38:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6HKl-000fNk-2j;
	Wed, 30 Oct 2024 22:38:35 +0000
Date: Thu, 31 Oct 2024 06:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 49/53] include/linux/blkdev.h:1390:18: error:
 'struct gendisk' has no member named 'conv_zones_bitmap'
Message-ID: <202410310625.mbht8XXR-lkp@intel.com>
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
commit: 8b88887562ef99311b5d6846095076ef74d3870f [49/53] block: add a public bdev_zone_is_seq helper
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241031/202410310625.mbht8XXR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310625.mbht8XXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310625.mbht8XXR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/f2fs.h:23,
                    from fs/f2fs/dir.c:13:
   include/linux/blkdev.h: In function 'bdev_zone_is_seq':
>> include/linux/blkdev.h:1390:18: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1390 |         if (!disk->conv_zones_bitmap)
         |                  ^~
   In file included from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/dir.c:9:
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
--
   In file included from fs/f2fs/data.c:14:
   include/linux/blkdev.h: In function 'bdev_zone_is_seq':
>> include/linux/blkdev.h:1390:18: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1390 |         if (!disk->conv_zones_bitmap)
         |                  ^~
   In file included from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/data.c:8:
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   include/linux/blkdev.h:1392:58: error: 'struct gendisk' has no member named 'conv_zones_bitmap'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                          ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/blkdev.h:1392:17: note: in expansion of macro 'test_bit'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                 ^~~~~~~~
   fs/f2fs/data.c: In function 'f2fs_mpage_readpages':
   fs/f2fs/data.c:2391:17: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    2391 |         pgoff_t index;
         |                 ^~~~~


vim +1390 include/linux/blkdev.h

  1378	
  1379	/**
  1380	 * bdev_zone_is_seq - check if a sector is on a sequential write zone
  1381	 * @bdev:	block device to check
  1382	 * @sector:	sector number
  1383	 *
  1384	 * Check if @sector on @bdev is on sequential write required zone.
  1385	 */
  1386	static inline bool bdev_zone_is_seq(struct block_device *bdev, sector_t sector)
  1387	{
  1388		struct gendisk *disk = bdev->bd_disk;
  1389	
> 1390		if (!disk->conv_zones_bitmap)
  1391			return bdev_is_zoned(bdev);
  1392		return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
  1393	}
  1394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
