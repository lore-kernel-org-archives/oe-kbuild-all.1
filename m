Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A05D1775B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688764455; x=1720300455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LFVWkYEDgaRHfNywUiOaliU2UYWFOq/yvp9wfHMzBEw=;
  b=fd/UlH4XdgUNWo4pqK3lOfnfLoMDFRyrfbfGLC3Pwo2xBL1O7A0Tjc7w
   8O5CKea8lJe+ipLWd/bqhHHrBr2OtPogvdQaS3Lr6sfoWLy/490FlDCpw
   ZeK7APbwqgdMNw8ijaHAAcwmEWxeksOSFqp3u/T4DAvcrFXK/85cct5x1
   HXoSz3M62FrfXg5Hml3SyW+z/y2U7fTKG3h92TrgdTxRgNiPvVDlB7Mpc
   5keOuRclHQxD+l6bzjz3x+FwbVw6JCPFQtX2MKbY6+l1C9rN9xcwfc8Qn
   vqmzQEDtV5CvF/mDBKHrA0K6AH2HUPnaBAn4Jc0W2iEAk6DhnB7qZx0yc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="361453688"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="361453688"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="697347723"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="697347723"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 14:14:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHsmI-0002Im-00;
	Fri, 07 Jul 2023 21:14:10 +0000
Date: Sat, 8 Jul 2023 05:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 21/37]
 arch/riscv/include/asm/pgtable.h:531:3: error: call to undeclared function
 'set_pte_at'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202307080524.GaAIlQnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 5f76d31b1de3753e2899c3a0698fef037340d8ee [21/37] riscv: Implement the new page table range API
config: riscv-randconfig-r035-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080524.GaAIlQnp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080524.GaAIlQnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080524.GaAIlQnp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:531:3: error: call to undeclared function 'set_pte_at'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     531 |                 set_pte_at(vma->vm_mm, address, ptep, entry);
         |                 ^
   arch/riscv/include/asm/pgtable.h:531:3: note: did you mean '__set_pte_at'?
   arch/riscv/include/asm/pgtable.h:494:20: note: '__set_pte_at' declared here
     494 | static inline void __set_pte_at(struct mm_struct *mm,
         |                    ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:1066:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^


vim +/set_pte_at +531 arch/riscv/include/asm/pgtable.h

08f051eda33b51 Andrew Waterman 2017-10-25  524  
07037db5d479f9 Palmer Dabbelt  2017-07-10  525  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
07037db5d479f9 Palmer Dabbelt  2017-07-10  526  static inline int ptep_set_access_flags(struct vm_area_struct *vma,
07037db5d479f9 Palmer Dabbelt  2017-07-10  527  					unsigned long address, pte_t *ptep,
07037db5d479f9 Palmer Dabbelt  2017-07-10  528  					pte_t entry, int dirty)
07037db5d479f9 Palmer Dabbelt  2017-07-10  529  {
07037db5d479f9 Palmer Dabbelt  2017-07-10  530  	if (!pte_same(*ptep, entry))
07037db5d479f9 Palmer Dabbelt  2017-07-10 @531  		set_pte_at(vma->vm_mm, address, ptep, entry);
07037db5d479f9 Palmer Dabbelt  2017-07-10  532  	/*
07037db5d479f9 Palmer Dabbelt  2017-07-10  533  	 * update_mmu_cache will unconditionally execute, handling both
07037db5d479f9 Palmer Dabbelt  2017-07-10  534  	 * the case that the PTE changed and the spurious fault case.
07037db5d479f9 Palmer Dabbelt  2017-07-10  535  	 */
07037db5d479f9 Palmer Dabbelt  2017-07-10  536  	return true;
07037db5d479f9 Palmer Dabbelt  2017-07-10  537  }
07037db5d479f9 Palmer Dabbelt  2017-07-10  538  

:::::: The code at line 531 was first introduced by commit
:::::: 07037db5d479f90377c998259a4f9a469c404edf RISC-V: Paging and MMU

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
