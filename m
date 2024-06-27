Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09177484
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719514223; cv=none; b=iZ39+lBhPW2WWSYRO0/Y1S0JjjssFhLtSqZ/PRUAckK4ePQjU9bRCHl/UI3uo5eka4DQVBeCGl4IrO1jEG1t358n15fZqjFZypCgbH0oe/bQ2FrOO3HKmZWk+LOgIUqcGQu0rjOdxOys0V4AHj9kmcszcSsW5T9PwQpPvqRfYHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719514223; c=relaxed/simple;
	bh=SNd1nDTYOYGtudzXlmFRCkOFjxyv8Xr3P8nqf98oo2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjMHeX8u6M+2kwTIjv8VvHLXfnZ9RGrajYvjLG/W+Q+OjcrDkic0uAAcTxjdEphvDezLxeWVmpvQWSHFQCZTCcAtYZMt2KhXHilVeXiIHnIxu82GTfExUs3fhfd8G9hP+asbzUvhPshiMEPQxXLpk1488hWf1/GuFs/5GirYuhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ou6QUriZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ou6QUriZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719514221; x=1751050221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SNd1nDTYOYGtudzXlmFRCkOFjxyv8Xr3P8nqf98oo2g=;
  b=Ou6QUriZh9orOExGyM6+jqoNcnwiXcbwVfrnLNkb4VQFCIkHG4En9k2e
   T06NDvy75cFxI9EOCUaMpSvpopuAYdevhfvjulWnx+eKOBJ6Z+7y8lHHb
   30r+SQOCLCd0LM3KrvDmA8kvIb/27FBIwwh2lOCmmmRtid5j1fv40u70z
   Y+zq9a70ae9LjNOiP3Pmzg/7Va1MgViG3/q11mRUo+lO101q5KO6MtadZ
   HZy1rGGM8Q3fE1mO2M5OwbNHmihXm4kEBzU6BEAT9HblGh1g+uTpCmONK
   QygUDr/c5eLkc9WCv0xUjlxzAd4OjsKDwxGDhXoCw+KUSmqNj8xhj7+xT
   Q==;
X-CSE-ConnectionGUID: 6jKu98zwRQ6M9RvKl/s94g==
X-CSE-MsgGUID: yu1hZkAIQnirA1tBqzs+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27801897"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="27801897"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 11:50:20 -0700
X-CSE-ConnectionGUID: yE9W7EOFTYWXKaBIWyjfTg==
X-CSE-MsgGUID: ogD+K6RvS6GHi3MKi5H6Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="49401046"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2024 11:50:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMuCG-000GRC-2l;
	Thu, 27 Jun 2024 18:50:16 +0000
Date: Fri, 28 Jun 2024 02:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V2 2/3] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
Message-ID: <202406280255.EzMI6Zjj-lkp@intel.com>
References: <20240620092607.267132-3-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620092607.267132-3-anshuman.khandual@arm.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on kvmarm/next arm/for-next arm/fixes soc/for-next linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm64-cpufeature-Add-field-details-for-ID_AA64DFR1_EL1-register/20240624-154408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240620092607.267132-3-anshuman.khandual%40arm.com
patch subject: [RFC V2 2/3] arm64/boot: Enable EL2 requirements for FEAT_Debugv8p9
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240628/202406280255.EzMI6Zjj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280255.EzMI6Zjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280255.EzMI6Zjj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/head.S: Assembler messages:
   arch/arm64/kernel/head.S:550: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/head.S:226:  Info: macro invoked from here
   arch/arm64/kernel/head.S:258:   Info: macro invoked from here
   arch/arm64/kernel/head.S:317:    Info: macro invoked from here
   arch/arm64/kernel/head.S:553: Error: non-constant expression in ".if" statement
   arch/arm64/kernel/head.S:226:  Info: macro invoked from here
   arch/arm64/kernel/head.S:258:   Info: macro invoked from here
   arch/arm64/kernel/head.S:317:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:1079: Error: constant expression required
   arch/arm64/kernel/head.S:227:  Info: macro invoked from here
   arch/arm64/kernel/head.S:258:   Info: macro invoked from here
   arch/arm64/kernel/head.S:317:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:1079: Error: constant expression required
   arch/arm64/kernel/head.S:228:  Info: macro invoked from here
   arch/arm64/kernel/head.S:258:   Info: macro invoked from here
   arch/arm64/kernel/head.S:317:    Info: macro invoked from here
