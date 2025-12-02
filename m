Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A723E350
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764710155; cv=none; b=Tmc0cvlC5Z7az+uEcnU+lyoGgnfvhlx9XLXKRVqxLS5l3QQI47gRiPVfuumDETMYwVkQ8mDy+IiEOG/fqAkIpAdtOLx6ZfA5REPYDcMYfug80VlyHPYO0lQGWvDm7l04DUJpHrZcokLgyzIPdlRgY/cO9vSJ32YdqN3gnBUrGBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764710155; c=relaxed/simple;
	bh=YAq9AnmC3mpN8UGS7H0AfgXSb1uMLx7hmOQbveeOegk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n433ea556ht69KyYceRYORgPcReN5RPxafSvIwui4AqtTF37mdnKPaP3vL329F2qEwCHyJX/1umSmikdCl30xODxBzSuvZKISv/X7G5jNJbVtSCvUgeM38K4RCG2dZhuf2LtVutzSmQcTQyqmzBIajARfuTXz5bIpcdMDILPcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HP7Ymg5w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HP7Ymg5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764710153; x=1796246153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YAq9AnmC3mpN8UGS7H0AfgXSb1uMLx7hmOQbveeOegk=;
  b=HP7Ymg5whtzE+r4KuoTpjpBhD7Gtf0o9KZ2zv8v23a4yiDQVeWS61m0O
   17REsy98+rDUiBFkGUO0u5oj5ZPoCDHOTz0t+tP36MD7miPozAhibRJ9m
   nIBwSdcEzFwQyP1oyCauCbnBOFIgA/asuUAgoSGGpUFqeg4UYSWnnMIY3
   qbllm6zQP1DNt/h3k6frxTLzDZ38Vn5KEHYl8S7WpB0He+EaezN5s3pCn
   +uQsarnns7vGmDOHqvp+Jcp5HlffZt9mkArAz5101zhiqdZflRxfWsL4o
   Nq4q86BqQEvsnu8+ndL+4wQ2p/HVHokCHaIuVavV2govPoZS8w1jidloh
   g==;
X-CSE-ConnectionGUID: btJtoHPpRrqGk/T3qg1r2g==
X-CSE-MsgGUID: ziUwDq/bTRuR1MPqleSsbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66583488"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66583488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 13:15:52 -0800
X-CSE-ConnectionGUID: CJQIqwC8TYqHDbJ/RZqxdg==
X-CSE-MsgGUID: S5jb/Y/JRk+9ETBV4QWcuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198904724"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 13:15:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQXiv-00000000ADJ-0ves;
	Tue, 02 Dec 2025 21:15:49 +0000
Date: Wed, 3 Dec 2025 05:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] mm/hmm.c:230:24: error:
 implicit declaration of function 'pte_present'; did you mean 'p4d_present'?
Message-ID: <202512030535.1Xz8Cxnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Vamsidhar,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c7e117640d8dc8b68d068c14d101402073625eb9
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable HMM_MIRROR config for all arch
config: arm-randconfig-r064-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030535.1Xz8Cxnf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030535.1Xz8Cxnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030535.1Xz8Cxnf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:230:6: error: implicit declaration of function 'pte_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         ^~~~~~~~
         p4d_none
