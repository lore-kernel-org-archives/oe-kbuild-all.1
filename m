Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A4420896
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 02:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478306; cv=none; b=mG674oa8OMms1nP+9GAdi8YyubhTgAt9u9oXRh7fYucIwltncxvZnfvo6BfQSSrL/HnCzUdsQzGaPt4CS6thCbHsSgamqzcrqq3p1GkLi7q/kLc9Q5UFMftxQFMw2syabgyGfWDNEjjqQ9LjYOEhlGmD722yzu4h8oTO4NboUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478306; c=relaxed/simple;
	bh=q5UDlEBnr/Omri/8EEbbExicvZCsYPDjAZrb6MRyfWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/B2voNd/o3l+SYuRCH43sxmJez1U0W8SakT7STDHvQBIOG974nyed0QOJ2dsHJWS7pkzwpkGv0Si4TTbD4pp079v16EveUp4CfbL6M4uwpEAsG+WY1FIaw3S5Gd/HHo/SGZUFAn9iVYpUaC5HjmR74mJRpSMqQo1+IlW0DdMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXXAvuc8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXXAvuc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783478305; x=1815014305;
  h=date:from:to:cc:subject:message-id;
  bh=q5UDlEBnr/Omri/8EEbbExicvZCsYPDjAZrb6MRyfWA=;
  b=VXXAvuc8wmxbRJj3nrAf0Br9m1WDrHGgt3iHxkcNaNplqPC1FbzGrEYq
   Mde29VdtcMMOFuoLopwHqk81tSn/kzKrn2G9sQcul60zd26ZNrP3BcLyC
   kYtvpy8wmWwrN54Yu2Akd6rUvYs/gqjuideQ4OPxdyBj+fA/0Rp/HGXuu
   xpAROGNorlllw+CqmfykU0utGSujlH+oW0vasu0P2VEXaSf4aGFR0c7K8
   dA8VkuytglAZj5+aXHRL0ZhQJk2MPSMaRWCoHTTKrM5nuzuKGsAvxCMNc
   rqjjmrxa0vw2J8ol8AQbLTy+qFfYnp2Kif8ZG2IE8TpHQXd8RyHYI8uYw
   A==;
X-CSE-ConnectionGUID: 7zCXvriURd65f7ExtfV/rA==
X-CSE-MsgGUID: PgvrhzaDSoW8kN/E3fyZIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84107229"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84107229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 19:38:25 -0700
X-CSE-ConnectionGUID: JKzVpiPoQtSSkEylm4fRqw==
X-CSE-MsgGUID: 9BDXAq9/To2Oanm6Q2wgKg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jul 2026 19:38:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whIB1-00000000Fvv-3WV2;
	Wed, 08 Jul 2026 02:38:19 +0000
Date: Wed, 08 Jul 2026 10:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [davidhildenbrand:folded_pgtable 17/28]
 arch/nios2/mm/fault.c:231:39: error: expected '=', ',', ';', 'asm' or
 '__attribute__' before 'p4d_k'
Message-ID: <202607081001.D20Pg1h9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   710c0f29eb829f67c4c0d1c2a3f764b286282229
commit: bdd0e7f6c7062ca47a16ca208ab1de07161ec049 [17/28] nios2: mm: use proper set_pXd() for folded patable in vmalloc_fault path
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607081001.D20Pg1h9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081001.D20Pg1h9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081001.D20Pg1h9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/nios2/mm/fault.c: In function 'do_page_fault':
>> arch/nios2/mm/fault.c:231:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'p4d_k'
     231 |                 p4d_t *p4dp, *p4dp_k  p4d_k;
         |                                       ^~~~~
>> arch/nios2/mm/fault.c:245:17: error: 'p4dp_k' undeclared (first use in this function); did you mean 'pmdp_k'?
     245 |                 p4dp_k = p4d_offset(pgdp_k, address);
         |                 ^~~~~~
         |                 pmdp_k
   arch/nios2/mm/fault.c:245:17: note: each undeclared identifier is reported only once for each function it appears in
>> arch/nios2/mm/fault.c:246:17: error: 'p4d_k' undeclared (first use in this function); did you mean 'pmd_k'?
     246 |                 p4d_k = p4dp_get(p4dp_k);
         |                 ^~~~~
         |                 pmd_k
