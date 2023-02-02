Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C457E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 02:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675305546; x=1706841546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZZ2JhLUQa2j3hjB+2Ft+Dmx7bN4KfFVJMSKJ0bxzfM=;
  b=XjcAsG7ToPz8BlemU/suYZmHfbYwxOz0gz9Is1o7SCh/GyEXhlUFCRhc
   81VROj038A5sKQBUA3aJegeJ8TsE1jrCYWvO1tEacfCB83gs5IbEsfDTu
   etec/LtkKU3t3x21Y/ENZoptL9XyR/jPFK0ibXI0B44Bvix/ZNEMIkL/e
   jyocWFSAfOXjp9/DsgxceB6wvvcEj5Yy5FYaBXLKOWUJB2qTrnMB6dEJr
   yH9XIu1PqpT0y1X2+4TUBcY2Rm2MQM+2Gl37P9TlLbwnSdLgJVvjEYQ/K
   JLsZ2tzFxYu6uK4kwTUhQ+as/b00FqydfE6G5K5cT9ESV9mG7ypWHIQ7N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308675096"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="308675096"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665109448"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="665109448"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 18:39:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNPV9-00062l-1K;
	Thu, 02 Feb 2023 02:39:03 +0000
Date: Thu, 2 Feb 2023 10:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/paronl.2023.02.01a 6/9]
 arch/x86/kernel/head_64.S:286: undefined reference to `__per_cpu_offset'
Message-ID: <202302021025.R4dApIXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/paronl.2023.02.01a
head:   05792727280c094a8dcd1aa4950a61a2d214ddb8
commit: 42e667c0dd66241675acf0e7bda8368b5bc8e384 [6/9] x86/smpboot: Support parallel startup of secondary CPUs
config: x86_64-randconfig-a003-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021025.R4dApIXe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/42e667c0dd66241675acf0e7bda8368b5bc8e384
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/paronl.2023.02.01a
        git checkout 42e667c0dd66241675acf0e7bda8368b5bc8e384
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/head_64.o: in function `secondary_startup_64_no_verify':
>> arch/x86/kernel/head_64.S:286: undefined reference to `__per_cpu_offset'
>> ld: arch/x86/kernel/head_64.S:298: undefined reference to `idle_threads'


vim +286 arch/x86/kernel/head_64.S

   190	
   191		/* Enable PAE mode, PGE and LA57 */
   192		orl	$(X86_CR4_PAE | X86_CR4_PGE), %ecx
   193	#ifdef CONFIG_X86_5LEVEL
   194		testl	$1, __pgtable_l5_enabled(%rip)
   195		jz	1f
   196		orl	$X86_CR4_LA57, %ecx
   197	1:
   198	#endif
   199		movq	%rcx, %cr4
   200	
   201		/* Setup early boot stage 4-/5-level pagetables. */
   202		addq	phys_base(%rip), %rax
   203	
   204		/*
   205		 * For SEV guests: Verify that the C-bit is correct. A malicious
   206		 * hypervisor could lie about the C-bit position to perform a ROP
   207		 * attack on the guest by writing to the unencrypted stack and wait for
   208		 * the next RET instruction.
   209		 * %rsi carries pointer to realmode data and is callee-clobbered. Save
   210		 * and restore it.
   211		 */
   212		pushq	%rsi
   213		movq	%rax, %rdi
   214		call	sev_verify_cbit
   215		popq	%rsi
   216	
   217		/*
   218		 * Switch to new page-table
   219		 *
   220		 * For the boot CPU this switches to early_top_pgt which still has the
   221		 * indentity mappings present. The secondary CPUs will switch to the
   222		 * init_top_pgt here, away from the trampoline_pgd and unmap the
   223		 * indentity mapped ranges.
   224		 */
   225		movq	%rax, %cr3
   226	
   227		/*
   228		 * Do a global TLB flush after the CR3 switch to make sure the TLB
   229		 * entries from the identity mapping are flushed.
   230		 */
   231		movq	%cr4, %rcx
   232		movq	%rcx, %rax
   233		xorq	$X86_CR4_PGE, %rcx
   234		movq	%rcx, %cr4
   235		movq	%rax, %cr4
   236	
   237		/* Ensure I am executing from virtual addresses */
   238		movq	$1f, %rax
   239		ANNOTATE_RETPOLINE_SAFE
   240		jmp	*%rax
   241	1:
   242		UNWIND_HINT_EMPTY
   243		ANNOTATE_NOENDBR // above
   244	
   245		/*
   246		 * Is this the boot CPU coming up? If so everything is available
   247		 * in initial_gs, initial_stack and early_gdt_descr.
   248		 */
   249		movl	smpboot_control(%rip), %eax
   250		testl	%eax, %eax
   251		jz	.Lsetup_cpu
   252	
   253		/*
   254		 * Secondary CPUs find out the offsets via the APIC ID. For parallel
   255		 * boot the APIC ID is retrieved from CPUID, otherwise it's encoded
   256		 * in smpboot_control:
   257		 * Bit 0-29	APIC ID if STARTUP_PARALLEL flag is not set
   258		 * Bit 30	STARTUP_SECONDARY flag
   259		 * Bit 31	STARTUP_PARALLEL flag (use CPUID 0x0b for APIC ID)
   260		 */
   261		testl	$STARTUP_PARALLEL, %eax
   262		jnz	.Luse_cpuid_0b
   263		andl	$0x0FFFFFFF, %eax
   264		jmp	.Lsetup_AP
   265	
   266	.Luse_cpuid_0b:
   267		mov	$0x0B, %eax
   268		xorl	%ecx, %ecx
   269		cpuid
   270		mov	%edx, %eax
   271	
   272	.Lsetup_AP:
   273		/* EAX contains the APICID of the current CPU */
   274		xorl	%ecx, %ecx
   275		leaq	cpuid_to_apicid(%rip), %rbx
   276	
   277	.Lfind_cpunr:
   278		cmpl	(%rbx), %eax
   279		jz	.Linit_cpu_data
   280		addq	$4, %rbx
   281		addq	$8, %rcx
   282		jmp	.Lfind_cpunr
   283	
   284	.Linit_cpu_data:
   285		/* Get the per cpu offset */
 > 286		leaq	__per_cpu_offset(%rip), %rbx
   287		addq	%rcx, %rbx
   288		movq	(%rbx), %rbx
   289		/* Save it for GS BASE setup */
   290		movq	%rbx, initial_gs(%rip)
   291	
   292		/* Calculate the GDT address */
   293		movq	$gdt_page, %rcx
   294		addq	%rbx, %rcx
   295		movq	%rcx, early_gdt_descr_base(%rip)
   296	
   297		/* Find the idle task stack */
 > 298		movq	$idle_threads, %rcx
   299		addq	%rbx, %rcx
   300		movq	(%rcx), %rcx
   301		movq	TASK_threadsp(%rcx), %rcx
   302		movq	%rcx, initial_stack(%rip)
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
