Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294219BBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234541; cv=none; b=dMTWESoaS36MCCnpecYSPfR46XvYKLYMGMe4dvbbI74LAvV/1u3ISOeD9QB0XODkoOcxrX3C1W7nledFObMNkDBTPsmsv/uhy0XkWp/lkyybgZ7ascRjLCmom9sG060OEdjfubgU7MlKjZoo/HMLc8TIPnEYAB/R1rSOuyjzdjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234541; c=relaxed/simple;
	bh=1icq9jSxAe5V2hWKWqC55XK6M+3IkVMUjY+spgAIUIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQvFlz0XV6NK+ZifAGkgBUt9KPn2NAXsTnEq845oIYQaxyt7b9ZLc2FUBWyrERjAgnASBTo1QjxcYUrRqSxn7Plw8J5UunGymtYBXg5yGkQcW9BKYwRFqNiefwOwpKoJDjwp6VURNIrsJMMVERdzQbg1pl0JG/PIsC+FlmtnZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSzyLj8x; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSzyLj8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747234539; x=1778770539;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1icq9jSxAe5V2hWKWqC55XK6M+3IkVMUjY+spgAIUIU=;
  b=RSzyLj8xb4CZFcI1aO5Bkt3PtlsuPYHutn8gOVap7HtnhkGYwFNv5gnH
   +mZJLfLB7g3evT0Z5MmlYenaGcXA5I+tJPL+7jFA3XqQNBPBzl83oh8NY
   xwzTe7WrXVFpXH/oNrdWsfy3BBWACVEHtYKn92i1gMFAjdctHiVH1pK7C
   o6hB5d8Pn4JrURxPglbkgBskfhuTmik6QNIAkA3atZV8dlEPenIvoDcij
   UEfjn3UZWuRDT77P64nqIBySxAJqQwH8AgfAuW47XbggegSumoeNnvF3X
   NzS1+3uHPrSx1rA2I1515wYgtIUm6UKg+W+9lyaVWIMXGAHcwxs71PXO8
   w==;
X-CSE-ConnectionGUID: yL+ULpiEQpOtp/VmXh2U1Q==
X-CSE-MsgGUID: jAQK1IY5TcaK0k5jWRk3Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49277305"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49277305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:55:38 -0700
X-CSE-ConnectionGUID: bI3UkzDqRpyIfdQEcts94Q==
X-CSE-MsgGUID: E25EP62sQp+Ru075UdasRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="143260543"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 May 2025 07:55:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFDWA-000HFF-39;
	Wed, 14 May 2025 14:55:34 +0000
Date: Wed, 14 May 2025 22:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 4/4] mm/migrate.c:630:9:
 error: implicit declaration of function 'folio_migrate_refs'; did you mean
 'folio_migrate_ksm'?
