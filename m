Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB71C451982
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049602; cv=none; b=uIq4C52OmdpcfxyszHn8kG9af7xgGXJ/67mP4tmAYiiaaMnE5O1uZKV6feaTCp952dMxVEd2GezG/TD0JprrpQYlTDfyeMH5V5BIGorBsESNnWB/gla/pp95tcQcfi85aRTqbwUKmg+uooqO/zL8njvfAkmSkNgY7u/6QDPDw+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049602; c=relaxed/simple;
	bh=FthEJNn1lHlRMWMowrzdv8QLSlr+6PqweILLpRRxXmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oO7dqCpREzXiYIEv2aDVZDjx2d8I8SrcU4Efi7qk1SqArImGL/byih/fPewUapZEHvw7bKKXi7x6Cg3hw1msz848jDRlB6En8Z8NNPKrcizn2e+pUjTl6km8vHS3NgQSId03L3SiN1VRx2askP6nJo/saiWX6HMokhVBKYh+sy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0whZflQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0whZflQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787049600; x=1818585600;
  h=date:from:to:cc:subject:message-id;
  bh=FthEJNn1lHlRMWMowrzdv8QLSlr+6PqweILLpRRxXmc=;
  b=Z0whZflQu7vHOT9E493rcEfGRrgQMQA1I0++0osQnvH72vFMBV5C9cJW
   vSZKVUp8o0dZnQmXbJ8w8cNViJtO5DuTrdW2IfTsKXvQpRsFkdIIGfQ/7
   Voyq6V1Di8bX9gm+oTUxkmDYu/l7htV8gGYkGAwy9Z7rnXutPJ5nWlQzD
   QMPdFQEp6d/0A7Em2zKJTRX9mwrg0I07Jf26Bv1/8K+rldjC9Ai/ObhIa
   EysclqzsEu3SMhjYLKo6teEohLAyncyeP/WdADVyKabPy44O1/YLDkVD+
   PDibAiXR3Wh2XuwhB3yk9MRlZvcV0C+gwPzJ80dr9pHC4eqdF4PVBC98t
   w==;
X-CSE-ConnectionGUID: Gx1XHHuSRKmCgmnGe3KANQ==
X-CSE-MsgGUID: rdglvGwwTNqziUKvEjTfjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691702"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98691702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:39:59 -0700
X-CSE-ConnectionGUID: pMIQDPT8SLSq5Ckema4MvA==
X-CSE-MsgGUID: 7YGUW5nZQ7+PAYwUmVgJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268698583"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 03:39:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwHEZ-00000000eH4-323z;
	Tue, 18 Aug 2026 10:39:55 +0000
Date: Tue, 18 Aug 2026 18:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-v1 65/76] mm/khugepaged.c:593:9: error:
 call to undeclared function 'lock_next_vma'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202608181800.KOyipeQ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-v1
head:   efac4ce42bf9ea34a32d1563fe3370ee837a751f
commit: 99f13a62a94d3cb1a452889bf38875e51c7cbee3 [65/76] mm/khugepaged: scan under a per-VMA read lock
config: i386-randconfig-141-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181800.KOyipeQ5-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181800.KOyipeQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181800.KOyipeQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:593:9: error: call to undeclared function 'lock_next_vma'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     593 |                 vma = lock_next_vma(mm, &vmi, khugepaged_scan.address);
         |                       ^
