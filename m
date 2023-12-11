Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306AA2137B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 21:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIXObhTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702330993; x=1733866993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19DxBUJi/Ir5nNm2awpXrBoHk+7/x5xguTu96/SHplM=;
  b=PIXObhTONbHuv3TWvOJqychT7K64/5G/MmgN6syAYgT8e1dasukhgs1t
   5Jo0REk8/OoxU5QhFEx0U3ifGxAZQ8LySwgHNxndnssIVSZfmX29o+mG8
   dzUSiwMkLh4n2w4/SFusZpWuEm9cqbmr1eBa5I4Qc8epBxkXyNLdLjmkN
   XwsU+3giid0aVIyX9SzAS04jovdX+cvIekoeG9PhZh8Cdn7zogd/Zu4h5
   ZtQqvo+JZIRVMmUntYVU2GF3/hHAScMuyFptPya2SUEOCVHPmJOeckvBV
   sbBr4+RYe0Z55Rq9BrtguwX3Uc81KcOryQcUTiR8h7JifB5+qq8QGqAVW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1862478"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1862478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 13:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722964430"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="722964430"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 13:43:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCo3K-000IV7-0E;
	Mon, 11 Dec 2023 21:43:02 +0000
Date: Tue, 12 Dec 2023 05:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 6/9] include/linux/blkdev.h:118:33: warning:
 passing argument 2 of 'blkdev_put' makes pointer from integer without a cast
Message-ID: <202312120516.oN3ZO1V5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b768cc63f5abe0b76a68266dd997c4c2d061363
commit: cd323d13deca39a6bf99aa7fd617f68234cd99a9 [6/9] CHROMIUM: PM: hibernate: Add three ioctls for secure image transfer
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231212/202312120516.oN3ZO1V5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120516.oN3ZO1V5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120516.oN3ZO1V5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/power/user.c:27:
   kernel/power/user.c: In function 'snapshot_set_block_device':
>> include/linux/blkdev.h:118:33: warning: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Wint-conversion]
     118 | #define BLK_OPEN_READ           ((__force blk_mode_t)(1 << 0))
         |                                 ^
         |                                 |
         |                                 unsigned int
   kernel/power/user.c:277:34: note: in expansion of macro 'BLK_OPEN_READ'
     277 |                 blkdev_put(bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
         |                                  ^~~~~~~~~~~~~
   include/linux/blkdev.h:1489:50: note: expected 'void *' but argument is of type 'unsigned int'
    1489 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                            ~~~~~~^~~~~~
   kernel/power/user.c: In function 'snapshot_release_block_device':
>> include/linux/blkdev.h:118:33: warning: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Wint-conversion]
     118 | #define BLK_OPEN_READ           ((__force blk_mode_t)(1 << 0))
         |                                 ^
         |                                 |
         |                                 unsigned int
   kernel/power/user.c:296:32: note: in expansion of macro 'BLK_OPEN_READ'
     296 |         blkdev_put(data->bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
         |                                ^~~~~~~~~~~~~
   include/linux/blkdev.h:1489:50: note: expected 'void *' but argument is of type 'unsigned int'
    1489 | void blkdev_put(struct block_device *bdev, void *holder);
         |                                            ~~~~~~^~~~~~


vim +/blkdev_put +118 include/linux/blkdev.h

05bdb9965305bb Christoph Hellwig 2023-06-08  116  
05bdb9965305bb Christoph Hellwig 2023-06-08  117  /* open for reading */
05bdb9965305bb Christoph Hellwig 2023-06-08 @118  #define BLK_OPEN_READ		((__force blk_mode_t)(1 << 0))
05bdb9965305bb Christoph Hellwig 2023-06-08  119  /* open for writing */
05bdb9965305bb Christoph Hellwig 2023-06-08  120  #define BLK_OPEN_WRITE		((__force blk_mode_t)(1 << 1))
05bdb9965305bb Christoph Hellwig 2023-06-08  121  /* open exclusively (vs other exclusive openers */
05bdb9965305bb Christoph Hellwig 2023-06-08  122  #define BLK_OPEN_EXCL		((__force blk_mode_t)(1 << 2))
05bdb9965305bb Christoph Hellwig 2023-06-08  123  /* opened with O_NDELAY */
05bdb9965305bb Christoph Hellwig 2023-06-08  124  #define BLK_OPEN_NDELAY		((__force blk_mode_t)(1 << 3))
05bdb9965305bb Christoph Hellwig 2023-06-08  125  /* open for "writes" only for ioctls (specialy hack for floppy.c) */
05bdb9965305bb Christoph Hellwig 2023-06-08  126  #define BLK_OPEN_WRITE_IOCTL	((__force blk_mode_t)(1 << 4))
05bdb9965305bb Christoph Hellwig 2023-06-08  127  

:::::: The code at line 118 was first introduced by commit
:::::: 05bdb9965305bbfdae79b31d22df03d1e2cfcb22 block: replace fmode_t with a block-specific type for block open flags

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