Message-ID: <202505142225.BsuNSqq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: b6776081daa3730aac859791902664bf9a8be4f5 [4/4] FIXUP: CHROMIUM: mm/mglru: Fix compilation with no MGLRU
config: x86_64-randconfig-101-20250513 (https://download.01.org/0day-ci/archive/20250514/202505142225.BsuNSqq9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142225.BsuNSqq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142225.BsuNSqq9-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function 'folio_migrate_flags':
>> mm/migrate.c:630:9: error: implicit declaration of function 'folio_migrate_refs'; did you mean 'folio_migrate_ksm'? [-Werror=implicit-function-declaration]
     630 |         folio_migrate_refs(newfolio, folio);
         |         ^~~~~~~~~~~~~~~~~~
         |         folio_migrate_ksm
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +630 mm/migrate.c

290408d4a25002f Naoya Horiguchi         2010-09-08  587  
b20a35035f983f4 Christoph Lameter       2006-03-22  588  /*
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  589)  * Copy the flags and some other ancillary information
b20a35035f983f4 Christoph Lameter       2006-03-22  590   */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  591) void folio_migrate_flags(struct folio *newfolio, struct folio *folio)
b20a35035f983f4 Christoph Lameter       2006-03-22  592  {
7851a45cd3f6198 Rik van Riel            2013-10-07  593  	int cpupid;
7851a45cd3f6198 Rik van Riel            2013-10-07  594  
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  595) 	if (folio_test_error(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  596) 		folio_set_error(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  597) 	if (folio_test_referenced(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  598) 		folio_set_referenced(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  599) 	if (folio_test_uptodate(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  600) 		folio_mark_uptodate(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  601) 	if (folio_test_clear_active(folio)) {
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  602) 		VM_BUG_ON_FOLIO(folio_test_unevictable(folio), folio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  603) 		folio_set_active(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  604) 	} else if (folio_test_clear_unevictable(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  605) 		folio_set_unevictable(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  606) 	if (folio_test_workingset(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  607) 		folio_set_workingset(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  608) 	if (folio_test_checked(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  609) 		folio_set_checked(newfolio);
6c287605fd56466 David Hildenbrand       2022-05-09  610  	/*
6c287605fd56466 David Hildenbrand       2022-05-09  611  	 * PG_anon_exclusive (-> PG_mappedtodisk) is always migrated via
6c287605fd56466 David Hildenbrand       2022-05-09  612  	 * migration entries. We can still have PG_anon_exclusive set on an
6c287605fd56466 David Hildenbrand       2022-05-09  613  	 * effectively unmapped and unreferenced first sub-pages of an
6c287605fd56466 David Hildenbrand       2022-05-09  614  	 * anonymous THP: we can simply copy it here via PG_mappedtodisk.
6c287605fd56466 David Hildenbrand       2022-05-09  615  	 */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  616) 	if (folio_test_mappedtodisk(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  617) 		folio_set_mappedtodisk(newfolio);
b20a35035f983f4 Christoph Lameter       2006-03-22  618  
76541556a9a3540 Peifeng Li              2022-09-13  619  	trace_android_vh_look_around_migrate_folio(folio, newfolio);
76541556a9a3540 Peifeng Li              2022-09-13  620  
3417013e0d183be Matthew Wilcox (Oracle  2021-05-07  621) 	/* Move dirty on pages not done by folio_migrate_mapping() */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  622) 	if (folio_test_dirty(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  623) 		folio_set_dirty(newfolio);
b20a35035f983f4 Christoph Lameter       2006-03-22  624  
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  625) 	if (folio_test_young(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  626) 		folio_set_young(newfolio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  627) 	if (folio_test_idle(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  628) 		folio_set_idle(newfolio);
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  629  
a33f7320b43e220 Zhaoyang Huang          2024-09-24 @630  	folio_migrate_refs(newfolio, folio);
7851a45cd3f6198 Rik van Riel            2013-10-07  631  	/*
7851a45cd3f6198 Rik van Riel            2013-10-07  632  	 * Copy NUMA information to the new page, to prevent over-eager
7851a45cd3f6198 Rik van Riel            2013-10-07  633  	 * future migrations of this same page.
7851a45cd3f6198 Rik van Riel            2013-10-07  634  	 */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  635) 	cpupid = page_cpupid_xchg_last(&folio->page, -1);
33024536bafd912 Huang Ying              2022-07-13  636  	/*
33024536bafd912 Huang Ying              2022-07-13  637  	 * For memory tiering mode, when migrate between slow and fast
33024536bafd912 Huang Ying              2022-07-13  638  	 * memory node, reset cpupid, because that is used to record
33024536bafd912 Huang Ying              2022-07-13  639  	 * page access time in slow memory node.
33024536bafd912 Huang Ying              2022-07-13  640  	 */
33024536bafd912 Huang Ying              2022-07-13  641  	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) {
33024536bafd912 Huang Ying              2022-07-13  642  		bool f_toptier = node_is_toptier(page_to_nid(&folio->page));
33024536bafd912 Huang Ying              2022-07-13  643  		bool t_toptier = node_is_toptier(page_to_nid(&newfolio->page));
33024536bafd912 Huang Ying              2022-07-13  644  
33024536bafd912 Huang Ying              2022-07-13  645  		if (f_toptier != t_toptier)
33024536bafd912 Huang Ying              2022-07-13  646  			cpupid = -1;
33024536bafd912 Huang Ying              2022-07-13  647  	}
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  648) 	page_cpupid_xchg_last(&newfolio->page, cpupid);
7851a45cd3f6198 Rik van Riel            2013-10-07  649  
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  650) 	folio_migrate_ksm(newfolio, folio);
c8d6553b9580188 Hugh Dickins            2013-02-22  651  	/*
c8d6553b9580188 Hugh Dickins            2013-02-22  652  	 * Please do not reorder this without considering how mm/ksm.c's
c8d6553b9580188 Hugh Dickins            2013-02-22  653  	 * get_ksm_page() depends upon ksm_migrate_page() and PageSwapCache().
c8d6553b9580188 Hugh Dickins            2013-02-22  654  	 */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  655) 	if (folio_test_swapcache(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  656) 		folio_clear_swapcache(folio);
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  657) 	folio_clear_private(folio);
ad2fa3717b74994 Muchun Song             2021-06-30  658  
ad2fa3717b74994 Muchun Song             2021-06-30  659  	/* page->private contains hugetlb specific flags */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  660) 	if (!folio_test_hugetlb(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  661) 		folio->private = NULL;
b20a35035f983f4 Christoph Lameter       2006-03-22  662  
b20a35035f983f4 Christoph Lameter       2006-03-22  663  	/*
b20a35035f983f4 Christoph Lameter       2006-03-22  664  	 * If any waiters have accumulated on the new page then
b20a35035f983f4 Christoph Lameter       2006-03-22  665  	 * wake them up.
b20a35035f983f4 Christoph Lameter       2006-03-22  666  	 */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  667) 	if (folio_test_writeback(newfolio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  668) 		folio_end_writeback(newfolio);
d435edca9288050 Vlastimil Babka         2016-03-15  669  
6aeff241fe6c456 Yang Shi                2020-04-06  670  	/*
6aeff241fe6c456 Yang Shi                2020-04-06  671  	 * PG_readahead shares the same bit with PG_reclaim.  The above
6aeff241fe6c456 Yang Shi                2020-04-06  672  	 * end_page_writeback() may clear PG_readahead mistakenly, so set the
6aeff241fe6c456 Yang Shi                2020-04-06  673  	 * bit after that.
6aeff241fe6c456 Yang Shi                2020-04-06  674  	 */
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  675) 	if (folio_test_readahead(folio))
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  676) 		folio_set_readahead(newfolio);
6aeff241fe6c456 Yang Shi                2020-04-06  677  
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  678) 	folio_copy_owner(newfolio, folio);
74485cf2bc85d2a Johannes Weiner         2016-03-15  679  
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  680) 	if (!folio_test_hugetlb(folio))
d21bba2b7d0ae19 Matthew Wilcox (Oracle  2021-05-06  681) 		mem_cgroup_migrate(folio, newfolio);
b20a35035f983f4 Christoph Lameter       2006-03-22  682  }
19138349ed59b90 Matthew Wilcox (Oracle  2021-05-07  683) EXPORT_SYMBOL(folio_migrate_flags);
2916ecc0f9d435d Jérôme Glisse           2017-09-08  684  

:::::: The code at line 630 was first introduced by commit
:::::: a33f7320b43e2208558b33b0e6253d1bce6e1060 FROMGIT: mm: migrate LRU_REFS_MASK bits in folio_migrate_flags

:::::: TO: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
