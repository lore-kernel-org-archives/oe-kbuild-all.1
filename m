Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087E126F2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 04:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728706196; cv=none; b=ZwSQE0u07jstZkK9YOKcPCy7NV7yJpE3PLAC6zKNu34rXJ08e2+TrqAmfCIj0AarQas2bB2Vv82AH6isbA5Cz2axEWVDG15dsd8KSKlIG0HDXXXEbHPW5QQxzKRExbLFm7ujpq6bvedXpoY677IUSyS22uJ/4xZkchsuEANqVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728706196; c=relaxed/simple;
	bh=fifwEM5JBkaWEerKzwZ4EFsET9m5TU36CjNeCG0ZmuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GyGduI0DqAF/GSi63btZp4xt1fNQBcVX2YpUP8WxaiDxdBIiEu00KrN+vJWY5qSlkm1QoTEvHEZUEAvjSO+6c5qgbtsLRtUOiqw+wg5qgAzFEFMlGsd9vPYC5HYxxX+RioSisfWKkBxbH+7SKwxtPC31l2IliRzjFakcer/59Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITEkDqKG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITEkDqKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728706194; x=1760242194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fifwEM5JBkaWEerKzwZ4EFsET9m5TU36CjNeCG0ZmuM=;
  b=ITEkDqKG21j7rBkl+vGb6n3QsZpkQch6FqfCviQtZRIyYl8Vin33Ifcs
   QBYuUaed3JLNBbQk4zhAKnrsTtbHEigfoU3cnQI7Pjm4gKV+ZCYLCTdFU
   Z0zBnBhBb4Pvg8LkjRi6HmW11WSVEx3SI8Mau1NdE+xL4TGR2l1evedtw
   vah7X7Sx7NAYfYVwtipxyBwiVuPKb+ml2COjaVNYHTdDaizZ3Bi2srDpZ
   DPi8olwDIair1CZyHHyORk2XFtQjtEQDFhefhKDvMay5qajcC8SF1ZZdG
   OZn/UT2giH9XJuFWMZtK+jKMf72j9RjzvpbcaWa8E5TaVgPDmsgNU9ORV
   A==;
X-CSE-ConnectionGUID: pnrGLFqARAmjCotzsIUfrA==
X-CSE-MsgGUID: 2YanRjGIRiSYkcL8HLdafQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31820164"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="31820164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 21:09:53 -0700
X-CSE-ConnectionGUID: eHkBdhMkQl2OawJat7ojOQ==
X-CSE-MsgGUID: 68TcPEevQqStB08vo+LuJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77089506"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Oct 2024 21:09:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szTRt-000D1r-0a;
	Sat, 12 Oct 2024 04:09:49 +0000
Date: Sat, 12 Oct 2024 12:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15642/22157]
 drivers/md/dm-verity-chromeos.c:67:21: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202410121140.n6eubJed-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   02f7b4a245a8145dae0565f010ac1e00d499e6d5
commit: 7dc041f752219f0bd30a5e9868135f6ef38ac7bb [15642/22157] CHROMIUM: md: dm-verity fixes chromeos needs
config: i386-randconfig-061-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121140.n6eubJed-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121140.n6eubJed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121140.n6eubJed-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-verity-chromeos.c:67:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_opf_t [usertype] bi_opf @@     got unsigned int @@
   drivers/md/dm-verity-chromeos.c:67:21: sparse:     expected restricted blk_opf_t [usertype] bi_opf
   drivers/md/dm-verity-chromeos.c:67:21: sparse:     got unsigned int
>> drivers/md/dm-verity-chromeos.c:181:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:181:47: sparse:     expected unsigned int op
   drivers/md/dm-verity-chromeos.c:181:47: sparse:     got restricted blk_opf_t
