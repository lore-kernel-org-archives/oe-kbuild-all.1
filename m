Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F6208AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 06:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735454583; cv=none; b=cY2aQU7oXbIXkEPFIZrIza2ZenR+JnKjGVtEH3wc/0+UT8LZHmQqtjdbjTTF1B0Z4CCsCd/EuUI1X7RVoFt5zPACcPvqtpPd0r1xhF6yyLkXL95f+QUl6Cwq72F9kq4WL9MhgqwLMMWaJJM5kxBcaMN+x2z1d4uieVLMZQUateg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735454583; c=relaxed/simple;
	bh=eAWyReerwUrbroL/N81+1JCQBCRwH9EEE0fHY6SOEm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsHeg0D/uTEZ4iaDYLqT/HUVrODbnHF4pocDPGhuypefxlog+4pyqX1eMakp9bsFQOehFDPL+qJ+1wkTtT9QiuIXDT3xrBuGpmSLs9/hQPrsakuNeshriY51IzAVaN/H7dwBRlOW9QQ9zwQVoMscmLcaqLa5mMbUHpscbzgcYSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTCi+x6M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTCi+x6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735454583; x=1766990583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eAWyReerwUrbroL/N81+1JCQBCRwH9EEE0fHY6SOEm8=;
  b=XTCi+x6MzZQfpgUvP2KrQQT54DcN6GyhN06ZHwXi8QLCSsbhSpUYeZA2
   ILeeqcELX2zYD6KJ3We4KWSClKfb0vBcQ1DdmUqNmUtVyGnG6YHiBfgd4
   wMkk3jNGsvdyofQ1a2gEQLXWFkt9xzbkACLDyIB9a6LNRcWvqT3Xm9iCy
   VWEQrg658DQC5Ca8s+XsDkx/R7D++zeZqzSuj/FV6ieRSY5NrMDDKfALZ
   lmIXDaTJYPpv/CLY6jVci2ZFrcIhn5Eqy+SC3X5bvSoy4z77jphOauIND
   eT3cxa6Pzo9KW8+Io5Wvt0ogbo3lIk1QGL1P+ak+1gWob0kGExMm/LcwZ
   w==;
X-CSE-ConnectionGUID: Z8ndWoiDTwKYb00y48e1uQ==
X-CSE-MsgGUID: C2wWsae3S32ZM33Oft3dUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47144917"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="47144917"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 22:43:02 -0800
X-CSE-ConnectionGUID: HvNdtwuiRp24W8FusGmTbw==
X-CSE-MsgGUID: q3SJKo2yR4aD+iN8uDuj9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="105482252"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Dec 2024 22:43:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRn0s-0004XH-2b;
	Sun, 29 Dec 2024 06:42:58 +0000
Date: Sun, 29 Dec 2024 14:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 14/14]
 arch/x86/kvm/vmx/vmenter.S:128: Error: bad register name `%rax'
Message-ID: <202412291415.r6kpF8FV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   a0cabfa58f8dd9676bcc378ca8d5a77ea2eb751c
commit: a0cabfa58f8dd9676bcc378ca8d5a77ea2eb751c [14/14] KVM: VMX: Use WRMSRNS or WRMSRNSI when available
config: i386-buildonly-randconfig-001-20241229 (https://download.01.org/0day-ci/archive/20241229/202412291415.r6kpF8FV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291415.r6kpF8FV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291415.r6kpF8FV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmenter.S: Assembler messages:
>> arch/x86/kvm/vmx/vmenter.S:128: Error: bad register name `%rax'


vim +128 arch/x86/kvm/vmx/vmenter.S

    68	
    69	/**
    70	 * __vmx_vcpu_run - Run a vCPU via a transition to VMX guest mode
    71	 * @vmx:	struct vcpu_vmx *
    72	 * @regs:	unsigned long * (to guest registers)
    73	 * @flags:	VMX_RUN_VMRESUME:	use VMRESUME instead of VMLAUNCH
    74	 *		VMX_RUN_SAVE_SPEC_CTRL: save guest SPEC_CTRL into vmx->spec_ctrl
    75	 *
    76	 * Returns:
    77	 *	0 on VM-Exit, 1 on VM-Fail
    78	 */
    79	SYM_FUNC_START(__vmx_vcpu_run)
    80		push %_ASM_BP
    81		mov  %_ASM_SP, %_ASM_BP
    82	#ifdef CONFIG_X86_64
    83		push %r15
    84		push %r14
    85		push %r13
    86		push %r12
    87	#else
    88		push %edi
    89		push %esi
    90	#endif
    91		push %_ASM_BX
    92	
    93		/* Save @vmx for SPEC_CTRL handling */
    94		push %_ASM_ARG1
    95	
    96		/* Save @flags for SPEC_CTRL handling */
    97		push %_ASM_ARG3
    98	
    99		/*
   100		 * Save @regs, _ASM_ARG2 may be modified by vmx_update_host_rsp() and
   101		 * @regs is needed after VM-Exit to save the guest's register values.
   102		 */
   103		push %_ASM_ARG2
   104	
   105		/* Copy @flags to EBX, _ASM_ARG3 is volatile. */
   106		mov %_ASM_ARG3L, %ebx
   107	
   108		lea (%_ASM_SP), %_ASM_ARG2
   109		call vmx_update_host_rsp
   110	
   111		ALTERNATIVE "jmp .Lspec_ctrl_done", "", X86_FEATURE_MSR_SPEC_CTRL
   112	
   113		/*
   114		 * SPEC_CTRL handling: if the guest's SPEC_CTRL value differs from the
   115		 * host's, write the MSR.
   116		 *
   117		 * IMPORTANT: To avoid RSB underflow attacks and any other nastiness,
   118		 * there must not be any returns or indirect branches between this code
   119		 * and vmentry.
   120		 */
   121		mov 2*WORD_SIZE(%_ASM_SP), %_ASM_DI
   122		movl VMX_spec_ctrl(%_ASM_DI), %edi
   123		movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
   124		cmp %edi, %esi
   125		je .Lspec_ctrl_done
   126	
   127		/* Clear the higher 32-bit of RAX for wrmsrnsi */
 > 128		xor %rax, %rax
   129	
   130		xor %edx, %edx
   131		mov %edi, %eax
   132		/* Change to 'wrmsrnsi %rax, $MSR_IA32_SPEC_CTRL' once the immediate form wrmsrns is supported */
   133		ALTERNATIVE_2 "mov 0x48, %ecx; ds wrmsr",					\
   134			      "mov 0x48, %ecx; .byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,	\
   135			      ".byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long 0x48", X86_FEATURE_MSR_IMM
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
