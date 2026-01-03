Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3227F4F5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767452603; cv=none; b=doheQt+rgooop625UXB9my1zzpQFg85U2OR95CKSGk5jfsGLMbPSOkARSmn0oM9FPbHi9RSCZRY7BpPsWp2eqKdSxC3UUfAzbfv12JxZo4ERN0+vRozmpjO+hLbq/Ubgp5xEc+5jjnf7c5CLVDRkkJjv0MEC9pw4wYTYcI52/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767452603; c=relaxed/simple;
	bh=wOo9qLq/JrN9Gak9SK5lHn7UOmptEHKmR1TxjsJVD5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RQw1qUIgsqzbWOVsjLS/0NFMW3YQBDLorB4HHmGn4DqNelU42C1cV0mG/+Pp3OgSyiXK/2evA8qTWaR9QP0z+VYq8layiSSO4o3GuPbIvLjijNGzzmuVqqf7NtzHwkAIacULT6CJ1nCNohVW7vSBI5m+v+ZDw8pxYZS5z832uG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UplwV9Eu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UplwV9Eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767452601; x=1798988601;
  h=date:from:to:cc:subject:message-id;
  bh=wOo9qLq/JrN9Gak9SK5lHn7UOmptEHKmR1TxjsJVD5E=;
  b=UplwV9EuIXMK5e+Jqiy/dnB+5O/sqKPvCiQDbnLXL548/Z8a7b1H8TDl
   4qTVP+3pwcY+oEz/5bmGWz4bICQzFLyUQQdwotOpWwG9YQkKvPUwt8Bot
   3kdo/7MBhIiApoPLdle/H9GM5I/a/jA0rtm2uIIxOVXSG1udBUUIwMzTs
   Iz64xg/ROMwPE1fpYW319aXZ2pQiExl3XcXJ7pTs8I4osNrkKEgkM/1kq
   qx5cv31q+BZM5n2GywzDdQzI7/pbhooZCXyCYAgnB+NwA4ufg0XCYEknl
   47fAkkTlxmjw3jzTBIzKdaG+4GV3rLCXlbp5IxrCtvQ/1RWs4e9BD14DC
   Q==;
X-CSE-ConnectionGUID: ReWuuo94QTiKuUBem5lEUA==
X-CSE-MsgGUID: AFhmK3F/R8CPpXRvqcYa6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68096732"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68096732"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 07:03:21 -0800
X-CSE-ConnectionGUID: /xEMkruiTIeWYlpmWDFsJQ==
X-CSE-MsgGUID: 9wpoUrCEQAe1w8v3SfgJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202020254"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2026 07:03:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc39w-0000000005x-1Q4S;
	Sat, 03 Jan 2026 15:03:16 +0000
Date: Sat, 03 Jan 2026 23:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 arch/arm64/mm/fault.c:594:15: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202601032224.Ypw4MQoY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 9e4d84273c9d786ee7592970f0a46c1c28eb3c18 [1/1] ANDROID: Fix sparse warning in __handle_speculative_fault caused by SPF
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260103/202601032224.Ypw4MQoY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601032224.Ypw4MQoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601032224.Ypw4MQoY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/mm/fault.c:494:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted vm_fault_t @@
   arch/arm64/mm/fault.c:494:31: sparse:     expected int
   arch/arm64/mm/fault.c:494:31: sparse:     got restricted vm_fault_t
>> arch/arm64/mm/fault.c:594:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] fault @@     got int @@
   arch/arm64/mm/fault.c:594:15: sparse:     expected restricted vm_fault_t [assigned] [usertype] fault
   arch/arm64/mm/fault.c:594:15: sparse:     got int
   arch/arm64/mm/fault.c:623:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:623:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:666:39: sparse: sparse: restricted vm_fault_t degrades to integer

vim +594 arch/arm64/mm/fault.c

