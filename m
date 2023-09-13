Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2517758
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694593206; x=1726129206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t6PgzNq9JclD/gNmVmIzXa6ZlnPJZG1iTN3HuYc+09c=;
  b=YvQTJRwJzMic1+NtrJkv4fBLtTHlTlVFbmuQ8BeY5J87qcAgRSCjdUzP
   l9EnXlZUzICKs4A/EQz/0lXuofKwCNB2c39BexCoxxn/shGzRsYK3/vpb
   RUOswiL/eg/3YzaItV6atmP9WrmcAZhUii9eXUr4wiC9nvujhZ1qalNFR
   /DTLAxsZ5YrAPRmC6/+keyQrnopikDhKqUlZgDXNmKo/SHL8333/V3Noo
   SiRaLRv2gDj/3lDg4L+RpEPvlXBXzgyQ2jSvwChylbn3CV19Z91QNCFiW
   1Dwd1+s8aDgD9dyRHrhR/yRFvr1LdJB3AiyBK4Jv4xY5rVGDXeeVO+Fkt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409546866"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="409546866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 01:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="744040033"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="744040033"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Sep 2023 01:20:03 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgL6P-0000GT-2g;
	Wed, 13 Sep 2023 08:20:01 +0000
Date: Wed, 13 Sep 2023 16:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <zi.yan@sent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] mm/compaction: optimize >0 order folio
 compaction by sorting source pages.
Message-ID: <202309131503.WNQRkkKb-lkp@intel.com>
References: <20230912162815.440749-4-zi.yan@sent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912162815.440749-4-zi.yan@sent.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-compaction-add-support-for-0-order-folio-memory-compaction/20230913-003027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230912162815.440749-4-zi.yan%40sent.com
patch subject: [RFC PATCH 3/4] mm/compaction: optimize >0 order folio compaction by sorting source pages.
config: i386-randconfig-r006-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131503.WNQRkkKb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131503.WNQRkkKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131503.WNQRkkKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/compaction.c:148:13: warning: 'sort_folios_by_order' defined but not used [-Wunused-function]
     148 | static void sort_folios_by_order(struct list_head *pages)
         |             ^~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:135:13: warning: 'sort_free_pages' defined but not used [-Wunused-function]
     135 | static void sort_free_pages(struct list_head *src, struct free_list *dst)
         |             ^~~~~~~~~~~~~~~
   mm/compaction.c:110:22: warning: 'release_free_list' defined but not used [-Wunused-function]
     110 | static unsigned long release_free_list(struct free_list *freepages)
         |                      ^~~~~~~~~~~~~~~~~


vim +/sort_folios_by_order +148 mm/compaction.c

   147	
 > 148	static void sort_folios_by_order(struct list_head *pages)
   149	{
   150		struct free_list page_list[MAX_ORDER + 1];
   151		int order;
   152		struct folio *folio, *next;
   153	
   154		for (order = 0; order <= MAX_ORDER; order++) {
   155			INIT_LIST_HEAD(&page_list[order].pages);
   156			page_list[order].nr_free = 0;
   157		}
   158	
   159		list_for_each_entry_safe(folio, next, pages, lru) {
   160			order = folio_order(folio);
   161	
   162			if (order > MAX_ORDER)
   163				continue;
   164	
   165			list_move(&folio->lru, &page_list[order].pages);
   166			page_list[order].nr_free++;
   167		}
   168	
   169		for (order = MAX_ORDER; order >= 0; order--) {
   170			if (page_list[order].nr_free) {
   171	
   172				list_for_each_entry_safe(folio, next,
   173							 &page_list[order].pages, lru) {
   174					list_move_tail(&folio->lru, pages);
   175				}
   176			}
   177		}
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
