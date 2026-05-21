Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5C285061
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340195; cv=none; b=TcRZxu6lAE0VfD+nQB2Ey5PJ/yusBmaErbFXwEpNvegLBPooNY+xR167tGaf7NQtnwYR10I6TDzcpyBqgC+bDFnEg9bo2RAs60SdssPKJuFOsWGDwMkz+AkOPakos99Y5RLVOZ4Z8wxlGL4976vEpM+tjOgLOeGH5pc7K9EFKa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340195; c=relaxed/simple;
	bh=pkQKioEOiq3Yd8aW1N+aukfMsTVvjM7X2bJUjlR4xac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNzKu1CM2cCXrbF8p/QCOLoXUtA36pOssR710gtA+IpNYrFM2FVzZLFY+wZ2Bu5NhSGtwNp39iIHyO5CrplXSbGSRxAFIZKR+JwWpbT/KFBILQ/PFV5x4OS1Wi6hmzXIdsAruQ8BSqun0w1BRV0h7TMWOFJGy0UWdQUEZj4Qpoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5gd5lYU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5gd5lYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779340193; x=1810876193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pkQKioEOiq3Yd8aW1N+aukfMsTVvjM7X2bJUjlR4xac=;
  b=c5gd5lYU7eUpozqEG8fWjewqnVey7HzoorJSZAVBxK6KRn/4TgUuc5Lk
   J6C6Auphk/vysAlxS1f9TLEgp4j+PJbxpAlTHO770dJn++joACY8gVJKx
   B0F9SduUIrlnl6jJUpxBcoo9O9NDkXEg5v1uCsReWBWvv32pmomfGqDdw
   aqRWMo0AsC/0zXYJUj3yBrHX+e/vmbwvpf9NSvJXfaJY37JUgcCLuLpGB
   geNA23z7RmTWUVdu+7/ebTR2XcmjjXR25vjgZRXyAlSwZqT/eJh3KP1pD
   gUQ/fSAyhvAVQGMpT2ZJXvCF4MRa7HKjQ6InbM5Quyw0wCQBczMO1uvVk
   g==;
X-CSE-ConnectionGUID: QH8medImSIe6nHOapDdx2A==
X-CSE-MsgGUID: YXLXejXBRbmUNuWynEeGUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80107007"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80107007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:09:53 -0700
X-CSE-ConnectionGUID: i1dpeZQ7Rput1CfibfroJA==
X-CSE-MsgGUID: dE3IohnzRbyV1A5SthmhFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="236176792"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 22:09:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvfJ-00000000AmL-2C6S;
	Thu, 21 May 2026 05:09:49 +0000
Date: Thu, 21 May 2026 07:09:49 +0200
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 40/40] mm: page_alloc: SPB tracepoint instrumentation
 [DO-NOT-MERGE]
Message-ID: <202605210734.l80ENPHT-lkp@intel.com>
References: <20260520150018.2491267-41-riel@surriel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520150018.2491267-41-riel@surriel.com>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/fixes]
[cannot apply to akpm-mm/mm-everything rppt-memblock/for-next linus/master v6.16-rc1 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260520-231340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
patch link:    https://lore.kernel.org/r/20260520150018.2491267-41-riel%40surriel.com
patch subject: [RFC PATCH 40/40] mm: page_alloc: SPB tracepoint instrumentation [DO-NOT-MERGE]
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605210734.l80ENPHT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210734.l80ENPHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210734.l80ENPHT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:120:
   kernel/../mm/internal.h: In function 'pfn_to_pageblock':
>> kernel/../mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from mm/filemap.c:54:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from mm/mm_init.c:35:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/mm_init.c: In function 'usemap_size':
>> mm/mm_init.c:1467:39: error: invalid application of 'sizeof' to incomplete type 'struct pageblock_data'
    1467 |         return nr_pageblocks * sizeof(struct pageblock_data);
         |                                       ^~~~~~
>> mm/mm_init.c:1468:1: warning: control reaches end of non-void function [-Wreturn-type]
    1468 | }
         | ^
--
   In file included from mm/page_alloc.c:58:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
>> mm/page_alloc.c:329:44: error: invalid use of undefined type 'struct pageblock_data'
     329 |         return &pfn_to_pageblock(page, pfn)->flags;
         |                                            ^~
>> mm/page_alloc.c:330:1: warning: control reaches end of non-void function [-Wreturn-type]
     330 | }
         | ^
--
   In file included from fs/exec.c:82:
   fs/../mm/internal.h: In function 'pfn_to_pageblock':
>> fs/../mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from lib/vsprintf.c:51:
   lib/../mm/internal.h: In function 'pfn_to_pageblock':
>> lib/../mm/internal.h:824:37: error: invalid use of undefined type 'struct pageblock_data'
     824 |         return &zone->pageblock_data[idx];
         |                                     ^


vim +824 kernel/../mm/internal.h

   810	
   811	static inline struct pageblock_data *pfn_to_pageblock(const struct page *page,
   812							      unsigned long pfn)
   813	{
   814	#ifdef CONFIG_SPARSEMEM
   815		struct mem_section *ms = __pfn_to_section(pfn);
   816		unsigned long idx = (pfn & (PAGES_PER_SECTION - 1)) >> pageblock_order;
   817	
   818		return &section_to_usemap(ms)[idx];
   819	#else
   820		struct zone *zone = page_zone(page);
   821		unsigned long idx;
   822	
   823		idx = (pfn - pageblock_start_pfn(zone->zone_start_pfn)) >> pageblock_order;
 > 824		return &zone->pageblock_data[idx];
   825	#endif
   826	}
   827	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
