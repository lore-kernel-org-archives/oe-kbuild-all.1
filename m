Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07717A2E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130561; cv=none; b=XeiqSjCuOiBr1jxFwENz3V3jxsfX78jBeZTzZyWLYGRbVZUwSxdJTOPfokN5tElR6oLySUJABpiDNbb9VK15V3YHXss3AZUwF8wf0ihfLFXxwm7TRHTlXcoD3XmBb66sHiMQYVMZt03c0hLmABCyKnZkJyRO4DEZHae8qFPZLWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130561; c=relaxed/simple;
	bh=4BoihZjGp9WJcyeY843noOemfFah2O9q+/hqhwvm3+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erulMjKZXQGmCwYJHyW7jMxYgrwM2pGoGoEsbSOg4GeTA20xmNNCloyDPVk24QPiUHo3NSJEddonk6zYbmO56EyzRmoAzifJZi1eqD5tzCRbuSCDL42pJnUTmF8lH+ZHrGChdVYdQQItIxKXOZD93CGGVWhAXUlaO/jgi0XILTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFp9pDqm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFp9pDqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743130559; x=1774666559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4BoihZjGp9WJcyeY843noOemfFah2O9q+/hqhwvm3+w=;
  b=kFp9pDqmI2AUeqPIo1LFAUxRnIQ7d6XJpYQMGHebPA/4TBS50odQ7lp+
   2uNxGD6VUPfm3DPrSCPPXeFHuTVkSbnX/K4gk+OXhhIh2EyABMZZ+y7If
   b9upEeUCJa9mwdN5jNkEenYUxgXRyxYQck6BEBWUzDd7w04wmmc1sFtTG
   9NBqv2SzTkMlt7kml/6e1uhrjXZMlqxba1LPd7EfPbFwcEs9G+4ejzckA
   lD4YjBIsCacz7kQDp7mf5B1Au7YVwazi0zXfvP36nysHLj0lfwDIuJ8Ez
   IObaDNst8EYnGpwk49LGMhX2A+FG0pQxugDUgUG87RneyozbiAJIDtN8T
   w==;
X-CSE-ConnectionGUID: xUqXWqpqQjqbyuNZdB2fpw==
X-CSE-MsgGUID: dVJH6acgSeKzmZuun/T0eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32088276"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="32088276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 19:55:59 -0700
X-CSE-ConnectionGUID: ixh//qx+Q1eomozbP1AcQg==
X-CSE-MsgGUID: 0zzU80DnQiKGoUXswRqbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="130039448"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2025 19:55:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txzsx-00076K-2M;
	Fri, 28 Mar 2025 02:55:55 +0000
Date: Fri, 28 Mar 2025 10:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 9/9] arch/x86/boot/compressed/la57toggle.S:28:
 Error: `pushq' is only supported in 64-bit mode
Message-ID: <202503281031.qZkr8L7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   668422543f4fba0346351fa5e549ab9199a1676d
commit: 668422543f4fba0346351fa5e549ab9199a1676d [9/9] efi zboot for x86
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250328/202503281031.qZkr8L7D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281031.qZkr8L7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281031.qZkr8L7D-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/boot/compressed/la57toggle.S: Assembler messages:
>> arch/x86/boot/compressed/la57toggle.S:28: Error: `pushq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:29: Error: `pushq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:30: Error: `pushq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:31: Error: `pushq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:32: Error: `pushq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:33: Error: `pushq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:36: Error: bad register name `%rsp'
>> arch/x86/boot/compressed/la57toggle.S:37: Error: `shrq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:40: Error: `pushq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:41: Error: `leaq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:42: Error: `pushq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:43: Error: `lretq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:52: Error: `shlq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:53: Error: `orq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:56: Error: `popq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:57: Error: `popq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:58: Error: `popq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:59: Error: `popq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:60: Error: `popq' is only supported in 64-bit mode
   arch/x86/boot/compressed/la57toggle.S:61: Error: `popq' is only supported in 64-bit mode
>> arch/x86/boot/compressed/la57toggle.S:62: Error: `retq' is only supported in 64-bit mode


vim +28 arch/x86/boot/compressed/la57toggle.S

