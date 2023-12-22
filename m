Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213512E637
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr8O1eh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703274020; x=1734810020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jTayaJuu7zho2btpLe9S7oJWgYS6XCwrt+iBDqDyNk=;
  b=lr8O1eh1b70Vl2SLXkeddwBK4dYwePDuoTcPJIeG3Q3ydnST2ao7rigm
   dxZatFO4RnYK9jwHDb/qd/2BbBNKa9sViXtlAQPl+CQvgIOui5iIVeceg
   VFM5ldPOvCF+5j9VNKchadEgOBTXi1FcXtUbCI2eCfjfrqWlXY/9iNnUG
   qKWAxlvn2dWmos2HUIhXZKeQTiQ70eg2Lv/crL32ZutgFHdm0YS84Lljg
   junHbg5MIwldLhrkPDSVXmkTzeB0Mx+MMhS6VjhGR6fYW9Mr49JkQQ8TC
   Vakb+04V4bgKjwZKdXWMpmR05UYaU5uvq2IlmMIQSyHyEIbnnPD4tSkkw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="3236204"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="3236204"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 11:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="847537549"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="847537549"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2023 11:40:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGlMn-0009oz-0r;
	Fri, 22 Dec 2023 19:39:47 +0000
Date: Sat, 23 Dec 2023 03:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 6/9] include/linux/blkdev.h:118:24: error:
 passing argument 2 of 'blkdev_put' makes pointer from integer without a cast
Message-ID: <202312230342.XPSmycD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ba67b993ee791830d376c1d702efa351e5239684
commit: cd323d13deca39a6bf99aa7fd617f68234cd99a9 [6/9] CHROMIUM: PM: hibernate: Add three ioctls for secure image transfer
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20231223/202312230342.XPSmycD6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230342.XPSmycD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230342.XPSmycD6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/power/user.c:27:0:
   kernel/power/user.c: In function 'snapshot_set_block_device':
>> include/linux/blkdev.h:118:24: error: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Werror=int-conversion]
    #define BLK_OPEN_READ  ((__force blk_mode_t)(1 << 0))
                           ^
   kernel/power/user.c:277:20: note: in expansion of macro 'BLK_OPEN_READ'
      blkdev_put(bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
                       ^~~~~~~~~~~~~
   include/linux/blkdev.h:1489:6: note: expected 'void *' but argument is of type 'unsigned int'
    void blkdev_put(struct block_device *bdev, void *holder);
         ^~~~~~~~~~
   kernel/power/user.c: In function 'snapshot_release_block_device':
>> include/linux/blkdev.h:118:24: error: passing argument 2 of 'blkdev_put' makes pointer from integer without a cast [-Werror=int-conversion]
    #define BLK_OPEN_READ  ((__force blk_mode_t)(1 << 0))
                           ^
   kernel/power/user.c:296:25: note: in expansion of macro 'BLK_OPEN_READ'
     blkdev_put(data->bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
                            ^~~~~~~~~~~~~
   include/linux/blkdev.h:1489:6: note: expected 'void *' but argument is of type 'unsigned int'
    void blkdev_put(struct block_device *bdev, void *holder);
         ^~~~~~~~~~
   cc1: all warnings being treated as errors


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
