Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99CDDA6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/UEAXOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703449469; x=1734985469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FBjEhTqLmPWSSyH+0hZEb0tP8ogRb4SjQo6bHoIQ5vk=;
  b=W/UEAXOQDZlrhMDnKJhSX3tLLEpqt083cWvuXzcW5wI27TeGwcCRLX15
   Yq499aOeQAOhCVmygQCokebIy/yoUPzR9l6fzylBQ0x4e7s6dR0oyIUgU
   Sb/b8VCVAHRe5WcYFAzXZaFQ2zCZjTijsFwvyGhW1xALE0WCMby2vz2KF
   HF9NOCyn/TUUqcIhvCprdkQOoy7UCToKF5kVB0BIyDEyKZWxijVYpRQnT
   5l7quFj5xUXvcDIgCasy2JDwUcOo9DLRUqWbXP0rV+7iK7D4TTX5qTcKh
   xMxH1EOyuSHaNg8rSXfWrOP8CICWIImkvQaTy9XwlMMS/7dyoR9q8CEZ0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="386681484"
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="386681484"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 12:24:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,301,1695711600"; 
   d="scan'208";a="25909544"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2023 12:24:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHV1B-000Cbz-0D;
	Sun, 24 Dec 2023 20:24:17 +0000
Date: Mon, 25 Dec 2023 04:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 for-6.8/block 01/17] block: add some bdev apis
Message-ID: <202312250302.HnqjvbMO-lkp@intel.com>
References: <20231221085712.1766333-2-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221085712.1766333-2-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on axboe-block/for-next kdave/for-next linus/master v6.7-rc7]
[cannot apply to next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-add-some-bdev-apis/20231222-165436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20231221085712.1766333-2-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC v3 for-6.8/block 01/17] block: add some bdev apis
config: i386-buildonly-randconfig-004-20231224 (https://download.01.org/0day-ci/archive/20231225/202312250302.HnqjvbMO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312250302.HnqjvbMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312250302.HnqjvbMO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bdev.c:106: warning: expecting prototype for invalidate_bdev_pages(). Prototype was for invalidate_bdev_range() instead
>> block/bdev.c:1229: warning: expecting prototype for bdev_async_readahead(). Prototype was for bdev_sync_readahead() instead


vim +106 block/bdev.c

    91	
    92	/**
    93	 * invalidate_bdev_pages - Invalidate clean unused buffers and pagecache.
    94	 * @bdev: the block device which holds the cache to invalidate
    95	 * @start: the offset 'from' which to invalidate
    96	 * @end: the offset 'to' which to invalidate (inclusive)
    97	 *
    98	 * This function removes pages that are clean, unmapped and unlocked,
    99	 * as well as shadow entries. It will not block on IO activity.
   100	 *
   101	 * If you want to remove all the pages of one block device, regardless of
   102	 * their use and writeback state, use truncate_bdev_range().
   103	 */
   104	void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
   105				   pgoff_t end)
 > 106	{
   107		invalidate_mapping_pages(bdev->bd_inode->i_mapping, start, end);
   108	}
   109	EXPORT_SYMBOL_GPL(invalidate_bdev_range);
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
