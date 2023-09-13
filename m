Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03DC803
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694575201; x=1726111201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hdw8/lQV9smDZLbO6M3+xszz9yt4ge1PONjl2MZlFz8=;
  b=FYa3jOrWQ/HYwa75JewNEh+41bNLXQQBjxhPcGGRxQ0OCTrepbdWC5vx
   8469IZ/+s9gut3j2A3lLHb5fJgWc/eo/0kXhd7mmU0SZvnx+VtUdiJ3c4
   cy7Nv8u+KA8CrkRUt3UKwVKXvQoaOZeMJ3F+gc61u2wAzce0V8L4danD4
   swjgqIJ3542LD/Nck3ul01sOe0p6E+gm919q5gATxCTEkuQXPMPxQZKw7
   TV4nnZuBRHtKOeayUlg4nYM5yP0X1jbP/NYRE1HsQ8EQgPqTrGpsDiav5
   t8ZY0iSDSkFnMGTe0FUq0sRpEOtLkBrR9kNqA2zRERAq48kD1DuBrIQ4S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444991390"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="444991390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737330221"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="737330221"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Sep 2023 20:20:00 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGQ1-00000z-2W;
	Wed, 13 Sep 2023 03:19:57 +0000
Date: Wed, 13 Sep 2023 11:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <zi.yan@sent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] mm/compaction: add support for >0 order folio
 memory compaction.
Message-ID: <202309131044.fMW8Zabt-lkp@intel.com>
References: <20230912162815.440749-2-zi.yan@sent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912162815.440749-2-zi.yan@sent.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-compaction-add-support-for-0-order-folio-memory-compaction/20230913-003027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230912162815.440749-2-zi.yan%40sent.com
patch subject: [RFC PATCH 1/4] mm/compaction: add support for >0 order folio memory compaction.
config: i386-randconfig-r006-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131044.fMW8Zabt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131044.fMW8Zabt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131044.fMW8Zabt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:135:13: warning: 'sort_free_pages' defined but not used [-Wunused-function]
     135 | static void sort_free_pages(struct list_head *src, struct free_list *dst)
         |             ^~~~~~~~~~~~~~~
>> mm/compaction.c:110:22: warning: 'release_free_list' defined but not used [-Wunused-function]
     110 | static unsigned long release_free_list(struct free_list *freepages)
         |                      ^~~~~~~~~~~~~~~~~


vim +/sort_free_pages +135 mm/compaction.c

   109	
 > 110	static unsigned long release_free_list(struct free_list *freepages)
   111	{
   112		int order;
   113		unsigned long high_pfn = 0;
   114	
   115		for (order = 0; order <= MAX_ORDER; order++) {
   116			struct page *page, *next;
   117	
   118			list_for_each_entry_safe(page, next, &freepages[order].pages, lru) {
   119				unsigned long pfn = page_to_pfn(page);
   120	
   121				list_del(&page->lru);
   122				/*
   123				 * Convert free pages into post allocation pages, so
   124				 * that we can free them via __free_page.
   125				 */
   126				post_alloc_hook(page, order, __GFP_MOVABLE);
   127				__free_pages(page, order);
   128				if (pfn > high_pfn)
   129					high_pfn = pfn;
   130			}
   131		}
   132		return high_pfn;
   133	}
   134	
 > 135	static void sort_free_pages(struct list_head *src, struct free_list *dst)
   136	{
   137		unsigned int order;
   138		struct page *page, *next;
   139	
   140		list_for_each_entry_safe(page, next, src, lru) {
   141			order = buddy_order(page);
   142	
   143			list_move(&page->lru, &dst[order].pages);
   144			dst[order].nr_free++;
   145		}
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
