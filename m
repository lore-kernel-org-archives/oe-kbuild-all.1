Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34418188703
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730763898; cv=none; b=gm/rPJagllmApyNxEM1Be07aPmr2jQr2we2Bkr7gnniX1/h/byVu2j4uLDjwVVgjtRBHBKTwj17xP9gWnIqQZR6xTRGgcV1VZ6/OAnlxjXVoOo2jsd2B9mWWxHOpF9RCBXRz77spt5150qrA2xVNMhLzw4XdkHEiHB1APXNQV9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730763898; c=relaxed/simple;
	bh=ZOG+mOz8yJP/C8UYPu8nrcdL2Cqw9KJlUikvqrq34+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTvpyJeYHSPXzUtmGaAVq5Z1LIQ/9JQDqyVnJDWVHuk6hZUHc9yRjP/xPmjTO6LuUyrUIkoMCIW+PhGJSrDQtB8TWJ3hV8nMnUepIlyAS/g3PjJKK+fZg9t8p9ck0Mnm7phjnF/7KvtPWes3s33QlfztxowTouN1pBLZtEFhDzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qi3yls+B; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qi3yls+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730763896; x=1762299896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZOG+mOz8yJP/C8UYPu8nrcdL2Cqw9KJlUikvqrq34+w=;
  b=Qi3yls+BWBCPKUwAg0W2wcDBwfREDDuYmchRB8ujCk0IsxvkgwGEd4yY
   U10omSYmWDojhkN9A2zpWptiu1UkhcqP0ebZyVgDS00cyIxJzzcoD4ob7
   rSbqXM7SaxXY7vFYoRNQaVuJFlb6pue9/jdYvetvwIPbkfQM+0sISC5MC
   DaOvq3D/sY8Lk43aDngpieewxKILs2JunJbJN3Y2x0hEcRnw22NCyt0LN
   yHTlI+Fi38z/KCh9XuF0wCyEE3RyjnMGtPiJpj4aYIrImqMCIOUgRu95L
   nETHhzIApPGEBhzHPMtKcxc14q641IJY3ouUI8eBf1BMvZ37daRoQEp9o
   Q==;
X-CSE-ConnectionGUID: hIIud/8DTCSosZPuhOXHdg==
X-CSE-MsgGUID: 0Got40ydRTeQTdvHBCOSLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41856876"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41856876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 15:44:55 -0800
X-CSE-ConnectionGUID: rQOIpOktR0+MOJ4hWzyEwQ==
X-CSE-MsgGUID: 7cFGMM7iQgqAGNk1bRLaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="83325225"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 15:44:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t86kb-000lP3-1H;
	Mon, 04 Nov 2024 23:44:49 +0000
Date: Tue, 5 Nov 2024 07:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt 19/25]
 arch/arm/include/asm/tlbflush.h:363:19: error: no member named 'context' in
 'struct mm_struct'