>> mm/khugepaged.c:593:7: error: incompatible integer to pointer conversion assigning to 'struct vm_area_struct *' from 'int' [-Wint-conversion]
     593 |                 vma = lock_next_vma(mm, &vmi, khugepaged_scan.address);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/lock_next_vma +593 mm/khugepaged.c

   508	
   509	static void collapse_scan_mm_slot(unsigned int progress_max,
   510			enum scan_result *result, struct collapse_control *cc)
   511		__releases(&khugepaged_mm_lock)
   512		__acquires(&khugepaged_mm_lock)
   513	{
   514		struct mm_slot *slot;
   515		struct mm_struct *mm;
   516		struct vm_area_struct *vma;
   517		bool scan_complete = false;
   518		unsigned int progress_prev = cc->progress;
   519	
   520		lockdep_assert_held(&khugepaged_mm_lock);
   521		*result = SCAN_FAIL;
   522	
   523		if (khugepaged_scan.mm_slot) {
   524			slot = khugepaged_scan.mm_slot;
   525		} else {
   526			slot = list_first_entry(&khugepaged_scan.mm_head,
   527					     struct mm_slot, mm_node);
   528			khugepaged_scan.address = 0;
   529			khugepaged_scan.mm_slot = slot;
   530		}
   531		spin_unlock(&khugepaged_mm_lock);
   532	
   533		mm = slot->mm;
   534		vma = NULL;
   535	
   536		/*
   537		 * Hold the address space open for the pass.  A collapse works under a
   538		 * per-VMA read lock, and the barrier __khugepaged_exit() puts in front
   539		 * of exit_mmap() -- mmap_write_lock() -- waits for a reader of
   540		 * mmap_lock, not for a reader of one VMA.  A reference on mm_users
   541		 * stops __mmput(), and so both of those, from starting at all.
   542		 *
   543		 * Once per pass rather than once per table: the reference is what makes
   544		 * the address space safe to work on, and the pass is how long that is
   545		 * wanted for.  Nothing else in mm takes it per unit of work -- DAMON
   546		 * takes one per target and walks every region under it, swapoff one per
   547		 * mm across the whole address space, userfaultfd one per call.  It is
   548		 * dropped below before the exiting mm is judged, so that judgement still
   549		 * sees the true count.
   550		 */
   551		if (!mmget_not_zero(mm))
   552			goto breakouterloop_no_mmput;
   553	
   554		cc->progress++;
   555	
   556		/*
   557		 * One VMA at a time, each held by its own read lock rather than by
   558		 * mmap_lock over the whole address space.  lock_next_vma() locks what it
   559		 * finds, falling back to mmap_lock only where it cannot.
   560		 *
   561		 * Whether this mm still wants collapsing is asked once, at the top of
   562		 * each round of the loop.  Asking again before entering it only repeats
   563		 * the same question: nothing between the two can answer it differently.
   564		 */
   565		for (;;) {
   566			unsigned long hstart, hend, window;
   567			struct vma_iterator vmi;
   568			unsigned long orders;
   569	
   570			cond_resched();
   571			/*
   572			 * Our reference is the reason the count cannot fall to zero, so
   573			 * it is also what an address space whose owner has gone looks
   574			 * like.  Stopping is what frees it: nothing else here would.
   575			 */
   576			if (unlikely(collapse_test_exit_or_disable_mmref(mm))) {
   577				cc->progress++;
   578				goto breakouterloop;
   579			}
   580	
   581			/*
   582			 * Before a VMA is locked, so that a pass over an address space
   583			 * of VMAs it skips is bounded by the budget too, and so that a
   584			 * collapse returning here does not lock one to be told it is
   585			 * out of budget.
   586			 */
   587			if (cc->progress >= progress_max)
   588				goto breakouterloop;
   589	
   590			/* The first VMA at or after the cursor, which often sits in a gap */
   591			rcu_read_lock();
   592			vma_iter_init(&vmi, mm, khugepaged_scan.address);
 > 593			vma = lock_next_vma(mm, &vmi, khugepaged_scan.address);
   594			rcu_read_unlock();
   595	
   596			/*
   597			 * NULL is the end of the address space, and the only thing that
   598			 * finishes this mm.  An error is a fatal signal or the unlikely
   599			 * reference count overflow: leave the mm for the next pass
   600			 * rather than treat it as walked.
   601			 */
   602			if (IS_ERR_OR_NULL(vma)) {
   603				scan_complete = !IS_ERR(vma);
   604				vma = NULL;
   605				goto breakouterloop;
   606			}
   607	
   608			orders = collapse_possible_orders(vma, vma->vm_flags,
   609							  TVA_KHUGEPAGED);
   610			if (!orders) {
   611				cc->progress++;
   612				goto next_vma;
   613			}
   614	
   615			/*
   616			 * Coverage is rooted at windows of the largest order the VMA
   617			 * allows: below the PMD order that reaches VMAs a whole table
   618			 * would not fit in, and parts of a VMA that a whole table would
   619			 * leave out.
   620			 */
   621			window = PAGE_SIZE << __fls(orders);
   622			hstart = ALIGN(vma->vm_start, window);
   623			hend = ALIGN_DOWN(vma->vm_end, window);
   624			if (khugepaged_scan.address > hend) {
   625				cc->progress++;
   626				goto next_vma;
   627			}
   628			if (khugepaged_scan.address < hstart)
   629				khugepaged_scan.address = hstart;
   630	
   631			while (khugepaged_scan.address < hend) {
   632				unsigned long pmd_addr, range_end, start;
   633	
   634				cond_resched();
   635	
   636				if (unlikely(collapse_test_exit_or_disable_mmref(mm)) ||
   637				    cc->progress >= progress_max) {
   638					vma_end_read(vma);
   639					vma = NULL;
   640					goto breakouterloop;
   641				}
   642	
   643				/* One table's worth at most, and never past the VMA */
   644				pmd_addr = khugepaged_scan.address & HPAGE_PMD_MASK;
   645				range_end = min(hend, pmd_addr + HPAGE_PMD_SIZE);
   646				start = khugepaged_scan.address;
   647	
   648				VM_WARN_ON_ONCE(khugepaged_scan.address < hstart);
   649				VM_WARN_ON_ONCE(range_end > hend);
   650	
   651				/* Move the cursor on regardless of what the scan says */
   652				khugepaged_scan.address = range_end;
   653	
   654				/* If nothing to collapse, the lock is still ours */
   655				if (!collapse_scan_pmd(vma, start, range_end, cc, orders)) {
   656					*result = cc->scan_refusal;
   657					continue;
   658				}
   659	
   660				/* collapse_run_pmd() takes its own locks, so give this up */
   661				vma_end_read(vma);
   662				vma = NULL;
   663	
   664				*result = collapse_run_pmd(mm, start, range_end, cc);
   665				if (*result == SCAN_SUCCEED)
   666					khugepaged_pages_collapsed++;
   667				goto breakouterloop;
   668			}
   669	next_vma:
   670			/*
   671			 * Past this VMA: the cursor has to move by hand, where the
   672			 * mmap_lock iterator used to carry it.  A VMA that was walked
   673			 * is charged by the scan itself, one table at a time; only one
   674			 * passed over without being looked at is charged here.
   675			 */
   676			khugepaged_scan.address = vma->vm_end;
   677			vma_end_read(vma);
   678			vma = NULL;
   679		}
   680	
   681	breakouterloop:
   682		/*
   683		 * Not mmput(): the last reference would run exit_mmap() here, and
   684		 * khugepaged is not the thread that should tear an address space down.
   685		 */
   686		mmput_async(mm);
   687	breakouterloop_no_mmput:
   688	
   689		spin_lock(&khugepaged_mm_lock);
   690		VM_BUG_ON(khugepaged_scan.mm_slot != slot);
   691		/*
   692		 * Release the current mm_slot if this mm is about to die, or
   693		 * if we scanned all vmas of this mm, or THP got disabled.
   694		 */
   695		if (collapse_test_exit_or_disable(mm) || scan_complete) {
   696			/*
   697			 * Make sure that if mm_users is reaching zero while
   698			 * khugepaged runs here, khugepaged_exit will find
   699			 * mm_slot not pointing to the exiting mm.
   700			 */
   701			if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
   702				khugepaged_scan.mm_slot = list_next_entry(slot, mm_node);
   703				khugepaged_scan.address = 0;
   704			} else {
   705				khugepaged_scan.mm_slot = NULL;
   706				khugepaged_full_scans++;
   707			}
   708	
   709			collect_mm_slot(slot);
   710		}
   711	
   712		trace_mm_khugepaged_scan(mm, cc->progress - progress_prev,
   713					 khugepaged_scan.mm_slot == NULL);
   714	}
   715	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
