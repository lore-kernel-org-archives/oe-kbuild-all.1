Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D9B2E0903
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757739271; cv=none; b=YwQCSTR3meX8YzPf6XTH36rAS2HR2+XHJKTAihDQIyx7INFqFFT5eGjosIQ46HrQGQ0lZ/tXtoKZ4DBkYaqFo0bBnwX1Of7C4hPi1ocLVhlpIEHl0MDBGbYpnh32F7sbbkSOi+RMZGL1pYR9qhVCK67SlVTn6jXq1XaoaqADKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757739271; c=relaxed/simple;
	bh=vf17++RMcUm1uTKoA7SlmMgh6YPFEz2iKCiWctknxnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrpiE6/yr795DeJeyIARxlp9MC92kSwd+KsnTUUoqfQEn0WUoG/Q+2h6Sfjpc3VmnansFzXhd8jwCnrSNdVWH/e65kwZcK2oUHEQ6wTcgWzpEmtxLWOxIy9yV4plKqpjbqz5zUxrJvI5ajaYegNs7gpPMWblcYd8omNOotZ8XpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuWjdRA3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuWjdRA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757739270; x=1789275270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vf17++RMcUm1uTKoA7SlmMgh6YPFEz2iKCiWctknxnQ=;
  b=FuWjdRA3vt7fChcgqgjIsZMTRofon7tASJZrEkiFEVUqKV5J/JMK107B
   HFIQsEApnAbMbakMEMzjIDhRWYEPfwfUuFKAmjfOHXgOv0IOuwNxIMzjV
   IkiEnhg4lkvl2Mmwni53D1xDZrvQ0NyNpWL5X2sjSl4tRBDeZyh/OMtqn
   3V6brk+qyACSpxO92VVUjkTFlWduUP2eAmvTeeQmfRZ6SJXAyKyI2EUXd
   UnRRBydlNEyd3UsWtbk3MKvEqEEtRW6ceYNvdRjv3InNH1dMPI6sCuuAm
   Mo3J1Qqtk70ga9MFt8afdL7dP8M/75XgIMGsOnDGbLeovFD/ifE1wMGMY
   Q==;
X-CSE-ConnectionGUID: 8EPNpHZRRVCbqEc+YReJKA==
X-CSE-MsgGUID: KF8whiZfTPqbg5smPeUGPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60151369"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="60151369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 21:54:28 -0700
X-CSE-ConnectionGUID: dl5LpduZQZerRsKIL84RQQ==
X-CSE-MsgGUID: HCSkTh/JRZSJmYTWN0jrog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="197872578"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2025 21:54:27 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxIHJ-0001Mo-05;
	Sat, 13 Sep 2025 04:54:25 +0000
Date: Sat, 13 Sep 2025 12:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 39/428] include/linux/pgtable.h:235:36: error:
 expected expression before 'do'
Message-ID: <202509131255.x9EfvIGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   8ded915c4409a5190b1c9c57c172d62ab5534274
commit: f6748cc302fdca7c486c6098f315bd4174f5c614 [39/428] kasan: Fix warnings caused by use of arch_enter_lazy_mmu_mode()
config: s390-randconfig-002-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509131255.x9EfvIGt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kasan.h:37,
                    from mm/kasan/shadow.c:14:
   mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
>> include/linux/pgtable.h:235:36: error: expected expression before 'do'
    #define arch_enter_lazy_mmu_mode() do {} while (0)
                                       ^~
   mm/kasan/shadow.c:322:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
     (void)arch_enter_lazy_mmu_mode();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
>> include/linux/pgtable.h:235:36: error: expected expression before 'do'
    #define arch_enter_lazy_mmu_mode() do {} while (0)
                                       ^~
   mm/kasan/shadow.c:497:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
     (void)arch_enter_lazy_mmu_mode();
           ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/do +235 include/linux/pgtable.h

533c67e63584067 Kinsey Ho               2023-12-27  214  
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  215) /*
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  216)  * A facility to provide lazy MMU batching.  This allows PTE updates and
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  217)  * page invalidations to be delayed until a call to leave lazy MMU mode
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  218)  * is issued.  Some architectures may benefit from doing this, and it is
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  219)  * beneficial for both shadow and direct mode hypervisors, which may batch
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  220)  * the PTE updates which happen during this window.  Note that using this
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  221)  * interface requires that read hazards be removed from the code.  A read
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  222)  * hazard could result in the direct mode hypervisor case, since the actual
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  223)  * write to the page tables may not yet have taken place, so reads though
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  224)  * a raw PTE pointer after it has been modified are not guaranteed to be
691ee97e1a9de0c Ryan Roberts            2025-03-03  225   * up to date.
691ee97e1a9de0c Ryan Roberts            2025-03-03  226   *
691ee97e1a9de0c Ryan Roberts            2025-03-03  227   * In the general case, no lock is guaranteed to be held between entry and exit
691ee97e1a9de0c Ryan Roberts            2025-03-03  228   * of the lazy mode. So the implementation must assume preemption may be enabled
691ee97e1a9de0c Ryan Roberts            2025-03-03  229   * and cpu migration is possible; it must take steps to be robust against this.
691ee97e1a9de0c Ryan Roberts            2025-03-03  230   * (In practice, for user PTE updates, the appropriate page table lock(s) are
691ee97e1a9de0c Ryan Roberts            2025-03-03  231   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
691ee97e1a9de0c Ryan Roberts            2025-03-03  232   * and the mode cannot be used in interrupt context.
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  233)  */
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  234) #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02 @235) #define arch_enter_lazy_mmu_mode()	do {} while (0)
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  236) #define arch_leave_lazy_mmu_mode()	do {} while (0)
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  237) #define arch_flush_lazy_mmu_mode()	do {} while (0)
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  238) #endif
bcc6cc832573a99 Matthew Wilcox (Oracle  2023-08-02  239) 

:::::: The code at line 235 was first introduced by commit
:::::: bcc6cc832573a99d1f935c89a28e2c71fd1aaf0c mm: add default definition of set_ptes()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
