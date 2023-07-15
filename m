Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C927FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689414059; x=1720950059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S58W8uqdYRQ13v2hxYJlN5cBHGqnBJBBHVl4k3baPLM=;
  b=j6d8XCCBq2F/1Av9Po0uqny13JYP+pfl+SmkixPRNdk6+QiZueRNgr1L
   UjSRR2MEXphB9C+W22nVeSPZY2eT9kxPzyygOuwEAkniwieF55r4Xi8iK
   lQlA0Vdx0ZIFoF6Em3US/y98jXDMmJHitGaHALWMhCYzBUjoHOSm/rpaF
   9tGyyQgb7BKqqnvvDCviYnD0V2KmBQL+DhC/r12uabgZjuscckCxOWWSg
   u0WpOh6wRfwO+CpTBXVLPhnK8fEHmemsJpAwRsSbqS45GAIP9GBbfYlAa
   59WlQ37kRiEoAOwuBWroXbI7FspUeKdC7NrhECYWvL6yHCuWp+E16e4UY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="365689760"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="365689760"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 02:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896671197"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="896671197"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jul 2023 02:40:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKblo-00086D-0k;
	Sat, 15 Jul 2023 09:40:56 +0000
Date: Sat, 15 Jul 2023 17:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev, Hu Haowen <src.res.211@gmail.com>
Subject: [srcres258-doc:next 1/1] mm/hugetlb.c:7236:6: warning: no previous
 prototype for 'is_raw_hwp_subpage'
Message-ID: <202307151708.HLazIdzW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/srcres258/linux-doc next
head:   402c80656f93d63ae5b6d2bdd940f13abf809879
commit: 402c80656f93d63ae5b6d2bdd940f13abf809879 [1/1] Merge commit 'f0412619534a7315acfcbfdf1fa7aa7e8a93f69c' into next
config: loongarch-randconfig-r036-20230715 (https://download.01.org/0day-ci/archive/20230715/202307151708.HLazIdzW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151708.HLazIdzW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151708.HLazIdzW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/hugetlb.c:8:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:277:34: warning: missing braces around initializer [-Wmissing-braces]
     277 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:513:16: note: in expansion of macro '__swp_entry_to_pmd'
     513 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/hugetlb.c: At top level:
>> mm/hugetlb.c:7236:6: warning: no previous prototype for 'is_raw_hwp_subpage' [-Wmissing-prototypes]
    7236 | bool is_raw_hwp_subpage(struct folio *folio, struct page *subpage)
         |      ^~~~~~~~~~~~~~~~~~


vim +/is_raw_hwp_subpage +7236 mm/hugetlb.c

405ce051236cc6 Naoya Horiguchi 2022-04-21  7235  
e833a46a28d799 Jiaqi Yan       2023-07-07 @7236  bool is_raw_hwp_subpage(struct folio *folio, struct page *subpage)
e833a46a28d799 Jiaqi Yan       2023-07-07  7237  {
e833a46a28d799 Jiaqi Yan       2023-07-07  7238  	bool ret;
e833a46a28d799 Jiaqi Yan       2023-07-07  7239  
e833a46a28d799 Jiaqi Yan       2023-07-07  7240  	spin_lock_irq(&hugetlb_lock);
e833a46a28d799 Jiaqi Yan       2023-07-07  7241  	ret = __is_raw_hwp_subpage(folio, subpage);
e833a46a28d799 Jiaqi Yan       2023-07-07  7242  	spin_unlock_irq(&hugetlb_lock);
e833a46a28d799 Jiaqi Yan       2023-07-07  7243  	return ret;
e833a46a28d799 Jiaqi Yan       2023-07-07  7244  }
e833a46a28d799 Jiaqi Yan       2023-07-07  7245  

:::::: The code at line 7236 was first introduced by commit
:::::: e833a46a28d799bf3c4816d79487ee5f8b6fef51 mm/hwpoison: check if a subpage of a hugetlb folio is raw HWPOISON

:::::: TO: Jiaqi Yan <jiaqiyan@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
