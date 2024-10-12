Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50F2581
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728718140; cv=none; b=mJ9yDDaN3Jhu+ClhEIBl8Scdu5CUyGQNEU0mkea0sZNw3eMc1qQQUmbBGQNFatOGUFeVSFtrcO8Ik3n0as6ibd5J7M/lKqGMs1JKvpfYqGvApfW0MXCGVaCN6Ez0JDY8W0ATtq9WENWNlMMju5eYTDiQhrQsuOGHUu22HOeoG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728718140; c=relaxed/simple;
	bh=DHqgC9riqIPSeVXZ0S0J8nRUtjG3WkcyNMIppuPpTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUT0an5TFf7SX325Gkc8SywktT7GNfC11egqQlT8TT3v36FtzB8iD2HluY4tkkMKUP3AhuZjEwFAh7TF8w+odpt3vVGBV7vtYLki3b3pX2VNpKly5ST+5nRj44VAal1XGNBg+WX1r0VL6Y9/ExtVvnLSTJAs0tzAxXJjKfI5RHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTniRnMQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTniRnMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728718137; x=1760254137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHqgC9riqIPSeVXZ0S0J8nRUtjG3WkcyNMIppuPpTbQ=;
  b=nTniRnMQdsogTBT9yjErz3TA2sDid9UosFKLabfMcm1L06QvvMBnriWm
   7lp4cdWAVVp628JhKsGno+bdZ4VbMjpw9TLKAX7A42yB3kpWRRoD3I9q5
   ms56U5FVUhxZ0jAO/XnVLl9uYQu7Qh79rW9R40zvpvWOZDXMMRgQcIFDn
   e9ujvIJfU39L52VTjxMlrXC4nque3Nori5Q38H8VX4rpmM2eYn5aEASp0
   dolfiZ7VX6Y7lcsMM0qFR2hAQy3ThIkZ/6Pjl1IXH+BlOH1U7e3o0gCmq
   kdgtt7FW/MToSFlhuXpBrVgQzW+I+xMEqAPGZUkxvUbA53bVznelLsUVa
   g==;
X-CSE-ConnectionGUID: Nrhg52M5QG6TuKo9otBYEA==
X-CSE-MsgGUID: TYpcgMvhTjauluPFmaXjgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31913902"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="31913902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 00:28:57 -0700
X-CSE-ConnectionGUID: kzvxSaR4SzWFI+Ql0X/C+g==
X-CSE-MsgGUID: SgJJzPPmSNCh1PXDwV1QXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="76739429"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2024 00:28:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szWYX-000D9j-2n;
	Sat, 12 Oct 2024 07:28:53 +0000
Date: Sat, 12 Oct 2024 15:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15673/22157]
 drivers/md/dm-verity-chromeos.c:177:47: sparse: sparse: incorrect type in
 argument 4 (different base types)
Message-ID: <202410121529.imhfBNdb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   02f7b4a245a8145dae0565f010ac1e00d499e6d5
commit: 06f9a01849d1cf93952a0917dab68817394a53a8 [15673/22157] CHROMIUM: dm-verity: Remove REQ_PREFLUSH during REQ_OP_READ
config: i386-randconfig-061-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121529.imhfBNdb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121529.imhfBNdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121529.imhfBNdb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-verity-chromeos.c:67:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_opf_t [usertype] bi_opf @@     got unsigned int @@
   drivers/md/dm-verity-chromeos.c:67:21: sparse:     expected restricted blk_opf_t [usertype] bi_opf
   drivers/md/dm-verity-chromeos.c:67:21: sparse:     got unsigned int
   drivers/md/dm-verity-chromeos.c:176:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:176:47: sparse:     expected unsigned int op
   drivers/md/dm-verity-chromeos.c:176:47: sparse:     got restricted blk_opf_t
