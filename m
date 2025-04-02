Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7B1F1302
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629258; cv=none; b=DzZ0LfkpAVJkKRR3AwFgD+YL2Kj/1HoO6g8HG+s1bfqwCO6bYdMojQxjvqOeJlXLwnyDlumQmWhU7FU7m74QXKe4CAnLlAFnV1LHBoJU0aJOf0UDqaGlTk5ynhU03zMQyMUMEZpEPJc36bLW4Zw17x2LT7jcB96jAJYtxYAHWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629258; c=relaxed/simple;
	bh=96gTIsmviiFlLACF/uSZ55m9N4eubH94F5N8ZlBjlak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvPt29dwrJFWVBP2fjFF9QtdXQm1wUYhKai1C+sqtOKe2ELtGdpWxiBAJy00LhPYnPdodeJpM22NrTW1ayxKfBTcrkm9lBYMbCNqQanxMobVx1KjjI0fJWdasOGwi7UCQF0ikZVtrXOMB2odu60+GjdfP9BRm7ZrtYLBashwZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yx7h8aLN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yx7h8aLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743629256; x=1775165256;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=96gTIsmviiFlLACF/uSZ55m9N4eubH94F5N8ZlBjlak=;
  b=Yx7h8aLN4VFZwYZZ/petWw2qY7k0wwLYTHqVodljw8rIZaVMwsJ/5kFM
   JRV8210tI/nL9/ucjzxgZm1bA0KiMOhUlPnqxtPSjPhpE1/IjZJ2Z37sO
   ZS4NjSPGSrC8HQomUuMD/ICIgsVfn3eb9cj4n8QaWL5JI3gkZ/deuYspQ
   kXrpALXXqJ6Sg1rvjYk7xwCwbVwLTBT4sMgi/B0L/WWOKyEL06NoidcHD
   LwugfmeKnIOCIZw1ya6jibgQhvGj91BmWThFXzTTRk3ffiI7BUL7hc2Pc
   1pVNR3buTGgxyWAZW9K+IMEkjrcGdi3Q/2DF6pZBr9//eft0STJShM+Np
   Q==;
X-CSE-ConnectionGUID: IBSUcyq0Rg+Nk55BYmF9zw==
X-CSE-MsgGUID: m3Lou8RHRUmy5pOUXzD2/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55681594"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="55681594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:27:33 -0700
X-CSE-ConnectionGUID: sYZtKEx9Ruix6cRezZCQWA==
X-CSE-MsgGUID: cLHx1xgRTMe30ImCcIk2XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="127669158"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2025 14:27:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u05cQ-000B26-10;
	Wed, 02 Apr 2025 21:27:30 +0000
Date: Thu, 3 Apr 2025 05:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-08 3/3] mm/hmm.c:379:7: warning:
 assignment to 'pte_t *' {aka 'long unsigned int *'} from 'int' makes pointer
 from integer without a cast