c49bd02f4c7412 Anshuman Khandual   2019-06-07  510  
1ad9551f1d90e3 Peter Collingbourne 2021-01-22  511  static int __kprobes do_page_fault(unsigned long far, unsigned int esr,
1d18c47c735e8a Catalin Marinas     2012-03-05  512  				   struct pt_regs *regs)
1d18c47c735e8a Catalin Marinas     2012-03-05  513  {
2d2837fab5fada Eric W. Biederman   2018-09-22  514  	const struct fault_info *inf;
61681036004318 Anshuman Khandual   2019-06-03  515  	struct mm_struct *mm = current->mm;
6a1bb025d28e10 Peter Xu            2020-08-11  516  	vm_fault_t fault;
6cb4d9a2870d20 Anshuman Khandual   2020-04-10  517  	unsigned long vm_flags = VM_ACCESS_FLAGS;
dde1607248328c Peter Xu            2020-04-01  518  	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  519  	struct vm_area_struct *vma = NULL;
1ad9551f1d90e3 Peter Collingbourne 2021-01-22  520  	unsigned long addr = untagged_addr(far);
db6f41063cbdb5 Will Deacon         2013-07-19  521  
b98cca444d287a Anshuman Khandual   2019-07-16  522  	if (kprobe_page_fault(regs, esr))
2dd0e8d2d2a157 Sandeepa Prabhu     2016-07-08  523  		return 0;
2dd0e8d2d2a157 Sandeepa Prabhu     2016-07-08  524  
1d18c47c735e8a Catalin Marinas     2012-03-05  525  	/*
1d18c47c735e8a Catalin Marinas     2012-03-05  526  	 * If we're in an interrupt or have no user context, we must not take
1d18c47c735e8a Catalin Marinas     2012-03-05  527  	 * the fault.
1d18c47c735e8a Catalin Marinas     2012-03-05  528  	 */
70ffdb9393a726 David Hildenbrand   2015-05-11  529  	if (faulthandler_disabled() || !mm)
1d18c47c735e8a Catalin Marinas     2012-03-05  530  		goto no_context;
1d18c47c735e8a Catalin Marinas     2012-03-05  531  
759496ba6407c6 Johannes Weiner     2013-09-12  532  	if (user_mode(regs))
759496ba6407c6 Johannes Weiner     2013-09-12  533  		mm_flags |= FAULT_FLAG_USER;
759496ba6407c6 Johannes Weiner     2013-09-12  534  
541ec870ef3143 Mark Rutland        2016-05-31  535  	if (is_el0_instruction_abort(esr)) {
759496ba6407c6 Johannes Weiner     2013-09-12  536  		vm_flags = VM_EXEC;
01de1776f62e64 Anshuman Khandual   2019-05-05  537  		mm_flags |= FAULT_FLAG_INSTRUCTION;
c49bd02f4c7412 Anshuman Khandual   2019-06-07  538  	} else if (is_write_abort(esr)) {
759496ba6407c6 Johannes Weiner     2013-09-12  539  		vm_flags = VM_WRITE;
759496ba6407c6 Johannes Weiner     2013-09-12  540  		mm_flags |= FAULT_FLAG_WRITE;
759496ba6407c6 Johannes Weiner     2013-09-12  541  	}
759496ba6407c6 Johannes Weiner     2013-09-12  542  
356607f21e6035 Andrey Konovalov    2018-12-28  543  	if (is_ttbr0_addr(addr) && is_el1_permission_fault(addr, esr, regs)) {
e19a6ee2460bdd James Morse         2016-06-20  544  		/* regs->orig_addr_limit may be 0 if we entered from EL0 */
e19a6ee2460bdd James Morse         2016-06-20  545  		if (regs->orig_addr_limit == KERNEL_DS)
c870f14ea115bb Mark Rutland        2018-05-21  546  			die_kernel_fault("access to user memory with fs=KERNEL_DS",
c870f14ea115bb Mark Rutland        2018-05-21  547  					 addr, esr, regs);
705441960033e6 James Morse         2016-02-05  548  
9adeb8e72dbfe9 Laura Abbott        2016-08-09  549  		if (is_el1_instruction_abort(esr))
c870f14ea115bb Mark Rutland        2018-05-21  550  			die_kernel_fault("execution of user memory",
c870f14ea115bb Mark Rutland        2018-05-21  551  					 addr, esr, regs);
9adeb8e72dbfe9 Laura Abbott        2016-08-09  552  
57f4959bad0a15 James Morse         2016-02-05  553  		if (!search_exception_tables(regs->pc))
c870f14ea115bb Mark Rutland        2018-05-21  554  			die_kernel_fault("access to user memory outside uaccess routines",
c870f14ea115bb Mark Rutland        2018-05-21  555  					 addr, esr, regs);
57f4959bad0a15 James Morse         2016-02-05  556  	}
338d4f49d6f711 James Morse         2015-07-22  557  
0e3a9026396cd7 Punit Agrawal       2017-06-08  558  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
0e3a9026396cd7 Punit Agrawal       2017-06-08  559  
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  560  	/*
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  561  	 * let's try a speculative page fault without grabbing the
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  562  	 * mmap_sem.
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  563  	 */
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  564  	fault = handle_speculative_fault(mm, addr, mm_flags, &vma);
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  565  	if (fault != VM_FAULT_RETRY)
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  566  		goto done;
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  567  
1d18c47c735e8a Catalin Marinas     2012-03-05  568  	/*
1d18c47c735e8a Catalin Marinas     2012-03-05  569  	 * As per x86, we may deadlock here. However, since the kernel only
1d18c47c735e8a Catalin Marinas     2012-03-05  570  	 * validly references user space from well defined areas of the code,
1d18c47c735e8a Catalin Marinas     2012-03-05  571  	 * we can bug out early if this is from code which shouldn't.
1d18c47c735e8a Catalin Marinas     2012-03-05  572  	 */
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  573  	if (!mmap_read_trylock(mm)) {
1d18c47c735e8a Catalin Marinas     2012-03-05  574  		if (!user_mode(regs) && !search_exception_tables(regs->pc))
1d18c47c735e8a Catalin Marinas     2012-03-05  575  			goto no_context;
1d18c47c735e8a Catalin Marinas     2012-03-05  576  retry:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  577  		mmap_read_lock(mm);
1d18c47c735e8a Catalin Marinas     2012-03-05  578  	} else {
1d18c47c735e8a Catalin Marinas     2012-03-05  579  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  580  		 * The above down_read_trylock() might have succeeded in which
1d18c47c735e8a Catalin Marinas     2012-03-05  581  		 * case, we'll have missed the might_sleep() from down_read().
1d18c47c735e8a Catalin Marinas     2012-03-05  582  		 */
1d18c47c735e8a Catalin Marinas     2012-03-05  583  		might_sleep();
1d18c47c735e8a Catalin Marinas     2012-03-05  584  #ifdef CONFIG_DEBUG_VM
a0509313d5dea0 Anshuman Khandual   2019-06-03  585  		if (!user_mode(regs) && !search_exception_tables(regs->pc)) {
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  586  			mmap_read_unlock(mm);
1d18c47c735e8a Catalin Marinas     2012-03-05  587  			goto no_context;
a0509313d5dea0 Anshuman Khandual   2019-06-03  588  		}
1d18c47c735e8a Catalin Marinas     2012-03-05  589  #endif
1d18c47c735e8a Catalin Marinas     2012-03-05  590  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  591  
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  592  	if (!vma || !can_reuse_spf_vma(vma, addr))
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  593  		vma = find_vma(mm, addr);
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04 @594  	fault = __do_page_fault(vma, addr, mm_flags, vm_flags, regs);
1d18c47c735e8a Catalin Marinas     2012-03-05  595  
b502f038f2ffc9 Peter Xu            2020-04-01  596  	/* Quick path to respond to signals */
b502f038f2ffc9 Peter Xu            2020-04-01  597  	if (fault_signal_pending(fault, regs)) {
289d07a2dc6c6b Mark Rutland        2017-07-11  598  		if (!user_mode(regs))
289d07a2dc6c6b Mark Rutland        2017-07-11  599  			goto no_context;
1d18c47c735e8a Catalin Marinas     2012-03-05  600  		return 0;
289d07a2dc6c6b Mark Rutland        2017-07-11  601  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  602  
b502f038f2ffc9 Peter Xu            2020-04-01  603  	if (fault & VM_FAULT_RETRY) {
0e3a9026396cd7 Punit Agrawal       2017-06-08  604  		if (mm_flags & FAULT_FLAG_ALLOW_RETRY) {
569ba74a7ba69f Mark Salyzyn        2015-09-21  605  			mm_flags |= FAULT_FLAG_TRIED;
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  606  
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  607  			/*
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  608  			 * Do not try to reuse this vma and fetch it
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  609  			 * again since we will release the mmap_sem.
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  610  			 */
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  611  			vma = NULL;
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  612  
1d18c47c735e8a Catalin Marinas     2012-03-05  613  			goto retry;
1d18c47c735e8a Catalin Marinas     2012-03-05  614  		}
1d18c47c735e8a Catalin Marinas     2012-03-05  615  	}
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  616  	mmap_read_unlock(mm);
1d18c47c735e8a Catalin Marinas     2012-03-05  617  
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  618  done:
2fd69fa6bcab98 Mahendran Ganesh    2018-05-04  619  
1d18c47c735e8a Catalin Marinas     2012-03-05  620  	/*
0e3a9026396cd7 Punit Agrawal       2017-06-08  621  	 * Handle the "normal" (no error) case first.
1d18c47c735e8a Catalin Marinas     2012-03-05  622  	 */
1d18c47c735e8a Catalin Marinas     2012-03-05  623  	if (likely(!(fault & (VM_FAULT_ERROR | VM_FAULT_BADMAP |
6a1bb025d28e10 Peter Xu            2020-08-11  624  			      VM_FAULT_BADACCESS))))
1d18c47c735e8a Catalin Marinas     2012-03-05  625  		return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  626  
871341023c771a Johannes Weiner     2013-09-12  627  	/*
871341023c771a Johannes Weiner     2013-09-12  628  	 * If we are in kernel mode at this point, we have no context to
871341023c771a Johannes Weiner     2013-09-12  629  	 * handle this fault with.
871341023c771a Johannes Weiner     2013-09-12  630  	 */
871341023c771a Johannes Weiner     2013-09-12  631  	if (!user_mode(regs))
871341023c771a Johannes Weiner     2013-09-12  632  		goto no_context;
871341023c771a Johannes Weiner     2013-09-12  633  
1d18c47c735e8a Catalin Marinas     2012-03-05  634  	if (fault & VM_FAULT_OOM) {
1d18c47c735e8a Catalin Marinas     2012-03-05  635  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  636  		 * We ran out of memory, call the OOM killer, and return to
1d18c47c735e8a Catalin Marinas     2012-03-05  637  		 * userspace (which will retry the fault, or kill us if we got
1d18c47c735e8a Catalin Marinas     2012-03-05  638  		 * oom-killed).
1d18c47c735e8a Catalin Marinas     2012-03-05  639  		 */
1d18c47c735e8a Catalin Marinas     2012-03-05  640  		pagefault_out_of_memory();
1d18c47c735e8a Catalin Marinas     2012-03-05  641  		return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  642  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  643  
2d2837fab5fada Eric W. Biederman   2018-09-22  644  	inf = esr_to_fault_info(esr);
559d8d91a89cc2 Eric W. Biederman   2018-09-22  645  	set_thread_esr(addr, esr);
1d18c47c735e8a Catalin Marinas     2012-03-05  646  	if (fault & VM_FAULT_SIGBUS) {
1d18c47c735e8a Catalin Marinas     2012-03-05  647  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  648  		 * We had some memory, but were unable to successfully fix up
1d18c47c735e8a Catalin Marinas     2012-03-05  649  		 * this page fault.
1d18c47c735e8a Catalin Marinas     2012-03-05  650  		 */
1ad9551f1d90e3 Peter Collingbourne 2021-01-22  651  		arm64_force_sig_fault(SIGBUS, BUS_ADRERR, far, inf->name);
9ea3a9743cac4f Eric W. Biederman   2018-09-22  652  	} else if (fault & (VM_FAULT_HWPOISON_LARGE | VM_FAULT_HWPOISON)) {
9ea3a9743cac4f Eric W. Biederman   2018-09-22  653  		unsigned int lsb;
9ea3a9743cac4f Eric W. Biederman   2018-09-22  654  
9ea3a9743cac4f Eric W. Biederman   2018-09-22  655  		lsb = PAGE_SHIFT;
9ea3a9743cac4f Eric W. Biederman   2018-09-22  656  		if (fault & VM_FAULT_HWPOISON_LARGE)
9ea3a9743cac4f Eric W. Biederman   2018-09-22  657  			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
92ff0674f5d801 Will Deacon         2018-02-20  658  
1ad9551f1d90e3 Peter Collingbourne 2021-01-22  659  		arm64_force_sig_mceerr(BUS_MCEERR_AR, far, lsb, inf->name);
1d18c47c735e8a Catalin Marinas     2012-03-05  660  	} else {
1d18c47c735e8a Catalin Marinas     2012-03-05  661  		/*
1d18c47c735e8a Catalin Marinas     2012-03-05  662  		 * Something tried to access memory that isn't in our memory
1d18c47c735e8a Catalin Marinas     2012-03-05  663  		 * map.
1d18c47c735e8a Catalin Marinas     2012-03-05  664  		 */
feca355b3d8eba Eric W. Biederman   2018-09-22  665  		arm64_force_sig_fault(SIGSEGV,
feca355b3d8eba Eric W. Biederman   2018-09-22  666  				      fault == VM_FAULT_BADACCESS ? SEGV_ACCERR : SEGV_MAPERR,
1ad9551f1d90e3 Peter Collingbourne 2021-01-22  667  				      far, inf->name);
1d18c47c735e8a Catalin Marinas     2012-03-05  668  	}
1d18c47c735e8a Catalin Marinas     2012-03-05  669  
1d18c47c735e8a Catalin Marinas     2012-03-05  670  	return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  671  
1d18c47c735e8a Catalin Marinas     2012-03-05  672  no_context:
67ce16ec15ce9d Kristina Martsenko  2017-06-09  673  	__do_kernel_fault(addr, esr, regs);
1d18c47c735e8a Catalin Marinas     2012-03-05  674  	return 0;
1d18c47c735e8a Catalin Marinas     2012-03-05  675  }
1d18c47c735e8a Catalin Marinas     2012-03-05  676  

:::::: The code at line 594 was first introduced by commit
:::::: 2fd69fa6bcab984b56ccfd4860b10f11f1966bed FROMLIST: arm64/mm: add speculative page fault

:::::: TO: Mahendran Ganesh <opensource.ganesh@gmail.com>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
