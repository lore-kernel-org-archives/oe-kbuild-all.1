Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D94188010
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731776758; cv=none; b=I+BWZQXJ4v5ipAv0Abx15wlo9XYYBg9st9f3dHXzuESxkjkztyYCbyCto7YdHOmGvPqhhO8S/Ehkfqb6O9j4/1LgSWyG6c63fekZjV6eeBmRyKzrh04+4e8a+6yjx3tAU/KnKMtXi3/pb6HUBP+4PePXwve4Ft2xwDCaG2jylTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731776758; c=relaxed/simple;
	bh=pb0uWq5L39XaO6NRhRGGD40qiMZNbHBkU9eErMfu4EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGLSjbMPolJkioFbn698rZ06lXpoZkrmMA57vRxEQ8R4BvJyY+X0ILZ0mt2qMkPU9MUOWVpemDobkaBKGX7yZYBeWr6i7pn9uHuj9rnps/96Rkt6HJKezr5NKkfi7tLnOxnPAbC8b9uZWavPHomCJTcbISFOqNgVDxwGuMmYSDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrG4nnce; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrG4nnce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731776756; x=1763312756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pb0uWq5L39XaO6NRhRGGD40qiMZNbHBkU9eErMfu4EM=;
  b=CrG4nnce6h4EyGZjSNEPeXgWqLL842qVLEDXmlZ95pwYBNbUKZc0afyg
   hvV2rbW9kG1oVY/atf6rxuCVAnto7tzxHfmgBBHDrRJbREkbiRuNIzb4O
   sE7CwuclBeiEW9w2ZP7l6EQ2ZqlOET1sDvCr/FcM4ScmYzUok2UOARXjp
   2fJdr73I5+3Nx2YaZeFKV6lXoEvGdHtS3P/U0J3H35AnK/YCoeluSnjAh
   W+RvqmwOq+LBlxdowiaX36RzYKIvI3XxMx4QlXcbMVsbx2Hd/OyCiwWtQ
   eeXl++0xxHGJjuEsZ6RgS6mhs9Pm90j0EMkZ9u2k+roEIk2i2C/wtwO4j
   w==;
X-CSE-ConnectionGUID: 5aii40ObTxWqM0Mc7a53Vw==
X-CSE-MsgGUID: 3vF8f0VUT+enou/ZdBC6Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42298730"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42298730"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:05:51 -0800
X-CSE-ConnectionGUID: /R39sg5UScCfdNYgOvBsow==
X-CSE-MsgGUID: vfIYW+QXR/iKzfTa+OqoMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93775743"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 09:05:49 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMF0-0000zN-2k;
	Sat, 16 Nov 2024 17:05:46 +0000
Date: Sun, 17 Nov 2024 01:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 206/259]
 arch/x86/coco/tdx/tdx.c:317:12: warning: 'handle_cpuid' defined but not used
