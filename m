Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86FF168BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692289834; x=1723825834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HUELBaoIqG5gC/eMADgo/OvMV/tdwgksvsAnQE+2rIk=;
  b=U1vPzmTLguntkXv+r40EGMUlbCJ/qZjiuLCRw6IO7zLPIyNT1aVU07LD
   qPLyFWhOPJgyiOsgTsx507iZrTDi2PQrUJKsWoM0SQ58U91hCbkusOKkB
   5flvwVjuWJejk0mq+WgGWvBRk/AMN/tWDaBgMDRauiGmVeXg2x0aWWD7C
   1km/nrC2Oup6VsA3PW6Eo1Gpi8dPZBF9VHsLew1g3zf70kUA3XKrRddp4
   K1p08reJUZ2Sh2N71RJ9fBW6x7vy2OAJFsN0SO1jH+zMmgQsvwnOjRdyt
   V3M+yEGVZ9EVHGm3ahhCy8OhQmSILxslDECjr8gvQBmZK1AoVYqLkR7TA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363021229"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363021229"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 09:30:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734718908"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="734718908"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 09:30:32 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWftH-0001K6-0V;
	Thu, 17 Aug 2023 16:30:31 +0000
Date: Fri, 18 Aug 2023 00:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:aass 11/17] include/linux/bitmap.h:629:25: error: 'EBUSY'
 undeclared
Message-ID: <202308180042.0R195nyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux aass
head:   e211be4b64839aeefa5f9de667a409803063d2d6
commit: b61791a23a9a9e776203781c45aa306fa1a10069 [11/17] bitmap: move bitmap_*_region functions to bitmap.h
config: arm-randconfig-r005-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180042.0R195nyA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180042.0R195nyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180042.0R195nyA-lkp@intel.com/

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
>> include/linux/bitmap.h:629:25: error: 'EBUSY' undeclared (first use in this function)
     629 |                 return -EBUSY;
         |                         ^~~~~
   include/linux/bitmap.h:629:25: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/bitmap.h: In function 'bitmap_find_free_region':
>> include/linux/bitmap.h:656:17: error: 'ENOMEM' undeclared (first use in this function)
     656 |         return -ENOMEM;
         |                 ^~~~~~


vim +/EBUSY +629 include/linux/bitmap.h

   612	
   613	/**
   614	 * bitmap_allocate_region - allocate bitmap region
   615	 *	@bitmap: array of unsigned longs corresponding to the bitmap
   616	 *	@pos: beginning of bit region to allocate
   617	 *	@order: region size (log base 2 of number of bits) to allocate
   618	 *
   619	 * Allocate (set bits in) a specified region of a bitmap.
   620	 *
   621	 * Return: 0 on success, or %-EBUSY if specified region wasn't
   622	 * free (not all bits were zero).
   623	 */
   624	static inline int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order)
   625	{
   626		unsigned int len = BIT(order);
   627	
   628		if (find_next_bit(bitmap, pos + len, pos) < pos + len)
 > 629			return -EBUSY;
   630		bitmap_set(bitmap, pos, len);
   631		return 0;
   632	}
   633	
   634	/*
   635	 * bitmap_find_free_region - find a contiguous aligned mem region
   636	 *	@bitmap: array of unsigned longs corresponding to the bitmap
   637	 *	@bits: number of bits in the bitmap
   638	 *	@order: region size (log base 2 of number of bits) to find
   639	 *
   640	 * Find a region of free (zero) bits in a @bitmap of @bits bits and
   641	 * allocate them (set them to one).  Only consider regions of length
   642	 * a power (@order) of two, aligned to that power of two, which
   643	 * makes the search algorithm much faster.
   644	 *
   645	 * Return: the bit offset in bitmap of the allocated region,
   646	 * or -errno on failure.
   647	 */
   648	static inline int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order)
   649	{
   650		unsigned int pos, end;		/* scans bitmap by regions of size order */
   651	
   652		for (pos = 0; (end = pos + BIT(order)) <= bits; pos = end) {
   653			if (!bitmap_allocate_region(bitmap, pos, order))
   654				return pos;
   655		}
 > 656		return -ENOMEM;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