Message-ID: <202411050702.BmkzBFgz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt
head:   ea12a7f9c1697d73061d2c3627052fc528e238a1
commit: 538aa4dff7cbb83642feed8922eb41bf1e315efe [19/25] uprobes: Add mapping for optimized uprobe trampolines
config: arm-randconfig-r052-20241105 (https://download.01.org/0day-ci/archive/20241105/202411050702.BmkzBFgz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050702.BmkzBFgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050702.BmkzBFgz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/init-mm.c:2:
   In file included from include/linux/mm_types.h:16:
   include/linux/uprobes.h:126:16: error: field has incomplete type 'struct mutex'
     126 |         struct mutex            tramp_mutex;
         |                                 ^
   include/linux/refcount.h:102:8: note: forward declaration of 'struct mutex'
     102 | struct mutex;
         |        ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1138:27: error: no member named 'mm_mt' in 'struct mm_struct'
    1138 |         mas_init(&vmi->mas, &mm->mm_mt, addr);
         |                              ~~  ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:16:
   include/linux/mmap_lock.h:65:25: error: no member named 'mmap_lock' in 'struct mm_struct'
      65 |         rwsem_assert_held(&mm->mmap_lock);
         |                            ~~  ^
   include/linux/mmap_lock.h:70:31: error: no member named 'mmap_lock' in 'struct mm_struct'
      70 |         rwsem_assert_held_write(&mm->mmap_lock);
         |                                  ~~  ^
   include/linux/mmap_lock.h:100:18: error: no member named 'mmap_lock' in 'struct mm_struct'
     100 |         init_rwsem(&mm->mmap_lock);
         |                     ~~  ^
   include/linux/rwsem.h:121:16: note: expanded from macro 'init_rwsem'
     121 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:16:
   include/linux/mmap_lock.h:106:18: error: no member named 'mmap_lock' in 'struct mm_struct'
     106 |         down_write(&mm->mmap_lock);
         |                     ~~  ^
   include/linux/mmap_lock.h:113:25: error: no member named 'mmap_lock' in 'struct mm_struct'
     113 |         down_write_nested(&mm->mmap_lock, subclass);
         |                            ~~  ^
   include/linux/mmap_lock.h:122:33: error: no member named 'mmap_lock' in 'struct mm_struct'
     122 |         ret = down_write_killable(&mm->mmap_lock);
         |                                    ~~  ^
   include/linux/mmap_lock.h:131:16: error: no member named 'mmap_lock' in 'struct mm_struct'
     131 |         up_write(&mm->mmap_lock);
         |                   ~~  ^
   include/linux/mmap_lock.h:138:23: error: no member named 'mmap_lock' in 'struct mm_struct'
     138 |         downgrade_write(&mm->mmap_lock);
         |                          ~~  ^
   include/linux/mmap_lock.h:144:17: error: no member named 'mmap_lock' in 'struct mm_struct'
     144 |         down_read(&mm->mmap_lock);
         |                    ~~  ^
   include/linux/mmap_lock.h:153:32: error: no member named 'mmap_lock' in 'struct mm_struct'
     153 |         ret = down_read_killable(&mm->mmap_lock);
         |                                   ~~  ^
   include/linux/mmap_lock.h:163:31: error: no member named 'mmap_lock' in 'struct mm_struct'
     163 |         ret = down_read_trylock(&mm->mmap_lock) != 0;
         |                                  ~~  ^
   include/linux/mmap_lock.h:171:15: error: no member named 'mmap_lock' in 'struct mm_struct'
     171 |         up_read(&mm->mmap_lock);
         |                  ~~  ^
   include/linux/mmap_lock.h:177:25: error: no member named 'mmap_lock' in 'struct mm_struct'
     177 |         up_read_non_owner(&mm->mmap_lock);
         |                            ~~  ^
   include/linux/mmap_lock.h:182:33: error: no member named 'mmap_lock' in 'struct mm_struct'
     182 |         return rwsem_is_contended(&mm->mmap_lock);
         |                                    ~~  ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:34:
>> arch/arm/include/asm/tlbflush.h:363:19: error: no member named 'context' in 'struct mm_struct'
     363 |         const int asid = ASID(mm);
         |                          ^~~~~~~~
   arch/arm/include/asm/mmu.h:27:40: note: expanded from macro 'ASID'
      27 | #define ASID(mm)        ((unsigned int)((mm)->context.id.counter & ~ASID_MASK))
         |                                         ~~~~  ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:34:
   arch/arm/include/asm/tlbflush.h:381:19: error: no member named 'context' in 'struct mm_struct'
     381 |         const int asid = ASID(mm);
         |                          ^~~~~~~~
   arch/arm/include/asm/mmu.h:27:40: note: expanded from macro 'ASID'
      27 | #define ASID(mm)        ((unsigned int)((mm)->context.id.counter & ~ASID_MASK))
         |                                         ~~~~  ^
   In file included from mm/init-mm.c:8:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:30:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:34:
   arch/arm/include/asm/tlbflush.h:418:32: error: no member named 'context' in 'struct mm_struct'
     418 |         uaddr = (uaddr & PAGE_MASK) | ASID(vma->vm_mm);
         |                                       ^~~~~~~~~~~~~~~~
   arch/arm/include/asm/mmu.h:27:40: note: expanded from macro 'ASID'
      27 | #define ASID(mm)        ((unsigned int)((mm)->context.id.counter & ~ASID_MASK))
         |                                         ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +363 arch/arm/include/asm/tlbflush.h

f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  359  
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  360  static inline void __local_flush_tlb_mm(struct mm_struct *mm)
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  361  {
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  362  	const int zero = 0;
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11 @363  	const int asid = ASID(mm);
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  364  	const unsigned int __tlb_flag = __cpu_tlb_flags;
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  365  
4cc3daaf3976bd arch/arm/include/asm/tlbflush.h Will Deacon    2013-01-14  366  	if (possible_tlb_flags & (TLB_V4_U_FULL|TLB_V4_D_FULL|TLB_V4_I_FULL)) {
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  367  		if (cpumask_test_cpu(smp_processor_id(), mm_cpumask(mm))) {
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  368  			tlb_op(TLB_V4_U_FULL, "c8, c7, 0", zero);
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  369  			tlb_op(TLB_V4_D_FULL, "c8, c6, 0", zero);
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  370  			tlb_op(TLB_V4_I_FULL, "c8, c5, 0", zero);
^1da177e4c3f41 include/asm-arm/tlbflush.h      Linus Torvalds 2005-04-16  371  		}
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  372  	}
^1da177e4c3f41 include/asm-arm/tlbflush.h      Linus Torvalds 2005-04-16  373  
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  374  	tlb_op(TLB_V6_U_ASID, "c8, c7, 2", asid);
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  375  	tlb_op(TLB_V6_D_ASID, "c8, c6, 2", asid);
87067a935a174c arch/arm/include/asm/tlbflush.h Russell King   2012-02-04  376  	tlb_op(TLB_V6_I_ASID, "c8, c5, 2", asid);
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  377  }
f0915781bd5edf arch/arm/include/asm/tlbflush.h Will Deacon    2013-02-11  378  

:::::: The code at line 363 was first introduced by commit
:::::: f0915781bd5edf78b1154e61efe962dc15872d09 ARM: tlb: don't perform inner-shareable invalidation for local TLB ops

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
