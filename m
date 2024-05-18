Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4391773A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716045982; cv=none; b=IHadnwAQQfjGcCVSu24nzJloA64nD3phsiYfon2CSbpGzDI78B5SshpliovzNH95GTT4GUHLTxmwVQQ/t7yWwgEosHvUi5X9CwtYiwYWbW77SdTADdhvJPEddy5Bn1p8hQc/YTl7hWdsmZLC6nhpVyrVlCj1E5L+LpfxJ++6d/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716045982; c=relaxed/simple;
	bh=+3t9ADV6PMPKV6WxuM2216KHYxpD+g4D9ELw+/CY8qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQ1On8J8oq94UfSi9HK20/lzorha42UmJXk0mh8UR2gu+4eE8PqZyk4BWmndgE6oruMVq0JIHnip/ZmfJ1Ah8Zvs0tN80PhZe2EZBN2d0rYeAOqdsxpT+TAL1/kri0faU9MD1VJaZLN4bEV9UgRnEI4KXlsxAQls/kOiDthamX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLd6Uop9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLd6Uop9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716045980; x=1747581980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+3t9ADV6PMPKV6WxuM2216KHYxpD+g4D9ELw+/CY8qw=;
  b=JLd6Uop9TcnwykSGFrrs1u0F4DmmheDw09l/t5sN62cwGNoklLXKuJO8
   MgNRlOfMHFDNTvHhpqkXCeRQ3gdwTzarrttpKiJ06UVlbFO+0/9223fAC
   rDR2jWxhbzf30NK7bXEJkIZojvuI/1Y8Bwg+wMHGxyyhK6yZVIZ5SnT/6
   KDdpw8+B8LQ7gABO5WVcKbJEqQGT4NrVlgkVLpEdmnh+N+jw2MeVFwyq6
   lZ3XPUvi1l4gTj+0ZzCpxOHZAI9WCYWsz3ruSW64g1neu6WW7WrlLtzjk
   G281FamVZ7Z4MoOiCkNwpR9AeLb1FE576BDEjF1B5uITsdLx35UUGvq2M
   A==;
X-CSE-ConnectionGUID: WMqTe02cRBOl69SglB+SpA==
X-CSE-MsgGUID: VZlmamolTt2eyC06r5G6Rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="23629015"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="23629015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:26:19 -0700
X-CSE-ConnectionGUID: wV02GoY7TviPiRpPITJnbA==
X-CSE-MsgGUID: tn7hsYZlS06saIUqZkrFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="31930116"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2024 08:26:18 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8LwD-0002Jr-14;
	Sat, 18 May 2024 15:26:03 +0000
Date: Sat, 18 May 2024 23:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v5 14/14] mm/page_frag_cache.c:289:22:
 warning: unused variable 'page'
