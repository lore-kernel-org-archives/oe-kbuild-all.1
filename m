Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEAB1E25FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928268; cv=none; b=bMzJaoJvdWbUtgTiQu6/zNHZINzRoNrx432lc4TD/+CREKtUkI9QHvIvaA4Czy668ATGOD5C5+DT9hKPaiwj0wMjSaVuV+7QAnphd+BUx06PpJyoVRVnQttb1kKeA1Qc/ft7IOSmbXd3WatbGLXGPQUVpdqZNdoRUiirMFoDiNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928268; c=relaxed/simple;
	bh=/2AXmNLNzdIUoWKOKSRD78MvbCLPPZ4H4sXQ2Hyrj+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwPRpQcAs63EQkLa/yxXjGncsvhc5eo8xFk/TVqFDOfJXrbAFUcLy/m0AemkItvcdKpMwtyNBBXh8qXQyJz/o/MUIAXGp5OaPMbSWnBcia2vOXvmkBJXjfBjP2orxZCr8gZQ71u2bkQo+yN6sbaCJE502m+QxSJOK+5yfq0GgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1CjKXwP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1CjKXwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750928267; x=1782464267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2AXmNLNzdIUoWKOKSRD78MvbCLPPZ4H4sXQ2Hyrj+Y=;
  b=R1CjKXwPvqc2490McuiHgjYGS7SYjhRMhkUqQUUtdg3+zATjhqw8dSYv
   ANyVyVLWeiqMLbwJLhzl5ZkgO/ylMdMhXMyD866+pu7WTls4DRogzaAMX
   xL1pXdfHE2BNn6JyP+YZVBQdrnq9Nkq1KMxKlBga3XoagDi/JAMfbFwyq
   y9Ywuo/flH3iyR9BEDukmIrzb16NxRvIRoMzrGaofD9Yy2qUe3gXZgkjA
   SlpJ/Ts6AyuP8c9c2zX8Gerby1aOF+vQmEReZDrcyWDqL/BGKDonuWWXp
   ZQSaW73PwG4DhrQ3YPH4lsu0+7TujWjOzqSzQSS7rEYFF4k35rOAJgS1o
   A==;
X-CSE-ConnectionGUID: kIRGFOTCTa2PDOQd3LTalg==
X-CSE-MsgGUID: T7DeROr7TC2oyj7cOHyF8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="75757435"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="75757435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:57:46 -0700
X-CSE-ConnectionGUID: xXx7UcmtTgy967zH9KvG8w==
X-CSE-MsgGUID: UySbiMyyQviTa9VJZGnO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152222053"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2025 01:57:46 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUiQR-0000FX-0K;
	Thu, 26 Jun 2025 08:57:43 +0000
Date: Thu, 26 Jun 2025 10:56:57 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] mm/memory.c:5277:17: warning: variable
 'nr_pages' set but not used
Message-ID: <202506261637.qYfRPb91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 3bfa35ccde9e52ca74fed047eb4d89be32dd9e5e [2195/2195] mm/numa: no task_numa_fault() call if PTE is changed
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250626/202506261637.qYfRPb91-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261637.qYfRPb91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261637.qYfRPb91-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:44:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memory.c:5277:17: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5277 |         int flags = 0, nr_pages;
         |                        ^
   4 warnings generated.


vim +/nr_pages +5277 mm/memory.c

