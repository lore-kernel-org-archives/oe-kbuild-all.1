Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5C537F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 23:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DScZCmrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703548343; x=1735084343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBx8Vz79iPdlu7GRR1RhlP2ryWiWnJR1VvC2CvUJMLI=;
  b=DScZCmrrdXcdLwJ6830ErDuU+uKlXC2JsHOedDXoU9I8rbVybWLv2muk
   w4Ya3q3GVy8bYAUewAys4JPqzYbNg0F7U07+5AZk3AGug4vn9PCkwqs61
   Fov9amvkfDS9ARhdtA3aJ55WB8G69FckovTvgxI+YsvD3X/+n4YKvmjkY
   x2g6OtGKwY7IyqyRYF0ZO/8PnbRDW7AuppMWnBN6JID7DYXRBVXmVqQG9
   cFPAOqSSlruJF4M3MEO8lpGoAMG/SVRCYXu1i0zQlfFAMgRv4yz/5J3fq
   P+RTfocEI1a43NhgMdiRPkNnCkrT3oocon9kJbD2dbTrV8g7wDhLR11gN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="381283505"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="381283505"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 15:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="896420715"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="896420715"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Dec 2023 15:52:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHuk4-000DnN-1T;
	Mon, 25 Dec 2023 23:52:17 +0000
Date: Tue, 26 Dec 2023 07:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 6/9] kernel/power/user.c:277:65: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202312260727.pyL9wohx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a9fe2b1986954da61e4548da06442a9567c9ef90
commit: cd323d13deca39a6bf99aa7fd617f68234cd99a9 [6/9] CHROMIUM: PM: hibernate: Add three ioctls for secure image transfer
config: i386-randconfig-r122-20231226 (https://download.01.org/0day-ci/archive/20231226/202312260727.pyL9wohx-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260727.pyL9wohx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260727.pyL9wohx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/power/user.c:277:65: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected void *holder @@     got restricted blk_mode_t @@
   kernel/power/user.c:277:65: sparse:     expected void *holder
   kernel/power/user.c:277:65: sparse:     got restricted blk_mode_t
   kernel/power/user.c:296:63: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected void *holder @@     got restricted blk_mode_t @@
   kernel/power/user.c:296:63: sparse:     expected void *holder
   kernel/power/user.c:296:63: sparse:     got restricted blk_mode_t
   kernel/power/user.c:334:63: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int new @@     got restricted blk_status_t [usertype] bi_status @@
   kernel/power/user.c:334:63: sparse:     expected int new
   kernel/power/user.c:334:63: sparse:     got restricted blk_status_t [usertype] bi_status
   kernel/power/user.c:357:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got int @@
   kernel/power/user.c:357:47: sparse:     expected restricted blk_status_t [usertype] status
   kernel/power/user.c:357:47: sparse:     got int
   kernel/power/user.c:363:62: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got restricted gfp_t @@
   kernel/power/user.c:363:62: sparse:     expected restricted blk_opf_t [usertype] opf
   kernel/power/user.c:363:62: sparse:     got restricted gfp_t
   kernel/power/user.c:363:79: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp_mask @@     got int @@
   kernel/power/user.c:363:79: sparse:     expected restricted gfp_t [usertype] gfp_mask
   kernel/power/user.c:363:79: sparse:     got int
   kernel/power/user.c:407:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int op @@     got restricted blk_opf_t @@
   kernel/power/user.c:407:61: sparse:     expected int op
   kernel/power/user.c:407:61: sparse:     got restricted blk_opf_t
   kernel/power/user.c:408:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int op_flags @@     got restricted blk_opf_t @@
   kernel/power/user.c:408:42: sparse:     expected int op_flags
   kernel/power/user.c:408:42: sparse:     got restricted blk_opf_t
   kernel/power/user.c:420:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got int @@
   kernel/power/user.c:420:54: sparse:     expected restricted blk_status_t [usertype] status
   kernel/power/user.c:420:54: sparse:     got int
   kernel/power/user.c:424:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int op @@     got restricted blk_opf_t @@
   kernel/power/user.c:424:42: sparse:     expected int op
   kernel/power/user.c:424:42: sparse:     got restricted blk_opf_t
   kernel/power/user.c:424:75: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int op_flags @@     got restricted blk_opf_t @@
   kernel/power/user.c:424:75: sparse:     expected int op_flags
   kernel/power/user.c:424:75: sparse:     got restricted blk_opf_t

vim +277 kernel/power/user.c

   256	
   257	static int snapshot_set_block_device(struct snapshot_data *data, __u32 device)
   258	{
   259		dev_t dev;
   260		struct block_device *bdev;
   261		int res;
   262	
   263		if (swsusp_swap_in_use())
   264			return -EPERM;
   265	
   266		if (data->swap > 0 || data->bdev)
   267			return -EBUSY;
   268	
   269		dev = new_decode_dev(device);
   270		bdev = blkdev_get_by_dev(dev,
   271					 BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL, &snapshot_state, NULL);
   272		if (IS_ERR(bdev))
   273			return PTR_ERR(bdev);
   274	
   275		res = set_blocksize(bdev, PAGE_SIZE);
   276		if (res < 0) {
 > 277			blkdev_put(bdev, BLK_OPEN_READ | BLK_OPEN_WRITE | BLK_OPEN_EXCL);
   278			return res;
   279		}
   280	
   281		data->dev = dev;
   282		data->bdev = bdev;
   283		pr_info("snapshot block device set to %02x:%02x: %lld blocks", MAJOR(dev), MINOR(dev),
   284			i_size_read(bdev->bd_inode) >> PAGE_SHIFT);
   285		return 0;
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
