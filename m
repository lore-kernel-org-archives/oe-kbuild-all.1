Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C776DD0D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714938945; cv=none; b=aD5ygvAGLl+WFEW7v3hN8TTag3EIdPfpu/VyqAxUvSOrAxg+QcBfJUqDDs9f6wYXiFj3/0xxvRO+z13I+0Lhvj3IIOrZIDEenSCoFoiLweW9qw5bfA5Zc780liCafQ0juga80WsM+pRNUN4AJXNJdPt6L700Eq+2/h08q1LxcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714938945; c=relaxed/simple;
	bh=Bq0PgQiqmX1v1ZYFzzKDi7uBKFLgzCfDzblOUN5kg4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osm+suRO7m58HAQ5RH42jPykl6PXMFN/kRwyjsU9F5WVUb+fqueMHGe5Y2Vxdnmrp+NxQnaMHxEwjTMIpEXa6e+kwNHEbferFKO8u7BKj5khcH2jWcQHPMbogRLFS9a0TGdRKUc2SuYgy4S89R+Q4WtfZTEVzYWwGvHuUhqcH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJS/FrOj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJS/FrOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714938943; x=1746474943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bq0PgQiqmX1v1ZYFzzKDi7uBKFLgzCfDzblOUN5kg4c=;
  b=UJS/FrOjA0xEHQ/c2m/VT0O2qw5hLLIYxEuj+vKvif6hyFEX0fc2W/fc
   ChX5CiX1wO9ZoaWpPuqjXhAbJVauaF1M6V855EeDw5APNCgXjOc0JnN9Y
   Efck0duzhamodR/JcBAb9mgjjNDj0CT7e7uYpT3PWyAsRKILRFRD2Pplu
   JVjZuFZgIXdz+NQ3KmLq1MwbjPdJN3giANY2aXKueHBDAZQVeLBBKnj/7
   J48mQ8u8ltVxcDjEVTHPkb3AARpoxHwJhCNe4uaDp8fWh5usIGjxoneNA
   Dj5x2UQVhaUYQMAGD3vDaQ7UaSHn20hVsu09Zr6hrqDPwKfenPZmUEJQL
   w==;
X-CSE-ConnectionGUID: Ky0nXB70RSa2piqPdhMe2A==
X-CSE-MsgGUID: CXU2Zp6xRraLkDdjaBvC+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14494104"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14494104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 12:55:43 -0700
X-CSE-ConnectionGUID: 1bfpI5bfQ7CG+tGtKwvKTg==
X-CSE-MsgGUID: NihSLsj+ShGvpqeU+g2ibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="58841913"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2024 12:55:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3hxS-00009f-2J;
	Sun, 05 May 2024 19:55:38 +0000
Date: Mon, 6 May 2024 03:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_test 9/9] mm/page_frag_cache.c:51:1:
 warning: label 'out' defined but not used
Message-ID: <202405060341.BSLQ6ri6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_test
head:   128485e995fc7e92dfb438c15e97da66fc1d5240
commit: 128485e995fc7e92dfb438c15e97da66fc1d5240 [9/9] mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240506/202405060341.BSLQ6ri6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060341.BSLQ6ri6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060341.BSLQ6ri6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_frag_cache.c: In function '__page_frag_cache_refill':
>> mm/page_frag_cache.c:51:1: warning: label 'out' defined but not used [-Wunused-label]
      51 | out:
         | ^~~
   mm/page_frag_cache.c:24:28: warning: variable 'order' set but not used [-Wunused-but-set-variable]
      24 |         unsigned int size, order;
         |                            ^~~~~


vim +/out +51 mm/page_frag_cache.c

    20	
    21	static struct page *__page_frag_cache_refill(struct page_frag_cache *nc,
    22						     gfp_t gfp_mask)
    23	{
    24		unsigned int size, order;
    25		gfp_t gfp = gfp_mask;
    26		struct page *page;
    27	
    28	#if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
    29		/* Ensure free_unref_page() can be used to free the page fragment */
    30		BUILD_BUG_ON(PAGE_FRAG_CACHE_MAX_ORDER > PAGE_ALLOC_COSTLY_ORDER);
    31	
    32		gfp_mask = (gfp_mask & ~__GFP_DIRECT_RECLAIM) |  __GFP_COMP |
    33			   __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC;
    34		page = alloc_pages_node(NUMA_NO_NODE, gfp_mask,
    35					PAGE_FRAG_CACHE_MAX_ORDER);
    36		if (likely(page)) {
    37			size = PAGE_FRAG_CACHE_MAX_SIZE;
    38			order = PAGE_FRAG_CACHE_MAX_ORDER;
    39			goto out;
    40		}
    41	#endif
    42		page = alloc_pages_node(NUMA_NO_NODE, gfp, 0);
    43		if (unlikely(!page)) {
    44			nc->encoded_va = NULL;
    45			nc->remaining = 0;
    46			return NULL;
    47		}
    48	
    49		size = PAGE_SIZE;
    50		order = 0;
  > 51	out:
    52		nc->encoded_va = encode_aligned_va(page_address(page),
    53						   PAGE_FRAG_CACHE_MAX_ORDER,
    54						   page_is_pfmemalloc(page));
    55		nc->remaining = size;
    56		page_ref_add(page, PAGE_FRAG_CACHE_MAX_SIZE);
    57		nc->pagecnt_bias = PAGE_FRAG_CACHE_MAX_SIZE + 1;
    58	
    59		return page;
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