f569661eacc258 Baolin Wang       2024-05-11  5266  
2b7403035459c7 Souptick Joarder  2018-08-23  5267  static vm_fault_t do_numa_page(struct vm_fault *vmf)
d10e63f29488b0 Mel Gorman        2012-10-25  5268  {
82b0f8c39a3869 Jan Kara          2016-12-14  5269  	struct vm_area_struct *vma = vmf->vma;
d5e6c8d5790088 Kefeng Wang       2023-11-27  5270  	struct folio *folio = NULL;
d5e6c8d5790088 Kefeng Wang       2023-11-27  5271  	int nid = NUMA_NO_NODE;
2cb37064a2b82c Baolin Wang       2024-06-22  5272  	bool writable = false, ignore_writable = false;
2cb37064a2b82c Baolin Wang       2024-06-22  5273  	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
90572890d20252 Peter Zijlstra    2013-10-07  5274  	int last_cpupid;
cbee9f88ec1b8d Peter Zijlstra    2012-10-25  5275  	int target_nid;
04a8645304500b Aneesh Kumar K.V  2019-03-05  5276  	pte_t pte, old_pte;
2cb37064a2b82c Baolin Wang       2024-06-22 @5277  	int flags = 0, nr_pages;
d10e63f29488b0 Mel Gorman        2012-10-25  5278  
d10e63f29488b0 Mel Gorman        2012-10-25  5279  	/*
e2491c31fb10ae John Hubbard      2024-05-25  5280  	 * The pte cannot be used safely until we verify, while holding the page
e2491c31fb10ae John Hubbard      2024-05-25  5281  	 * table lock, that its contents have not changed during fault handling.
d10e63f29488b0 Mel Gorman        2012-10-25  5282  	 */
82b0f8c39a3869 Jan Kara          2016-12-14  5283  	spin_lock(vmf->ptl);
e2491c31fb10ae John Hubbard      2024-05-25  5284  	/* Read the live PTE from the page tables: */
e2491c31fb10ae John Hubbard      2024-05-25  5285  	old_pte = ptep_get(vmf->pte);
e2491c31fb10ae John Hubbard      2024-05-25  5286  
e2491c31fb10ae John Hubbard      2024-05-25  5287  	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
82b0f8c39a3869 Jan Kara          2016-12-14  5288  		pte_unmap_unlock(vmf->pte, vmf->ptl);
3bfa35ccde9e52 Zi Yan            2024-08-09  5289  		return 0;
4daae3b4b9e49b Mel Gorman        2012-11-02  5290  	}
4daae3b4b9e49b Mel Gorman        2012-11-02  5291  
04a8645304500b Aneesh Kumar K.V  2019-03-05  5292  	pte = pte_modify(old_pte, vma->vm_page_prot);
d10e63f29488b0 Mel Gorman        2012-10-25  5293  
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5294  	/*
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5295  	 * Detect now whether the PTE could be writable; this information
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5296  	 * is only valid while holding the PT lock.
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5297  	 */
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5298  	writable = pte_write(pte);
2cb37064a2b82c Baolin Wang       2024-06-22  5299  	if (!writable && pte_write_upgrade &&
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5300  	    can_change_pte_writable(vma, vmf->address, pte))
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5301  		writable = true;
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5302  
d5e6c8d5790088 Kefeng Wang       2023-11-27  5303  	folio = vm_normal_folio(vma, vmf->address, pte);
d5e6c8d5790088 Kefeng Wang       2023-11-27  5304  	if (!folio || folio_is_zone_device(folio))
b99a342d4f11a5 Huang Ying        2021-04-29  5305  		goto out_map;
d10e63f29488b0 Mel Gorman        2012-10-25  5306  
6688cc05473b36 Peter Zijlstra    2013-10-07  5307  	/*
bea66fbd11af1c Mel Gorman        2015-03-25  5308  	 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
bea66fbd11af1c Mel Gorman        2015-03-25  5309  	 * much anyway since they can be in shared cache state. This misses
bea66fbd11af1c Mel Gorman        2015-03-25  5310  	 * the case where a mapping is writable but the process never writes
bea66fbd11af1c Mel Gorman        2015-03-25  5311  	 * to it but pte_write gets cleared during protection updates and
bea66fbd11af1c Mel Gorman        2015-03-25  5312  	 * pte_dirty has unpredictable behaviour between PTE scan updates,
bea66fbd11af1c Mel Gorman        2015-03-25  5313  	 * background writeback, dirty balancing and application behaviour.
bea66fbd11af1c Mel Gorman        2015-03-25  5314  	 */
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5315  	if (!writable)
6688cc05473b36 Peter Zijlstra    2013-10-07  5316  		flags |= TNF_NO_GROUP;
6688cc05473b36 Peter Zijlstra    2013-10-07  5317  
dabe1d992414a6 Rik van Riel      2013-10-07  5318  	/*
d5e6c8d5790088 Kefeng Wang       2023-11-27  5319  	 * Flag if the folio is shared between multiple address spaces. This
dabe1d992414a6 Rik van Riel      2013-10-07  5320  	 * is later used when determining whether to group tasks together
dabe1d992414a6 Rik van Riel      2013-10-07  5321  	 */
b8eba2d7e4a309 David Hildenbrand 2024-05-11  5322  	if (folio_likely_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
dabe1d992414a6 Rik van Riel      2013-10-07  5323  		flags |= TNF_SHARED;
dabe1d992414a6 Rik van Riel      2013-10-07  5324  
d5e6c8d5790088 Kefeng Wang       2023-11-27  5325  	nid = folio_nid(folio);
2cb37064a2b82c Baolin Wang       2024-06-22  5326  	nr_pages = folio_nr_pages(folio);
33024536bafd91 Huang Ying        2022-07-13  5327  	/*
33024536bafd91 Huang Ying        2022-07-13  5328  	 * For memory tiering mode, cpupid of slow memory page is used
33024536bafd91 Huang Ying        2022-07-13  5329  	 * to record page access time.  So use default value.
33024536bafd91 Huang Ying        2022-07-13  5330  	 */
33024536bafd91 Huang Ying        2022-07-13  5331  	if ((sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
d5e6c8d5790088 Kefeng Wang       2023-11-27  5332  	    !node_is_toptier(nid))
33024536bafd91 Huang Ying        2022-07-13  5333  		last_cpupid = (-1 & LAST_CPUPID_MASK);
33024536bafd91 Huang Ying        2022-07-13  5334  	else
28e1ec746768bb Kefeng Wang       2023-11-27  5335  		last_cpupid = folio_last_cpupid(folio);
bf7c2ab764599b Kefeng Wang       2023-11-27  5336  	target_nid = numa_migrate_prep(folio, vma, vmf->address, nid, &flags);
98fa15f34cb379 Anshuman Khandual 2019-03-05  5337  	if (target_nid == NUMA_NO_NODE) {
d5e6c8d5790088 Kefeng Wang       2023-11-27  5338  		folio_put(folio);
b99a342d4f11a5 Huang Ying        2021-04-29  5339  		goto out_map;
4daae3b4b9e49b Mel Gorman        2012-11-02  5340  	}
b99a342d4f11a5 Huang Ying        2021-04-29  5341  	pte_unmap_unlock(vmf->pte, vmf->ptl);
6a56ccbcf6c695 David Hildenbrand 2022-11-08  5342  	writable = false;
2cb37064a2b82c Baolin Wang       2024-06-22  5343  	ignore_writable = true;
4daae3b4b9e49b Mel Gorman        2012-11-02  5344  
4daae3b4b9e49b Mel Gorman        2012-11-02  5345  	/* Migrate to the requested node */
d5e6c8d5790088 Kefeng Wang       2023-11-27  5346  	if (migrate_misplaced_folio(folio, vma, target_nid)) {
d5e6c8d5790088 Kefeng Wang       2023-11-27  5347  		nid = target_nid;
6688cc05473b36 Peter Zijlstra    2013-10-07  5348  		flags |= TNF_MIGRATED;
3bfa35ccde9e52 Zi Yan            2024-08-09  5349  		task_numa_fault(last_cpupid, nid, 1, flags);
3bfa35ccde9e52 Zi Yan            2024-08-09  5350  		return 0;
3bfa35ccde9e52 Zi Yan            2024-08-09  5351  	}
3bfa35ccde9e52 Zi Yan            2024-08-09  5352  
074c238177a75f Mel Gorman        2015-03-25  5353  	flags |= TNF_MIGRATE_FAIL;
c7ad08804fae5b Hugh Dickins      2023-06-08  5354  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, 
c7ad08804fae5b Hugh Dickins      2023-06-08  5355  			               vmf->address, &vmf->ptl);
c7ad08804fae5b Hugh Dickins      2023-06-08  5356  	if (unlikely(!vmf->pte))
3bfa35ccde9e52 Zi Yan            2024-08-09  5357  		return 0;
c33c794828f212 Ryan Roberts      2023-06-12  5358  	if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
b99a342d4f11a5 Huang Ying        2021-04-29  5359  		pte_unmap_unlock(vmf->pte, vmf->ptl);
d10e63f29488b0 Mel Gorman        2012-10-25  5360  		return 0;
3bfa35ccde9e52 Zi Yan            2024-08-09  5361  	}
b99a342d4f11a5 Huang Ying        2021-04-29  5362  out_map:
b99a342d4f11a5 Huang Ying        2021-04-29  5363  	/*
b99a342d4f11a5 Huang Ying        2021-04-29  5364  	 * Make it present again, depending on how arch implements
b99a342d4f11a5 Huang Ying        2021-04-29  5365  	 * non-accessible ptes, some can allow access by kernel mode.
b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 */
2cb37064a2b82c Baolin Wang       2024-06-22  5367  	if (folio && folio_test_large(folio))
2cb37064a2b82c Baolin Wang       2024-06-22  5368  		numa_rebuild_large_mapping(vmf, vma, folio, pte, ignore_writable,
2cb37064a2b82c Baolin Wang       2024-06-22  5369  					   pte_write_upgrade);
2cb37064a2b82c Baolin Wang       2024-06-22  5370  	else
2cb37064a2b82c Baolin Wang       2024-06-22  5371  		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
2cb37064a2b82c Baolin Wang       2024-06-22  5372  					    writable);
b99a342d4f11a5 Huang Ying        2021-04-29  5373  	pte_unmap_unlock(vmf->pte, vmf->ptl);
3bfa35ccde9e52 Zi Yan            2024-08-09  5374  
3bfa35ccde9e52 Zi Yan            2024-08-09  5375  	if (nid != NUMA_NO_NODE)
3bfa35ccde9e52 Zi Yan            2024-08-09  5376  		task_numa_fault(last_cpupid, nid, 1, flags);
3bfa35ccde9e52 Zi Yan            2024-08-09  5377  	return 0;
d10e63f29488b0 Mel Gorman        2012-10-25  5378  }
d10e63f29488b0 Mel Gorman        2012-10-25  5379  

:::::: The code at line 5277 was first introduced by commit
:::::: 2cb37064a2b82cd8ebeeaaed21259b5912dff51d mm: support multi-size THP numa balancing

:::::: TO: Baolin Wang <baolin.wang@linux.alibaba.com>
:::::: CC: Liu Shixin <liushixin2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
