Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE028EA4F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790658; cv=none; b=JKKW1Rh4r23u5Afebw6TcRAHqhSKq4tBebp1RIAosXGhAwsrl7q3Pr27v7ZRCfm/H5sp1Z8RGXHXfrL6xUiHsAviCiWpwdNYnFg6+I5rW0bd41GNsHcmr3tFEHObJFTJayo2FZ8s7iCXsD/mNPTzkHV5Tfnv+JF5zxLZVhv1cNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790658; c=relaxed/simple;
	bh=lJK9P/UqvvRucHrFH6poT0P/XIDz3KA2NzPZSRtw3m8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ee5ID5AzZIFUzrJsUA78IHWfl1lUZdzy69hlQSz3AkWy8OnA7tQO8ix9fhF4RhpFOxljDoUD/dBYc3+be8aOUXv2EOISGk/krHNzMEHSvuLipYB7GzxNtsn3lbTydmOR8HZDSmt+s2qZLlXoUfisR1M1Vezv1WL+QSFlE6G2zJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/rt/Pll; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/rt/Pll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753790656; x=1785326656;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lJK9P/UqvvRucHrFH6poT0P/XIDz3KA2NzPZSRtw3m8=;
  b=a/rt/PllvnuAbb0ZIs/gY+ZvUYLIKam2RJCRKt1rXX1aihWUFL/TKdu1
   j87zL919mAbq/fpHUTjN2OmkUzxgPoeVmFe1KExZaYLe0EEI/KfCM/MBA
   p48PGfp0lXgiFYxmbPgDWIZciHZR1MiNK1/bAcEj0xeOJ2CcmMZdCXb/C
   mAp9vuD3NawqheZCqoxCt4k7bt5fFtpbqIFi5xw5pkZhW1C8XllO7s3jm
   7vSmAV4AQZKOSsgXcGhvr2w50tbMp5QL0DF2mfGoYME5TeVvdYqyinynQ
   7Pr06lB9XtHQ6O60F5QDmWQ/dvAzr1ngl1f4jjfUkb3CXRBTUZHmmBvcI
   g==;
X-CSE-ConnectionGUID: ko43hUFYRF6DQtF0eCkIZw==
X-CSE-MsgGUID: 5T7Kyp+PQO6k24dBYqujJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66622103"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="66622103"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:04:15 -0700
X-CSE-ConnectionGUID: w4XcP1iyQ9SCDAoPxVVIEg==
X-CSE-MsgGUID: K0InhKgeS2uw2NI16oPhCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="163130949"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2025 05:04:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugj40-0001GB-0g;
	Tue, 29 Jul 2025 12:04:12 +0000
Date: Tue, 29 Jul 2025 20:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 151/151] mm/hmm.c:379:14:
 warning: assignment to 'pte_t *' {aka 'long unsigned int *'} from 'int'
 makes pointer from integer without a cast
Message-ID: <202507291903.tk06GIHw-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   3560030555e2dc86062e1e1a31b95e741dafec38
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [151/151] ANDROID: GKI: Kconfig.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-r133-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291903.tk06GIHw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250729/202507291903.tk06GIHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291903.tk06GIHw-lkp@intel.com/

