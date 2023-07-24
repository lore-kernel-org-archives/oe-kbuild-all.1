Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236FAF9E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690220053; x=1721756053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hefD9mlfmcdDOVuixhUxITOsmmTVl4sFC0Fe6KykCgI=;
  b=STTSNhj7zXojywd7wFp27VzCTrSPPou9aUi4avG/IyX5kTGfXmm+G95V
   U9QDhy3ZUVZwFZLlLoooPPGil+04ti++vE6b7JGvgMjSQtcoXYLGjlZ2e
   gJZz2RVXgCZCNKZ4v5ObJIZTc3g+H9wn2HIRmXUPgxQHrWPZkmpKRykIG
   6+2oAN+zfmK9euLN4v0a+fFb4zGR/d9t7fzcVyBIJCPDd+wDxLIiyH0ki
   gZ+0twG1yMoOihl+TNDYXwfcKyER1T/GZkfiA2lZxTPR0aps9xaRm4GKu
   ++9MTA7XAGKEbMBZ6AdDkA+zXvebVn3hBiGkqrLewMf2aj7U2HRx5HSO2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398415578"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398415578"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755385764"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="755385764"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Jul 2023 10:34:10 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNzRi-0009us-0P;
	Mon, 24 Jul 2023 17:34:10 +0000
Date: Tue, 25 Jul 2023 01:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/4] mm/hugetlb: Skip prep of tail pages when HVO is enabled
Message-ID: <202307250114.8KlXie9d-lkp@intel.com>
References: <20230724134644.1299963-2-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724134644.1299963-2-usama.arif@bytedance.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-hugetlb-Skip-prep-of-tail-pages-when-HVO-is-enabled/20230724-214832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230724134644.1299963-2-usama.arif%40bytedance.com
patch subject: [RFC 1/4] mm/hugetlb: Skip prep of tail pages when HVO is enabled
config: sparc-randconfig-r036-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250114.8KlXie9d-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250114.8KlXie9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250114.8KlXie9d-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb.c: In function '__prep_compound_gigantic_folio':
>> mm/hugetlb.c:1988:28: error: 'HUGETLB_VMEMMAP_RESERVE_SIZE' undeclared (first use in this function)
    1988 |                 nr_pages = HUGETLB_VMEMMAP_RESERVE_SIZE / sizeof(struct page);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:1988:28: note: each undeclared identifier is reported only once for each function it appears in


vim +/HUGETLB_VMEMMAP_RESERVE_SIZE +1988 mm/hugetlb.c

  1972	
  1973	static bool __prep_compound_gigantic_folio(struct folio *folio,
  1974						unsigned int order, bool demote,
  1975						bool hugetlb_vmemmap_optimizable)
  1976	{
  1977		int i, j;
  1978		int nr_pages = 1 << order;
  1979		struct page *p;
  1980	
  1981		__folio_clear_reserved(folio);
  1982	
  1983		/*
  1984		 * No need to prep pages that will be freed later by hugetlb_vmemmap_optimize
  1985		 * in prep_new_huge_page. Hence, reduce nr_pages to the pages that will be kept.
  1986		 */
  1987		if (hugetlb_vmemmap_optimizable)
> 1988			nr_pages = HUGETLB_VMEMMAP_RESERVE_SIZE / sizeof(struct page);
  1989	
  1990		for (i = 0; i < nr_pages; i++) {
  1991			p = folio_page(folio, i);
  1992	
  1993			/*
  1994			 * For gigantic hugepages allocated through bootmem at
  1995			 * boot, it's safer to be consistent with the not-gigantic
  1996			 * hugepages and clear the PG_reserved bit from all tail pages
  1997			 * too.  Otherwise drivers using get_user_pages() to access tail
  1998			 * pages may get the reference counting wrong if they see
  1999			 * PG_reserved set on a tail page (despite the head page not
  2000			 * having PG_reserved set).  Enforcing this consistency between
  2001			 * head and tail pages allows drivers to optimize away a check
  2002			 * on the head page when they need know if put_page() is needed
  2003			 * after get_user_pages().
  2004			 */
  2005			if (i != 0)	/* head page cleared above */
  2006				__ClearPageReserved(p);
  2007			/*
  2008			 * Subtle and very unlikely
  2009			 *
  2010			 * Gigantic 'page allocators' such as memblock or cma will
  2011			 * return a set of pages with each page ref counted.  We need
  2012			 * to turn this set of pages into a compound page with tail
  2013			 * page ref counts set to zero.  Code such as speculative page
  2014			 * cache adding could take a ref on a 'to be' tail page.
  2015			 * We need to respect any increased ref count, and only set
  2016			 * the ref count to zero if count is currently 1.  If count
  2017			 * is not 1, we return an error.  An error return indicates
  2018			 * the set of pages can not be converted to a gigantic page.
  2019			 * The caller who allocated the pages should then discard the
  2020			 * pages using the appropriate free interface.
  2021			 *
  2022			 * In the case of demote, the ref count will be zero.
  2023			 */
  2024			if (!demote) {
  2025				if (!page_ref_freeze(p, 1)) {
  2026					pr_warn("HugeTLB page can not be used due to unexpected inflated ref count\n");
  2027					goto out_error;
  2028				}
  2029			} else {
  2030				VM_BUG_ON_PAGE(page_count(p), p);
  2031			}
  2032			if (i != 0)
  2033				set_compound_head(p, &folio->page);
  2034		}
  2035		__folio_set_head(folio);
  2036		/* we rely on prep_new_hugetlb_folio to set the destructor */
  2037		folio_set_order(folio, order);
  2038		atomic_set(&folio->_entire_mapcount, -1);
  2039		atomic_set(&folio->_nr_pages_mapped, 0);
  2040		atomic_set(&folio->_pincount, 0);
  2041		return true;
  2042	
  2043	out_error:
  2044		/* undo page modifications made above */
  2045		for (j = 0; j < i; j++) {
  2046			p = folio_page(folio, j);
  2047			if (j != 0)
  2048				clear_compound_head(p);
  2049			set_page_refcounted(p);
  2050		}
  2051		/* need to clear PG_reserved on remaining tail pages  */
  2052		for (; j < nr_pages; j++) {
  2053			p = folio_page(folio, j);
  2054			__ClearPageReserved(p);
  2055		}
  2056		return false;
  2057	}
  2058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
