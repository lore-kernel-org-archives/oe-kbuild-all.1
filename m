Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1F7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677315638; x=1708851638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hp2A3dJ9JDILZBZ3Bxreao2Q7Sw2MGajColjvcI/Gt8=;
  b=H+CS3zPoH42s+7akn1rzdCoapKkP+oVChpQnvr6xF+ZJRdv4KFkH59Mh
   uSrbmwqwJeFOZPn5VUqR3qgI75xeZhf4wBQRooECwVwSimtCK862JS0Wi
   G5sKw6Ia38UvXhb4n5lgZllNNd7HKYG9cBYSxQ5GyTxLPcz2OqNL+2jvG
   tVTXR4uBJQB3bs/6bz/eUzX2538exR98pA/760qHuY+4Gh4OJStWWLdql
   2s8uRKwcVFmCj9gBpXpSFNsT/mr+gQgNxmGhYttZLZ5Wovt+prDMTXeWL
   1KbI+27U1uWf0yvQKlz2Gadk5tMYmcmZNh54EBT3zbsEb9dxmZo+42bDN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313282912"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="313282912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 01:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="650618589"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="650618589"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Feb 2023 01:00:25 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVqPo-00034h-0w;
	Sat, 25 Feb 2023 09:00:24 +0000
Date: Sat, 25 Feb 2023 16:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/fixes 5/10]
 arch/microblaze/mm/fault.c:224:25: error: label 'no_context' used but not
 defined
Message-ID: <202302251612.lARjPOWJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/fixes
head:   b260379a90a440564d4c0196ec52f621b1c05020
commit: 8820100806d82abf47169f2ac4a1a1d64d83b220 [5/10] microblaze: fix livelock in uaccess
config: microblaze-randconfig-r011-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251612.lARjPOWJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/8820100806d82abf47169f2ac4a1a1d64d83b220
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/fixes
        git checkout 8820100806d82abf47169f2ac4a1a1d64d83b220
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash arch/microblaze/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251612.lARjPOWJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/microblaze/mm/fault.c: In function 'do_page_fault':
>> arch/microblaze/mm/fault.c:224:25: error: label 'no_context' used but not defined
     224 |                         goto no_context;
         |                         ^~~~