Message-ID: <202504030557.SP9JmOJP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jihan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-08
head:   2348145354358cdea3d9ba4c6ae622ae394c4223
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [3/3] ANDROID: GKI: Kconfig.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-004-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030557.SP9JmOJP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030557.SP9JmOJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030557.SP9JmOJP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hmm.c:181:29: note: each undeclared identifier is reported only once for each function it appears in
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:216:9: error: implicit declaration of function 'is_device_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=implicit-function-declaration]
     return is_device_private_entry(entry) &&
            ^~~~~~~~~~~~~~~~~~~~~~~
            hmm_is_device_private_entry
   mm/hmm.c:217:3: error: implicit declaration of function 'device_private_entry_to_page'; did you mean 'is_device_private_page'? [-Werror=implicit-function-declaration]
      device_private_entry_to_page(entry)->pgmap->owner ==
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      is_device_private_page
   mm/hmm.c:217:38: error: invalid type argument of '->' (have 'int')
      device_private_entry_to_page(entry)->pgmap->owner ==
                                         ^~
   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:224:6: error: implicit declaration of function 'pte_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:224:24: error: implicit declaration of function 'pte_present'; did you mean 'p4d_present'? [-Werror=implicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                           ^~~~~~~~~~~
                           p4d_present
   mm/hmm.c:224:44: error: implicit declaration of function 'pte_protnone'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
                                               ^~~~~~~~~~~~
                                               p4d_none
   mm/hmm.c:226:9: error: implicit declaration of function 'pte_write'; did you mean 'pgd_write'? [-Werror=implicit-function-declaration]
     return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
            ^~~~~~~~~
            pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
   mm/hmm.c:250:23: error: implicit declaration of function 'pte_to_swp_entry'; did you mean 'pte_lockptr'? [-Werror=implicit-function-declaration]
      swp_entry_t entry = pte_to_swp_entry(pte);
                          ^~~~~~~~~~~~~~~~
                          pte_lockptr
   mm/hmm.c:250:23: error: invalid initializer
   mm/hmm.c:258:8: error: implicit declaration of function 'is_write_device_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=implicit-function-declaration]
       if (is_write_device_private_entry(entry))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           hmm_is_device_private_entry
   mm/hmm.c:260:15: error: implicit declaration of function 'device_private_entry_to_pfn'; did you mean 'device_create_with_groups'? [-Werror=implicit-function-declaration]
       *hmm_pfn = device_private_entry_to_pfn(entry) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                  device_create_with_groups
   mm/hmm.c:272:8: error: implicit declaration of function 'non_swap_entry'; did you mean 'init_wait_entry'? [-Werror=implicit-function-declaration]
      if (!non_swap_entry(entry))
           ^~~~~~~~~~~~~~
           init_wait_entry
   mm/hmm.c:275:7: error: implicit declaration of function 'is_migration_entry'; did you mean 'list_first_entry'? [-Werror=implicit-function-declaration]
      if (is_migration_entry(entry)) {
          ^~~~~~~~~~~~~~~~~~
          list_first_entry
   mm/hmm.c:276:4: error: implicit declaration of function 'pte_unmap'; did you mean 'memunmap'? [-Werror=implicit-function-declaration]
       pte_unmap(ptep);
       ^~~~~~~~~
       memunmap
   mm/hmm.c:278:4: error: implicit declaration of function 'migration_entry_wait'; did you mean 'in_entry_text'? [-Werror=implicit-function-declaration]
       migration_entry_wait(walk->mm, pmdp, addr);
       ^~~~~~~~~~~~~~~~~~~~
       in_entry_text
   mm/hmm.c:297:39: error: implicit declaration of function 'pte_pfn'; did you mean 'pte_val'? [-Werror=implicit-function-declaration]
     if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
                                          ^~~~~~~
                                          pte_val
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:331:6: error: implicit declaration of function 'pmd_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pmd_none(pmd))
         ^~~~~~~~
         p4d_none
   mm/hmm.c:334:35: error: implicit declaration of function 'is_pmd_migration_entry'; did you mean 'list_first_entry'? [-Werror=implicit-function-declaration]
     if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
                                      list_first_entry
   mm/hmm.c:337:4: error: implicit declaration of function 'pmd_migration_entry_wait' [-Werror=implicit-function-declaration]
       pmd_migration_entry_wait(walk->mm, pmdp);
       ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:343:7: error: implicit declaration of function 'pmd_present'; did you mean 'p4d_present'? [-Werror=implicit-function-declaration]
     if (!pmd_present(pmd)) {
          ^~~~~~~~~~~
          p4d_present
   mm/hmm.c:349:6: error: implicit declaration of function 'pmd_devmap'; did you mean 'pte_devmap'? [-Werror=implicit-function-declaration]
     if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         ^~~~~~~~~~
         pte_devmap
   mm/hmm.c:349:25: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'? [-Werror=implicit-function-declaration]
     if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
                            ^~~~~~~~~~~~~~
                            pmd_trans_huge_lock
   mm/hmm.c:359:9: error: implicit declaration of function 'pmd_read_atomic'; did you mean 'kmap_atomic'? [-Werror=implicit-function-declaration]
      pmd = pmd_read_atomic(pmdp);
            ^~~~~~~~~~~~~~~
            kmap_atomic
   mm/hmm.c:373:6: error: implicit declaration of function 'pmd_bad'; did you mean 'p4d_bad'? [-Werror=implicit-function-declaration]
     if (pmd_bad(pmd)) {
         ^~~~~~~
         p4d_bad
   mm/hmm.c:379:9: error: implicit declaration of function 'pte_offset_map'; did you mean 'pte_offset_map_lock'? [-Werror=implicit-function-declaration]
     ptep = pte_offset_map(pmdp, addr);
            ^~~~~~~~~~~~~~
            pte_offset_map_lock
>> mm/hmm.c:379:7: warning: assignment to 'pte_t *' {aka 'long unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     ptep = pte_offset_map(pmdp, addr);
          ^
   mm/hmm.c: In function 'hmm_is_device_private_entry':
>> mm/hmm.c:219:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +379 mm/hmm.c

da4c3c735ea4dc Jérôme Glisse     2017-09-08  212  
08ddddda667b3b Christoph Hellwig 2020-03-16  213  static inline bool hmm_is_device_private_entry(struct hmm_range *range,
08ddddda667b3b Christoph Hellwig 2020-03-16  214  		swp_entry_t entry)
08ddddda667b3b Christoph Hellwig 2020-03-16  215  {
08ddddda667b3b Christoph Hellwig 2020-03-16  216  	return is_device_private_entry(entry) &&
08ddddda667b3b Christoph Hellwig 2020-03-16  217  		device_private_entry_to_page(entry)->pgmap->owner ==
08ddddda667b3b Christoph Hellwig 2020-03-16  218  		range->dev_private_owner;
08ddddda667b3b Christoph Hellwig 2020-03-16 @219  }
08ddddda667b3b Christoph Hellwig 2020-03-16  220  
2733ea144dcce7 Jason Gunthorpe   2020-05-01  221  static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
2733ea144dcce7 Jason Gunthorpe   2020-05-01  222  						 pte_t pte)
2aee09d8c11642 Jérôme Glisse     2018-04-10  223  {
789c2af88f24d1 Philip Yang       2019-05-23  224  	if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
2aee09d8c11642 Jérôme Glisse     2018-04-10  225  		return 0;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  226  	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
2aee09d8c11642 Jérôme Glisse     2018-04-10  227  }
2aee09d8c11642 Jérôme Glisse     2018-04-10  228  
53f5c3f489ecdd Jérôme Glisse     2018-04-10  229  static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
53f5c3f489ecdd Jérôme Glisse     2018-04-10  230  			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
2733ea144dcce7 Jason Gunthorpe   2020-05-01  231  			      unsigned long *hmm_pfn)
53f5c3f489ecdd Jérôme Glisse     2018-04-10  232  {
53f5c3f489ecdd Jérôme Glisse     2018-04-10  233  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
f88a1e90c66540 Jérôme Glisse     2018-04-10  234  	struct hmm_range *range = hmm_vma_walk->range;
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  235  	unsigned int required_fault;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  236  	unsigned long cpu_flags;
da4c3c735ea4dc Jérôme Glisse     2017-09-08  237  	pte_t pte = *ptep;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  238  	uint64_t pfn_req_flags = *hmm_pfn;
da4c3c735ea4dc Jérôme Glisse     2017-09-08  239  
74eee180b935fc Jérôme Glisse     2017-09-08  240  	if (pte_none(pte)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  241  		required_fault =
2733ea144dcce7 Jason Gunthorpe   2020-05-01  242  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  243  		if (required_fault)
74eee180b935fc Jérôme Glisse     2017-09-08  244  			goto fault;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  245  		*hmm_pfn = 0;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  246  		return 0;
74eee180b935fc Jérôme Glisse     2017-09-08  247  	}
74eee180b935fc Jérôme Glisse     2017-09-08  248  
74eee180b935fc Jérôme Glisse     2017-09-08  249  	if (!pte_present(pte)) {
8d63e4cd62b258 Ralph Campbell    2018-01-31  250  		swp_entry_t entry = pte_to_swp_entry(pte);
74eee180b935fc Jérôme Glisse     2017-09-08  251  
74eee180b935fc Jérôme Glisse     2017-09-08  252  		/*
0cb80a2fb5bcd1 Randy Dunlap      2020-08-11  253  		 * Never fault in device private pages, but just report
17ffdc482982af Christoph Hellwig 2020-03-16  254  		 * the PFN even if not present.
74eee180b935fc Jérôme Glisse     2017-09-08  255  		 */
08ddddda667b3b Christoph Hellwig 2020-03-16  256  		if (hmm_is_device_private_entry(range, entry)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  257  			cpu_flags = HMM_PFN_VALID;
17ffdc482982af Christoph Hellwig 2020-03-16  258  			if (is_write_device_private_entry(entry))
2733ea144dcce7 Jason Gunthorpe   2020-05-01  259  				cpu_flags |= HMM_PFN_WRITE;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  260  			*hmm_pfn = device_private_entry_to_pfn(entry) |
2733ea144dcce7 Jason Gunthorpe   2020-05-01  261  					cpu_flags;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  262  			return 0;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  263  		}
53f5c3f489ecdd Jérôme Glisse     2018-04-10  264  
2733ea144dcce7 Jason Gunthorpe   2020-05-01  265  		required_fault =
2733ea144dcce7 Jason Gunthorpe   2020-05-01  266  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
846babe85efdda Jason Gunthorpe   2020-03-27  267  		if (!required_fault) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  268  			*hmm_pfn = 0;
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  269  			return 0;
846babe85efdda Jason Gunthorpe   2020-03-27  270  		}
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  271  
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  272  		if (!non_swap_entry(entry))
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  273  			goto fault;
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  274  
53f5c3f489ecdd Jérôme Glisse     2018-04-10  275  		if (is_migration_entry(entry)) {
74eee180b935fc Jérôme Glisse     2017-09-08  276  			pte_unmap(ptep);
74eee180b935fc Jérôme Glisse     2017-09-08  277  			hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell    2019-07-25  278  			migration_entry_wait(walk->mm, pmdp, addr);
73231612dc7c90 Jérôme Glisse     2019-05-13  279  			return -EBUSY;
74eee180b935fc Jérôme Glisse     2017-09-08  280  		}
53f5c3f489ecdd Jérôme Glisse     2018-04-10  281  
53f5c3f489ecdd Jérôme Glisse     2018-04-10  282  		/* Report error for everything else */
dfdc22078f3f06 Jason Gunthorpe   2020-02-28  283  		pte_unmap(ptep);
53f5c3f489ecdd Jérôme Glisse     2018-04-10  284  		return -EFAULT;
da4c3c735ea4dc Jérôme Glisse     2017-09-08  285  	}
da4c3c735ea4dc Jérôme Glisse     2017-09-08  286  
76612d6ce4ccd2 Jason Gunthorpe   2020-02-28  287  	cpu_flags = pte_to_hmm_pfn_flags(range, pte);
2733ea144dcce7 Jason Gunthorpe   2020-05-01  288  	required_fault =
2733ea144dcce7 Jason Gunthorpe   2020-05-01  289  		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  290  	if (required_fault)
74eee180b935fc Jérôme Glisse     2017-09-08  291  		goto fault;
74eee180b935fc Jérôme Glisse     2017-09-08  292  
ac541f25037229 Ralph Campbell    2019-10-23  293  	/*
40550627492291 Jason Gunthorpe   2020-03-05  294  	 * Since each architecture defines a struct page for the zero page, just
40550627492291 Jason Gunthorpe   2020-03-05  295  	 * fall through and treat it like a normal page.
ac541f25037229 Ralph Campbell    2019-10-23  296  	 */
40550627492291 Jason Gunthorpe   2020-03-05  297  	if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  298  		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
40550627492291 Jason Gunthorpe   2020-03-05  299  			pte_unmap(ptep);
40550627492291 Jason Gunthorpe   2020-03-05  300  			return -EFAULT;
40550627492291 Jason Gunthorpe   2020-03-05  301  		}
2733ea144dcce7 Jason Gunthorpe   2020-05-01  302  		*hmm_pfn = HMM_PFN_ERROR;
40550627492291 Jason Gunthorpe   2020-03-05  303  		return 0;
ac541f25037229 Ralph Campbell    2019-10-23  304  	}
992de9a8b75116 Jérôme Glisse     2019-05-13  305  
2733ea144dcce7 Jason Gunthorpe   2020-05-01  306  	*hmm_pfn = pte_pfn(pte) | cpu_flags;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  307  	return 0;
74eee180b935fc Jérôme Glisse     2017-09-08  308  
74eee180b935fc Jérôme Glisse     2017-09-08  309  fault:
74eee180b935fc Jérôme Glisse     2017-09-08  310  	pte_unmap(ptep);
5504ed29692faa Jérôme Glisse     2018-04-10  311  	/* Fault any virtual address we were asked to fault */
a3eb13c1579ba9 Jason Gunthorpe   2020-03-27  312  	return hmm_vma_fault(addr, end, required_fault, walk);
53f5c3f489ecdd Jérôme Glisse     2018-04-10  313  }
53f5c3f489ecdd Jérôme Glisse     2018-04-10  314  
53f5c3f489ecdd Jérôme Glisse     2018-04-10  315  static int hmm_vma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd Jérôme Glisse     2018-04-10  316  			    unsigned long start,
53f5c3f489ecdd Jérôme Glisse     2018-04-10  317  			    unsigned long end,
53f5c3f489ecdd Jérôme Glisse     2018-04-10  318  			    struct mm_walk *walk)
53f5c3f489ecdd Jérôme Glisse     2018-04-10  319  {
53f5c3f489ecdd Jérôme Glisse     2018-04-10  320  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  321  	struct hmm_range *range = hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe   2020-05-01  322  	unsigned long *hmm_pfns =
2733ea144dcce7 Jason Gunthorpe   2020-05-01  323  		&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe   2020-03-05  324  	unsigned long npages = (end - start) >> PAGE_SHIFT;
2288a9a68175ce Jason Gunthorpe   2020-03-05  325  	unsigned long addr = start;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  326  	pte_t *ptep;
d08faca018c461 Jérôme Glisse     2018-10-30  327  	pmd_t pmd;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  328  
53f5c3f489ecdd Jérôme Glisse     2018-04-10  329  again:
d08faca018c461 Jérôme Glisse     2018-10-30  330  	pmd = READ_ONCE(*pmdp);
d08faca018c461 Jérôme Glisse     2018-10-30  331  	if (pmd_none(pmd))
b7a16c7ad790d0 Steven Price      2020-02-03  332  		return hmm_vma_walk_hole(start, end, -1, walk);
53f5c3f489ecdd Jérôme Glisse     2018-04-10  333  
d08faca018c461 Jérôme Glisse     2018-10-30  334  	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  335  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 Jérôme Glisse     2018-10-30  336  			hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell    2019-07-25  337  			pmd_migration_entry_wait(walk->mm, pmdp);
73231612dc7c90 Jérôme Glisse     2019-05-13  338  			return -EBUSY;
d08faca018c461 Jérôme Glisse     2018-10-30  339  		}
2733ea144dcce7 Jason Gunthorpe   2020-05-01  340  		return hmm_pfns_fill(start, end, range, 0);
2288a9a68175ce Jason Gunthorpe   2020-03-05  341  	}
2288a9a68175ce Jason Gunthorpe   2020-03-05  342  
2288a9a68175ce Jason Gunthorpe   2020-03-05  343  	if (!pmd_present(pmd)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  344  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe   2020-03-05  345  			return -EFAULT;
d28c2c9a487708 Ralph Campbell    2019-11-04  346  		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe   2020-03-05  347  	}
d08faca018c461 Jérôme Glisse     2018-10-30  348  
d08faca018c461 Jérôme Glisse     2018-10-30  349  	if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
53f5c3f489ecdd Jérôme Glisse     2018-04-10  350  		/*
d2e8d551165ccb Ralph Campbell    2019-07-25  351  		 * No need to take pmd_lock here, even if some other thread
53f5c3f489ecdd Jérôme Glisse     2018-04-10  352  		 * is splitting the huge pmd we will get that event through
53f5c3f489ecdd Jérôme Glisse     2018-04-10  353  		 * mmu_notifier callback.
53f5c3f489ecdd Jérôme Glisse     2018-04-10  354  		 *
d2e8d551165ccb Ralph Campbell    2019-07-25  355  		 * So just read pmd value and check again it's a transparent
53f5c3f489ecdd Jérôme Glisse     2018-04-10  356  		 * huge or device mapping one and compute corresponding pfn
53f5c3f489ecdd Jérôme Glisse     2018-04-10  357  		 * values.
53f5c3f489ecdd Jérôme Glisse     2018-04-10  358  		 */
53f5c3f489ecdd Jérôme Glisse     2018-04-10  359  		pmd = pmd_read_atomic(pmdp);
53f5c3f489ecdd Jérôme Glisse     2018-04-10  360  		barrier();
53f5c3f489ecdd Jérôme Glisse     2018-04-10  361  		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
53f5c3f489ecdd Jérôme Glisse     2018-04-10  362  			goto again;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  363  
2733ea144dcce7 Jason Gunthorpe   2020-05-01  364  		return hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecdd Jérôme Glisse     2018-04-10  365  	}
53f5c3f489ecdd Jérôme Glisse     2018-04-10  366  
d08faca018c461 Jérôme Glisse     2018-10-30  367  	/*
d2e8d551165ccb Ralph Campbell    2019-07-25  368  	 * We have handled all the valid cases above ie either none, migration,
d08faca018c461 Jérôme Glisse     2018-10-30  369  	 * huge or transparent huge. At this point either it is a valid pmd
d08faca018c461 Jérôme Glisse     2018-10-30  370  	 * entry pointing to pte directory or it is a bad pmd that will not
d08faca018c461 Jérôme Glisse     2018-10-30  371  	 * recover.
d08faca018c461 Jérôme Glisse     2018-10-30  372  	 */
2288a9a68175ce Jason Gunthorpe   2020-03-05 @373  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe   2020-05-01  374  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe   2020-03-05  375  			return -EFAULT;
d28c2c9a487708 Ralph Campbell    2019-11-04  376  		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe   2020-03-05  377  	}
53f5c3f489ecdd Jérôme Glisse     2018-04-10  378  
53f5c3f489ecdd Jérôme Glisse     2018-04-10 @379  	ptep = pte_offset_map(pmdp, addr);
2733ea144dcce7 Jason Gunthorpe   2020-05-01  380  	for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd Jérôme Glisse     2018-04-10  381  		int r;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  382  
2733ea144dcce7 Jason Gunthorpe   2020-05-01  383  		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd Jérôme Glisse     2018-04-10  384  		if (r) {
dfdc22078f3f06 Jason Gunthorpe   2020-02-28  385  			/* hmm_vma_handle_pte() did pte_unmap() */
53f5c3f489ecdd Jérôme Glisse     2018-04-10  386  			return r;
53f5c3f489ecdd Jérôme Glisse     2018-04-10  387  		}
da4c3c735ea4dc Jérôme Glisse     2017-09-08  388  	}
da4c3c735ea4dc Jérôme Glisse     2017-09-08  389  	pte_unmap(ptep - 1);
da4c3c735ea4dc Jérôme Glisse     2017-09-08  390  	return 0;
da4c3c735ea4dc Jérôme Glisse     2017-09-08  391  }
da4c3c735ea4dc Jérôme Glisse     2017-09-08  392  

:::::: The code at line 379 was first introduced by commit
:::::: 53f5c3f489ecddc7570a2e2422a6fc5b25007b9d mm/hmm: factor out pte and pmd handling to simplify hmm_vma_walk_pmd()

:::::: TO: Jérôme Glisse <jglisse@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
