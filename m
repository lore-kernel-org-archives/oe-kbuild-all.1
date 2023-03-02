Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A48EC4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677727803; x=1709263803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5fHijzpmSkHVVSbzDmP902wiQwC7rYJY6ua466DKcAM=;
  b=avs4sx5CCmETFpJxBeQSQ9r3Jn6AI4HTQhqmuC0f9Vk0KRNcbDccrEHN
   8M18EJL3exy4OxQhTHLkirgHOtBKphYQVGJEyMwboj47k7ylsK+zSyQm7
   uej61+67SgVLv7lox9aaw5rdeJDhp3iWFyFCMjvdlo1yaocfV52EomFpy
   mCuL9EWH4MJaNbNwvYRLN49EMPm+F3dcYLcpYOxJkk41gpijSZ0SSkvEk
   nUh5ykLC5ZLnzLTcGnmcNonUepTZqjpICwtenQ+hIjV6xC5koilak9pMf
   HkBecxHrePEFRenRMqIg6/YxpbwE12oppN0jIiueppKDDrzv+DCo37ZUv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332085164"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332085164"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:30:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743674638"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743674638"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 19:29:58 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZdm-00009S-0U;
	Thu, 02 Mar 2023 03:29:58 +0000
Date: Thu, 2 Mar 2023 11:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [dwmw2:parallel-6.2-rc8-v12bis 6/11] arch/x86/kernel/head_64.S:250:
 Error: incorrect register `%edx' used with `q' suffix
Message-ID: <202303021135.VSyFfjP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc8-v12bis
head:   1be25b975a05184b71fc403cb4f742d78d1fbf32
commit: ac86ad32434d4661db0bef6791b7953d369585e2 [6/11] x86/smpboot: Remove initial_stack on 64-bit
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230302/202303021135.VSyFfjP1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc8-v12bis
        git checkout ac86ad32434d4661db0bef6791b7953d369585e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021135.VSyFfjP1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/head_64.S: Assembler messages:
>> arch/x86/kernel/head_64.S:250: Error: incorrect register `%edx' used with `q' suffix


