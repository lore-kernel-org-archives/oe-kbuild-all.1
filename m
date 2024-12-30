Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793431799B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735560039; cv=none; b=dlNxPYHtwFS+ht81EA30RoUpHJ1Pq6OxoLL/ry6p3vKlrap6PEjR42WOwO05Hj6E9dPDIDk16G64MVHR/oozGswwIrDbxdULqomuyN0+sF1gZ45aqVd/O8hlZ77mI0kTgNjHLPbkze4Q0d2KW06Yq4jQ2Jm2ZFwga/2XmDs0BqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735560039; c=relaxed/simple;
	bh=lvO4ozbQ1MpfxMtEtbgRrYkt62nF2uiuhHrWZDbX1wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fks5ZzQNEJ++aOAZEIWrg2Zt58R1OgyRepIqZ01BePsYagSzy7H/LOqrkdflWz+IGQijeWFR6DQ1ZcLR920XSt6DHaNwBBOJpfMZsf2iiMgR/rhp32vlpwuggIblAijZS2RjHBhhiDn7dLBf6b8r9U2RlWPMKSAgIEcXwa58P7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0A89L0V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0A89L0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735560037; x=1767096037;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lvO4ozbQ1MpfxMtEtbgRrYkt62nF2uiuhHrWZDbX1wE=;
  b=J0A89L0VcZ7BjMMxbngSfQExD5rcaWLN8nNTIatfXTxG3LgYZKaNOjcb
   6asguTKpdcoUmUxDPAXsNrBhijGO+8brCkw3WqWREX2QGi08rT+MrSJ9d
   8WYpQw2fdLliJfu3SyzVL/y+cCYLwxHe2YrYQBDun30VxkXpZe3RIxHoS
   CkVqSMEx5JwWYWVeYydjT7jwC/AmApWEUFl/bKISCa6wbWRvP6fe/ynp9
   ygefQ+/EYm0+pWDA7G5oH4nAvVCdUIqAIZSovYesK/AQEaabcKzX4nd+d
   FQNRSTxVlQg23/bQZviM45ps+WMqnkVH4BiEYl6d79fvPLSmZPTlUwPz4
   Q==;
X-CSE-ConnectionGUID: yDjkgpIyTqOKffo8kBePig==
X-CSE-MsgGUID: lxsejV1uRpKkCL96WJSWMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36009648"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="36009648"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 04:00:36 -0800
X-CSE-ConnectionGUID: SroEnlZfRC291ghcboUoNA==
X-CSE-MsgGUID: XNxzUKYVTuCn5mAgZ3QDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105396100"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Dec 2024 04:00:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSERk-0005gm-1q;
	Mon, 30 Dec 2024 12:00:32 +0000
Date: Mon, 30 Dec 2024 20:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 877/877]
 mm/migrate.c:630:2: error: call to undeclared function 'folio_migrate_refs';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202412301944.hXgj67YH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   d8ee6b4ae3d261b5d5dfe13c527acea28c2724d8