>> arch/nios2/mm/fault.c:252:17: error: 'pud' undeclared (first use in this function); did you mean 'pudp'?
     252 |                 pud = pud_offset(p4dp, address);
         |                 ^~~
         |                 pudp
   In file included from arch/nios2/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/mm/fault.c:22:
   arch/nios2/mm/fault.c:258:39: error: incompatible types when initializing type 'long unsigned int' using type 'pud_t'
     258 |                         set_p4d(pudp, pud_k);
         |                                       ^~~~~
   include/asm-generic/pgtable-nopmd.h:45:86: note: in definition of macro 'set_pud'
      45 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                                      ^~~~~~
   arch/nios2/mm/fault.c:258:25: note: in expansion of macro 'set_p4d'
     258 |                         set_p4d(pudp, pud_k);
         |                         ^~~~~~~
   arch/nios2/mm/fault.c:261:37: error: incompatible type for argument 1 of 'pmd_offset'
     261 |                 pmdp_k = pmd_offset(pud_k, address);
         |                                     ^~~~~
         |                                     |
         |                                     pud_t
   In file included from arch/nios2/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/mm/fault.c:22:
   include/asm-generic/pgtable-nopmd.h:47:42: note: expected 'pud_t *' but argument is of type 'pud_t'
      47 | static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
         |                                  ~~~~~~~~^~~