Message-ID: <202405182342.mIwMakuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v5
head:   e6543161a8d13e28e244803a755a007021b9dea7
commit: e6543161a8d13e28e244803a755a007021b9dea7 [14/14] add alloc_pg api and refactor alloc_va api
config: arc-vdk_hs38_defconfig (https://download.01.org/0day-ci/archive/20240518/202405182342.mIwMakuN-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182342.mIwMakuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182342.mIwMakuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_frag_cache.c: In function '__page_frag_alloc_va_align':
>> mm/page_frag_cache.c:289:22: warning: unused variable 'page' [-Wunused-variable]
     289 |         struct page *page;
         |                      ^~~~
   In file included from include/linux/export.h:5,
                    from mm/page_frag_cache.c:15:
>> include/linux/compiler.h:77:42: warning: 'remaining' is used uninitialized [-Wuninitialized]
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                          ^~~~~
   mm/page_frag_cache.c:291:13: note: in expansion of macro 'unlikely'
     291 |         if (unlikely(fragsz > remaining)) {
         |             ^~~~~~~~
   mm/page_frag_cache.c:288:22: note: 'remaining' was declared here
     288 |         unsigned int remaining;
         |                      ^~~~~~~~~


vim +/page +289 mm/page_frag_cache.c

8b045aa063651c Yunsheng Lin 2024-05-15  269  
616ae9b1b510e1 Yunsheng Lin 2024-05-15  270  /**
616ae9b1b510e1 Yunsheng Lin 2024-05-15  271   * __page_frag_alloc_va_align() - Alloc a page fragment with aligning
616ae9b1b510e1 Yunsheng Lin 2024-05-15  272   * requirement.
616ae9b1b510e1 Yunsheng Lin 2024-05-15  273   * @nc: page_frag cache from which to allocate
616ae9b1b510e1 Yunsheng Lin 2024-05-15  274   * @fragsz: the requested fragment size
616ae9b1b510e1 Yunsheng Lin 2024-05-15  275   * @gfp_mask: the allocation gfp to use when cache need to be refilled
616ae9b1b510e1 Yunsheng Lin 2024-05-15  276   * @align_mask: the requested aligning requirement for the 'va'
616ae9b1b510e1 Yunsheng Lin 2024-05-15  277   *
616ae9b1b510e1 Yunsheng Lin 2024-05-15  278   * Get a page fragment from page_frag cache with aligning requirement.
616ae9b1b510e1 Yunsheng Lin 2024-05-15  279   *
616ae9b1b510e1 Yunsheng Lin 2024-05-15  280   * Return:
616ae9b1b510e1 Yunsheng Lin 2024-05-15  281   * Return va of the page fragment, otherwise return NULL.
616ae9b1b510e1 Yunsheng Lin 2024-05-15  282   */
3ba205fc955f3f Yunsheng Lin 2024-05-15  283  void *__page_frag_alloc_va_align(struct page_frag_cache *nc,
8b045aa063651c Yunsheng Lin 2024-05-15  284  				 unsigned int fragsz, gfp_t gfp_mask,
8b045aa063651c Yunsheng Lin 2024-05-15  285  				 unsigned int align_mask)
8b045aa063651c Yunsheng Lin 2024-05-15  286  {
96b2e1c760d339 Yunsheng Lin 2024-05-15  287  	struct encoded_va *encoded_va;
96b2e1c760d339 Yunsheng Lin 2024-05-15  288  	unsigned int remaining;
8b045aa063651c Yunsheng Lin 2024-05-15 @289  	struct page *page;
8b045aa063651c Yunsheng Lin 2024-05-15  290  
e6543161a8d13e Yunsheng Lin 2024-05-18  291  	if (unlikely(fragsz > remaining)) {
96b2e1c760d339 Yunsheng Lin 2024-05-15  292  		/* fragsz is not supposed to be bigger than PAGE_SIZE as we are
96b2e1c760d339 Yunsheng Lin 2024-05-15  293  		 * allowing order 3 page allocation to fail easily under low
96b2e1c760d339 Yunsheng Lin 2024-05-15  294  		 * memory condition.
96b2e1c760d339 Yunsheng Lin 2024-05-15  295  		 */
e6543161a8d13e Yunsheng Lin 2024-05-18  296  		if (WARN_ON_ONCE(fragsz > PAGE_SIZE) ||
e6543161a8d13e Yunsheng Lin 2024-05-18  297  		    unlikely(!page_frag_cache_refill(nc, gfp_mask)))
96b2e1c760d339 Yunsheng Lin 2024-05-15  298  			return NULL;
8b045aa063651c Yunsheng Lin 2024-05-15  299  	}
8b045aa063651c Yunsheng Lin 2024-05-15  300  
e6543161a8d13e Yunsheng Lin 2024-05-18  301  	encoded_va = nc->encoded_va;
96b2e1c760d339 Yunsheng Lin 2024-05-15  302  	remaining = nc->remaining & align_mask;
96b2e1c760d339 Yunsheng Lin 2024-05-15  303  	nc->remaining = remaining - fragsz;
8b045aa063651c Yunsheng Lin 2024-05-15  304  	nc->pagecnt_bias--;
8b045aa063651c Yunsheng Lin 2024-05-15  305  
96b2e1c760d339 Yunsheng Lin 2024-05-15  306  	return encoded_page_address(encoded_va) +
96b2e1c760d339 Yunsheng Lin 2024-05-15  307  		__page_frag_cache_page_offset(encoded_va, remaining);
8b045aa063651c Yunsheng Lin 2024-05-15  308  }
3ba205fc955f3f Yunsheng Lin 2024-05-15  309  EXPORT_SYMBOL(__page_frag_alloc_va_align);
8b045aa063651c Yunsheng Lin 2024-05-15  310  

:::::: The code at line 289 was first introduced by commit
:::::: 8b045aa063651c896192832fa823fb9d0bd17667 mm: move the page fragment allocator from page_alloc into its own file

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Yunsheng Lin <linyunsheng@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
