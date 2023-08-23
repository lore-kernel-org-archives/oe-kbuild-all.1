Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD08C132
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692793980; x=1724329980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XnpA35LfJDLKCRlvJjVhs2705u6X9OOp+1E2Ns9N6Lw=;
  b=kZjv1IxRYRUmp1BCQnVzHayvI/3/QqPFFFMo6x5rYReh0QcxlT2BBJjn
   5j4iuUVtYNu0nSda69p/aioySOEqCzIH8M1RxYiQ2frVAqja5Z13e5pI6
   RSqHKxsRMtNlBRewKozKZt5CdkNAHcYOJ0Z8EJW0ZMFhFPzxSx9CSBU1b
   emNyIDoSWVlUb+wmaN573Zj6Wj8g16pxO/z7GgW8Vvxr66jyBiTGi+05+
   ohANZBbOureIG43s/M6MIjKAGNHyPRxRjzuBersQ7d+hfb1QuY3DI06V3
   3n2aIxQK/312hRdhBmDXtmPwqo5RH7E7g4ZZrFECeoNvYYE26NIuWLC/Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="353697915"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353697915"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="739762317"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739762317"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 05:32:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYn2f-0001Bs-0t;
	Wed, 23 Aug 2023 12:32:57 +0000
Date: Wed, 23 Aug 2023 20:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11986/12208] fs/proc/task_mmu.c:457:40: error:
 implicit declaration of function 'is_ksm_zero_pte'
Message-ID: <202308232003.eoFc7Z2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 5233d9beb1a81c08d8155b62df5e9635ee99ee27 [11986/12208] proc/ksm: add ksm stats to /proc/pid/smaps
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230823/202308232003.eoFc7Z2h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232003.eoFc7Z2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232003.eoFc7Z2h-lkp@intel.com/

Note: the linux-next/master HEAD e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'smaps_account':
>> fs/proc/task_mmu.c:457:40: error: implicit declaration of function 'is_ksm_zero_pte' [-Werror=implicit-function-declaration]
     457 |         if (PageKsm(page) && (!pte || !is_ksm_zero_pte(*pte)))
         |                                        ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/is_ksm_zero_pte +457 fs/proc/task_mmu.c

   439	
   440	static void smaps_account(struct mem_size_stats *mss, pte_t *pte,
   441			struct page *page, bool compound, bool young, bool dirty,
   442			bool locked, bool migration)
   443	{
   444		int i, nr = compound ? compound_nr(page) : 1;
   445		unsigned long size = nr * PAGE_SIZE;
   446	
   447		/*
   448		 * First accumulate quantities that depend only on |size| and the type
   449		 * of the compound page.
   450		 */
   451		if (PageAnon(page)) {
   452			mss->anonymous += size;
   453			if (!PageSwapBacked(page) && !dirty && !PageDirty(page))
   454				mss->lazyfree += size;
   455		}
   456	
 > 457		if (PageKsm(page) && (!pte || !is_ksm_zero_pte(*pte)))
   458			mss->ksm += size;
   459	
   460		mss->resident += size;
   461		/* Accumulate the size in pages that have been accessed. */
   462		if (young || page_is_young(page) || PageReferenced(page))
   463			mss->referenced += size;
   464	
   465		/*
   466		 * Then accumulate quantities that may depend on sharing, or that may
   467		 * differ page-by-page.
   468		 *
   469		 * page_count(page) == 1 guarantees the page is mapped exactly once.
   470		 * If any subpage of the compound page mapped with PTE it would elevate
   471		 * page_count().
   472		 *
   473		 * The page_mapcount() is called to get a snapshot of the mapcount.
   474		 * Without holding the page lock this snapshot can be slightly wrong as
   475		 * we cannot always read the mapcount atomically.  It is not safe to
   476		 * call page_mapcount() even with PTL held if the page is not mapped,
   477		 * especially for migration entries.  Treat regular migration entries
   478		 * as mapcount == 1.
   479		 */
   480		if ((page_count(page) == 1) || migration) {
   481			smaps_page_accumulate(mss, page, size, size << PSS_SHIFT, dirty,
   482				locked, true);
   483			return;
   484		}
   485		for (i = 0; i < nr; i++, page++) {
   486			int mapcount = page_mapcount(page);
   487			unsigned long pss = PAGE_SIZE << PSS_SHIFT;
   488			if (mapcount >= 2)
   489				pss /= mapcount;
   490			smaps_page_accumulate(mss, page, PAGE_SIZE, pss, dirty, locked,
   491					      mapcount < 2);
   492		}
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
