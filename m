Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7330188907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732214919; cv=none; b=Q1h6t6R7OAg3SNWBcKtfsetMhiZzqUNKU9mXw/KgI6v+r9PiWdXC3m45tl6DoWsV7yysK9zKRktE/mMrZ6qvBcSz2ZdIic8KTjVSIXSHzt8hSfhZLyDlcwxAIHSllo4DaGHhKhPbakfOu0yjIfqZOi9NcqamqwL1lYZei7ceLe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732214919; c=relaxed/simple;
	bh=b+muyN3Won4F1x4LMozq3F3zX1gttse/iW7/XfQW+Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8sWrBFBU4n/UYykNH0iAdfl3qDxE2Auxqx6dl5/tTQSTrqrQYurXOuYnjxCswxLTp6kIzkSziWOniYOKT+BLgRWCUFFI9sr/7FGvZ5qgDguM6LzfQ5IGhAEvWQVvkgrUF2USr/PnaJmVNihcgg4vdHONkQGUfXv8oL9/NawJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcf1RH0u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcf1RH0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732214916; x=1763750916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b+muyN3Won4F1x4LMozq3F3zX1gttse/iW7/XfQW+Ps=;
  b=jcf1RH0uZgk5dTUx/W13alfc1vfGZgjyKHH8Aw4mJHOUpAHHRuL1NLsT
   TjOo22DewHMtOxWniObVH1U/C4+tb2Qwg/mcOwkq8h8HHQV+BU06rM/Fm
   TFSyuw4Ntsiu4u6nKoi4/oP+6Q1Od80+jIh9jiYtTwDkOMN76iApQt3Mt
   jn66ct6ujZ9Yge0HwXCGL932AgFqFuqCF2u/5mnFxxnPeSvALqZNOc3Yh
   YrHbCHa4ogpCQ+fTUkDn/3q08pqqIsP3hKb7utv3ebTxtp7TPYd6LO9Gq
   08eul6mFnCUK0Ztcd96iZ+97vJmFCscLqmv/MkeUQes2M39L8qokRmGvM
   g==;
X-CSE-ConnectionGUID: FnLc8rQ/Qsa03ZKyEAfNtA==
X-CSE-MsgGUID: Bt+DgCESTW6CwY5TsB14XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42962965"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="42962965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 10:48:36 -0800
X-CSE-ConnectionGUID: 693ogU59TYy/zaTOm43dmg==
X-CSE-MsgGUID: dvgdHMnqR/CjgbJY5SDvSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="94425859"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 10:48:35 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tECEC-0003G7-38;
	Thu, 21 Nov 2024 18:48:32 +0000
Date: Fri, 22 Nov 2024 02:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wen Zhiwei <wenzhiwei@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1513/1513] mm/memory.c:5277:17: warning: variable
 'nr_pages' set but not used
Message-ID: <202411220229.ELIipVRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab293c3a32ba6594fd24cd7ecd4a4a00ede0cd65
commit: 3bfa35ccde9e52ca74fed047eb4d89be32dd9e5e [1513/1513] mm/numa: no task_numa_fault() call if PTE is changed
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241122/202411220229.ELIipVRO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220229.ELIipVRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220229.ELIipVRO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.


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