>> drivers/md/dm-verity-chromeos.c:177:47: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int op_flags @@     got restricted blk_opf_t [usertype] @@
   drivers/md/dm-verity-chromeos.c:177:47: sparse:     expected unsigned int op_flags
   drivers/md/dm-verity-chromeos.c:177:47: sparse:     got restricted blk_opf_t [usertype]
   drivers/md/dm-verity-chromeos.c:217:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:217:58: sparse:     expected unsigned int op
   drivers/md/dm-verity-chromeos.c:217:58: sparse:     got restricted blk_opf_t
   drivers/md/dm-verity-chromeos.c:218:56: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int op_flags @@     got restricted blk_opf_t @@
   drivers/md/dm-verity-chromeos.c:218:56: sparse:     expected unsigned int op_flags
   drivers/md/dm-verity-chromeos.c:218:56: sparse:     got restricted blk_opf_t

vim +177 drivers/md/dm-verity-chromeos.c

    45	
    46	static int chromeos_invalidate_kernel_submit(struct bio *bio,
    47						     struct block_device *bdev,
    48						     unsigned int op,
    49						     unsigned int op_flags,
    50						     struct page *page)
    51	{
    52		DECLARE_COMPLETION_ONSTACK(wait);
    53		unsigned int block_size = bdev_logical_block_size(bdev);
    54	
    55		if (block_size > page_size(page))
    56			panic("dm-verity failed to override signature");
    57	
    58		bio->bi_private = &wait;
    59		bio->bi_end_io = chromeos_invalidate_kernel_endio;
    60		bio_set_dev(bio, bdev);
    61	
    62		bio->bi_iter.bi_sector = 0;
    63		bio->bi_vcnt = 1;
    64		bio->bi_iter.bi_idx = 0;
    65		bio->bi_iter.bi_size = block_size;
    66		bio->bi_iter.bi_bvec_done = 0;
  > 67		bio->bi_opf =  op | op_flags;
    68		bio->bi_io_vec[0].bv_page = page;
    69		bio->bi_io_vec[0].bv_len = block_size;
    70		bio->bi_io_vec[0].bv_offset = 0;
    71	
    72		submit_bio(bio);
    73		/* Wait up to 2 seconds for completion or fail. */
    74		if (!wait_for_completion_timeout(&wait, msecs_to_jiffies(2000)))
    75			return -1;
    76		return 0;
    77	}
    78	
    79	static dev_t get_boot_dev_from_root_dev(struct block_device *root_bdev)
    80	{
    81		/* Very basic sanity checking. This should be better. */
    82		if (!root_bdev || MAJOR(root_bdev->bd_dev) == 254 ||
    83		    root_bdev->bd_partno <= 1) {
    84			return 0;
    85		}
    86		return MKDEV(MAJOR(root_bdev->bd_dev), MINOR(root_bdev->bd_dev) - 1);
    87	}
    88	
    89	static char kern_guid[48];
    90	
    91	/*
    92	 * get_boot_dev is based on dm_get_device_by_uuid in dm_bootcache.
    93	 *
    94	 * This function is marked __ref because it calls the __init marked
    95	 * early_lookup_bdev when called from the early boot code.
    96	 */
    97	static dev_t __ref get_boot_dev(void)
    98	{
    99		const char partuuid[] = "PARTUUID=";
   100		char uuid[sizeof(partuuid) + 36];
   101		char *uuid_str;
   102		dev_t devt;
   103	
   104		if (!strlen(kern_guid)) {
   105			DMERR("Couldn't get uuid, try root dev");
   106			return 0;
   107		}
   108	
   109		if (strncmp(kern_guid, partuuid, strlen(partuuid))) {
   110			/* Not prefixed with "PARTUUID=", so add it */
   111			strcpy(uuid, partuuid);
   112			strlcat(uuid, kern_guid, sizeof(uuid));
   113			uuid_str = uuid;
   114		} else {
   115			uuid_str = kern_guid;
   116		}
   117	        if (early_lookup_bdev(uuid_str, &devt)) {
   118	                DMDEBUG("No matching partition for GUID: %s", uuid_str);
   119	                return 0;
   120	        }
   121		return devt;
   122	}
   123	
   124	/*
   125	 * Invalidate the kernel which corresponds to the root block device.
   126	 *
   127	 * This function stamps DMVERROR on the beginning of the kernel partition.
   128	 *
   129	 * The kernel_guid commandline parameter is used to find the kernel partition
   130	 *  number.
   131	 * If that fails, the kernel partition is found by subtracting 1 from
   132	 *  the root partition.
   133	 * The DMVERROR string is stamped over only the CHROMEOS string at the
   134	 *  beginning of the kernel blob, leaving the rest of it intact.
   135	 */
   136	static int chromeos_invalidate_kernel_bio(struct block_device *root_bdev)
   137	{
   138		int ret = 0;
   139		struct block_device *bdev;
   140		struct bio *bio;
   141		struct page *page;
   142		dev_t devt;
   143		blk_mode_t dev_mode;
   144	
   145		devt = get_boot_dev();
   146		if (!devt) {
   147			devt = get_boot_dev_from_root_dev(root_bdev);
   148			if (!devt)
   149				return -EINVAL;
   150		}
   151	
   152		/* First we open the device for reading. */
   153		dev_mode = BLK_OPEN_READ | BLK_OPEN_EXCL;
   154		bdev = blkdev_get_by_dev(devt, dev_mode,
   155					 chromeos_invalidate_kernel_bio, NULL);
   156		if (IS_ERR(bdev)) {
   157			DMERR("invalidate_kernel: could not open device for reading");
   158			dev_mode = 0;
   159			ret = -1;
   160			goto failed_to_read;
   161		}
   162	
   163		bio = bio_alloc(NULL, 1, 0, GFP_NOIO);
   164		if (!bio) {
   165			ret = -1;
   166			goto failed_bio_alloc;
   167		}
   168	
   169		page = alloc_page(GFP_NOIO);
   170		if (!page) {
   171			ret = -ENOMEM;
   172			goto failed_to_alloc_page;
   173		}
   174	
   175		if (chromeos_invalidate_kernel_submit(bio, bdev,
   176						      REQ_OP_READ,
 > 177						      REQ_SYNC,
   178						      page)) {
   179			ret = -1;
   180			goto failed_to_submit_read;
   181		}
   182	
   183		/* We have a page. Let's make sure it looks right. */
   184		if (memcmp("CHROMEOS", page_address(page), 8)) {
   185			DMERR("invalidate_kernel called on non-kernel partition");
   186			ret = -EINVAL;
   187			goto invalid_header;
   188		} else {
   189			DMERR("invalidate_kernel: found CHROMEOS kernel partition");
   190		}
   191	
   192		/* Stamp it and rewrite */
   193		memcpy(page_address(page), DMVERROR, strlen(DMVERROR));
   194	
   195		/* The block dev was being changed on read. Let's reopen here. */
   196		blkdev_put(bdev, chromeos_invalidate_kernel_bio);
   197		dev_mode = BLK_OPEN_WRITE | BLK_OPEN_EXCL;
   198		bdev = blkdev_get_by_dev(devt, dev_mode,
   199					 chromeos_invalidate_kernel_bio, NULL);
   200		if (IS_ERR(bdev)) {
   201			DMERR("invalidate_kernel: could not open device for writing");
   202			dev_mode = 0;
   203			ret = -1;
   204			goto failed_to_write;
   205		}
   206	
   207		/* We re-use the same bio to do the write after the read. Need to reset
   208		 * it to initialize bio->bi_remaining.
   209		 */
   210		bio_reset(bio, NULL, 0);
   211	
   212		/*
   213		 * Request write operation with REQ_FUA flag to ensure that I/O
   214		 * completion for the write is signaled only after the data has been
   215		 * committed to non-volatile storage.
   216		 */
   217		if (chromeos_invalidate_kernel_submit(bio, bdev, REQ_OP_WRITE,
   218						      REQ_SYNC | REQ_FUA, page)) {
   219			ret = -1;
   220			goto failed_to_submit_write;
   221		}
   222	
   223		DMERR("invalidate_kernel: completed.");
   224		ret = 0;
   225	failed_to_submit_write:
   226	failed_to_write:
   227	invalid_header:
   228		__free_page(page);
   229	failed_to_submit_read:
   230		/* Technically, we'll leak a page with the pending bio, but
   231		 *  we're about to panic so it's safer to do the panic() we expect.
   232		 */
   233	failed_to_alloc_page:
   234		bio_put(bio);
   235	failed_bio_alloc:
   236		if (dev_mode)
   237			blkdev_put(bdev, chromeos_invalidate_kernel_bio);
   238	failed_to_read:
   239		return ret;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