Message-ID: <202411170143.bY5E7ORt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: c679d728be765bc07b0a2cff90e44768ed28804d [206/259] ANDROID: x86/tdx: Move virt exception handler code to virt_exception.c
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241117/202411170143.bY5E7ORt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170143.bY5E7ORt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170143.bY5E7ORt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c:381:9: error: expected identifier or '(' before '}' token
     381 |         }
         |         ^
   arch/x86/coco/tdx/tdx.c:383:9: error: expected identifier or '(' before 'if'
     383 |         if (!fault_in_kernel_space(ve->gla)) {
         |         ^~
>> arch/x86/coco/tdx/tdx.c:317:12: warning: 'handle_cpuid' defined but not used [-Wunused-function]
     317 | static int handle_cpuid(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~~~~~
>> arch/x86/coco/tdx/tdx.c:297:12: warning: 'write_msr' defined but not used [-Wunused-function]
     297 | static int write_msr(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~~
>> arch/x86/coco/tdx/tdx.c:276:12: warning: 'read_msr' defined but not used [-Wunused-function]
     276 | static int read_msr(struct pt_regs *regs, struct ve_info *ve)
         |            ^~~~~~~~
>> arch/x86/coco/tdx/tdx.c:255:12: warning: 'handle_halt' defined but not used [-Wunused-function]
     255 | static int handle_halt(struct ve_info *ve)
         |            ^~~~~~~~~~~
>> arch/x86/coco/tdx/tdx.c:145:13: warning: 'tdx_parse_tdinfo' defined but not used [-Wunused-function]
     145 | static void tdx_parse_tdinfo(u64 *cc_mask)
         |             ^~~~~~~~~~~~~~~~


vim +/handle_cpuid +317 arch/x86/coco/tdx/tdx.c

71acdcd7cd0abe Kirill A. Shutemov         2023-01-27  144  
a6dd6f39008bb3 Dave Hansen                2022-10-28 @145  static void tdx_parse_tdinfo(u64 *cc_mask)
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  146  {
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  147  	struct tdx_module_output out;
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  148  	unsigned int gpa_width;
373e715e31bf4e Kirill A. Shutemov         2022-10-28  149  	u64 td_attr;
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  150  
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  151  	/*
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  152  	 * TDINFO TDX module call is used to get the TD execution environment
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  153  	 * information like GPA width, number of available vcpus, debug mode
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  154  	 * information, etc. More details about the ABI can be found in TDX
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  155  	 * Guest-Host-Communication Interface (GHCI), section 2.4.2 TDCALL
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  156  	 * [TDG.VP.INFO].
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  157  	 */
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  158  	tdx_module_call(TDX_GET_INFO, 0, 0, 0, 0, &out);
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  159  
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  160  	/*
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  161  	 * The highest bit of a guest physical address is the "sharing" bit.
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  162  	 * Set it for shared pages and clear it for private pages.
373e715e31bf4e Kirill A. Shutemov         2022-10-28  163  	 *
373e715e31bf4e Kirill A. Shutemov         2022-10-28  164  	 * The GPA width that comes out of this call is critical. TDX guests
373e715e31bf4e Kirill A. Shutemov         2022-10-28  165  	 * can not meaningfully run without it.
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  166  	 */
373e715e31bf4e Kirill A. Shutemov         2022-10-28  167  	gpa_width = out.rcx & GENMASK(5, 0);
a6dd6f39008bb3 Dave Hansen                2022-10-28  168  	*cc_mask = BIT_ULL(gpa_width - 1);
373e715e31bf4e Kirill A. Shutemov         2022-10-28  169  
373e715e31bf4e Kirill A. Shutemov         2022-10-28  170  	/*
373e715e31bf4e Kirill A. Shutemov         2022-10-28  171  	 * The kernel can not handle #VE's when accessing normal kernel
373e715e31bf4e Kirill A. Shutemov         2022-10-28  172  	 * memory.  Ensure that no #VE will be delivered for accesses to
373e715e31bf4e Kirill A. Shutemov         2022-10-28  173  	 * TD-private memory.  Only VMM-shared memory (MMIO) will #VE.
373e715e31bf4e Kirill A. Shutemov         2022-10-28  174  	 */
373e715e31bf4e Kirill A. Shutemov         2022-10-28  175  	td_attr = out.rdx;
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  176  	if (!(td_attr & ATTR_SEPT_VE_DISABLE)) {
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  177  		const char *msg = "TD misconfiguration: SEPT_VE_DISABLE attribute must be set.";
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  178  
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  179  		/* Relax SEPT_VE_DISABLE check for debug TD. */
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  180  		if (td_attr & ATTR_DEBUG)
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  181  			pr_warn("%s\n", msg);
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  182  		else
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  183  			tdx_panic(msg);
47e67cf317ed6a Kirill A. Shutemov         2023-01-27  184  	}
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  185  }
41394e33f3a0ce Kirill A. Shutemov         2022-04-06  186  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  187  /*
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  188   * The TDX module spec states that #VE may be injected for a limited set of
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  189   * reasons:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  190   *
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  191   *  - Emulation of the architectural #VE injection on EPT violation;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  192   *
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  193   *  - As a result of guest TD execution of a disallowed instruction,
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  194   *    a disallowed MSR access, or CPUID virtualization;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  195   *
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  196   *  - A notification to the guest TD about anomalous behavior;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  197   *
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  198   * The last one is opt-in and is not used by the kernel.
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  199   *
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  200   * The Intel Software Developer's Manual describes cases when instruction
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  201   * length field can be used in section "Information for VM Exits Due to
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  202   * Instruction Execution".
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  203   *
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  204   * For TDX, it ultimately means GET_VEINFO provides reliable instruction length
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  205   * information if #VE occurred due to instruction execution, but not for EPT
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  206   * violations.
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  207   */
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  208  static int ve_instr_len(struct ve_info *ve)
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  209  {
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  210  	switch (ve->exit_reason) {
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  211  	case EXIT_REASON_HLT:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  212  	case EXIT_REASON_MSR_READ:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  213  	case EXIT_REASON_MSR_WRITE:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  214  	case EXIT_REASON_CPUID:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  215  	case EXIT_REASON_IO_INSTRUCTION:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  216  		/* It is safe to use ve->instr_len for #VE due instructions */
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  217  		return ve->instr_len;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  218  	case EXIT_REASON_EPT_VIOLATION:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  219  		/*
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  220  		 * For EPT violations, ve->insn_len is not defined. For those,
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  221  		 * the kernel must decode instructions manually and should not
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  222  		 * be using this function.
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  223  		 */
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  224  		WARN_ONCE(1, "ve->instr_len is not defined for EPT violations");
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  225  		return 0;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  226  	default:
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  227  		WARN_ONCE(1, "Unexpected #VE-type: %lld\n", ve->exit_reason);
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  228  		return ve->instr_len;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  229  	}
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  230  }
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  231  
e80a48bade619e Peter Zijlstra             2023-01-12  232  static u64 __cpuidle __halt(const bool irq_disabled)
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  233  {
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  234  	struct tdx_hypercall_args args = {
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  235  		.r10 = TDX_HYPERCALL_STANDARD,
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  236  		.r11 = hcall_func(EXIT_REASON_HLT),
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  237  		.r12 = irq_disabled,
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  238  	};
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  239  
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  240  	/*
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  241  	 * Emulate HLT operation via hypercall. More info about ABI
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  242  	 * can be found in TDX Guest-Host-Communication Interface
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  243  	 * (GHCI), section 3.8 TDG.VP.VMCALL<Instruction.HLT>.
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  244  	 *
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  245  	 * The VMM uses the "IRQ disabled" param to understand IRQ
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  246  	 * enabled status (RFLAGS.IF) of the TD guest and to determine
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  247  	 * whether or not it should schedule the halted vCPU if an
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  248  	 * IRQ becomes pending. E.g. if IRQs are disabled, the VMM
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  249  	 * can keep the vCPU in virtual HLT, even if an IRQ is
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  250  	 * pending, without hanging/breaking the guest.
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  251  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  252  	return __tdx_hypercall(&args);
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  253  }
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  254  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14 @255  static int handle_halt(struct ve_info *ve)
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  256  {
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  257  	const bool irq_disabled = irqs_disabled();
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  258  
e80a48bade619e Peter Zijlstra             2023-01-12  259  	if (__halt(irq_disabled))
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  260  		return -EIO;
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  261  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  262  	return ve_instr_len(ve);
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  263  }
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  264  
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  265  void __cpuidle tdx_safe_halt(void)
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  266  {
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  267  	const bool irq_disabled = false;
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  268  
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  269  	/*
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  270  	 * Use WARN_ONCE() to report the failure.
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  271  	 */
e80a48bade619e Peter Zijlstra             2023-01-12  272  	if (__halt(irq_disabled))
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  273  		WARN_ONCE(1, "HLT instruction emulation failed\n");
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  274  }
bfe6ed0c672782 Kirill A. Shutemov         2022-04-06  275  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14 @276  static int read_msr(struct pt_regs *regs, struct ve_info *ve)
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  277  {
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  278  	struct tdx_hypercall_args args = {
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  279  		.r10 = TDX_HYPERCALL_STANDARD,
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  280  		.r11 = hcall_func(EXIT_REASON_MSR_READ),
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  281  		.r12 = regs->cx,
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  282  	};
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  283  
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  284  	/*
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  285  	 * Emulate the MSR read via hypercall. More info about ABI
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  286  	 * can be found in TDX Guest-Host-Communication Interface
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  287  	 * (GHCI), section titled "TDG.VP.VMCALL<Instruction.RDMSR>".
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  288  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  289  	if (__tdx_hypercall_ret(&args))
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  290  		return -EIO;
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  291  
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  292  	regs->ax = lower_32_bits(args.r11);
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  293  	regs->dx = upper_32_bits(args.r11);
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  294  	return ve_instr_len(ve);
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  295  }
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  296  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14 @297  static int write_msr(struct pt_regs *regs, struct ve_info *ve)
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  298  {
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  299  	struct tdx_hypercall_args args = {
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  300  		.r10 = TDX_HYPERCALL_STANDARD,
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  301  		.r11 = hcall_func(EXIT_REASON_MSR_WRITE),
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  302  		.r12 = regs->cx,
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  303  		.r13 = (u64)regs->dx << 32 | regs->ax,
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  304  	};
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  305  
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  306  	/*
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  307  	 * Emulate the MSR write via hypercall. More info about ABI
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  308  	 * can be found in TDX Guest-Host-Communication Interface
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  309  	 * (GHCI) section titled "TDG.VP.VMCALL<Instruction.WRMSR>".
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  310  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  311  	if (__tdx_hypercall(&args))
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  312  		return -EIO;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  313  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  314  	return ve_instr_len(ve);
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  315  }
ae87f609cd5282 Kirill A. Shutemov         2022-04-06  316  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14 @317  static int handle_cpuid(struct pt_regs *regs, struct ve_info *ve)
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  318  {
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  319  	struct tdx_hypercall_args args = {
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  320  		.r10 = TDX_HYPERCALL_STANDARD,
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  321  		.r11 = hcall_func(EXIT_REASON_CPUID),
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  322  		.r12 = regs->ax,
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  323  		.r13 = regs->cx,
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  324  	};
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  325  
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  326  	/*
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  327  	 * Only allow VMM to control range reserved for hypervisor
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  328  	 * communication.
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  329  	 *
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  330  	 * Return all-zeros for any CPUID outside the range. It matches CPU
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  331  	 * behaviour for non-supported leaf.
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  332  	 */
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  333  	if (regs->ax < 0x40000000 || regs->ax > 0x4FFFFFFF) {
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  334  		regs->ax = regs->bx = regs->cx = regs->dx = 0;
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  335  		return ve_instr_len(ve);
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  336  	}
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  337  
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  338  	/*
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  339  	 * Emulate the CPUID instruction via a hypercall. More info about
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  340  	 * ABI can be found in TDX Guest-Host-Communication Interface
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  341  	 * (GHCI), section titled "VP.VMCALL<Instruction.CPUID>".
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  342  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  343  	if (__tdx_hypercall_ret(&args))
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  344  		return -EIO;
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  345  
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  346  	/*
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  347  	 * As per TDX GHCI CPUID ABI, r12-r15 registers contain contents of
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  348  	 * EAX, EBX, ECX, EDX registers after the CPUID instruction execution.
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  349  	 * So copy the register contents back to pt_regs.
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  350  	 */
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  351  	regs->ax = args.r12;
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  352  	regs->bx = args.r13;
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  353  	regs->cx = args.r14;
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  354  	regs->dx = args.r15;
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  355  
cdd85786f4b3b9 Kirill A. Shutemov         2022-06-14  356  	return ve_instr_len(ve);
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  357  }
c141fa2c2bbaff Kirill A. Shutemov         2022-04-06  358  
c679d728be765b Shaoqin Huang              2022-12-07  359  bool mmio_read(int size, unsigned long addr, unsigned long *val)
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  360  {
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  361  	struct tdx_hypercall_args args = {
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  362  		.r10 = TDX_HYPERCALL_STANDARD,
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  363  		.r11 = hcall_func(EXIT_REASON_EPT_VIOLATION),
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  364  		.r12 = size,
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  365  		.r13 = EPT_READ,
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  366  		.r14 = addr,
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  367  	};
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  368  
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  369  	if (__tdx_hypercall_ret(&args))
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  370  		return false;
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  371  	*val = args.r11;
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  372  	return true;
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  373  }
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  374  
c679d728be765b Shaoqin Huang              2022-12-07  375  bool mmio_write(int size, unsigned long addr, unsigned long val)
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  376  {
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  377  	return !_tdx_hypercall(hcall_func(EXIT_REASON_EPT_VIOLATION), size,
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  378  			       EPT_WRITE, addr, val);
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  379  }
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  380  
31d58c4e557d46 Kirill A. Shutemov         2022-04-06 @381  	}
31d58c4e557d46 Kirill A. Shutemov         2022-04-06  382  
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13 @383) 	if (!fault_in_kernel_space(ve->gla)) {
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13  384) 		WARN_ONCE(1, "Access to userspace address is not supported");
4c0c5dcb5471de Alexey Gladkov (Intel      2024-09-13  385) 		return -EINVAL;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  386  static bool handle_in(struct pt_regs *regs, int size, int port)
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  387  {
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  388  	struct tdx_hypercall_args args = {
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  389  		.r10 = TDX_HYPERCALL_STANDARD,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  390  		.r11 = hcall_func(EXIT_REASON_IO_INSTRUCTION),
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  391  		.r12 = size,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  392  		.r13 = PORT_READ,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  393  		.r14 = port,
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  394  	};
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  395  	u64 mask = GENMASK(BITS_PER_BYTE * size, 0);
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  396  	bool success;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  397  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  398  	/*
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  399  	 * Emulate the I/O read via hypercall. More info about ABI can be found
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  400  	 * in TDX Guest-Host-Communication Interface (GHCI) section titled
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  401  	 * "TDG.VP.VMCALL<Instruction.IO>".
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  402  	 */
7a3a401874bea0 Kirill A. Shutemov         2023-03-21  403  	success = !__tdx_hypercall_ret(&args);
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  404  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  405  	/* Update part of the register affected by the emulated instruction */
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  406  	regs->ax &= ~mask;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  407  	if (success)
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  408  		regs->ax |= args.r11 & mask;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  409  
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  410  	return success;
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  411  }
03149948832a07 Kuppuswamy Sathyanarayanan 2022-04-06  412  

:::::: The code at line 317 was first introduced by commit
:::::: cdd85786f4b3b9273e4376e69aa95a2d71722764 x86/tdx: Clarify RIP adjustments in #VE handler

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
