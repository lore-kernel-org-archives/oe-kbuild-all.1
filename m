Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB63C490
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT6QLru5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701771715; x=1733307715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/ztZyAy6nFZ/EwP3psl8n3dImEyhCLRK3ybilKxJdT8=;
  b=jT6QLru5/ELaI2gQIR+/jXs2rMy0Fk3kIEk54riCpdd2yYcS60WgyogL
   +9l58mdiK+KRniv0ioYkGlojwsL9LCj3HEDxhhvf1qX97J59pkLjrXb1D
   tuI9PVCnAHmvOGzQ1Lb/MxgF4oyhq7SYuxrLKrYXObdwFXJ7N748v4tOm
   SzkcCY43wFoptruBNyzf+QAP34NBK5LRd0g7cx5pBFIo8/UjCbvhI9/cK
   1B5aJjECSGNGQtrQyo2/b5i++PUkFcXkRb6VK15QtOEUzJEcTHA8OIstB
   Y3TpXw658BmysasoW1ROnejlSMVa0Hbba2zz2XmcHbwed58ksBy/dVfT/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="716130"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="716130"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018174043"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="1018174043"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 02:21:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rASYo-0008kK-24;
	Tue, 05 Dec 2023 10:21:50 +0000
Date: Tue, 5 Dec 2023 18:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jihan Cha <jihan.cha@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 1517/9999] mm/hmm.c:219:1: warning:
 control reaches end of non-void function
Message-ID: <202312051844.wSaL8EPI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [1517/9999] ANDROID: GKI: Kconfig.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-randconfig-r064-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051844.wSaL8EPI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051844.wSaL8EPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051844.wSaL8EPI-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   mm/hmm.c:379:14: warning: assignment to 'pte_t *' {aka 'long unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |         ptep = pte_offset_map(pmdp, addr);
         |              ^
   mm/hmm.c: In function 'hmm_is_device_private_entry':
>> mm/hmm.c:219:1: warning: control reaches end of non-void function [-Wreturn-type]
     219 | }
         | ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=y]


vim +219 mm/hmm.c

da4c3c735ea4dc Jérôme Glisse     2017-09-08  212  
08ddddda667b3b Christoph Hellwig 2020-03-16  213  static inline bool hmm_is_device_private_entry(struct hmm_range *range,
08ddddda667b3b Christoph Hellwig 2020-03-16  214  		swp_entry_t entry)
08ddddda667b3b Christoph Hellwig 2020-03-16  215  {
08ddddda667b3b Christoph Hellwig 2020-03-16  216  	return is_device_private_entry(entry) &&
08ddddda667b3b Christoph Hellwig 2020-03-16  217  		device_private_entry_to_page(entry)->pgmap->owner ==
08ddddda667b3b Christoph Hellwig 2020-03-16  218  		range->dev_private_owner;
08ddddda667b3b Christoph Hellwig 2020-03-16 @219  }
08ddddda667b3b Christoph Hellwig 2020-03-16  220  

:::::: The code at line 219 was first introduced by commit
:::::: 08ddddda667b3b7aaac10641418283f78118c5cd mm/hmm: check the device private page owner in hmm_range_fault()

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