>> drivers/md/dm-verity-chromeos.c:182:56: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int op_flags @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:182:56: sparse:     expected unsigned int op_flags
   drivers/md/dm-verity-chromeos.c:182:56: sparse:     got restricted blk_opf_t
   drivers/md/dm-verity-chromeos.c:222:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:222:58: sparse:     expected unsigned int op
   drivers/md/dm-verity-chromeos.c:222:58: sparse:     got restricted blk_opf_t
   drivers/md/dm-verity-chromeos.c:223:56: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int op_flags @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:223:56: sparse:     expected unsigned int op_flags
   drivers/md/dm-verity-chromeos.c:223:56: sparse:     got restricted blk_opf_t

vim +67 drivers/md/dm-verity-chromeos.c

8c313d4f1fa03f Sonny Rao 2013-05-15   45  
8c313d4f1fa03f Sonny Rao 2013-05-15   46  static int chromeos_invalidate_kernel_submit(struct bio *bio,
8c313d4f1fa03f Sonny Rao 2013-05-15   47  					     struct block_device *bdev,
8c313d4f1fa03f Sonny Rao 2013-05-15   48  					     unsigned int op,
8c313d4f1fa03f Sonny Rao 2013-05-15   49  					     unsigned int op_flags,
8c313d4f1fa03f Sonny Rao 2013-05-15   50  					     struct page *page)
8c313d4f1fa03f Sonny Rao 2013-05-15   51  {
8c313d4f1fa03f Sonny Rao 2013-05-15   52  	DECLARE_COMPLETION_ONSTACK(wait);
8c313d4f1fa03f Sonny Rao 2013-05-15   53  	unsigned int block_size = bdev_logical_block_size(bdev);
8c313d4f1fa03f Sonny Rao 2013-05-15   54  
8c313d4f1fa03f Sonny Rao 2013-05-15   55  	if (block_size > page_size(page))
8c313d4f1fa03f Sonny Rao 2013-05-15   56  		panic("dm-verity failed to override signature");
8c313d4f1fa03f Sonny Rao 2013-05-15   57  
8c313d4f1fa03f Sonny Rao 2013-05-15   58  	bio->bi_private = &wait;
8c313d4f1fa03f Sonny Rao 2013-05-15   59  	bio->bi_end_io = chromeos_invalidate_kernel_endio;
8c313d4f1fa03f Sonny Rao 2013-05-15   60  	bio_set_dev(bio, bdev);
8c313d4f1fa03f Sonny Rao 2013-05-15   61  
8c313d4f1fa03f Sonny Rao 2013-05-15   62  	bio->bi_iter.bi_sector = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15   63  	bio->bi_vcnt = 1;
8c313d4f1fa03f Sonny Rao 2013-05-15   64  	bio->bi_iter.bi_idx = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15   65  	bio->bi_iter.bi_size = block_size;
8c313d4f1fa03f Sonny Rao 2013-05-15   66  	bio->bi_iter.bi_bvec_done = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  @67  	bio->bi_opf =  op | op_flags;
8c313d4f1fa03f Sonny Rao 2013-05-15   68  	bio->bi_io_vec[0].bv_page = page;
8c313d4f1fa03f Sonny Rao 2013-05-15   69  	bio->bi_io_vec[0].bv_len = block_size;
8c313d4f1fa03f Sonny Rao 2013-05-15   70  	bio->bi_io_vec[0].bv_offset = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15   71  
8c313d4f1fa03f Sonny Rao 2013-05-15   72  	submit_bio(bio);
8c313d4f1fa03f Sonny Rao 2013-05-15   73  	/* Wait up to 2 seconds for completion or fail. */
8c313d4f1fa03f Sonny Rao 2013-05-15   74  	if (!wait_for_completion_timeout(&wait, msecs_to_jiffies(2000)))
8c313d4f1fa03f Sonny Rao 2013-05-15   75  		return -1;
8c313d4f1fa03f Sonny Rao 2013-05-15   76  	return 0;
8c313d4f1fa03f Sonny Rao 2013-05-15   77  }
8c313d4f1fa03f Sonny Rao 2013-05-15   78  
8c313d4f1fa03f Sonny Rao 2013-05-15   79  static dev_t get_boot_dev_from_root_dev(struct block_device *root_bdev)
8c313d4f1fa03f Sonny Rao 2013-05-15   80  {
8c313d4f1fa03f Sonny Rao 2013-05-15   81  	/* Very basic sanity checking. This should be better. */
8c313d4f1fa03f Sonny Rao 2013-05-15   82  	if (!root_bdev || MAJOR(root_bdev->bd_dev) == 254 ||
8c313d4f1fa03f Sonny Rao 2013-05-15   83  	    root_bdev->bd_partno <= 1) {
8c313d4f1fa03f Sonny Rao 2013-05-15   84  		return 0;
8c313d4f1fa03f Sonny Rao 2013-05-15   85  	}
8c313d4f1fa03f Sonny Rao 2013-05-15   86  	return MKDEV(MAJOR(root_bdev->bd_dev), MINOR(root_bdev->bd_dev) - 1);
8c313d4f1fa03f Sonny Rao 2013-05-15   87  }
8c313d4f1fa03f Sonny Rao 2013-05-15   88  
8c313d4f1fa03f Sonny Rao 2013-05-15   89  static char kern_guid[48];
8c313d4f1fa03f Sonny Rao 2013-05-15   90  
8c313d4f1fa03f Sonny Rao 2013-05-15   91  /*
8c313d4f1fa03f Sonny Rao 2013-05-15   92   * get_boot_dev is based on dm_get_device_by_uuid in dm_bootcache.
8c313d4f1fa03f Sonny Rao 2013-05-15   93   *
8c313d4f1fa03f Sonny Rao 2013-05-15   94   * This function is marked __ref because it calls the __init marked
8c313d4f1fa03f Sonny Rao 2013-05-15   95   * early_lookup_bdev when called from the early boot code.
8c313d4f1fa03f Sonny Rao 2013-05-15   96   */
8c313d4f1fa03f Sonny Rao 2013-05-15   97  static dev_t __ref get_boot_dev(void)
8c313d4f1fa03f Sonny Rao 2013-05-15   98  {
8c313d4f1fa03f Sonny Rao 2013-05-15   99  	const char partuuid[] = "PARTUUID=";
8c313d4f1fa03f Sonny Rao 2013-05-15  100  	char uuid[sizeof(partuuid) + 36];
8c313d4f1fa03f Sonny Rao 2013-05-15  101  	char *uuid_str;
8c313d4f1fa03f Sonny Rao 2013-05-15  102  	dev_t devt;
8c313d4f1fa03f Sonny Rao 2013-05-15  103  
8c313d4f1fa03f Sonny Rao 2013-05-15  104  	if (!strlen(kern_guid)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  105  		DMERR("Couldn't get uuid, try root dev");
8c313d4f1fa03f Sonny Rao 2013-05-15  106  		return 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  107  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  108  
8c313d4f1fa03f Sonny Rao 2013-05-15  109  	if (strncmp(kern_guid, partuuid, strlen(partuuid))) {
8c313d4f1fa03f Sonny Rao 2013-05-15  110  		/* Not prefixed with "PARTUUID=", so add it */
8c313d4f1fa03f Sonny Rao 2013-05-15  111  		strcpy(uuid, partuuid);
8c313d4f1fa03f Sonny Rao 2013-05-15  112  		strlcat(uuid, kern_guid, sizeof(uuid));
8c313d4f1fa03f Sonny Rao 2013-05-15  113  		uuid_str = uuid;
8c313d4f1fa03f Sonny Rao 2013-05-15  114  	} else {
8c313d4f1fa03f Sonny Rao 2013-05-15  115  		uuid_str = kern_guid;
8c313d4f1fa03f Sonny Rao 2013-05-15  116  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  117          if (early_lookup_bdev(uuid_str, &devt)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  118                  DMDEBUG("No matching partition for GUID: %s", uuid_str);
8c313d4f1fa03f Sonny Rao 2013-05-15  119                  return 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  120          }
8c313d4f1fa03f Sonny Rao 2013-05-15  121  	return devt;
8c313d4f1fa03f Sonny Rao 2013-05-15  122  }
8c313d4f1fa03f Sonny Rao 2013-05-15  123  
8c313d4f1fa03f Sonny Rao 2013-05-15  124  /*
8c313d4f1fa03f Sonny Rao 2013-05-15  125   * Invalidate the kernel which corresponds to the root block device.
8c313d4f1fa03f Sonny Rao 2013-05-15  126   *
8c313d4f1fa03f Sonny Rao 2013-05-15  127   * This function stamps DMVERROR on the beginning of the kernel partition.
8c313d4f1fa03f Sonny Rao 2013-05-15  128   *
8c313d4f1fa03f Sonny Rao 2013-05-15  129   * The kernel_guid commandline parameter is used to find the kernel partition
8c313d4f1fa03f Sonny Rao 2013-05-15  130   *  number.
8c313d4f1fa03f Sonny Rao 2013-05-15  131   * If that fails, the kernel partition is found by subtracting 1 from
8c313d4f1fa03f Sonny Rao 2013-05-15  132   *  the root partition.
8c313d4f1fa03f Sonny Rao 2013-05-15  133   * The DMVERROR string is stamped over only the CHROMEOS string at the
8c313d4f1fa03f Sonny Rao 2013-05-15  134   *  beginning of the kernel blob, leaving the rest of it intact.
8c313d4f1fa03f Sonny Rao 2013-05-15  135   */
8c313d4f1fa03f Sonny Rao 2013-05-15  136  static int chromeos_invalidate_kernel_bio(struct block_device *root_bdev)
8c313d4f1fa03f Sonny Rao 2013-05-15  137  {
8c313d4f1fa03f Sonny Rao 2013-05-15  138  	int ret = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  139  	struct block_device *bdev;
8c313d4f1fa03f Sonny Rao 2013-05-15  140  	struct bio *bio;
8c313d4f1fa03f Sonny Rao 2013-05-15  141  	struct page *page;
8c313d4f1fa03f Sonny Rao 2013-05-15  142  	dev_t devt;
8c313d4f1fa03f Sonny Rao 2013-05-15  143  	blk_mode_t dev_mode;
8c313d4f1fa03f Sonny Rao 2013-05-15  144  
8c313d4f1fa03f Sonny Rao 2013-05-15  145  	devt = get_boot_dev();
8c313d4f1fa03f Sonny Rao 2013-05-15  146  	if (!devt) {
8c313d4f1fa03f Sonny Rao 2013-05-15  147  		devt = get_boot_dev_from_root_dev(root_bdev);
8c313d4f1fa03f Sonny Rao 2013-05-15  148  		if (!devt)
8c313d4f1fa03f Sonny Rao 2013-05-15  149  			return -EINVAL;
8c313d4f1fa03f Sonny Rao 2013-05-15  150  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  151  
8c313d4f1fa03f Sonny Rao 2013-05-15  152  	/* First we open the device for reading. */
8c313d4f1fa03f Sonny Rao 2013-05-15  153  	dev_mode = BLK_OPEN_READ | BLK_OPEN_EXCL;
8c313d4f1fa03f Sonny Rao 2013-05-15  154  	bdev = blkdev_get_by_dev(devt, dev_mode,
8c313d4f1fa03f Sonny Rao 2013-05-15  155  				 chromeos_invalidate_kernel_bio, NULL);
8c313d4f1fa03f Sonny Rao 2013-05-15  156  	if (IS_ERR(bdev)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  157  		DMERR("invalidate_kernel: could not open device for reading");
8c313d4f1fa03f Sonny Rao 2013-05-15  158  		dev_mode = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  159  		ret = -1;
8c313d4f1fa03f Sonny Rao 2013-05-15  160  		goto failed_to_read;
8c313d4f1fa03f Sonny Rao 2013-05-15  161  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  162  
8c313d4f1fa03f Sonny Rao 2013-05-15  163  	bio = bio_alloc(NULL, 1, 0, GFP_NOIO);
8c313d4f1fa03f Sonny Rao 2013-05-15  164  	if (!bio) {
8c313d4f1fa03f Sonny Rao 2013-05-15  165  		ret = -1;
8c313d4f1fa03f Sonny Rao 2013-05-15  166  		goto failed_bio_alloc;
8c313d4f1fa03f Sonny Rao 2013-05-15  167  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  168  
8c313d4f1fa03f Sonny Rao 2013-05-15  169  	page = alloc_page(GFP_NOIO);
8c313d4f1fa03f Sonny Rao 2013-05-15  170  	if (!page) {
8c313d4f1fa03f Sonny Rao 2013-05-15  171  		ret = -ENOMEM;
8c313d4f1fa03f Sonny Rao 2013-05-15  172  		goto failed_to_alloc_page;
8c313d4f1fa03f Sonny Rao 2013-05-15  173  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  174  
8c313d4f1fa03f Sonny Rao 2013-05-15  175  	/*
8c313d4f1fa03f Sonny Rao 2013-05-15  176  	 * Request read operation with REQ_PREFLUSH flag to ensure that the
8c313d4f1fa03f Sonny Rao 2013-05-15  177  	 * cache of non-volatile storage device has been flushed before read is
8c313d4f1fa03f Sonny Rao 2013-05-15  178  	 * started.
8c313d4f1fa03f Sonny Rao 2013-05-15  179  	 */
8c313d4f1fa03f Sonny Rao 2013-05-15  180  	if (chromeos_invalidate_kernel_submit(bio, bdev,
8c313d4f1fa03f Sonny Rao 2013-05-15 @181  					      REQ_OP_READ,
8c313d4f1fa03f Sonny Rao 2013-05-15 @182  					      REQ_SYNC | REQ_PREFLUSH,
8c313d4f1fa03f Sonny Rao 2013-05-15  183  					      page)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  184  		ret = -1;
8c313d4f1fa03f Sonny Rao 2013-05-15  185  		goto failed_to_submit_read;
8c313d4f1fa03f Sonny Rao 2013-05-15  186  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  187  
8c313d4f1fa03f Sonny Rao 2013-05-15  188  	/* We have a page. Let's make sure it looks right. */
8c313d4f1fa03f Sonny Rao 2013-05-15  189  	if (memcmp("CHROMEOS", page_address(page), 8)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  190  		DMERR("invalidate_kernel called on non-kernel partition");
8c313d4f1fa03f Sonny Rao 2013-05-15  191  		ret = -EINVAL;
8c313d4f1fa03f Sonny Rao 2013-05-15  192  		goto invalid_header;
8c313d4f1fa03f Sonny Rao 2013-05-15  193  	} else {
8c313d4f1fa03f Sonny Rao 2013-05-15  194  		DMERR("invalidate_kernel: found CHROMEOS kernel partition");
8c313d4f1fa03f Sonny Rao 2013-05-15  195  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  196  
8c313d4f1fa03f Sonny Rao 2013-05-15  197  	/* Stamp it and rewrite */
8c313d4f1fa03f Sonny Rao 2013-05-15  198  	memcpy(page_address(page), DMVERROR, strlen(DMVERROR));
8c313d4f1fa03f Sonny Rao 2013-05-15  199  
8c313d4f1fa03f Sonny Rao 2013-05-15  200  	/* The block dev was being changed on read. Let's reopen here. */
8c313d4f1fa03f Sonny Rao 2013-05-15  201  	blkdev_put(bdev, chromeos_invalidate_kernel_bio);
8c313d4f1fa03f Sonny Rao 2013-05-15  202  	dev_mode = BLK_OPEN_WRITE | BLK_OPEN_EXCL;
8c313d4f1fa03f Sonny Rao 2013-05-15  203  	bdev = blkdev_get_by_dev(devt, dev_mode,
8c313d4f1fa03f Sonny Rao 2013-05-15  204  				 chromeos_invalidate_kernel_bio, NULL);
8c313d4f1fa03f Sonny Rao 2013-05-15  205  	if (IS_ERR(bdev)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  206  		DMERR("invalidate_kernel: could not open device for writing");
8c313d4f1fa03f Sonny Rao 2013-05-15  207  		dev_mode = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  208  		ret = -1;
8c313d4f1fa03f Sonny Rao 2013-05-15  209  		goto failed_to_write;
8c313d4f1fa03f Sonny Rao 2013-05-15  210  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  211  
8c313d4f1fa03f Sonny Rao 2013-05-15  212  	/* We re-use the same bio to do the write after the read. Need to reset
8c313d4f1fa03f Sonny Rao 2013-05-15  213  	 * it to initialize bio->bi_remaining.
8c313d4f1fa03f Sonny Rao 2013-05-15  214  	 */
8c313d4f1fa03f Sonny Rao 2013-05-15  215  	bio_reset(bio, NULL, 0);
8c313d4f1fa03f Sonny Rao 2013-05-15  216  
8c313d4f1fa03f Sonny Rao 2013-05-15  217  	/*
8c313d4f1fa03f Sonny Rao 2013-05-15  218  	 * Request write operation with REQ_FUA flag to ensure that I/O
8c313d4f1fa03f Sonny Rao 2013-05-15  219  	 * completion for the write is signaled only after the data has been
8c313d4f1fa03f Sonny Rao 2013-05-15  220  	 * committed to non-volatile storage.
8c313d4f1fa03f Sonny Rao 2013-05-15  221  	 */
8c313d4f1fa03f Sonny Rao 2013-05-15  222  	if (chromeos_invalidate_kernel_submit(bio, bdev, REQ_OP_WRITE,
8c313d4f1fa03f Sonny Rao 2013-05-15  223  					      REQ_SYNC | REQ_FUA, page)) {
8c313d4f1fa03f Sonny Rao 2013-05-15  224  		ret = -1;
8c313d4f1fa03f Sonny Rao 2013-05-15  225  		goto failed_to_submit_write;
8c313d4f1fa03f Sonny Rao 2013-05-15  226  	}
8c313d4f1fa03f Sonny Rao 2013-05-15  227  
8c313d4f1fa03f Sonny Rao 2013-05-15  228  	DMERR("invalidate_kernel: completed.");
8c313d4f1fa03f Sonny Rao 2013-05-15  229  	ret = 0;
8c313d4f1fa03f Sonny Rao 2013-05-15  230  failed_to_submit_write:
8c313d4f1fa03f Sonny Rao 2013-05-15  231  failed_to_write:
8c313d4f1fa03f Sonny Rao 2013-05-15  232  invalid_header:
8c313d4f1fa03f Sonny Rao 2013-05-15  233  	__free_page(page);
8c313d4f1fa03f Sonny Rao 2013-05-15  234  failed_to_submit_read:
8c313d4f1fa03f Sonny Rao 2013-05-15  235  	/* Technically, we'll leak a page with the pending bio, but
8c313d4f1fa03f Sonny Rao 2013-05-15  236  	 *  we're about to panic so it's safer to do the panic() we expect.
8c313d4f1fa03f Sonny Rao 2013-05-15  237  	 */
8c313d4f1fa03f Sonny Rao 2013-05-15  238  failed_to_alloc_page:
8c313d4f1fa03f Sonny Rao 2013-05-15  239  	bio_put(bio);
8c313d4f1fa03f Sonny Rao 2013-05-15  240  failed_bio_alloc:
8c313d4f1fa03f Sonny Rao 2013-05-15  241  	if (dev_mode)
8c313d4f1fa03f Sonny Rao 2013-05-15  242  		blkdev_put(bdev, chromeos_invalidate_kernel_bio);
8c313d4f1fa03f Sonny Rao 2013-05-15  243  failed_to_read:
8c313d4f1fa03f Sonny Rao 2013-05-15  244  	return ret;
8c313d4f1fa03f Sonny Rao 2013-05-15  245  }
8c313d4f1fa03f Sonny Rao 2013-05-15  246  

:::::: The code at line 67 was first introduced by commit
:::::: 8c313d4f1fa03f6878024fab9fcc5b79eb34e880 CHROMIUM: verity: bring over dm-verity-chromeos.c

:::::: TO: Sonny Rao <sonnyrao@chromium.org>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