All warnings (new ones prefixed by >>):

     177 |         if (pmd_protnone(pmd))
         |             ^~~~~~~~~~~~
   mm/hmm.c:179:17: error: implicit declaration of function 'pmd_write'; did you mean 'pgd_write'? [-Werror=implicit-function-declaration]
     179 |         return (pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
         |                 ^~~~~~~~~
         |                 pgd_write
   mm/hmm.c:181:36: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
     181 |                hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
         |                                    ^~~~~~~~~
         |                                    PUD_SHIFT
   mm/hmm.c:181:36: note: each undeclared identifier is reported only once for each function it appears in
   mm/hmm.c: In function 'hmm_is_device_private_entry':
   mm/hmm.c:216:16: error: implicit declaration of function 'is_device_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=implicit-function-declaration]
     216 |         return is_device_private_entry(entry) &&
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                hmm_is_device_private_entry
   mm/hmm.c:217:17: error: implicit declaration of function 'device_private_entry_to_page' [-Werror=implicit-function-declaration]
     217 |                 device_private_entry_to_page(entry)->pgmap->owner ==
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:217:52: error: invalid type argument of '->' (have 'int')
     217 |                 device_private_entry_to_page(entry)->pgmap->owner ==
         |                                                    ^~
   mm/hmm.c: In function 'pte_to_hmm_pfn_flags':
   mm/hmm.c:224:13: error: implicit declaration of function 'pte_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     224 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         |             ^~~~~~~~
         |             p4d_none
   mm/hmm.c:224:31: error: implicit declaration of function 'pte_present'; did you mean 'p4d_present'? [-Werror=implicit-function-declaration]
     224 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         |                               ^~~~~~~~~~~
         |                               p4d_present
   mm/hmm.c:224:51: error: implicit declaration of function 'pte_protnone' [-Werror=implicit-function-declaration]
     224 |         if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
         |                                                   ^~~~~~~~~~~~
   mm/hmm.c:226:16: error: implicit declaration of function 'pte_write'; did you mean 'pgd_write'? [-Werror=implicit-function-declaration]
     226 |         return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
         |                ^~~~~~~~~
         |                pgd_write
   mm/hmm.c: In function 'hmm_vma_handle_pte':
   mm/hmm.c:250:37: error: implicit declaration of function 'pte_to_swp_entry' [-Werror=implicit-function-declaration]
     250 |                 swp_entry_t entry = pte_to_swp_entry(pte);
         |                                     ^~~~~~~~~~~~~~~~
   mm/hmm.c:250:37: error: invalid initializer
   mm/hmm.c:258:29: error: implicit declaration of function 'is_write_device_private_entry'; did you mean 'hmm_is_device_private_entry'? [-Werror=implicit-function-declaration]
     258 |                         if (is_write_device_private_entry(entry))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             hmm_is_device_private_entry
   mm/hmm.c:260:36: error: implicit declaration of function 'device_private_entry_to_pfn' [-Werror=implicit-function-declaration]
     260 |                         *hmm_pfn = device_private_entry_to_pfn(entry) |
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:272:22: error: implicit declaration of function 'non_swap_entry' [-Werror=implicit-function-declaration]
     272 |                 if (!non_swap_entry(entry))
         |                      ^~~~~~~~~~~~~~
   mm/hmm.c:275:21: error: implicit declaration of function 'is_migration_entry' [-Werror=implicit-function-declaration]
     275 |                 if (is_migration_entry(entry)) {
         |                     ^~~~~~~~~~~~~~~~~~
   mm/hmm.c:276:25: error: implicit declaration of function 'pte_unmap'; did you mean 'memunmap'? [-Werror=implicit-function-declaration]
     276 |                         pte_unmap(ptep);
         |                         ^~~~~~~~~
         |                         memunmap
   mm/hmm.c:278:25: error: implicit declaration of function 'migration_entry_wait' [-Werror=implicit-function-declaration]
     278 |                         migration_entry_wait(walk->mm, pmdp, addr);
         |                         ^~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:297:46: error: implicit declaration of function 'pte_pfn' [-Werror=implicit-function-declaration]
     297 |         if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
         |                                              ^~~~~~~
   mm/hmm.c: In function 'hmm_vma_walk_pmd':
   mm/hmm.c:331:13: error: implicit declaration of function 'pmd_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     331 |         if (pmd_none(pmd))
         |             ^~~~~~~~
         |             p4d_none
   mm/hmm.c:334:42: error: implicit declaration of function 'is_pmd_migration_entry' [-Werror=implicit-function-declaration]
     334 |         if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:337:25: error: implicit declaration of function 'pmd_migration_entry_wait' [-Werror=implicit-function-declaration]
     337 |                         pmd_migration_entry_wait(walk->mm, pmdp);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/hmm.c:343:14: error: implicit declaration of function 'pmd_present'; did you mean 'p4d_present'? [-Werror=implicit-function-declaration]
     343 |         if (!pmd_present(pmd)) {
         |              ^~~~~~~~~~~
         |              p4d_present
   mm/hmm.c:349:13: error: implicit declaration of function 'pmd_devmap'; did you mean 'pte_devmap'? [-Werror=implicit-function-declaration]
     349 |         if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         |             ^~~~~~~~~~
         |             pte_devmap
   mm/hmm.c:349:32: error: implicit declaration of function 'pmd_trans_huge'; did you mean 'pmd_trans_huge_lock'? [-Werror=implicit-function-declaration]
     349 |         if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
         |                                ^~~~~~~~~~~~~~
         |                                pmd_trans_huge_lock
   mm/hmm.c:359:23: error: implicit declaration of function 'pmd_read_atomic' [-Werror=implicit-function-declaration]
     359 |                 pmd = pmd_read_atomic(pmdp);
         |                       ^~~~~~~~~~~~~~~
   mm/hmm.c:373:13: error: implicit declaration of function 'pmd_bad'; did you mean 'p4d_bad'? [-Werror=implicit-function-declaration]
     373 |         if (pmd_bad(pmd)) {
         |             ^~~~~~~
         |             p4d_bad
   mm/hmm.c:379:16: error: implicit declaration of function 'pte_offset_map'; did you mean 'pte_offset_map_lock'? [-Werror=implicit-function-declaration]
     379 |         ptep = pte_offset_map(pmdp, addr);
         |                ^~~~~~~~~~~~~~
         |                pte_offset_map_lock
>> mm/hmm.c:379:14: warning: assignment to 'pte_t *' {aka 'long unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |         ptep = pte_offset_map(pmdp, addr);
         |              ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +379 mm/hmm.c

53f5c3f489ecdd Jérôme Glisse   2018-04-10  314  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  315  static int hmm_vma_walk_pmd(pmd_t *pmdp,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  316  			    unsigned long start,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  317  			    unsigned long end,
53f5c3f489ecdd Jérôme Glisse   2018-04-10  318  			    struct mm_walk *walk)
53f5c3f489ecdd Jérôme Glisse   2018-04-10  319  {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  320  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  321  	struct hmm_range *range = hmm_vma_walk->range;
2733ea144dcce7 Jason Gunthorpe 2020-05-01  322  	unsigned long *hmm_pfns =
2733ea144dcce7 Jason Gunthorpe 2020-05-01  323  		&range->hmm_pfns[(start - range->start) >> PAGE_SHIFT];
2288a9a68175ce Jason Gunthorpe 2020-03-05  324  	unsigned long npages = (end - start) >> PAGE_SHIFT;
2288a9a68175ce Jason Gunthorpe 2020-03-05  325  	unsigned long addr = start;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  326  	pte_t *ptep;
d08faca018c461 Jérôme Glisse   2018-10-30  327  	pmd_t pmd;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  328  
53f5c3f489ecdd Jérôme Glisse   2018-04-10  329  again:
d08faca018c461 Jérôme Glisse   2018-10-30  330  	pmd = READ_ONCE(*pmdp);
d08faca018c461 Jérôme Glisse   2018-10-30  331  	if (pmd_none(pmd))
b7a16c7ad790d0 Steven Price    2020-02-03  332  		return hmm_vma_walk_hole(start, end, -1, walk);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  333  
d08faca018c461 Jérôme Glisse   2018-10-30  334  	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  335  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0)) {
d08faca018c461 Jérôme Glisse   2018-10-30  336  			hmm_vma_walk->last = addr;
d2e8d551165ccb Ralph Campbell  2019-07-25  337  			pmd_migration_entry_wait(walk->mm, pmdp);
73231612dc7c90 Jérôme Glisse   2019-05-13  338  			return -EBUSY;
d08faca018c461 Jérôme Glisse   2018-10-30  339  		}
2733ea144dcce7 Jason Gunthorpe 2020-05-01  340  		return hmm_pfns_fill(start, end, range, 0);
2288a9a68175ce Jason Gunthorpe 2020-03-05  341  	}
2288a9a68175ce Jason Gunthorpe 2020-03-05  342  
2288a9a68175ce Jason Gunthorpe 2020-03-05  343  	if (!pmd_present(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  344  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  345  			return -EFAULT;
d28c2c9a487708 Ralph Campbell  2019-11-04  346  		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  347  	}
d08faca018c461 Jérôme Glisse   2018-10-30  348  
d08faca018c461 Jérôme Glisse   2018-10-30  349  	if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  350  		/*
d2e8d551165ccb Ralph Campbell  2019-07-25  351  		 * No need to take pmd_lock here, even if some other thread
53f5c3f489ecdd Jérôme Glisse   2018-04-10  352  		 * is splitting the huge pmd we will get that event through
53f5c3f489ecdd Jérôme Glisse   2018-04-10  353  		 * mmu_notifier callback.
53f5c3f489ecdd Jérôme Glisse   2018-04-10  354  		 *
d2e8d551165ccb Ralph Campbell  2019-07-25  355  		 * So just read pmd value and check again it's a transparent
53f5c3f489ecdd Jérôme Glisse   2018-04-10  356  		 * huge or device mapping one and compute corresponding pfn
53f5c3f489ecdd Jérôme Glisse   2018-04-10  357  		 * values.
53f5c3f489ecdd Jérôme Glisse   2018-04-10  358  		 */
53f5c3f489ecdd Jérôme Glisse   2018-04-10  359  		pmd = pmd_read_atomic(pmdp);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  360  		barrier();
53f5c3f489ecdd Jérôme Glisse   2018-04-10  361  		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
53f5c3f489ecdd Jérôme Glisse   2018-04-10  362  			goto again;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  363  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  364  		return hmm_vma_handle_pmd(walk, addr, end, hmm_pfns, pmd);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  365  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  366  
d08faca018c461 Jérôme Glisse   2018-10-30  367  	/*
d2e8d551165ccb Ralph Campbell  2019-07-25  368  	 * We have handled all the valid cases above ie either none, migration,
d08faca018c461 Jérôme Glisse   2018-10-30  369  	 * huge or transparent huge. At this point either it is a valid pmd
d08faca018c461 Jérôme Glisse   2018-10-30  370  	 * entry pointing to pte directory or it is a bad pmd that will not
d08faca018c461 Jérôme Glisse   2018-10-30  371  	 * recover.
d08faca018c461 Jérôme Glisse   2018-10-30  372  	 */
2288a9a68175ce Jason Gunthorpe 2020-03-05  373  	if (pmd_bad(pmd)) {
2733ea144dcce7 Jason Gunthorpe 2020-05-01  374  		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
2288a9a68175ce Jason Gunthorpe 2020-03-05  375  			return -EFAULT;
d28c2c9a487708 Ralph Campbell  2019-11-04  376  		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
2288a9a68175ce Jason Gunthorpe 2020-03-05  377  	}
53f5c3f489ecdd Jérôme Glisse   2018-04-10  378  
53f5c3f489ecdd Jérôme Glisse   2018-04-10 @379  	ptep = pte_offset_map(pmdp, addr);
2733ea144dcce7 Jason Gunthorpe 2020-05-01  380  	for (; addr < end; addr += PAGE_SIZE, ptep++, hmm_pfns++) {
53f5c3f489ecdd Jérôme Glisse   2018-04-10  381  		int r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  382  
2733ea144dcce7 Jason Gunthorpe 2020-05-01  383  		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, hmm_pfns);
53f5c3f489ecdd Jérôme Glisse   2018-04-10  384  		if (r) {
dfdc22078f3f06 Jason Gunthorpe 2020-02-28  385  			/* hmm_vma_handle_pte() did pte_unmap() */
53f5c3f489ecdd Jérôme Glisse   2018-04-10  386  			return r;
53f5c3f489ecdd Jérôme Glisse   2018-04-10  387  		}
da4c3c735ea4dc Jérôme Glisse   2017-09-08  388  	}
da4c3c735ea4dc Jérôme Glisse   2017-09-08  389  	pte_unmap(ptep - 1);
da4c3c735ea4dc Jérôme Glisse   2017-09-08  390  	return 0;
da4c3c735ea4dc Jérôme Glisse   2017-09-08  391  }
da4c3c735ea4dc Jérôme Glisse   2017-09-08  392  

:::::: The code at line 379 was first introduced by commit
:::::: 53f5c3f489ecddc7570a2e2422a6fc5b25007b9d mm/hmm: factor out pte and pmd handling to simplify hmm_vma_walk_pmd()

:::::: TO: Jérôme Glisse <jglisse@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
