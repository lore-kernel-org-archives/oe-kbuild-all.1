Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC31F12E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 22:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755557936; cv=none; b=ezTgRNVDoDNKtl/yktB/3/q4r25+Gr5qjCu4g/ucBfiHWLuQZ1Q9/6ujwV5dLmkZaaSRd7FXbhk4kEc2ju39ndDzotGmL7CekSrN8evckqOc+A4v294ulQnOFaV+PNhpkX6BAlQ00pZS2HhNOocWDnahLSRMUziBF6tNCNQ+Hh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755557936; c=relaxed/simple;
	bh=2HQvf1YEkkaHrThEUEdZD/k8fdfjHt1nCIMTWIqU6J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbRZC3WlWxugB1HtctJOzWZK5eNVgc/1GtPFBPe0dE1kVtEMdr7fGk8Ot+iFOBGZZbTF9Cn2Xc3ZQSzKTRA7Y4pyUyL/nZKu3xmnfd7PRqch4yHMcl3OgJGvqAz1vc84mWWieNRX6gwBcmtPDHPfELgo3kt4WXSbmjydsbV+c2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlG7cqsR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlG7cqsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755557934; x=1787093934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HQvf1YEkkaHrThEUEdZD/k8fdfjHt1nCIMTWIqU6J8=;
  b=RlG7cqsRzT/gXLOHJOgVQxCNEPvw7b5OZtJbtBq+7E9q7k7D+EYG+aNV
   IxvM+9Us+HG/CB1dlO+q8L/JaYxdW94133dIoROaqa6qknYSI4SePxlQ0
   Tw0YuWDP9vXYKqVFsTFC9duBu/C8T6/96fAOQ/gP3jtBAlxmO3QPIfkEw
   2S5BSeaTCxGeS0QfG/tmP1Ruwa3OfV2HZtp+ZmD6Nu6ipnSVwHzsBKzZM
   H4zl1BkEuipR4QdV4RQufC9z3tfqN/mAAKJz7bNnhu9M7FyKbLSdKBVVk
   UkLwOEdLOrifchHlnsG5JygZH5KhA1l4Hf5uiBYxE8brw3SG6vo8pgY32
   Q==;
X-CSE-ConnectionGUID: N9JYIzdMQ/yrj3T9BiFzVw==
X-CSE-MsgGUID: qgu8wfSZSSKQebjXlXFigA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68396952"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68396952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 15:58:54 -0700
X-CSE-ConnectionGUID: Kh3Y7NnZT+yfQR3kPqCK4g==
X-CSE-MsgGUID: 1xDzuJsZSv6ASwnVZwU2iA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 18 Aug 2025 15:58:52 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo8oU-0001Bz-1i;
	Mon, 18 Aug 2025 22:58:50 +0000
Date: Tue, 19 Aug 2025 00:57:55 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] mm/memory.c:5277:24: warning: variable
 'nr_pages' set but not used
Message-ID: <202508190033.UvAhiuWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zi,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 3bfa35ccde9e52ca74fed047eb4d89be32dd9e5e [2687/2687] mm/numa: no task_numa_fault() call if PTE is changed
config: x86_64-buildonly-randconfig-2001-20250818 (https://download.01.org/0day-ci/archive/20250819/202508190033.UvAhiuWp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190033.UvAhiuWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190033.UvAhiuWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'do_numa_page':
>> mm/memory.c:5277:24: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5277 |         int flags = 0, nr_pages;
         |                        ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


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