vim +231 arch/nios2/mm/fault.c

    37	
    38	/*
    39	 * This routine handles page faults.  It determines the address,
    40	 * and the problem, and then passes it off to one of the appropriate
    41	 * routines.
    42	 */
    43	asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
    44					unsigned long address)
    45	{
    46		struct vm_area_struct *vma = NULL;
    47		struct task_struct *tsk = current;
    48		struct mm_struct *mm = tsk->mm;
    49		int code = SEGV_MAPERR;
    50		vm_fault_t fault;
    51		unsigned int flags = FAULT_FLAG_DEFAULT;
    52	
    53		cause >>= 2;
    54	
    55		/* Restart the instruction */
    56		regs->ea -= 4;
    57	
    58		/*
    59		 * We fault-in kernel-space virtual memory on-demand. The
    60		 * 'reference' page table is init_mm.pgd.
    61		 *
    62		 * NOTE! We MUST NOT take any locks for this case. We may
    63		 * be in an interrupt or a critical region, and should
    64		 * only copy the information from the master page table,
    65		 * nothing more.
    66		 */
    67		if (unlikely(address >= VMALLOC_START && address <= VMALLOC_END)) {
    68			if (user_mode(regs))
    69				goto bad_area_nosemaphore;
    70			else
    71				goto vmalloc_fault;
    72		}
    73	
    74		if (unlikely(address >= TASK_SIZE))
    75			goto bad_area_nosemaphore;
    76	
    77		/*
    78		 * If we're in an interrupt or have no user
    79		 * context, we must not take the fault..
    80		 */
    81		if (faulthandler_disabled() || !mm)
    82			goto bad_area_nosemaphore;
    83	
    84		if (user_mode(regs))
    85			flags |= FAULT_FLAG_USER;
    86	
    87		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
    88	
    89	retry:
    90		vma = lock_mm_and_find_vma(mm, address, regs);
    91		if (!vma)
    92			goto bad_area_nosemaphore;
    93	/*
    94	 * Ok, we have a good vm_area for this memory access, so
    95	 * we can handle it..
    96	 */
    97		code = SEGV_ACCERR;
    98	
    99		switch (cause) {
   100		case EXC_SUPERV_INSN_ACCESS:
   101			goto bad_area;
   102		case EXC_SUPERV_DATA_ACCESS:
   103			goto bad_area;
   104		case EXC_X_PROTECTION_FAULT:
   105			if (!(vma->vm_flags & VM_EXEC))
   106				goto bad_area;
   107			break;
   108		case EXC_R_PROTECTION_FAULT:
   109			if (!(vma->vm_flags & VM_READ))
   110				goto bad_area;
   111			break;
   112		case EXC_W_PROTECTION_FAULT:
   113			if (!(vma->vm_flags & VM_WRITE))
   114				goto bad_area;
   115			flags = FAULT_FLAG_WRITE;
   116			break;
   117		}
   118	
   119		/*
   120		 * If for any reason at all we couldn't handle the fault,
   121		 * make sure we exit gracefully rather than endlessly redo
   122		 * the fault.
   123		 */
   124		fault = handle_mm_fault(vma, address, flags, regs);
   125	
   126		if (fault_signal_pending(fault, regs)) {
   127			if (!user_mode(regs))
   128				goto no_context;
   129			return;
   130		}
   131	
   132		/* The fault is fully completed (including releasing mmap lock) */
   133		if (fault & VM_FAULT_COMPLETED)
   134			return;
   135	
   136		if (unlikely(fault & VM_FAULT_ERROR)) {
   137			if (fault & VM_FAULT_OOM)
   138				goto out_of_memory;
   139			else if (fault & VM_FAULT_SIGSEGV)
   140				goto bad_area;
   141			else if (fault & VM_FAULT_SIGBUS)
   142				goto do_sigbus;
   143			BUG();
   144		}
   145	
   146		if (fault & VM_FAULT_RETRY) {
   147			flags |= FAULT_FLAG_TRIED;
   148	
   149			/*
   150			 * No need to mmap_read_unlock(mm) as we would
   151			 * have already released it in __lock_page_or_retry
   152			 * in mm/filemap.c.
   153			 */
   154	
   155			goto retry;
   156		}
   157	
   158		mmap_read_unlock(mm);
   159		return;
   160	
   161	/*
   162	 * Something tried to access memory that isn't in our memory map..
   163	 * Fix it, but check if it's kernel or user first..
   164	 */
   165	bad_area:
   166		mmap_read_unlock(mm);
   167	
   168	bad_area_nosemaphore:
   169		/* User mode accesses just cause a SIGSEGV */
   170		if (user_mode(regs)) {
   171			if (unhandled_signal(current, SIGSEGV) && printk_ratelimit()) {
   172				pr_info("%s: unhandled page fault (%d) at 0x%08lx, "
   173					"cause %ld\n", current->comm, SIGSEGV, address, cause);
   174				show_regs(regs);
   175			}
   176			_exception(SIGSEGV, regs, code, address);
   177			return;
   178		}
   179	
   180	no_context:
   181		/* Are we prepared to handle this kernel fault? */
   182		if (fixup_exception(regs))
   183			return;
   184	
   185		/*
   186		 * Oops. The kernel tried to access some bad page. We'll have to
   187		 * terminate things with extreme prejudice.
   188		 */
   189		bust_spinlocks(1);
   190	
   191		pr_alert("Unable to handle kernel %s at virtual address %08lx",
   192			address < PAGE_SIZE ? "NULL pointer dereference" :
   193			"paging request", address);
   194		pr_alert("ea = %08lx, ra = %08lx, cause = %ld\n", regs->ea, regs->ra,
   195			cause);
   196		panic("Oops");
   197		return;
   198	
   199	/*
   200	 * We ran out of memory, or some other thing happened to us that made
   201	 * us unable to handle the page fault gracefully.
   202	 */
   203	out_of_memory:
   204		mmap_read_unlock(mm);
   205		if (!user_mode(regs))
   206			goto no_context;
   207		pagefault_out_of_memory();
   208		return;
   209	
   210	do_sigbus:
   211		mmap_read_unlock(mm);
   212	
   213		/* Kernel mode? Handle exceptions or die */
   214		if (!user_mode(regs))
   215			goto no_context;
   216	
   217		_exception(SIGBUS, regs, BUS_ADRERR, address);
   218		return;
   219	
   220	vmalloc_fault:
   221		{
   222			/*
   223			 * Synchronize this task's top level page-table
   224			 * with the 'reference' page table.
   225			 *
   226			 * Do _not_ use "tsk" here. We might be inside
   227			 * an interrupt in the middle of a task switch..
   228			 */
   229			int offset = pgd_index(address);
   230			pgd_t *pgdp, *pgdp_k, pgd_k;
 > 231			p4d_t *p4dp, *p4dp_k  p4d_k;
   232			pud_t *pudp, *pudp_k, pud_k;
   233			pmd_t *pmdp, *pmdp_k, pmd_k;
   234			pte_t *ptep_k;
   235	
   236			pgdp = pgd_current + offset;
   237			pgdp_k = init_mm.pgd + offset;
   238			pgd_k = pgdp_get(pgdp_k);
   239			if (!pgd_present(pgd_k))
   240				goto no_context;
   241			if (!pgd_present(pgdp_get(pgdp)))
   242				set_pgd(pgdp, pgd_k);
   243	
   244			p4dp = p4d_offset(pgdp, address);
 > 245			p4dp_k = p4d_offset(pgdp_k, address);
 > 246			p4d_k = p4dp_get(p4dp_k);
   247			if (!p4d_present(p4d_k))
   248				goto no_context;
   249			if (!p4d_present(p4dp_get(p4dp)))
   250				set_p4d(p4dp, p4d_k);
   251	
 > 252			pud = pud_offset(p4dp, address);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
