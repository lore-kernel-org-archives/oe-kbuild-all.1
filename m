Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8A7E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 01:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687916313; x=1719452313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkdZjr6cDFXV52aSAwRAnhlp5kTjHc/ukkdMv3cK/PA=;
  b=LCXJerEZpEO71jOenWRDSCgfraiyBjNvvdVSdoDE2oh1OKmdeVVA0hQQ
   11i+ku+EuWfuWNkl3PHlpnq7IkyOXcuq/5h0aNSLdobvnrIQhwLRkkQ68
   B8e1s6fX5lhU0QQqbBMdQt4kiwFHPHZTdUcUkfQVNf1vTXcJt8+E6W3Z4
   6JTmTcmuVguyVs0sBJWeBIwPtw/wHVHoEB5AP7FhxbWbPKogzJ3+mpjhw
   xJ7shDDWXasX1hpnO0ZbqyGSSsRkEP9tqTjeZhTq/4gIujMdEA95o2Fn2
   K/9Zf0T9uOlgcAKQIw9g3gz8+lob3XjQJDRDyqzcq3F/jUITN02L27seQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="342063631"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="342063631"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 18:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="1047197275"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="1047197275"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jun 2023 18:38:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEK8c-000CS5-0O;
	Wed, 28 Jun 2023 01:38:30 +0000
Date: Wed, 28 Jun 2023 09:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 1/2]
 arch/x86/kernel/relocate_kernel_64.S:151: Error: too many positional
 arguments
Message-ID: <202306280925.r9Z2nppv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   ac18652a4806023b0986b468dc9061c640383279
commit: 0dc7dad5e4c5ab94e4429d16272f65de6307c5c0 [1/2] x86/kexec: Keep CR4.MCE during kexec for TDX guest
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230628/202306280925.r9Z2nppv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280925.r9Z2nppv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280925.r9Z2nppv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/relocate_kernel_64.S: Assembler messages:
>> arch/x86/kernel/relocate_kernel_64.S:151: Error: too many positional arguments


vim +151 arch/x86/kernel/relocate_kernel_64.S

   114	
   115	SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
   116		UNWIND_HINT_END_OF_STACK
   117		/* set return address to 0 if not preserving context */
   118		pushq	$0
   119		/* store the start address on the stack */
   120		pushq   %rdx
   121	
   122		/*
   123		 * Clear X86_CR4_CET (if it was set) such that we can clear CR0_WP
   124		 * below.
   125		 */
   126		movq	%cr4, %rax
   127		andq	$~(X86_CR4_CET), %rax
   128		movq	%rax, %cr4
   129	
   130		/*
   131		 * Set cr0 to a known state:
   132		 *  - Paging enabled
   133		 *  - Alignment check disabled
   134		 *  - Write protect disabled
   135		 *  - No task switch
   136		 *  - Don't do FP software emulation.
   137		 *  - Protected mode enabled
   138		 */
   139		movq	%cr0, %rax
   140		andq	$~(X86_CR0_AM | X86_CR0_WP | X86_CR0_TS | X86_CR0_EM), %rax
   141		orl	$(X86_CR0_PG | X86_CR0_PE), %eax
   142		movq	%rax, %cr0
   143	
   144		/*
   145		 * Set cr4 to a known state:
   146		 *  - physical address extension enabled
   147		 *  - 5-level paging, if it was enabled before
   148		 *  - Machine check exception on TDX guest. Clearing MCE is not allowed
   149		 *    in TDX guests.
   150		 */
 > 151		ALTERNATIVE "movl "$X86_CR4_PAE", %eax", \
   152			    "movl "$(X86_CR4_PAE | X86_CR4_MCE)", %eax", X86_FEATURE_TDX_GUEST
   153		testq	$X86_CR4_LA57, %r13
   154		jz	1f
   155		orl	$X86_CR4_LA57, %eax
   156	1:
   157		movq	%rax, %cr4
   158	
   159		jmp 1f
   160	1:
   161	
   162		/* Flush the TLB (needed?) */
   163		movq	%r9, %cr3
   164	
   165		/*
   166		 * If SME is active, there could be old encrypted cache line
   167		 * entries that will conflict with the now unencrypted memory
   168		 * used by kexec. Flush the caches before copying the kernel.
   169		 */
   170		testq	%r12, %r12
   171		jz 1f
   172		wbinvd
   173	1:
   174	
   175		movq	%rcx, %r11
   176		call	swap_pages
   177	
   178		/*
   179		 * To be certain of avoiding problems with self-modifying code
   180		 * I need to execute a serializing instruction here.
   181		 * So I flush the TLB by reloading %cr3 here, it's handy,
   182		 * and not processor dependent.
   183		 */
   184		movq	%cr3, %rax
   185		movq	%rax, %cr3
   186	
   187		/*
   188		 * set all of the registers to known values
   189		 * leave %rsp alone
   190		 */
   191	
   192		testq	%r11, %r11
   193		jnz 1f
   194		xorl	%eax, %eax
   195		xorl	%ebx, %ebx
   196		xorl    %ecx, %ecx
   197		xorl    %edx, %edx
   198		xorl    %esi, %esi
   199		xorl    %edi, %edi
   200		xorl    %ebp, %ebp
   201		xorl	%r8d, %r8d
   202		xorl	%r9d, %r9d
   203		xorl	%r10d, %r10d
   204		xorl	%r11d, %r11d
   205		xorl	%r12d, %r12d
   206		xorl	%r13d, %r13d
   207		xorl	%r14d, %r14d
   208		xorl	%r15d, %r15d
   209	
   210		ANNOTATE_UNRET_SAFE
   211		ret
   212		int3
   213	
   214	1:
   215		popq	%rdx
   216		leaq	PAGE_SIZE(%r10), %rsp
   217		ANNOTATE_RETPOLINE_SAFE
   218		call	*%rdx
   219	
   220		/* get the re-entry point of the peer system */
   221		movq	0(%rsp), %rbp
   222		leaq	relocate_kernel(%rip), %r8
   223		movq	CP_PA_SWAP_PAGE(%r8), %r10
   224		movq	CP_PA_BACKUP_PAGES_MAP(%r8), %rdi
   225		movq	CP_PA_TABLE_PAGE(%r8), %rax
   226		movq	%rax, %cr3
   227		lea	PAGE_SIZE(%r8), %rsp
   228		call	swap_pages
   229		movq	$virtual_mapped, %rax
   230		pushq	%rax
   231		ANNOTATE_UNRET_SAFE
   232		ret
   233		int3
   234	SYM_CODE_END(identity_mapped)
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
