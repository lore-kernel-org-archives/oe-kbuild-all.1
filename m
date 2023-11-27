Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4C531A79
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5/ShrNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701098612; x=1732634612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDv13xLKjJtk3thuWlLsjukyY944fnknfyPWmJzEho8=;
  b=g5/ShrNx2jGHBAoBVYKrZqbjfAhholC+CfEqXHiXJF9uBmBlvhl2u9xv
   RtedR0QIGS0I8Ewe7kEeG/s+z+2a5DfU2Jev8kNHRuBn+4ylzjqcnubDO
   Gc5frFGp10762psJtrY0h8puU5/qi1bmReqYujAuK3BXGdlck2VlzpoQw
   ISrWwk3u6FdIsApaDUulCNv3Azq3c53imM5KrWy9QSrVFwRyC4VskQiJN
   OAVw933U7pDvCP2yZjnHVLve5dDSQc/aL5qt3IkoevukwnMoMWq2zU0lE
   Cour4itVj2mRbRaVoDicZ8734iR3z9sSrsj/nStwD9l2wBcgdUvDxs/fO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5976914"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5976914"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744596166"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="744596166"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2023 07:23:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7dSK-0006Mh-07;
	Mon, 27 Nov 2023 15:23:28 +0000
Date: Mon, 27 Nov 2023 23:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2357/3551] arch/alpha/mm/fault.c:193:60: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202311272143.1EnibyIf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 23f8c1823bd4041064ab557283dbb37657549c5b [2357/3551] arch: add do_page_fault prototypes
config: alpha-randconfig-r112-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272143.1EnibyIf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311272143.1EnibyIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272143.1EnibyIf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/alpha/mm/fault.c:193:60: sparse: sparse: Using plain integer as NULL pointer