vim +/no_context +224 arch/microblaze/mm/fault.c

    81	
    82	/*
    83	 * The error_code parameter is ESR for a data fault,
    84	 * 0 for an instruction fault.
    85	 */
    86	void do_page_fault(struct pt_regs *regs, unsigned long address,
    87			   unsigned long error_code)
    88	{
    89		struct vm_area_struct *vma;
    90		struct mm_struct *mm = current->mm;
    91		int code = SEGV_MAPERR;
    92		int is_write = error_code & ESR_S;
    93		vm_fault_t fault;
    94		unsigned int flags = FAULT_FLAG_DEFAULT;
    95	
    96		regs->ear = address;
    97		regs->esr = error_code;
    98	
    99		/* On a kernel SLB miss we can only check for a valid exception entry */
   100		if (unlikely(kernel_mode(regs) && (address >= TASK_SIZE))) {
   101			pr_warn("kernel task_size exceed");
   102			_exception(SIGSEGV, regs, code, address);
   103		}
   104	
   105		/* for instr TLB miss and instr storage exception ESR_S is undefined */
   106		if ((error_code & 0x13) == 0x13 || (error_code & 0x11) == 0x11)
   107			is_write = 0;
   108	
   109		if (unlikely(faulthandler_disabled() || !mm)) {
   110			if (kernel_mode(regs))
   111				goto bad_area_nosemaphore;
   112	
   113			/* faulthandler_disabled() in user mode is really bad,
   114			   as is current->mm == NULL. */
   115			pr_emerg("Page fault in user mode with faulthandler_disabled(), mm = %p\n",
   116				 mm);
   117			pr_emerg("r15 = %lx  MSR = %lx\n",
   118			       regs->r15, regs->msr);
   119			die("Weird page fault", regs, SIGSEGV);
   120		}
   121	
   122		if (user_mode(regs))
   123			flags |= FAULT_FLAG_USER;
   124	
   125		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
   126	
   127		/* When running in the kernel we expect faults to occur only to
   128		 * addresses in user space.  All other faults represent errors in the
   129		 * kernel and should generate an OOPS.  Unfortunately, in the case of an
   130		 * erroneous fault occurring in a code path which already holds mmap_lock
   131		 * we will deadlock attempting to validate the fault against the
   132		 * address space.  Luckily the kernel only validly references user
   133		 * space from well defined areas of code, which are listed in the
   134		 * exceptions table.
   135		 *
   136		 * As the vast majority of faults will be valid we will only perform
   137		 * the source reference check when there is a possibility of a deadlock.
   138		 * Attempt to lock the address space, if we cannot we then validate the
   139		 * source.  If this is invalid we can skip the address space check,
   140		 * thus avoiding the deadlock.
   141		 */
   142		if (unlikely(!mmap_read_trylock(mm))) {
   143			if (kernel_mode(regs) && !search_exception_tables(regs->pc))
   144				goto bad_area_nosemaphore;
   145	
   146	retry:
   147			mmap_read_lock(mm);
   148		}
   149	
   150		vma = find_vma(mm, address);
   151		if (unlikely(!vma))
   152			goto bad_area;
   153	
   154		if (vma->vm_start <= address)
   155			goto good_area;
   156	
   157		if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
   158			goto bad_area;
   159	
   160		if (unlikely(!is_write))
   161			goto bad_area;
   162	
   163		/*
   164		 * N.B. The ABI allows programs to access up to
   165		 * a few hundred bytes below the stack pointer (TBD).
   166		 * The kernel signal delivery code writes up to about 1.5kB
   167		 * below the stack pointer (r1) before decrementing it.
   168		 * The exec code can write slightly over 640kB to the stack
   169		 * before setting the user r1.  Thus we allow the stack to
   170		 * expand to 1MB without further checks.
   171		 */
   172		if (unlikely(address + 0x100000 < vma->vm_end)) {
   173	
   174			/* get user regs even if this fault is in kernel mode */
   175			struct pt_regs *uregs = current->thread.regs;
   176			if (uregs == NULL)
   177				goto bad_area;
   178	
   179			/*
   180			 * A user-mode access to an address a long way below
   181			 * the stack pointer is only valid if the instruction
   182			 * is one which would update the stack pointer to the
   183			 * address accessed if the instruction completed,
   184			 * i.e. either stwu rs,n(r1) or stwux rs,r1,rb
   185			 * (or the byte, halfword, float or double forms).
   186			 *
   187			 * If we don't check this then any write to the area
   188			 * between the last mapped region and the stack will
   189			 * expand the stack rather than segfaulting.
   190			 */
   191			if (address + 2048 < uregs->r1
   192				&& (kernel_mode(regs) || !store_updates_sp(regs)))
   193					goto bad_area;
   194		}
   195		if (expand_stack(vma, address))
   196			goto bad_area;
   197	
   198	good_area:
   199		code = SEGV_ACCERR;
   200	
   201		/* a write */
   202		if (unlikely(is_write)) {
   203			if (unlikely(!(vma->vm_flags & VM_WRITE)))
   204				goto bad_area;
   205			flags |= FAULT_FLAG_WRITE;
   206		/* a read */
   207		} else {
   208			/* protection fault */
   209			if (unlikely(error_code & 0x08000000))
   210				goto bad_area;
   211			if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC))))
   212				goto bad_area;
   213		}
   214	
   215		/*
   216		 * If for any reason at all we couldn't handle the fault,
   217		 * make sure we exit gracefully rather than endlessly redo
   218		 * the fault.
   219		 */
   220		fault = handle_mm_fault(vma, address, flags, regs);
   221	
   222		if (fault_signal_pending(fault, regs)) {
   223			if (!user_mode(regs))
 > 224				goto no_context;
   225			return;
   226		}
   227	
   228		/* The fault is fully completed (including releasing mmap lock) */
   229		if (fault & VM_FAULT_COMPLETED)
   230			return;
   231	
   232		if (unlikely(fault & VM_FAULT_ERROR)) {
   233			if (fault & VM_FAULT_OOM)
   234				goto out_of_memory;
   235			else if (fault & VM_FAULT_SIGSEGV)
   236				goto bad_area;
   237			else if (fault & VM_FAULT_SIGBUS)
   238				goto do_sigbus;
   239			BUG();
   240		}
   241	
   242		if (fault & VM_FAULT_RETRY) {
   243			flags |= FAULT_FLAG_TRIED;
   244	
   245			/*
   246			 * No need to mmap_read_unlock(mm) as we would
   247			 * have already released it in __lock_page_or_retry
   248			 * in mm/filemap.c.
   249			 */
   250	
   251			goto retry;
   252		}
   253	
   254		mmap_read_unlock(mm);
   255	
   256		/*
   257		 * keep track of tlb+htab misses that are good addrs but
   258		 * just need pte's created via handle_mm_fault()
   259		 * -- Cort
   260		 */
   261		pte_misses++;
   262		return;
   263	
   264	bad_area:
   265		mmap_read_unlock(mm);
   266	
   267	bad_area_nosemaphore:
   268		pte_errors++;
   269	
   270		/* User mode accesses cause a SIGSEGV */
   271		if (user_mode(regs)) {
   272			_exception(SIGSEGV, regs, code, address);
   273			return;
   274		}
   275	
   276		bad_page_fault(regs, address, SIGSEGV);
   277		return;
   278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
