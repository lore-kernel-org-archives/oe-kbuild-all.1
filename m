Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F704BA45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714159570; cv=none; b=DgweYYjFSCVyKbcZRaUTr5vTMx40ql5AjuC9p0aIey8bvOZjSq8UXCctccFomZ1xG8mEucxDg7Y66qXKOqdzcnqSVN1fUM01j++Z43stZgXhnQNdORcx0TkgumAeWOo1fTGaqrwzuB8U9d+o+TUGuOIBeerw2kJ4IJrzXG0+l1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714159570; c=relaxed/simple;
	bh=KgeCy5sXzQqsEPrFkjedF+Aa937qamfaCTMgOebhLi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIDV5C3dBvKFMuwJe5pPKQQczL4Ag3w5PNuCAXj4CMRBXDxtnbnFJ9fUTjEvkGPuU6e9UJOb0XFVeOuBRwAjtotEUgUd6fRCWivaL9fVw4Ap1zBqD7fA6Ok2AD9gb9Agtobi/R1n4dSv+7aSZMZMJdkDoGhe44pSByJrRMBxNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTzRA2vv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTzRA2vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714159568; x=1745695568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KgeCy5sXzQqsEPrFkjedF+Aa937qamfaCTMgOebhLi4=;
  b=WTzRA2vvc9eN66R5NeMdUDfFRKIzJmEeQTf974DDmYea/1pQ5hzvvE/Y
   35mBKHTlMTqELohV6iOtvLF/eZcVK4NbL2l0QcsO0nVlfg6GvIgm0JTTG
   r0Jcjxy2EIUjYLTlPJNvg88Qhf9AClyJsKO8jrFWdwRHL+PwI9XM/k2Ww
   PDcUKQZXeh/cvqI1+ghbwW6RInPKlYq5xuay01vG+e3m/LCNu1pjQEh3v
   P7HsbzF0IArL/vLyvhd8MbMLTHviFTxUnv+tbc7My/XoIZ/DGCMOiJsCB
   zXjC1lOGAupbxBx+cNVsoM68IXVNoen7Q0IOirhe81NZu5cppc8d+60Vz
   w==;
X-CSE-ConnectionGUID: Q1xN07jBTba2ngmDEae76Q==
X-CSE-MsgGUID: dj6iz0WlQ2O5IZXoZAiIRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="20592569"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="20592569"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 12:26:07 -0700
X-CSE-ConnectionGUID: vMXTY8y/RH65MTQdNf4/ig==
X-CSE-MsgGUID: uiHCJPttTp6k4n6kjArFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25913388"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Apr 2024 12:26:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0RCt-0004As-1X;
	Fri, 26 Apr 2024 19:26:03 +0000
Date: Sat, 27 Apr 2024 03:25:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 31/33]
 drivers/md/dm-verity-chromeos.c:177:47: sparse: sparse: incorrect type in
 argument 4 (different base types)
Message-ID: <202404270341.0o1zTCme-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   32b84185bd19d2bd0070fd34152e0e1f20e2e160
commit: 3817c02346151b4e6796a6c4b212209e4a429c1d [31/33] CHROMIUM: dm-verity: Remove REQ_PREFLUSH during REQ_OP_READ
config: arm-randconfig-r121-20240426 (https://download.01.org/0day-ci/archive/20240427/202404270341.0o1zTCme-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce: (https://download.01.org/0day-ci/archive/20240427/202404270341.0o1zTCme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270341.0o1zTCme-lkp@intel.com/

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