vim +193 arch/alpha/mm/fault.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   56  
^1da177e4c3f41 Linus Torvalds     2005-04-16   57  
^1da177e4c3f41 Linus Torvalds     2005-04-16   58  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   59   * This routine handles page faults.  It determines the address,
^1da177e4c3f41 Linus Torvalds     2005-04-16   60   * and the problem, and then passes it off to handle_mm_fault().
^1da177e4c3f41 Linus Torvalds     2005-04-16   61   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   62   * mmcsr:
^1da177e4c3f41 Linus Torvalds     2005-04-16   63   *	0 = translation not valid
^1da177e4c3f41 Linus Torvalds     2005-04-16   64   *	1 = access violation
^1da177e4c3f41 Linus Torvalds     2005-04-16   65   *	2 = fault-on-read
^1da177e4c3f41 Linus Torvalds     2005-04-16   66   *	3 = fault-on-execute
^1da177e4c3f41 Linus Torvalds     2005-04-16   67   *	4 = fault-on-write
^1da177e4c3f41 Linus Torvalds     2005-04-16   68   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   69   * cause:
^1da177e4c3f41 Linus Torvalds     2005-04-16   70   *	-1 = instruction fetch
^1da177e4c3f41 Linus Torvalds     2005-04-16   71   *	0 = load
^1da177e4c3f41 Linus Torvalds     2005-04-16   72   *	1 = store
^1da177e4c3f41 Linus Torvalds     2005-04-16   73   *
^1da177e4c3f41 Linus Torvalds     2005-04-16   74   * Registers $9 through $15 are saved in a block just prior to `regs' and
^1da177e4c3f41 Linus Torvalds     2005-04-16   75   * are saved and restored around the call to allow exception code to
^1da177e4c3f41 Linus Torvalds     2005-04-16   76   * modify them.
^1da177e4c3f41 Linus Torvalds     2005-04-16   77   */
^1da177e4c3f41 Linus Torvalds     2005-04-16   78  
^1da177e4c3f41 Linus Torvalds     2005-04-16   79  /* Macro for exception fixup code to access integer registers.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16   80  #define dpf_reg(r)							\
^1da177e4c3f41 Linus Torvalds     2005-04-16   81  	(((unsigned long *)regs)[(r) <= 8 ? (r) : (r) <= 15 ? (r)-16 :	\
491af60ffb848b Sergei Trofimovich 2018-12-31   82  				 (r) <= 18 ? (r)+10 : (r)-10])
^1da177e4c3f41 Linus Torvalds     2005-04-16   83  
^1da177e4c3f41 Linus Torvalds     2005-04-16   84  asmlinkage void
^1da177e4c3f41 Linus Torvalds     2005-04-16   85  do_page_fault(unsigned long address, unsigned long mmcsr,
^1da177e4c3f41 Linus Torvalds     2005-04-16   86  	      long cause, struct pt_regs *regs)
^1da177e4c3f41 Linus Torvalds     2005-04-16   87  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   88  	struct vm_area_struct * vma;
^1da177e4c3f41 Linus Torvalds     2005-04-16   89  	struct mm_struct *mm = current->mm;
^1da177e4c3f41 Linus Torvalds     2005-04-16   90  	const struct exception_table_entry *fixup;
50a7ca3c6fc869 Souptick Joarder   2018-08-17   91  	int si_code = SEGV_MAPERR;
50a7ca3c6fc869 Souptick Joarder   2018-08-17   92  	vm_fault_t fault;
dde1607248328c Peter Xu           2020-04-01   93  	unsigned int flags = FAULT_FLAG_DEFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   94  
^1da177e4c3f41 Linus Torvalds     2005-04-16   95  	/* As of EV6, a load into $31/$f31 is a prefetch, and never faults
^1da177e4c3f41 Linus Torvalds     2005-04-16   96  	   (or is suppressed by the PALcode).  Support that for older CPUs
^1da177e4c3f41 Linus Torvalds     2005-04-16   97  	   by ignoring such an instruction.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16   98  	if (cause == 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   99  		unsigned int insn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  100  		__get_user(insn, (unsigned int __user *)regs->pc);
^1da177e4c3f41 Linus Torvalds     2005-04-16  101  		if ((insn >> 21 & 0x1f) == 0x1f &&
^1da177e4c3f41 Linus Torvalds     2005-04-16  102  		    /* ldq ldl ldt lds ldg ldf ldwu ldbu */
^1da177e4c3f41 Linus Torvalds     2005-04-16  103  		    (1ul << (insn >> 26) & 0x30f00001400ul)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  104  			regs->pc += 4;
^1da177e4c3f41 Linus Torvalds     2005-04-16  105  			return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  106  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  107  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  108  
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  	/* If we're in an interrupt context, or have no user context,
^1da177e4c3f41 Linus Torvalds     2005-04-16  110  	   we must not take the fault.  */
70ffdb9393a726 David Hildenbrand  2015-05-11  111  	if (!mm || faulthandler_disabled())
^1da177e4c3f41 Linus Torvalds     2005-04-16  112  		goto no_context;
^1da177e4c3f41 Linus Torvalds     2005-04-16  113  
^1da177e4c3f41 Linus Torvalds     2005-04-16  114  #ifdef CONFIG_ALPHA_LARGE_VMALLOC
^1da177e4c3f41 Linus Torvalds     2005-04-16  115  	if (address >= TASK_SIZE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  116  		goto vmalloc_fault;
^1da177e4c3f41 Linus Torvalds     2005-04-16  117  #endif
759496ba6407c6 Johannes Weiner    2013-09-12  118  	if (user_mode(regs))
759496ba6407c6 Johannes Weiner    2013-09-12  119  		flags |= FAULT_FLAG_USER;
c0f6eda41f97db Peter Xu           2020-08-11  120  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
0bcc426b1defa6 Kautuk Consul      2012-08-19  121  retry:
a050ba1e7422f2 Linus Torvalds     2023-06-24  122  	vma = lock_mm_and_find_vma(mm, address, regs);
^1da177e4c3f41 Linus Torvalds     2005-04-16  123  	if (!vma)
a050ba1e7422f2 Linus Torvalds     2023-06-24  124  		goto bad_area_nosemaphore;
^1da177e4c3f41 Linus Torvalds     2005-04-16  125  
^1da177e4c3f41 Linus Torvalds     2005-04-16  126  	/* Ok, we have a good vm_area for this memory access, so
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  	   we can handle it.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  128  	si_code = SEGV_ACCERR;
^1da177e4c3f41 Linus Torvalds     2005-04-16  129  	if (cause < 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  130  		if (!(vma->vm_flags & VM_EXEC))
^1da177e4c3f41 Linus Torvalds     2005-04-16  131  			goto bad_area;
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  	} else if (!cause) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  133  		/* Allow reads even for write-only mappings */
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  		if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  135  			goto bad_area;
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  137  		if (!(vma->vm_flags & VM_WRITE))
^1da177e4c3f41 Linus Torvalds     2005-04-16  138  			goto bad_area;
759496ba6407c6 Johannes Weiner    2013-09-12  139  		flags |= FAULT_FLAG_WRITE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  	/* If for any reason at all we couldn't handle the fault,
^1da177e4c3f41 Linus Torvalds     2005-04-16  143  	   make sure we exit gracefully rather than endlessly redo
^1da177e4c3f41 Linus Torvalds     2005-04-16  144  	   the fault.  */
c0f6eda41f97db Peter Xu           2020-08-11  145  	fault = handle_mm_fault(vma, address, flags, regs);
0bcc426b1defa6 Kautuk Consul      2012-08-19  146  
dce45493aff3fd Al Viro            2023-01-30  147  	if (fault_signal_pending(fault, regs)) {
dce45493aff3fd Al Viro            2023-01-30  148  		if (!user_mode(regs))
dce45493aff3fd Al Viro            2023-01-30  149  			goto no_context;
0bcc426b1defa6 Kautuk Consul      2012-08-19  150  		return;
dce45493aff3fd Al Viro            2023-01-30  151  	}
0bcc426b1defa6 Kautuk Consul      2012-08-19  152  
d92725256b4f22 Peter Xu           2022-05-30  153  	/* The fault is fully completed (including releasing mmap lock) */
d92725256b4f22 Peter Xu           2022-05-30  154  	if (fault & VM_FAULT_COMPLETED)
d92725256b4f22 Peter Xu           2022-05-30  155  		return;
d92725256b4f22 Peter Xu           2022-05-30  156  
83c54070ee1a2d Nicholas Piggin    2007-07-19  157  	if (unlikely(fault & VM_FAULT_ERROR)) {
83c54070ee1a2d Nicholas Piggin    2007-07-19  158  		if (fault & VM_FAULT_OOM)
^1da177e4c3f41 Linus Torvalds     2005-04-16  159  			goto out_of_memory;
33692f27597fca Linus Torvalds     2015-01-29  160  		else if (fault & VM_FAULT_SIGSEGV)
33692f27597fca Linus Torvalds     2015-01-29  161  			goto bad_area;
83c54070ee1a2d Nicholas Piggin    2007-07-19  162  		else if (fault & VM_FAULT_SIGBUS)
83c54070ee1a2d Nicholas Piggin    2007-07-19  163  			goto do_sigbus;
^1da177e4c3f41 Linus Torvalds     2005-04-16  164  		BUG();
^1da177e4c3f41 Linus Torvalds     2005-04-16  165  	}
0bcc426b1defa6 Kautuk Consul      2012-08-19  166  
0bcc426b1defa6 Kautuk Consul      2012-08-19  167  	if (fault & VM_FAULT_RETRY) {
4064b982706375 Peter Xu           2020-04-01  168  		flags |= FAULT_FLAG_TRIED;
0bcc426b1defa6 Kautuk Consul      2012-08-19  169  
3e4e28c5a8f01e Michel Lespinasse  2020-06-08  170  		/* No need to mmap_read_unlock(mm) as we would
0bcc426b1defa6 Kautuk Consul      2012-08-19  171  		 * have already released it in __lock_page_or_retry
0bcc426b1defa6 Kautuk Consul      2012-08-19  172  		 * in mm/filemap.c.
0bcc426b1defa6 Kautuk Consul      2012-08-19  173  		 */
0bcc426b1defa6 Kautuk Consul      2012-08-19  174  
0bcc426b1defa6 Kautuk Consul      2012-08-19  175  		goto retry;
0bcc426b1defa6 Kautuk Consul      2012-08-19  176  	}
0bcc426b1defa6 Kautuk Consul      2012-08-19  177  
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  178  	mmap_read_unlock(mm);
0bcc426b1defa6 Kautuk Consul      2012-08-19  179  
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  	return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	/* Something tried to access memory that isn't in our memory map.
^1da177e4c3f41 Linus Torvalds     2005-04-16  183  	   Fix it, but check if it's kernel or user first.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  184   bad_area:
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  185  	mmap_read_unlock(mm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  186  
a050ba1e7422f2 Linus Torvalds     2023-06-24  187   bad_area_nosemaphore:
^1da177e4c3f41 Linus Torvalds     2005-04-16  188  	if (user_mode(regs))
^1da177e4c3f41 Linus Torvalds     2005-04-16  189  		goto do_sigsegv;
^1da177e4c3f41 Linus Torvalds     2005-04-16  190  
^1da177e4c3f41 Linus Torvalds     2005-04-16  191   no_context:
^1da177e4c3f41 Linus Torvalds     2005-04-16  192  	/* Are we prepared to handle this fault as an exception?  */
^1da177e4c3f41 Linus Torvalds     2005-04-16 @193  	if ((fixup = search_exception_tables(regs->pc)) != 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  194  		unsigned long newpc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  195  		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		regs->pc = newpc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  198  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  
^1da177e4c3f41 Linus Torvalds     2005-04-16  200  	/* Oops. The kernel tried to access some bad page. We'll have to
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	   terminate things with extreme prejudice.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  202  	printk(KERN_ALERT "Unable to handle kernel paging request at "
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  	       "virtual address %016lx\n", address);
^1da177e4c3f41 Linus Torvalds     2005-04-16  204  	die_if_kernel("Oops", regs, cause, (unsigned long*)regs - 16);
0e25498f8cd43c Eric W. Biederman  2021-06-28  205  	make_task_dead(SIGKILL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  206  
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  	/* We ran out of memory, or some other thing happened to us that
^1da177e4c3f41 Linus Torvalds     2005-04-16  208  	   made us unable to handle the page fault gracefully.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  209   out_of_memory:
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  210  	mmap_read_unlock(mm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  211  	if (!user_mode(regs))
^1da177e4c3f41 Linus Torvalds     2005-04-16  212  		goto no_context;
1cb3d8e2c8d30d Nicholas Piggin    2010-04-29  213  	pagefault_out_of_memory();
1cb3d8e2c8d30d Nicholas Piggin    2010-04-29  214  	return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216   do_sigbus:
d8ed45c5dcd455 Michel Lespinasse  2020-06-08  217  	mmap_read_unlock(mm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  218  	/* Send a sigbus, regardless of whether we were in kernel
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  	   or user mode.  */
7de5f68d497cbc Eric W. Biederman  2021-05-28  220  	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address);
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	if (!user_mode(regs))
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  		goto no_context;
^1da177e4c3f41 Linus Torvalds     2005-04-16  223  	return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  224  
^1da177e4c3f41 Linus Torvalds     2005-04-16  225   do_sigsegv:
7de5f68d497cbc Eric W. Biederman  2021-05-28  226  	force_sig_fault(SIGSEGV, si_code, (void __user *) address);
^1da177e4c3f41 Linus Torvalds     2005-04-16  227  	return;
^1da177e4c3f41 Linus Torvalds     2005-04-16  228  

:::::: The code at line 193 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