vim +250 arch/x86/kernel/head_64.S

   189	
   190		/* Enable PAE mode, PGE and LA57 */
   191		orl	$(X86_CR4_PAE | X86_CR4_PGE), %ecx
   192	#ifdef CONFIG_X86_5LEVEL
   193		testl	$1, __pgtable_l5_enabled(%rip)
   194		jz	1f
   195		orl	$X86_CR4_LA57, %ecx
   196	1:
   197	#endif
   198		movq	%rcx, %cr4
   199	
   200		/* Setup early boot stage 4-/5-level pagetables. */
   201		addq	phys_base(%rip), %rax
   202	
   203		/*
   204		 * For SEV guests: Verify that the C-bit is correct. A malicious
   205		 * hypervisor could lie about the C-bit position to perform a ROP
   206		 * attack on the guest by writing to the unencrypted stack and wait for
   207		 * the next RET instruction.
   208		 * %rsi carries pointer to realmode data and is callee-clobbered. Save
   209		 * and restore it.
   210		 */
   211		pushq	%rsi
   212		movq	%rax, %rdi
   213		call	sev_verify_cbit
   214		popq	%rsi
   215	
   216		/*
   217		 * Switch to new page-table
   218		 *
   219		 * For the boot CPU this switches to early_top_pgt which still has the
   220		 * indentity mappings present. The secondary CPUs will switch to the
   221		 * init_top_pgt here, away from the trampoline_pgd and unmap the
   222		 * indentity mapped ranges.
   223		 */
   224		movq	%rax, %cr3
   225	
   226		/*
   227		 * Do a global TLB flush after the CR3 switch to make sure the TLB
   228		 * entries from the identity mapping are flushed.
   229		 */
   230		movq	%cr4, %rcx
   231		movq	%rcx, %rax
   232		xorq	$X86_CR4_PGE, %rcx
   233		movq	%rcx, %cr4
   234		movq	%rax, %cr4
   235	
   236		/* Ensure I am executing from virtual addresses */
   237		movq	$1f, %rax
   238		ANNOTATE_RETPOLINE_SAFE
   239		jmp	*%rax
   240	1:
   241		UNWIND_HINT_EMPTY
   242		ANNOTATE_NOENDBR // above
   243	
   244	#ifdef CONFIG_SMP
   245		movl	smpboot_control(%rip), %ecx
   246	
   247		/* Get the per cpu offset for the given CPU# which is in ECX */
   248		movq	__per_cpu_offset(,%rcx,8), %rdx
   249	#else
 > 250		xorq	%edx, %edx /* zero-extended to clear all of RDX */
   251	#endif /* CONFIG_SMP */
   252	
   253		/*
   254		 * Setup a boot time stack - Any secondary CPU will have lost its stack
   255		 * by now because the cr3-switch above unmaps the real-mode stack.
   256		 *
   257		 * RDX contains the per-cpu offset
   258		 */
   259		movq	pcpu_hot + X86_current_task(%rdx), %rax
   260		movq	TASK_threadsp(%rax), %rsp
   261	
   262		/*
   263		 * We must switch to a new descriptor in kernel space for the GDT
   264		 * because soon the kernel won't have access anymore to the userspace
   265		 * addresses where we're currently running on. We have to do that here
   266		 * because in 32bit we couldn't load a 64bit linear address.
   267		 */
   268		lgdt	early_gdt_descr(%rip)
   269	
   270		/* set up data segments */
   271		xorl %eax,%eax
   272		movl %eax,%ds
   273		movl %eax,%ss
   274		movl %eax,%es
   275	
   276		/*
   277		 * We don't really need to load %fs or %gs, but load them anyway
   278		 * to kill any stale realmode selectors.  This allows execution
   279		 * under VT hardware.
   280		 */
   281		movl %eax,%fs
   282		movl %eax,%gs
   283	
   284		/* Set up %gs.
   285		 *
   286		 * The base of %gs always points to fixed_percpu_data. If the
   287		 * stack protector canary is enabled, it is located at %gs:40.
   288		 * Note that, on SMP, the boot cpu uses init data section until
   289		 * the per cpu areas are set up.
   290		 */
   291		movl	$MSR_GS_BASE,%ecx
   292		movl	initial_gs(%rip),%eax
   293		movl	initial_gs+4(%rip),%edx
   294		wrmsr
   295	
   296		/* Setup and Load IDT */
   297		pushq	%rsi
   298		call	early_setup_idt
   299		popq	%rsi
   300	
   301		/* Check if nx is implemented */
   302		movl	$0x80000001, %eax
   303		cpuid
   304		movl	%edx,%edi
   305	
   306		/* Setup EFER (Extended Feature Enable Register) */
   307		movl	$MSR_EFER, %ecx
   308		rdmsr
   309		/*
   310		 * Preserve current value of EFER for comparison and to skip
   311		 * EFER writes if no change was made (for TDX guest)
   312		 */
   313		movl    %eax, %edx
   314		btsl	$_EFER_SCE, %eax	/* Enable System Call */
   315		btl	$20,%edi		/* No Execute supported? */
   316		jnc     1f
   317		btsl	$_EFER_NX, %eax
   318		btsq	$_PAGE_BIT_NX,early_pmd_flags(%rip)
   319	
   320		/* Avoid writing EFER if no change was made (for TDX guest) */
   321	1:	cmpl	%edx, %eax
   322		je	1f
   323		xor	%edx, %edx
   324		wrmsr				/* Make changes effective */
   325	1:
   326		/* Setup cr0 */
   327		movl	$CR0_STATE, %eax
   328		/* Make changes effective */
   329		movq	%rax, %cr0
   330	
   331		/* zero EFLAGS after setting rsp */
   332		pushq $0
   333		popfq
   334	
   335		/* rsi is pointer to real mode structure with interesting info.
   336		   pass it to C */
   337		movq	%rsi, %rdi
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
