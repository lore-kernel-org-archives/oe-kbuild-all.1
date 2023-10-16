Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF33A347DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB47L+1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697485458; x=1729021458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kGuhVPJj+hRRdhM3+/1uD61+lqPjHungSyIhtGmjYg=;
  b=jB47L+1a/OwKuPaSe53fpZHVRJYsORwkYjcoz0LGx14hg6zvg6NLo1dd
   me5CgCp0XXB0Q1yZUrNswUaBfzzVs1mUXVwjUz1aC/fyZB7IFdM/lUkXz
   O4Wbvwjpu/uYvATF+wAz7Dt6P/yWEdynH5PKBs3m6goVepCe4kb+UssiM
   /gkKyLEKoDofOUfoEOo7epTmQS6krcrqyB5fLfn1cf31Qn4pmaZ3Eo8zQ
   +/7SddxHyG53M+0a86zvRrXC+fAnYi977b8jHAMlRlCdwwn1c6uGHQgXv
   KBffFfr2UpmYNxUSPiFiExooJAhMBj55Akkf37FeIprOLca3biLkCcc1s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370698424"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="370698424"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 12:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087207544"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="1087207544"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 12:44:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsTVb-0008cz-2T;
	Mon, 16 Oct 2023 19:44:11 +0000
Date: Tue, 17 Oct 2023 03:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12146/12451] include/linux/bitmap.h:527:25:
 error: 'EBUSY' undeclared
Message-ID: <202310170340.tkkfdZYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0515b235dec789578d135a5db586b25c5870cb
commit: b9c957f5544422461e17b1010fa9114024632d7a [12146/12451] bitmap: move bitmap_*_region() functions to bitmap.h
config: arm-randconfig-s032-20220424 (https://download.01.org/0day-ci/archive/20231017/202310170340.tkkfdZYn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170340.tkkfdZYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170340.tkkfdZYn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from arch/arm/boot/compressed/../../../../lib/lz4/lz4_decompress.c:39,
                    from arch/arm/boot/compressed/../../../../lib/decompress_unlz4.c:10,
                    from arch/arm/boot/compressed/decompress.c:60:
   include/linux/bitmap.h: In function 'bitmap_allocate_region':
>> include/linux/bitmap.h:527:25: error: 'EBUSY' undeclared (first use in this function)
     527 |                 return -EBUSY;
         |                         ^~~~~
   include/linux/bitmap.h:527:25: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/bitmap.h: In function 'bitmap_find_free_region':
>> include/linux/bitmap.h:554:17: error: 'ENOMEM' undeclared (first use in this function)
     554 |         return -ENOMEM;
         |                 ^~~~~~


vim +/EBUSY +527 include/linux/bitmap.h

   510	
   511	/**
   512	 * bitmap_allocate_region - allocate bitmap region
   513	 *	@bitmap: array of unsigned longs corresponding to the bitmap
   514	 *	@pos: beginning of bit region to allocate
   515	 *	@order: region size (log base 2 of number of bits) to allocate
   516	 *
   517	 * Allocate (set bits in) a specified region of a bitmap.
   518	 *
   519	 * Returns: 0 on success, or %-EBUSY if specified region wasn't
   520	 * free (not all bits were zero).
   521	 */
   522	static inline int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order)
   523	{
   524		unsigned int len = BIT(order);
   525	
   526		if (find_next_bit(bitmap, pos + len, pos) < pos + len)
 > 527			return -EBUSY;
   528		bitmap_set(bitmap, pos, len);
   529		return 0;
   530	}
   531	
   532	/**
   533	 * bitmap_find_free_region - find a contiguous aligned mem region
   534	 *	@bitmap: array of unsigned longs corresponding to the bitmap
   535	 *	@bits: number of bits in the bitmap
   536	 *	@order: region size (log base 2 of number of bits) to find
   537	 *
   538	 * Find a region of free (zero) bits in a @bitmap of @bits bits and
   539	 * allocate them (set them to one).  Only consider regions of length
   540	 * a power (@order) of two, aligned to that power of two, which
   541	 * makes the search algorithm much faster.
   542	 *
   543	 * Returns: the bit offset in bitmap of the allocated region,
   544	 * or -errno on failure.
   545	 */
   546	static inline int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order)
   547	{
   548		unsigned int pos, end;		/* scans bitmap by regions of size order */
   549	
   550		for (pos = 0; (end = pos + BIT(order)) <= bits; pos = end) {
   551			if (!bitmap_allocate_region(bitmap, pos, order))
   552				return pos;
   553		}
 > 554		return -ENOMEM;
   555	}
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