e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13    9  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   10  /*
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   11   * This is the 32-bit trampoline that will be copied over to low memory. It
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   12   * will be called using the ordinary 64-bit calling convention from code
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   13   * running in 64-bit mode.
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   14   *
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   15   * Return address is at the top of the stack (might be above 4G).
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   16   * The first argument (EDI) contains the address of the temporary PGD level
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   17   * page table in 32-bit addressable memory which will be programmed into
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   18   * register CR3.
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   19   */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   20  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   21  	.section ".rodata", "a", @progbits
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   22  SYM_CODE_START(trampoline_32bit_src)
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   23  	/*
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   24  	 * Preserve callee save 64-bit registers on the stack: this is
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   25  	 * necessary because the architecture does not guarantee that GPRs will
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   26  	 * retain their full 64-bit values across a 32-bit mode switch.
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   27  	 */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @28  	pushq	%r15
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   29  	pushq	%r14
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   30  	pushq	%r13
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   31  	pushq	%r12
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   32  	pushq	%rbp
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   33  	pushq	%rbx
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   34  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   35  	/* Preserve top half of RSP in a legacy mode GPR to avoid truncation */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @36  	movq	%rsp, %rbx
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @37  	shrq	$32, %rbx
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   38  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   39  	/* Switch to compatibility mode (CS.L = 0 CS.D = 1) via far return */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   40  	pushq	$__KERNEL32_CS
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @41  	leaq	0f(%rip), %rax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   42  	pushq	%rax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @43  	lretq
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   44  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   45  	/*
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   46  	 * The 32-bit code below will do a far jump back to long mode and end
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   47  	 * up here after reconfiguring the number of paging levels. First, the
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   48  	 * stack pointer needs to be restored to its full 64-bit value before
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   49  	 * the callee save register contents can be popped from the stack.
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   50  	 */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   51  .Lret:
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @52  	shlq	$32, %rbx
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @53  	orq	%rbx, %rsp
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   54  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   55  	/* Restore the preserved 64-bit registers */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @56  	popq	%rbx
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   57  	popq	%rbp
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   58  	popq	%r12
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   59  	popq	%r13
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   60  	popq	%r14
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   61  	popq	%r15
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  @62  	retq
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   63  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   64  	.code32
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   65  0:
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   66  	/* Disable paging */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   67  	movl	%cr0, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   68  	btrl	$X86_CR0_PG_BIT, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   69  	movl	%eax, %cr0
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   70  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   71  	/* Point CR3 to the trampoline's new top level page table */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   72  	movl	%edi, %cr3
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   73  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   74  	/* Set EFER.LME=1 as a precaution in case hypervsior pulls the rug */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   75  	movl	$MSR_EFER, %ecx
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   76  	rdmsr
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   77  	btsl	$_EFER_LME, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   78  	/* Avoid writing EFER if no change was made (for TDX guest) */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   79  	jc	1f
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   80  	wrmsr
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   81  1:
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   82  	/* Toggle CR4.LA57 */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   83  	movl	%cr4, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   84  	btcl	$X86_CR4_LA57_BIT, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   85  	movl	%eax, %cr4
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   86  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   87  	/* Enable paging again. */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   88  	movl	%cr0, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   89  	btsl	$X86_CR0_PG_BIT, %eax
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   90  	movl	%eax, %cr0
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   91  
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   92  	/*
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   93  	 * Return to the 64-bit calling code using LJMP rather than LRET, to
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   94  	 * avoid the need for a 32-bit addressable stack. The destination
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   95  	 * address will be adjusted after the template code is copied into a
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   96  	 * 32-bit addressable buffer.
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   97  	 */
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   98  .Ljmp:	ljmpl	$__KERNEL_CS, $(.Lret - trampoline_32bit_src)
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13   99  SYM_CODE_END(trampoline_32bit_src)
e27dffba1b1d6c0 Ard Biesheuvel 2025-03-13  100  

:::::: The code at line 28 was first introduced by commit
:::::: e27dffba1b1d6c047b48c325adcb1342d3e3fa69 x86/boot: Move the LA57 trampoline to separate source file

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
