Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646A10E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705723709; cv=none; b=fbrqawlNTHIBSG9cXWz4MnA6BRC0fXJryr7RYFeS1LJF2foY1oyExtG0SxzNHIEHdUqzFotmoGE71u/W0NATJcGljLFu9m05qkd5wEqAlxl8rHkHsr58PUQX9+CvzkiKqj2UhBjc8xuYEUt6z9ZwtflxjobkaC4KP39n33/LaPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705723709; c=relaxed/simple;
	bh=X2Ky8D8mrA3e8nX1C+prp3MFEI6jPtKIbPbBwS1OJdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1Wl7XS+I3B9AmQBbwSnP+U69nRJup6zFefmvSBa9Xu4luL3acDEba1GVAZuKij3vR1iuvC6QFdzaq201R/FbAofVCl/y8k06KWEoqffWtowSekH9fGWyWOqWWiAlp6eoIXKLW9pGUwnoTZhgTAvtLO1NPaj8w4jDLI4r6RTkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBU5D0tJ; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBU5D0tJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705723707; x=1737259707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2Ky8D8mrA3e8nX1C+prp3MFEI6jPtKIbPbBwS1OJdE=;
  b=VBU5D0tJG25jK8o8IubphfQqUh53kcNDMeuhcWHbCnp4cAjS8i2clQuK
   e38h/kiy8/xQgAunxrdSG1nF22jdxHCFZYnOjHY/+Lw5jfL2qFvrrzpK/
   +3dE4cE9Um+Iv5qZVuOP0Ywt8Jl9aYAX73GOMlgc5GljAme5uaxGQzpuD
   FJA27rsg1BqTusnVUJxJghvCJrG/6eDWB637/TSOqyB0BbsFDzLVcRRY9
   ysF0afed1LZaurOn830hPu5Y7eQpuUaRf4NZ8hK6hruDjbcE3+Lj5GDwX
   LELM17fidnIQDooQoG+nNHKygRb3ODkLzrkCkbJTDLKmCa42SCHm3rKUq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="398071368"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="398071368"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:08:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1116405739"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="1116405739"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2024 20:08:25 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR2ed-0004iq-18;
	Sat, 20 Jan 2024 04:08:23 +0000
Date: Sat, 20 Jan 2024 12:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 3/11]
 include/linux/pgtable.h:638:20: warning: conflicting types for
 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,
  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  long long
 unsigned int *)'}
Message-ID: <202401201235.fcCAbfbN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   c54f3b69b7a799efa06dbf58a60db9b3fac04111
commit: d84c9158468598cb15b038bca27fd80e113b456c [3/11] mm/memory: optimize fork() with PTE-mapped THP
config: arm-randconfig-r062-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201235.fcCAbfbN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201235.fcCAbfbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201235.fcCAbfbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/page.h:169,
                    from arch/arm/include/asm/thread_info.h:14,
                    from include/linux/thread_info.h:60,
                    from include/linux/sched.h:14,
                    from arch/arm/kernel/asm-offsets.c:11:
   include/linux/pgtable.h: In function 'pte_next_pfn':
   include/linux/pgtable.h:218:45: error: 'PFN_PTE_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
     218 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/arm/include/asm/pgtable-3level-types.h:51:26: note: in definition of macro '__pte'
      51 | #define __pte(x)        (x)
         |                          ^
   include/linux/pgtable.h:218:45: note: each undeclared identifier is reported only once for each function it appears in
     218 |         return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
         |                                             ^~~~~~~~~~~~~
   arch/arm/include/asm/pgtable-3level-types.h:51:26: note: in definition of macro '__pte'
      51 | #define __pte(x)        (x)
         |                          ^
   In file included from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
   include/linux/pgtable.h: In function 'wrprotect_ptes':
   include/linux/pgtable.h:227:17: error: implicit declaration of function 'ptep_set_wrprotect'; did you mean 'pte_wrprotect'? [-Werror=implicit-function-declaration]
     227 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 pte_wrprotect
   include/linux/pgtable.h: At top level:
>> include/linux/pgtable.h:638:20: warning: conflicting types for 'ptep_set_wrprotect'; have 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  long long unsigned int *)'}
     638 | static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:638:20: error: static declaration of 'ptep_set_wrprotect' follows non-static declaration
   include/linux/pgtable.h:227:17: note: previous implicit declaration of 'ptep_set_wrprotect' with type 'void(struct mm_struct *, long unsigned int,  pte_t *)' {aka 'void(struct mm_struct *, long unsigned int,  long long unsigned int *)'}
     227 |                 ptep_set_wrprotect(mm, addr, ptep);
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +638 include/linux/pgtable.h

2f0584f3f4bd60 include/linux/pgtable.h       Rick Edgecombe 2023-06-12  635  
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  636  #ifndef __HAVE_ARCH_PTEP_SET_WRPROTECT
8c65b4a6045059 include/asm-generic/pgtable.h Tim Schmielau  2005-11-07  637  struct mm_struct;
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16 @638  static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  639  {
c33c794828f212 include/linux/pgtable.h       Ryan Roberts   2023-06-12  640  	pte_t old_pte = ptep_get(ptep);
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  641  	set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  642  }
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  643  #endif
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  644  

:::::: The code at line 638 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