commit: f835b56b3f4aef0a74db2de2afda42666877a373 [877/877] FIXUP: CHROMIUM: mm/mglru: Fix compilation with no MGLRU
config: i386-buildonly-randconfig-003-20241230 (https://download.01.org/0day-ci/archive/20241230/202412301944.hXgj67YH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412301944.hXgj67YH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412301944.hXgj67YH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/migrate.c:16:
   In file included from include/linux/migrate.h:5:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/migrate.c:22:
   include/linux/mm_inline.h:49:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:51:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      51 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/migrate.c:630:2: error: call to undeclared function 'folio_migrate_refs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     630 |         folio_migrate_refs(newfolio, folio);
         |         ^
   3 warnings and 1 error generated.


vim +/folio_migrate_refs +630 mm/migrate.c

290408d4a25002 Naoya Horiguchi         2010-09-08  587  
b20a35035f983f Christoph Lameter       2006-03-22  588  /*
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  589)  * Copy the flags and some other ancillary information
b20a35035f983f Christoph Lameter       2006-03-22  590   */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  591) void folio_migrate_flags(struct folio *newfolio, struct folio *folio)
b20a35035f983f Christoph Lameter       2006-03-22  592  {
7851a45cd3f619 Rik van Riel            2013-10-07  593  	int cpupid;
7851a45cd3f619 Rik van Riel            2013-10-07  594  
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  595) 	if (folio_test_error(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  596) 		folio_set_error(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  597) 	if (folio_test_referenced(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  598) 		folio_set_referenced(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  599) 	if (folio_test_uptodate(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  600) 		folio_mark_uptodate(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  601) 	if (folio_test_clear_active(folio)) {
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  602) 		VM_BUG_ON_FOLIO(folio_test_unevictable(folio), folio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  603) 		folio_set_active(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  604) 	} else if (folio_test_clear_unevictable(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  605) 		folio_set_unevictable(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  606) 	if (folio_test_workingset(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  607) 		folio_set_workingset(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  608) 	if (folio_test_checked(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  609) 		folio_set_checked(newfolio);
6c287605fd5646 David Hildenbrand       2022-05-09  610  	/*
6c287605fd5646 David Hildenbrand       2022-05-09  611  	 * PG_anon_exclusive (-> PG_mappedtodisk) is always migrated via
6c287605fd5646 David Hildenbrand       2022-05-09  612  	 * migration entries. We can still have PG_anon_exclusive set on an
6c287605fd5646 David Hildenbrand       2022-05-09  613  	 * effectively unmapped and unreferenced first sub-pages of an
6c287605fd5646 David Hildenbrand       2022-05-09  614  	 * anonymous THP: we can simply copy it here via PG_mappedtodisk.
6c287605fd5646 David Hildenbrand       2022-05-09  615  	 */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  616) 	if (folio_test_mappedtodisk(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  617) 		folio_set_mappedtodisk(newfolio);
b20a35035f983f Christoph Lameter       2006-03-22  618  
76541556a9a354 Peifeng Li              2022-09-13  619  	trace_android_vh_look_around_migrate_folio(folio, newfolio);
76541556a9a354 Peifeng Li              2022-09-13  620  
3417013e0d183b Matthew Wilcox (Oracle  2021-05-07  621) 	/* Move dirty on pages not done by folio_migrate_mapping() */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  622) 	if (folio_test_dirty(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  623) 		folio_set_dirty(newfolio);
b20a35035f983f Christoph Lameter       2006-03-22  624  
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  625) 	if (folio_test_young(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  626) 		folio_set_young(newfolio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  627) 	if (folio_test_idle(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  628) 		folio_set_idle(newfolio);
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  629  
a33f7320b43e22 Zhaoyang Huang          2024-09-24 @630  	folio_migrate_refs(newfolio, folio);
7851a45cd3f619 Rik van Riel            2013-10-07  631  	/*
7851a45cd3f619 Rik van Riel            2013-10-07  632  	 * Copy NUMA information to the new page, to prevent over-eager
7851a45cd3f619 Rik van Riel            2013-10-07  633  	 * future migrations of this same page.
7851a45cd3f619 Rik van Riel            2013-10-07  634  	 */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  635) 	cpupid = page_cpupid_xchg_last(&folio->page, -1);
33024536bafd91 Huang Ying              2022-07-13  636  	/*
33024536bafd91 Huang Ying              2022-07-13  637  	 * For memory tiering mode, when migrate between slow and fast
33024536bafd91 Huang Ying              2022-07-13  638  	 * memory node, reset cpupid, because that is used to record
33024536bafd91 Huang Ying              2022-07-13  639  	 * page access time in slow memory node.
33024536bafd91 Huang Ying              2022-07-13  640  	 */
33024536bafd91 Huang Ying              2022-07-13  641  	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) {
33024536bafd91 Huang Ying              2022-07-13  642  		bool f_toptier = node_is_toptier(page_to_nid(&folio->page));
33024536bafd91 Huang Ying              2022-07-13  643  		bool t_toptier = node_is_toptier(page_to_nid(&newfolio->page));
33024536bafd91 Huang Ying              2022-07-13  644  
33024536bafd91 Huang Ying              2022-07-13  645  		if (f_toptier != t_toptier)
33024536bafd91 Huang Ying              2022-07-13  646  			cpupid = -1;
33024536bafd91 Huang Ying              2022-07-13  647  	}
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  648) 	page_cpupid_xchg_last(&newfolio->page, cpupid);
7851a45cd3f619 Rik van Riel            2013-10-07  649  
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  650) 	folio_migrate_ksm(newfolio, folio);
c8d6553b958018 Hugh Dickins            2013-02-22  651  	/*
c8d6553b958018 Hugh Dickins            2013-02-22  652  	 * Please do not reorder this without considering how mm/ksm.c's
c8d6553b958018 Hugh Dickins            2013-02-22  653  	 * get_ksm_page() depends upon ksm_migrate_page() and PageSwapCache().
c8d6553b958018 Hugh Dickins            2013-02-22  654  	 */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  655) 	if (folio_test_swapcache(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  656) 		folio_clear_swapcache(folio);
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  657) 	folio_clear_private(folio);
ad2fa3717b7499 Muchun Song             2021-06-30  658  
ad2fa3717b7499 Muchun Song             2021-06-30  659  	/* page->private contains hugetlb specific flags */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  660) 	if (!folio_test_hugetlb(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  661) 		folio->private = NULL;
b20a35035f983f Christoph Lameter       2006-03-22  662  
b20a35035f983f Christoph Lameter       2006-03-22  663  	/*
b20a35035f983f Christoph Lameter       2006-03-22  664  	 * If any waiters have accumulated on the new page then
b20a35035f983f Christoph Lameter       2006-03-22  665  	 * wake them up.
b20a35035f983f Christoph Lameter       2006-03-22  666  	 */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  667) 	if (folio_test_writeback(newfolio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  668) 		folio_end_writeback(newfolio);
d435edca928805 Vlastimil Babka         2016-03-15  669  
6aeff241fe6c45 Yang Shi                2020-04-06  670  	/*
6aeff241fe6c45 Yang Shi                2020-04-06  671  	 * PG_readahead shares the same bit with PG_reclaim.  The above
6aeff241fe6c45 Yang Shi                2020-04-06  672  	 * end_page_writeback() may clear PG_readahead mistakenly, so set the
6aeff241fe6c45 Yang Shi                2020-04-06  673  	 * bit after that.
6aeff241fe6c45 Yang Shi                2020-04-06  674  	 */
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  675) 	if (folio_test_readahead(folio))
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  676) 		folio_set_readahead(newfolio);
6aeff241fe6c45 Yang Shi                2020-04-06  677  
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  678) 	folio_copy_owner(newfolio, folio);
74485cf2bc85d2 Johannes Weiner         2016-03-15  679  
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  680) 	if (!folio_test_hugetlb(folio))
d21bba2b7d0ae1 Matthew Wilcox (Oracle  2021-05-06  681) 		mem_cgroup_migrate(folio, newfolio);
b20a35035f983f Christoph Lameter       2006-03-22  682  }
19138349ed59b9 Matthew Wilcox (Oracle  2021-05-07  683) EXPORT_SYMBOL(folio_migrate_flags);
2916ecc0f9d435 Jérôme Glisse           2017-09-08  684  

:::::: The code at line 630 was first introduced by commit
:::::: a33f7320b43e2208558b33b0e6253d1bce6e1060 FROMGIT: mm: migrate LRU_REFS_MASK bits in folio_migrate_flags

:::::: TO: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