>> mm/hmm.c:230:24: error: implicit declaration of function 'pte_present'; did you mean 'p4d_present'? [-Werror=implicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                           ^~~~~~~~~~~
                           p4d_present
>> mm/hmm.c:230:44: error: implicit declaration of function 'pte_protnone'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                                               ^~~~~~~~~~~~
                                               p4d_none
   mm/hmm.c:232:9: error: implicit declaration of function 'pte_write'; did you mean 'pgd_write'? [-Werror=implicit-function-declaration]
     return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
            ^~~~~~~~~
            pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
>> mm/hmm.c:243:14: error: implicit declaration of function 'ptep_get'; did you mean 'kset_get'? [-Werror=implicit-function-declaration]
     pte_t pte = ptep_get(ptep);
                 ^~~~~~~~
                 kset_get
>> mm/hmm.c:247:6: error: implicit declaration of function 'pte_none_mostly'; did you mean 'pte_soft_dirty'? [-Werror=implicit-function-declaration]
     if (pte_none_mostly(pte)) {
         ^~~~~~~~~~~~~~~
         pte_soft_dirty
   mm/hmm.c:256:23: error: implicit declaration of function 'pte_to_swp_entry'; did you mean 'page_swap_entry'? [-Werror=implicit-function-declaration]
      swp_entry_t entry = pte_to_swp_entry(pte);
                          ^~~~~~~~~~~~~~~~
                          page_swap_entry
   mm/hmm.c:256:23: error: invalid initializer
   mm/hmm.c:262:7: error: implicit declaration of function 'is_device_private_entry'; did you mean 'is_device_private_page'? [-Werror=implicit-function-declaration]
      if (is_device_private_entry(entry) &&
          ^~~~~~~~~~~~~~~~~~~~~~~
          is_device_private_page
>> mm/hmm.c:263:18: error: implicit declaration of function 'pfn_swap_entry_to_page'; did you mean 'swap_entry_swapped'? [-Werror=implicit-function-declaration]
          page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
                     ^~~~~~~~~~~~~~~~~~~~~~
                     swap_entry_swapped
>> mm/hmm.c:263:18: warning: passing argument 1 of 'page_pgmap' makes pointer from integer without a cast [-Wint-conversion]
          page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagewalk.h:5,
                    from mm/hmm.c:11:
   include/linux/mmzone.h:1245:65: note: expected 'const struct page *' but argument is of type 'int'
    static inline struct dev_pagemap *page_pgmap(const struct page *page)
                                                 ~~~~~~~~~~~~~~~~~~~^~~~
>> mm/hmm.c:266:8: error: implicit declaration of function 'is_writable_device_private_entry'; did you mean 'is_device_private_page'? [-Werror=implicit-function-declaration]
       if (is_writable_device_private_entry(entry))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           is_device_private_page
>> mm/hmm.c:268:20: error: implicit declaration of function 'swp_offset_pfn'; did you mean 'pte_offset_map'? [-Werror=implicit-function-declaration]
       new_pfn_flags = swp_offset_pfn(entry) | cpu_flags;
                       ^~~~~~~~~~~~~~
                       pte_offset_map
   mm/hmm.c:277:8: error: implicit declaration of function 'non_swap_entry'; did you mean 'page_swap_entry'? [-Werror=implicit-function-declaration]
      if (!non_swap_entry(entry))
           ^~~~~~~~~~~~~~
           page_swap_entry
>> mm/hmm.c:283:7: error: implicit declaration of function 'is_device_exclusive_entry'; did you mean 'wait_event_exclusive_cmd'? [-Werror=implicit-function-declaration]
      if (is_device_exclusive_entry(entry))
          ^~~~~~~~~~~~~~~~~~~~~~~~~
          wait_event_exclusive_cmd
   mm/hmm.c:286:7: error: implicit declaration of function 'is_migration_entry'; did you mean 'list_first_entry'? [-Werror=implicit-function-declaration]
      if (is_migration_entry(entry)) {
          ^~~~~~~~~~~~~~~~~~
          list_first_entry
   mm/hmm.c:287:4: error: implicit declaration of function 'pte_unmap'; did you mean 'memunmap'? [-Werror=implicit-function-declaration]
       pte_unmap(ptep);
       ^~~~~~~~~
       memunmap
   mm/hmm.c:289:4: error: implicit declaration of function 'migration_entry_wait'; did you mean 'memalloc_retry_wait'? [-Werror=implicit-function-declaration]
       migration_entry_wait(walk->mm, pmdp, addr);
       ^~~~~~~~~~~~~~~~~~~~
       memalloc_retry_wait
   mm/hmm.c:309:19: error: implicit declaration of function 'pte_pfn'; did you mean 'pud_pfn'? [-Werror=implicit-function-declaration]
         !is_zero_pfn(pte_pfn(pte))) {
                      ^~~~~~~
                      pud_pfn
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
>> mm/hmm.c:406:8: error: implicit declaration of function 'pmdp_get_lockless'; did you mean 'pmd_offset_lockless'? [-Werror=implicit-function-declaration]
     pmd = pmdp_get_lockless(pmdp);
           ^~~~~~~~~~~~~~~~~
           pmd_offset_lockless
   mm/hmm.c:407:6: error: implicit declaration of function 'pmd_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pmd_none(pmd))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:410:35: error: implicit declaration of function 'is_pmd_migration_entry'; did you mean 'list_first_entry'? [-Werror=implicit-function-declaration]
     if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
                                      list_first_entry
   mm/hmm.c:413:4: error: implicit declaration of function 'pmd_migration_entry_wait'; did you mean 'memalloc_retry_wait'? [-Werror=implicit-function-declaration]
       pmd_migration_entry_wait(walk->mm, pmdp);
       ^~~~~~~~~~~~~~~~~~~~~~~~
       memalloc_retry_wait
>> mm/hmm.c:419:7: error: implicit declaration of function 'pmd_present'; did you mean 'p4d_present'? [-Werror=implicit-function-declaration]
     if (!pmd_present(pmd))
          ^~~~~~~~~~~
          p4d_present
   mm/hmm.c:423:6: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'? [-Werror=implicit-function-declaration]
     if (pmd_trans_huge(pmd)) {
         ^~~~~~~~~~~~~~
         pmd_trans_huge_lock
   mm/hmm.c:446:6: error: implicit declaration of function 'pmd_bad'; did you mean 'p4d_bad'? [-Werror=implicit-function-declaration]
     if (pmd_bad(pmd)) {
         ^~~~~~~
         p4d_bad
   mm/hmm.c: In function 'hmm_range_fault':
   mm/hmm.c:667:7: error: implicit declaration of function 'mmu_interval_check_retry'; did you mean 'vma_interval_tree_remove'? [-Werror=implicit-function-declaration]
      if (mmu_interval_check_retry(range->notifier,
          ^~~~~~~~~~~~~~~~~~~~~~~~
          vma_interval_tree_remove
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +230 mm/hmm.c

da4c3c735ea4dc Jérôme Glisse   2017-09-08  226  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  227  static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
2733ea144dcce7 Jason Gunthorpe 2020-05-01  228  						 pte_t pte)
2aee09d8c11642 Jérôme Glisse   2018-04-10  229  {
789c2af88f24d1 Philip Yang     2019-05-23 @230  	if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
2aee09d8c11642 Jérôme Glisse   2018-04-10  231  		return 0;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  232  	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
2aee09d8c11642 Jérôme Glisse   2018-04-10  233  }
2aee09d8c11642 Jérôme Glisse   2018-04-10  234  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  235  static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  236  			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
2733ea144dcce7 Jason Gunthorpe 2020-05-01  237  			      unsigned long *hmm_pfn)
53f5c3f489ecdd Jérôme Glisse   2018-04-10  238  {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  239  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
f88a1e90c66540 Jérôme Glisse   2018-04-10  240  	struct hmm_range *range = hmm_vma_walk->range;
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  241  	unsigned int required_fault;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  242  	unsigned long cpu_flags;
c33c794828f212 Ryan Roberts    2023-06-12 @243  	pte_t pte = ptep_get(ptep);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  244  	uint64_t pfn_req_flags = *hmm_pfn;
285e871884ff3d Leon Romanovsky 2025-04-28  245  	uint64_t new_pfn_flags = 0;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  246  
5c041f5d1f23d3 Peter Xu        2022-05-12 @247  	if (pte_none_mostly(pte)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  248  		required_fault =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  249  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  250  		if (required_fault)
74eee180b935fc Jérôme Glisse   2017-09-08  251  			goto fault;
285e871884ff3d Leon Romanovsky 2025-04-28  252  		goto out;
74eee180b935fc Jérôme Glisse   2017-09-08  253  	}
74eee180b935fc Jérôme Glisse   2017-09-08  254  
74eee180b935fc Jérôme Glisse   2017-09-08  255  	if (!pte_present(pte)) {
8d63e4cd62b258 Ralph Campbell  2018-01-31  256  		swp_entry_t entry = pte_to_swp_entry(pte);
74eee180b935fc Jérôme Glisse   2017-09-08  257  
74eee180b935fc Jérôme Glisse   2017-09-08  258  		/*
8a295dbbaf7292 Ralph Campbell  2022-07-25  259  		 * Don't fault in device private pages owned by the caller,
8a295dbbaf7292 Ralph Campbell  2022-07-25  260  		 * just report the PFN.
74eee180b935fc Jérôme Glisse   2017-09-08  261  		 */
8a295dbbaf7292 Ralph Campbell  2022-07-25  262  		if (is_device_private_entry(entry) &&
82ba975e4c43d9 Alistair Popple 2025-02-28 @263  		    page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
8a295dbbaf7292 Ralph Campbell  2022-07-25  264  		    range->dev_private_owner) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  265  			cpu_flags = HMM_PFN_VALID;
4dd845b5a3e57a Alistair Popple 2021-06-30 @266  			if (is_writable_device_private_entry(entry))
2733ea144dcce7 Jason Gunthorpe 2020-05-01  267  				cpu_flags |= HMM_PFN_WRITE;
285e871884ff3d Leon Romanovsky 2025-04-28 @268  			new_pfn_flags = swp_offset_pfn(entry) | cpu_flags;
285e871884ff3d Leon Romanovsky 2025-04-28  269  			goto out;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  270  		}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  271  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  272  		required_fault =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  273  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
285e871884ff3d Leon Romanovsky 2025-04-28  274  		if (!required_fault)
285e871884ff3d Leon Romanovsky 2025-04-28  275  			goto out;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  276  
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  277  		if (!non_swap_entry(entry))
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  278  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  279  
8a295dbbaf7292 Ralph Campbell  2022-07-25  280  		if (is_device_private_entry(entry))
8a295dbbaf7292 Ralph Campbell  2022-07-25  281  			goto fault;
8a295dbbaf7292 Ralph Campbell  2022-07-25  282  
b756a3b5e7ead8 Alistair Popple 2021-06-30 @283  		if (is_device_exclusive_entry(entry))
b756a3b5e7ead8 Alistair Popple 2021-06-30  284  			goto fault;
b756a3b5e7ead8 Alistair Popple 2021-06-30  285  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  286  		if (is_migration_entry(entry)) {
74eee180b935fc Jérôme Glisse   2017-09-08  287  			pte_unmap(ptep);
74eee180b935fc Jérôme Glisse   2017-09-08  288  			hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  289  			migration_entry_wait(walk->mm, pmdp, addr);
73231612dc7c90 Jérôme Glisse   2019-05-13  290  			return -EBUSY;
74eee180b935fc Jérôme Glisse   2017-09-08  291  		}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  292  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  293  		/* Report error for everything else */
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  294  		pte_unmap(ptep);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  295  		return -EFAULT;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  296  	}
da4c3c735ea4dc Jérôme Glisse   2017-09-08  297  
76612d6ce4ccd2 Jason Gunthorpe 2020-02-28  298  	cpu_flags = pte_to_hmm_pfn_flags(range, pte);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  299  	required_fault =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  300  		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  301  	if (required_fault)
74eee180b935fc Jérôme Glisse   2017-09-08  302  		goto fault;
74eee180b935fc Jérôme Glisse   2017-09-08  303  
ac541f25037229 Ralph Campbell  2019-10-23  304  	/*
40550627492291 Jason Gunthorpe 2020-03-05  305  	 * Since each architecture defines a struct page for the zero page, just
40550627492291 Jason Gunthorpe 2020-03-05  306  	 * fall through and treat it like a normal page.
ac541f25037229 Ralph Campbell  2019-10-23  307  	 */
87c01d57fa23de Alistair Popple 2022-01-14  308  	if (!vm_normal_page(walk->vma, addr, pte) &&
4b42fb213678d2 Li Zhijian      2021-09-08  309  	    !is_zero_pfn(pte_pfn(pte))) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  310  		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
40550627492291 Jason Gunthorpe 2020-03-05  311  			pte_unmap(ptep);
40550627492291 Jason Gunthorpe 2020-03-05  312  			return -EFAULT;
40550627492291 Jason Gunthorpe 2020-03-05  313  		}
285e871884ff3d Leon Romanovsky 2025-04-28  314  		new_pfn_flags = HMM_PFN_ERROR;
285e871884ff3d Leon Romanovsky 2025-04-28  315  		goto out;
ac541f25037229 Ralph Campbell  2019-10-23  316  	}
992de9a8b75116 Jérôme Glisse   2019-05-13  317  
285e871884ff3d Leon Romanovsky 2025-04-28  318  	new_pfn_flags = pte_pfn(pte) | cpu_flags;
285e871884ff3d Leon Romanovsky 2025-04-28  319  out:
285e871884ff3d Leon Romanovsky 2025-04-28  320  	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  321  	return 0;
74eee180b935fc Jérôme Glisse   2017-09-08  322  
74eee180b935fc Jérôme Glisse   2017-09-08  323  fault:
74eee180b935fc Jérôme Glisse   2017-09-08  324  	pte_unmap(ptep);
5504ed29692faa Jérôme Glisse   2018-04-10  325  	/* Fault any virtual address we were asked to fault */
a3eb13c1579ba9 Jason Gunthorpe 2020-03-27  326  	return hmm_vma_fault(addr, end, required_fault, walk);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  327  }
53f5c3f489ecdd Jérôme Glisse   2018-04-10  328  
10b9feee2d0dc8 Francois Dugast 2025-09-08  329  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
10b9feee2d0dc8 Francois Dugast 2025-09-08  330  static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc8 Francois Dugast 2025-09-08  331  				     unsigned long end, unsigned long *hmm_pfns,
10b9feee2d0dc8 Francois Dugast 2025-09-08  332  				     pmd_t pmd)
10b9feee2d0dc8 Francois Dugast 2025-09-08  333  {
10b9feee2d0dc8 Francois Dugast 2025-09-08  334  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
10b9feee2d0dc8 Francois Dugast 2025-09-08  335  	struct hmm_range *range = hmm_vma_walk->range;
10b9feee2d0dc8 Francois Dugast 2025-09-08  336  	unsigned long npages = (end - start) >> PAGE_SHIFT;
10b9feee2d0dc8 Francois Dugast 2025-09-08  337  	unsigned long addr = start;
10b9feee2d0dc8 Francois Dugast 2025-09-08  338  	swp_entry_t entry = pmd_to_swp_entry(pmd);
10b9feee2d0dc8 Francois Dugast 2025-09-08  339  	unsigned int required_fault;
10b9feee2d0dc8 Francois Dugast 2025-09-08  340  
10b9feee2d0dc8 Francois Dugast 2025-09-08  341  	if (is_device_private_entry(entry) &&
10b9feee2d0dc8 Francois Dugast 2025-09-08  342  	    pfn_swap_entry_folio(entry)->pgmap->owner ==
10b9feee2d0dc8 Francois Dugast 2025-09-08  343  	    range->dev_private_owner) {
10b9feee2d0dc8 Francois Dugast 2025-09-08  344  		unsigned long cpu_flags = HMM_PFN_VALID |
10b9feee2d0dc8 Francois Dugast 2025-09-08  345  			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
10b9feee2d0dc8 Francois Dugast 2025-09-08  346  		unsigned long pfn = swp_offset_pfn(entry);
10b9feee2d0dc8 Francois Dugast 2025-09-08  347  		unsigned long i;
10b9feee2d0dc8 Francois Dugast 2025-09-08  348  
10b9feee2d0dc8 Francois Dugast 2025-09-08  349  		if (is_writable_device_private_entry(entry))
10b9feee2d0dc8 Francois Dugast 2025-09-08  350  			cpu_flags |= HMM_PFN_WRITE;
10b9feee2d0dc8 Francois Dugast 2025-09-08  351  
10b9feee2d0dc8 Francois Dugast 2025-09-08  352  		/*
10b9feee2d0dc8 Francois Dugast 2025-09-08  353  		 * Fully populate the PFN list though subsequent PFNs could be
10b9feee2d0dc8 Francois Dugast 2025-09-08  354  		 * inferred, because drivers which are not yet aware of large
10b9feee2d0dc8 Francois Dugast 2025-09-08  355  		 * folios probably do not support sparsely populated PFN lists.
10b9feee2d0dc8 Francois Dugast 2025-09-08  356  		 */
10b9feee2d0dc8 Francois Dugast 2025-09-08  357  		for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
10b9feee2d0dc8 Francois Dugast 2025-09-08  358  			hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
10b9feee2d0dc8 Francois Dugast 2025-09-08  359  			hmm_pfns[i] |= pfn | cpu_flags;
10b9feee2d0dc8 Francois Dugast 2025-09-08  360  		}
10b9feee2d0dc8 Francois Dugast 2025-09-08  361  
10b9feee2d0dc8 Francois Dugast 2025-09-08  362  		return 0;
10b9feee2d0dc8 Francois Dugast 2025-09-08  363  	}
10b9feee2d0dc8 Francois Dugast 2025-09-08  364  
10b9feee2d0dc8 Francois Dugast 2025-09-08  365  	required_fault = hmm_range_need_fault(hmm_vma_walk, hmm_pfns,
10b9feee2d0dc8 Francois Dugast 2025-09-08  366  					      npages, 0);
10b9feee2d0dc8 Francois Dugast 2025-09-08  367  	if (required_fault) {
10b9feee2d0dc8 Francois Dugast 2025-09-08  368  		if (is_device_private_entry(entry))
10b9feee2d0dc8 Francois Dugast 2025-09-08  369  			return hmm_vma_fault(addr, end, required_fault, walk);
10b9feee2d0dc8 Francois Dugast 2025-09-08  370  		else
10b9feee2d0dc8 Francois Dugast 2025-09-08  371  			return -EFAULT;
10b9feee2d0dc8 Francois Dugast 2025-09-08  372  	}
10b9feee2d0dc8 Francois Dugast 2025-09-08  373  
10b9feee2d0dc8 Francois Dugast 2025-09-08  374  	return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
10b9feee2d0dc8 Francois Dugast 2025-09-08  375  }
10b9feee2d0dc8 Francois Dugast 2025-09-08  376  #else
10b9feee2d0dc8 Francois Dugast 2025-09-08  377  static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
10b9feee2d0dc8 Francois Dugast 2025-09-08  378  				     unsigned long end, unsigned long *hmm_pfns,
10b9feee2d0dc8 Francois Dugast 2025-09-08  379  				     pmd_t pmd)
10b9feee2d0dc8 Francois Dugast 2025-09-08  380  {
10b9feee2d0dc8 Francois Dugast 2025-09-08  381  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
10b9feee2d0dc8 Francois Dugast 2025-09-08  382  	struct hmm_range *range = hmm_vma_walk->range;
10b9feee2d0dc8 Francois Dugast 2025-09-08  383  	unsigned long npages = (end - start) >> PAGE_SHIFT;
10b9feee2d0dc8 Francois Dugast 2025-09-08  384  
10b9feee2d0dc8 Francois Dugast 2025-09-08  385  	if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
10b9feee2d0dc8 Francois Dugast 2025-09-08  386  		return -EFAULT;
10b9feee2d0dc8 Francois Dugast 2025-09-08  387  	return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
10b9feee2d0dc8 Francois Dugast 2025-09-08  388  }
10b9feee2d0dc8 Francois Dugast 2025-09-08  389  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
10b9feee2d0dc8 Francois Dugast 2025-09-08  390  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  391  static int hmm_vma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  392  			    unsigned long start,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  393  			    unsigned long end,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  394  			    struct mm_walk *walk)
53f5c3f489ecdd Jérôme Glisse   2018-04-10  395  {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  396  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  397  	struct hmm_range *range = hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  398  	unsigned long *hmm_pfns =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  399  		&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe 2020-03-05  400  	unsigned long npages = (end - start) >> PAGE_SHIFT;
2288a9a68175ce Jason Gunthorpe 2020-03-05  401  	unsigned long addr = start;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  402  	pte_t *ptep;
d08faca018c461 Jérôme Glisse   2018-10-30  403  	pmd_t pmd;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  404  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  405  again:
26e1a0c3277d7f Hugh Dickins    2023-06-08 @406  	pmd = pmdp_get_lockless(pmdp);
d08faca018c461 Jérôme Glisse   2018-10-30  407  	if (pmd_none(pmd))
b7a16c7ad790d0 Steven Price    2020-02-03  408  		return hmm_vma_walk_hole(start, end, -1, walk);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  409  
d08faca018c461 Jérôme Glisse   2018-10-30  410  	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  411  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 Jérôme Glisse   2018-10-30  412  			hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  413  			pmd_migration_entry_wait(walk->mm, pmdp);
73231612dc7c90 Jérôme Glisse   2019-05-13  414  			return -EBUSY;
d08faca018c461 Jérôme Glisse   2018-10-30  415  		}
2733ea144dcce7 Jason Gunthorpe 2020-05-01  416  		return hmm_pfns_fill(start, end, range, 0);
2288a9a68175ce Jason Gunthorpe 2020-03-05  417  	}
2288a9a68175ce Jason Gunthorpe 2020-03-05  418  
10b9feee2d0dc8 Francois Dugast 2025-09-08 @419  	if (!pmd_present(pmd))
10b9feee2d0dc8 Francois Dugast 2025-09-08  420  		return hmm_vma_handle_absent_pmd(walk, start, end, hmm_pfns,
10b9feee2d0dc8 Francois Dugast 2025-09-08  421  						 pmd);
d08faca018c461 Jérôme Glisse   2018-10-30  422  
8a6a984c2e0ea4 Alistair Popple 2025-06-19  423  	if (pmd_trans_huge(pmd)) {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  424  		/*
d2e8d551165ccb Ralph Campbell  2019-07-25  425  		 * No need to take pmd_lock here, even if some other thread
53f5c3f489ecdd Jérôme Glisse   2018-04-10  426  		 * is splitting the huge pmd we will get that event through
53f5c3f489ecdd Jérôme Glisse   2018-04-10  427  		 * mmu_notifier callback.
53f5c3f489ecdd Jérôme Glisse   2018-04-10  428  		 *
d2e8d551165ccb Ralph Campbell  2019-07-25  429  		 * So just read pmd value and check again it's a transparent
53f5c3f489ecdd Jérôme Glisse   2018-04-10  430  		 * huge or device mapping one and compute corresponding pfn
53f5c3f489ecdd Jérôme Glisse   2018-04-10  431  		 * values.
53f5c3f489ecdd Jérôme Glisse   2018-04-10  432  		 */
dab6e717429e5e Peter Zijlstra  2020-11-26  433  		pmd = pmdp_get_lockless(pmdp);
8a6a984c2e0ea4 Alistair Popple 2025-06-19  434  		if (!pmd_trans_huge(pmd))
53f5c3f489ecdd Jérôme Glisse   2018-04-10  435  			goto again;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  436  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  437  		return hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  438  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  439  
d08faca018c461 Jérôme Glisse   2018-10-30  440  	/*
d2e8d551165ccb Ralph Campbell  2019-07-25  441  	 * We have handled all the valid cases above ie either none, migration,
d08faca018c461 Jérôme Glisse   2018-10-30  442  	 * huge or transparent huge. At this point either it is a valid pmd
d08faca018c461 Jérôme Glisse   2018-10-30  443  	 * entry pointing to pte directory or it is a bad pmd that will not
d08faca018c461 Jérôme Glisse   2018-10-30  444  	 * recover.
d08faca018c461 Jérôme Glisse   2018-10-30  445  	 */
2288a9a68175ce Jason Gunthorpe 2020-03-05  446  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  447  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  448  			return -EFAULT;
d28c2c9a487708 Ralph Campbell  2019-11-04  449  		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  450  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  451  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  452  	ptep = pte_offset_map(pmdp, addr);
6ec1905f6ec7f9 Hugh Dickins    2023-06-08  453  	if (!ptep)
6ec1905f6ec7f9 Hugh Dickins    2023-06-08  454  		goto again;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  455  	for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  456  		int r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  457  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  458  		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  459  		if (r) {
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  460  			/* hmm_vma_handle_pte() did pte_unmap() */
53f5c3f489ecdd Jérôme Glisse   2018-04-10  461  			return r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  462  		}
da4c3c735ea4dc Jérôme Glisse   2017-09-08  463  	}
da4c3c735ea4dc Jérôme Glisse   2017-09-08  464  	pte_unmap(ptep - 1);
da4c3c735ea4dc Jérôme Glisse   2017-09-08  465  	return 0;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  466  }
da4c3c735ea4dc Jérôme Glisse   2017-09-08  467  

:::::: The code at line 230 was first introduced by commit
:::::: 789c2af88f24d1db983aae49b5c4561e6e02ff5b mm/hmm: support automatic NUMA balancing

:::::: TO: Philip Yang <Philip.Yang@amd.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