>> arch/arm64/kernel/head.S:317: Error: undefined symbol ID_AA64MMFR0_EL1_FGT_FGT2 used as an immediate value


vim +317 arch/arm64/kernel/head.S

034edabe6cf1d0 Laura Abbott    2014-11-21  246  
034edabe6cf1d0 Laura Abbott    2014-11-21  247  /*
034edabe6cf1d0 Laura Abbott    2014-11-21  248   * end early head section, begin head code that is also used for
034edabe6cf1d0 Laura Abbott    2014-11-21  249   * hotplug and needs to have the same protections as the text region
034edabe6cf1d0 Laura Abbott    2014-11-21  250   */
d54170812ef1c8 Mark Rutland    2023-02-20  251  	.section ".idmap.text","a"
f80fb3a3d50843 Ard Biesheuvel  2016-01-26  252  
9703d9d7f77ce1 Catalin Marinas 2012-03-05  253  /*
ecbb11ab3ebc02 Mark Rutland    2020-11-13  254   * Starting from EL2 or EL1, configure the CPU to execute at the highest
ecbb11ab3ebc02 Mark Rutland    2020-11-13  255   * reachable EL supported by the kernel in a chosen default state. If dropping
ecbb11ab3ebc02 Mark Rutland    2020-11-13  256   * from EL2 to EL1, configure EL2 before configuring EL1.
828e9834e9a5b7 Matthew Leach   2013-10-11  257   *
d87a8e65b51011 Mark Rutland    2020-11-13  258   * Since we cannot always rely on ERET synchronizing writes to sysregs (e.g. if
d87a8e65b51011 Mark Rutland    2020-11-13  259   * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
828e9834e9a5b7 Matthew Leach   2013-10-11  260   *
b65e411d6cc2f1 Marc Zyngier    2022-06-30  261   * Returns either BOOT_CPU_MODE_EL1 or BOOT_CPU_MODE_EL2 in x0 if
b65e411d6cc2f1 Marc Zyngier    2022-06-30  262   * booted in EL1 or EL2 respectively, with the top 32 bits containing
b65e411d6cc2f1 Marc Zyngier    2022-06-30  263   * potential context flags. These flags are *not* stored in __boot_cpu_mode.
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  264   *
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  265   * x0: whether we are being called from the primary boot path with the MMU on
9703d9d7f77ce1 Catalin Marinas 2012-03-05  266   */
ecbb11ab3ebc02 Mark Rutland    2020-11-13  267  SYM_FUNC_START(init_kernel_el)
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  268  	mrs	x1, CurrentEL
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  269  	cmp	x1, #CurrentEL_EL2
d87a8e65b51011 Mark Rutland    2020-11-13  270  	b.eq	init_el2
d87a8e65b51011 Mark Rutland    2020-11-13  271  
d87a8e65b51011 Mark Rutland    2020-11-13  272  SYM_INNER_LABEL(init_el1, SYM_L_LOCAL)
31a32b49b80f79 Marc Zyngier    2021-04-08  273  	mov_q	x0, INIT_SCTLR_EL1_MMU_OFF
9d7c13e5dde312 Ard Biesheuvel  2023-01-11  274  	pre_disable_mmu_workaround
31a32b49b80f79 Marc Zyngier    2021-04-08  275  	msr	sctlr_el1, x0
9cf71728931a40 Matthew Leach   2013-10-11  276  	isb
d87a8e65b51011 Mark Rutland    2020-11-13  277  	mov_q	x0, INIT_PSTATE_EL1
d87a8e65b51011 Mark Rutland    2020-11-13  278  	msr	spsr_el1, x0
d87a8e65b51011 Mark Rutland    2020-11-13  279  	msr	elr_el1, lr
d87a8e65b51011 Mark Rutland    2020-11-13  280  	mov	w0, #BOOT_CPU_MODE_EL1
d87a8e65b51011 Mark Rutland    2020-11-13  281  	eret
9703d9d7f77ce1 Catalin Marinas 2012-03-05  282  
d87a8e65b51011 Mark Rutland    2020-11-13  283  SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  284  	msr	elr_el2, lr
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  285  
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  286  	// clean all HYP code to the PoC if we booted at EL2 with the MMU on
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  287  	cbz	x0, 0f
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  288  	adrp	x0, __hyp_idmap_text_start
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  289  	adr_l	x1, __hyp_text_end
d54170812ef1c8 Mark Rutland    2023-02-20  290  	adr_l	x2, dcache_clean_poc
d54170812ef1c8 Mark Rutland    2023-02-20  291  	blr	x2
34e526cb7d4672 Ard Biesheuvel  2024-04-15  292  
34e526cb7d4672 Ard Biesheuvel  2024-04-15  293  	mov_q	x0, INIT_SCTLR_EL2_MMU_OFF
34e526cb7d4672 Ard Biesheuvel  2024-04-15  294  	pre_disable_mmu_workaround
34e526cb7d4672 Ard Biesheuvel  2024-04-15  295  	msr	sctlr_el2, x0
34e526cb7d4672 Ard Biesheuvel  2024-04-15  296  	isb
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  297  0:
78869f0f0552d0 David Brazdil   2020-12-02  298  	mov_q	x0, HCR_HOST_NVHE_FLAGS
b3320142f3db9b Marc Zyngier    2024-03-21  299  
b3320142f3db9b Marc Zyngier    2024-03-21  300  	/*
b3320142f3db9b Marc Zyngier    2024-03-21  301  	 * Compliant CPUs advertise their VHE-onlyness with
b3320142f3db9b Marc Zyngier    2024-03-21  302  	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
b3320142f3db9b Marc Zyngier    2024-03-21  303  	 * RES1 in that case. Publish the E2H bit early so that
b3320142f3db9b Marc Zyngier    2024-03-21  304  	 * it can be picked up by the init_el2_state macro.
b3320142f3db9b Marc Zyngier    2024-03-21  305  	 *
b3320142f3db9b Marc Zyngier    2024-03-21  306  	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
b3320142f3db9b Marc Zyngier    2024-03-21  307  	 * don't advertise it (they predate this relaxation).
b3320142f3db9b Marc Zyngier    2024-03-21  308  	 */
b3320142f3db9b Marc Zyngier    2024-03-21  309  	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
b3320142f3db9b Marc Zyngier    2024-03-21  310  	tbz	x1, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
b3320142f3db9b Marc Zyngier    2024-03-21  311  
b3320142f3db9b Marc Zyngier    2024-03-21  312  	orr	x0, x0, #HCR_E2H
b3320142f3db9b Marc Zyngier    2024-03-21  313  1:
78869f0f0552d0 David Brazdil   2020-12-02  314  	msr	hcr_el2, x0
22043a3c082a58 Dave Martin     2017-10-31  315  	isb
78869f0f0552d0 David Brazdil   2020-12-02  316  
e2df464173f0b5 Marc Zyngier    2021-02-08 @317  	init_el2_state
22043a3c082a58 Dave Martin     2017-10-31  318  
712c6ff4dba491 Marc Zyngier    2012-10-19  319  	/* Hypervisor stub */
78869f0f0552d0 David Brazdil   2020-12-02  320  	adr_l	x0, __hyp_stub_vectors
712c6ff4dba491 Marc Zyngier    2012-10-19  321  	msr	vbar_el2, x0
d87a8e65b51011 Mark Rutland    2020-11-13  322  	isb
78869f0f0552d0 David Brazdil   2020-12-02  323  
ae4b7e38e9a947 Marc Zyngier    2022-06-30  324  	mov_q	x1, INIT_SCTLR_EL1_MMU_OFF
ae4b7e38e9a947 Marc Zyngier    2022-06-30  325  
31a32b49b80f79 Marc Zyngier    2021-04-08  326  	mrs	x0, hcr_el2
31a32b49b80f79 Marc Zyngier    2021-04-08  327  	and	x0, x0, #HCR_E2H
3944382fa6f22b Marc Zyngier    2024-01-22  328  	cbz	x0, 2f
b3320142f3db9b Marc Zyngier    2024-03-21  329  
ae4b7e38e9a947 Marc Zyngier    2022-06-30  330  	/* Set a sane SCTLR_EL1, the VHE way */
ae4b7e38e9a947 Marc Zyngier    2022-06-30  331  	msr_s	SYS_SCTLR_EL12, x1
ae4b7e38e9a947 Marc Zyngier    2022-06-30  332  	mov	x2, #BOOT_CPU_FLAG_E2H
3944382fa6f22b Marc Zyngier    2024-01-22  333  	b	3f
31a32b49b80f79 Marc Zyngier    2021-04-08  334  
3944382fa6f22b Marc Zyngier    2024-01-22  335  2:
ae4b7e38e9a947 Marc Zyngier    2022-06-30  336  	msr	sctlr_el1, x1
ae4b7e38e9a947 Marc Zyngier    2022-06-30  337  	mov	x2, xzr
3944382fa6f22b Marc Zyngier    2024-01-22  338  3:
1700f89cb99aae Marc Zyngier    2023-06-14  339  	__init_el2_nvhe_prepare_eret
1700f89cb99aae Marc Zyngier    2023-06-14  340  
d87a8e65b51011 Mark Rutland    2020-11-13  341  	mov	w0, #BOOT_CPU_MODE_EL2
ae4b7e38e9a947 Marc Zyngier    2022-06-30  342  	orr	x0, x0, x2
9703d9d7f77ce1 Catalin Marinas 2012-03-05  343  	eret
ecbb11ab3ebc02 Mark Rutland    2020-11-13  344  SYM_FUNC_END(init_kernel_el)
9703d9d7f77ce1 Catalin Marinas 2012-03-05  345  
9703d9d7f77ce1 Catalin Marinas 2012-03-05  346  	/*
9703d9d7f77ce1 Catalin Marinas 2012-03-05  347  	 * This provides a "holding pen" for platforms to hold all secondary
9703d9d7f77ce1 Catalin Marinas 2012-03-05  348  	 * cores are held until we're ready for them to initialise.
9703d9d7f77ce1 Catalin Marinas 2012-03-05  349  	 */
c63d9f82db9439 Mark Brown      2020-02-18  350  SYM_FUNC_START(secondary_holding_pen)
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  351  	mov	x0, xzr
ecbb11ab3ebc02 Mark Rutland    2020-11-13  352  	bl	init_kernel_el			// w0=cpu_boot_mode
005e12676af09a Ard Biesheuvel  2022-06-24  353  	mrs	x2, mpidr_el1
b03cc885328e3c Ard Biesheuvel  2016-04-18  354  	mov_q	x1, MPIDR_HWID_BITMASK
005e12676af09a Ard Biesheuvel  2022-06-24  355  	and	x2, x2, x1
b1c98297fe0c6e Ard Biesheuvel  2015-03-10  356  	adr_l	x3, secondary_holding_pen_release
9703d9d7f77ce1 Catalin Marinas 2012-03-05  357  pen:	ldr	x4, [x3]
005e12676af09a Ard Biesheuvel  2022-06-24  358  	cmp	x4, x2
9703d9d7f77ce1 Catalin Marinas 2012-03-05  359  	b.eq	secondary_startup
9703d9d7f77ce1 Catalin Marinas 2012-03-05  360  	wfe
9703d9d7f77ce1 Catalin Marinas 2012-03-05  361  	b	pen
c63d9f82db9439 Mark Brown      2020-02-18  362  SYM_FUNC_END(secondary_holding_pen)
652af899799354 Mark Rutland    2013-10-24  363  
652af899799354 Mark Rutland    2013-10-24  364  	/*
652af899799354 Mark Rutland    2013-10-24  365  	 * Secondary entry point that jumps straight into the kernel. Only to
652af899799354 Mark Rutland    2013-10-24  366  	 * be used where CPUs are brought online dynamically by the kernel.
652af899799354 Mark Rutland    2013-10-24  367  	 */
c63d9f82db9439 Mark Brown      2020-02-18  368  SYM_FUNC_START(secondary_entry)
3dcf60bbfd284e Ard Biesheuvel  2023-01-11  369  	mov	x0, xzr
ecbb11ab3ebc02 Mark Rutland    2020-11-13  370  	bl	init_kernel_el			// w0=cpu_boot_mode
652af899799354 Mark Rutland    2013-10-24  371  	b	secondary_startup
c63d9f82db9439 Mark Brown      2020-02-18  372  SYM_FUNC_END(secondary_entry)
9703d9d7f77ce1 Catalin Marinas 2012-03-05  373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
