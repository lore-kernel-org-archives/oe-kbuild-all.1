Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222263B388C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961516; cv=none; b=bt62yqsV04WD32cq0LuLPr1aHlAAlB9pgVgDlEnYrkRNUKxSIwSm3pxJXkV3naJeOtF9t9HlEBvVpohoQRitWUQVVPPfHQ0jYyXmbZDwKToD1M78y5zCicsCsTAFNxhXI4TXRBlO72WIvQ4asPja5hI4oWLq85sQFJZbSLgiqgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961516; c=relaxed/simple;
	bh=Ns+kkAR+hqqNKJDOgIZGSsgQVGWwfuFwMtfE1ObOqIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxFNwdzHfFTw3IKjhLdTND1Vt4IBO1P/ayW9iEKmKZmHGJXhFMY3mWHSga5/O1bv/afj6dVc1h2bFWPHEb3sLe1aJu/tFIxpD3OCse5u8r8MUNyOPEgGKmAn9v1oe6d42PvFNn867l+EHzg1JpGYcCHaGs1wTVqAzrj1RBNfYL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZN8mH9Rb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZN8mH9Rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779961513; x=1811497513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ns+kkAR+hqqNKJDOgIZGSsgQVGWwfuFwMtfE1ObOqIo=;
  b=ZN8mH9RbFkErhTa7r1oYaZkyN89+77qd69nXcs6Cop5s38qyQgESQO3N
   ChVfJCUwpXWjiKan8a2fcJDLSmqjen4S5XtxDrrpvWMCQ9VkjoCJOOeB5
   lv7MIC+vzS+1RECiNAetbPB6D2WEvbAJISnUIumNeH7gjCB4QDZ9RZ3O/
   nmE8SFAHLRy6T+dR36vH5pQ6YY5IiS1qk9AjgMCjA21ya6xOS897wWTR5
   n8rD8NDu99C52xz5VvtKURl6+UFiLSQoO/W3GtM4lc1F32vCV8XKOnP3A
   2V4WpAi7/4sfBmMdm4HI4ZNJ30glqgJbwZawv1YgTTDodggsNOcSWqEKN
   A==;
X-CSE-ConnectionGUID: DNItP4PpTf++/dabFmtkVw==
X-CSE-MsgGUID: XunGUE/kSJOUGMN1B0tzAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91109296"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91109296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:45:12 -0700
X-CSE-ConnectionGUID: Wy6aTRKzTeeTOlrS3es8fA==
X-CSE-MsgGUID: DWx78cg/R5Wh9KSanTx46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="246533641"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2026 02:45:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSXIY-000000005nC-18BT;
	Thu, 28 May 2026 09:45:06 +0000
Date: Thu, 28 May 2026 17:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>, tglx <tglx@kernel.org>,
	mingo <mingo@redhat.com>, bp <bp@alien8.de>, hpa <hpa@zytor.com>,
	x86 <x86@kernel.org>, "dave.hansen" <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] x86/vm86: Remove deprecated VM86 support
Message-ID: <202605281749.4b3Hss7l-lkp@intel.com>
References: <19e6858d9db.3a90532342003.5043853571553507480@zohomail.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e6858d9db.3a90532342003.5043853571553507480@zohomail.in>

Hi Ashwin,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.1-rc5]
[also build test ERROR on linus/master next-20260527]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashwin-Gundarapu/x86-vm86-Remove-deprecated-VM86-support/20260527-153401
base:   v7.1-rc5
patch link:    https://lore.kernel.org/r/19e6858d9db.3a90532342003.5043853571553507480%40zohomail.in
patch subject: [PATCH v2] x86/vm86: Remove deprecated VM86 support
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260528/202605281749.4b3Hss7l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281749.4b3Hss7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281749.4b3Hss7l-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/lib/insn-eval.c: In function 'get_segment_selector':
>> arch/x86/lib/insn-eval.c:380:40: error: invalid use of undefined type 'struct kernel_vm86_regs'
     380 |                         return vm86regs->ds;
         |                                        ^~
   arch/x86/lib/insn-eval.c:382:40: error: invalid use of undefined type 'struct kernel_vm86_regs'
     382 |                         return vm86regs->es;
         |                                        ^~
   arch/x86/lib/insn-eval.c:384:40: error: invalid use of undefined type 'struct kernel_vm86_regs'
     384 |                         return vm86regs->fs;
         |                                        ^~
   arch/x86/lib/insn-eval.c:386:40: error: invalid use of undefined type 'struct kernel_vm86_regs'
     386 |                         return vm86regs->gs;
         |                                        ^~
--
   arch/x86/kernel/process_32.c: In function 'release_thread':
>> arch/x86/kernel/process_32.c:108:9: error: implicit declaration of function 'release_vm86_irqs' [-Wimplicit-function-declaration]
     108 |         release_vm86_irqs(dead_task);
         |         ^~~~~~~~~~~~~~~~~
--
   arch/x86/kernel/signal.c: In function 'handle_signal':
>> arch/x86/kernel/signal.c:261:17: error: implicit declaration of function 'save_v86_state' [-Wimplicit-function-declaration]
     261 |                 save_v86_state((struct kernel_vm86_regs *) regs, VM86_SIGNAL);
         |                 ^~~~~~~~~~~~~~
--
   arch/x86/kernel/traps.c: In function 'do_trap_no_signal':
>> arch/x86/kernel/traps.c:289:30: error: implicit declaration of function 'handle_vm86_trap' [-Wimplicit-function-declaration]
     289 |                         if (!handle_vm86_trap((struct kernel_vm86_regs *) regs,
         |                              ^~~~~~~~~~~~~~~~
   arch/x86/kernel/traps.c: In function '__exc_general_protection':
>> arch/x86/kernel/traps.c:927:17: error: implicit declaration of function 'handle_vm86_fault'; did you mean 'handle_mm_fault'? [-Wimplicit-function-declaration]
     927 |                 handle_vm86_fault((struct kernel_vm86_regs *) regs, error_code);
         |                 ^~~~~~~~~~~~~~~~~
         |                 handle_mm_fault


vim +380 arch/x86/lib/insn-eval.c

32d0b95300db03 Ricardo Neri 2017-10-27  323  
32d0b95300db03 Ricardo Neri 2017-10-27  324  /**
32d0b95300db03 Ricardo Neri 2017-10-27  325   * get_segment_selector() - obtain segment selector
32d0b95300db03 Ricardo Neri 2017-10-27  326   * @regs:		Register values as seen when entering kernel mode
32d0b95300db03 Ricardo Neri 2017-10-27  327   * @seg_reg_idx:	Segment register index to use
32d0b95300db03 Ricardo Neri 2017-10-27  328   *
32d0b95300db03 Ricardo Neri 2017-10-27  329   * Obtain the segment selector from any of the CS, SS, DS, ES, FS, GS segment
32d0b95300db03 Ricardo Neri 2017-10-27  330   * registers. In CONFIG_X86_32, the segment is obtained from either pt_regs or
32d0b95300db03 Ricardo Neri 2017-10-27  331   * kernel_vm86_regs as applicable. In CONFIG_X86_64, CS and SS are obtained
32d0b95300db03 Ricardo Neri 2017-10-27  332   * from pt_regs. DS, ES, FS and GS are obtained by reading the actual CPU
32d0b95300db03 Ricardo Neri 2017-10-27  333   * registers. This done for only for completeness as in CONFIG_X86_64 segment
32d0b95300db03 Ricardo Neri 2017-10-27  334   * registers are ignored.
32d0b95300db03 Ricardo Neri 2017-10-27  335   *
32d0b95300db03 Ricardo Neri 2017-10-27  336   * Returns:
32d0b95300db03 Ricardo Neri 2017-10-27  337   *
32d0b95300db03 Ricardo Neri 2017-10-27  338   * Value of the segment selector, including null when running in
32d0b95300db03 Ricardo Neri 2017-10-27  339   * long mode.
32d0b95300db03 Ricardo Neri 2017-10-27  340   *
32d0b95300db03 Ricardo Neri 2017-10-27  341   * -EINVAL on error.
32d0b95300db03 Ricardo Neri 2017-10-27  342   */
32d0b95300db03 Ricardo Neri 2017-10-27  343  static short get_segment_selector(struct pt_regs *regs, int seg_reg_idx)
32d0b95300db03 Ricardo Neri 2017-10-27  344  {
32d0b95300db03 Ricardo Neri 2017-10-27  345  	unsigned short sel;
32d0b95300db03 Ricardo Neri 2017-10-27  346  
3a24a60854d2ef Brian Gerst  2022-03-25  347  #ifdef CONFIG_X86_64
32d0b95300db03 Ricardo Neri 2017-10-27  348  	switch (seg_reg_idx) {
32d0b95300db03 Ricardo Neri 2017-10-27  349  	case INAT_SEG_REG_IGNORE:
32d0b95300db03 Ricardo Neri 2017-10-27  350  		return 0;
32d0b95300db03 Ricardo Neri 2017-10-27  351  	case INAT_SEG_REG_CS:
32d0b95300db03 Ricardo Neri 2017-10-27  352  		return (unsigned short)(regs->cs & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  353  	case INAT_SEG_REG_SS:
32d0b95300db03 Ricardo Neri 2017-10-27  354  		return (unsigned short)(regs->ss & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  355  	case INAT_SEG_REG_DS:
32d0b95300db03 Ricardo Neri 2017-10-27  356  		savesegment(ds, sel);
32d0b95300db03 Ricardo Neri 2017-10-27  357  		return sel;
32d0b95300db03 Ricardo Neri 2017-10-27  358  	case INAT_SEG_REG_ES:
32d0b95300db03 Ricardo Neri 2017-10-27  359  		savesegment(es, sel);
32d0b95300db03 Ricardo Neri 2017-10-27  360  		return sel;
32d0b95300db03 Ricardo Neri 2017-10-27  361  	case INAT_SEG_REG_FS:
32d0b95300db03 Ricardo Neri 2017-10-27  362  		savesegment(fs, sel);
32d0b95300db03 Ricardo Neri 2017-10-27  363  		return sel;
32d0b95300db03 Ricardo Neri 2017-10-27  364  	case INAT_SEG_REG_GS:
32d0b95300db03 Ricardo Neri 2017-10-27  365  		savesegment(gs, sel);
32d0b95300db03 Ricardo Neri 2017-10-27  366  		return sel;
32d0b95300db03 Ricardo Neri 2017-10-27  367  	default:
32d0b95300db03 Ricardo Neri 2017-10-27  368  		return -EINVAL;
32d0b95300db03 Ricardo Neri 2017-10-27  369  	}
32d0b95300db03 Ricardo Neri 2017-10-27  370  #else /* CONFIG_X86_32 */
32d0b95300db03 Ricardo Neri 2017-10-27  371  	struct kernel_vm86_regs *vm86regs = (struct kernel_vm86_regs *)regs;
32d0b95300db03 Ricardo Neri 2017-10-27  372  
32d0b95300db03 Ricardo Neri 2017-10-27  373  	if (v8086_mode(regs)) {
32d0b95300db03 Ricardo Neri 2017-10-27  374  		switch (seg_reg_idx) {
32d0b95300db03 Ricardo Neri 2017-10-27  375  		case INAT_SEG_REG_CS:
32d0b95300db03 Ricardo Neri 2017-10-27  376  			return (unsigned short)(regs->cs & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  377  		case INAT_SEG_REG_SS:
32d0b95300db03 Ricardo Neri 2017-10-27  378  			return (unsigned short)(regs->ss & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  379  		case INAT_SEG_REG_DS:
32d0b95300db03 Ricardo Neri 2017-10-27 @380  			return vm86regs->ds;
32d0b95300db03 Ricardo Neri 2017-10-27  381  		case INAT_SEG_REG_ES:
32d0b95300db03 Ricardo Neri 2017-10-27  382  			return vm86regs->es;
32d0b95300db03 Ricardo Neri 2017-10-27  383  		case INAT_SEG_REG_FS:
32d0b95300db03 Ricardo Neri 2017-10-27  384  			return vm86regs->fs;
32d0b95300db03 Ricardo Neri 2017-10-27  385  		case INAT_SEG_REG_GS:
32d0b95300db03 Ricardo Neri 2017-10-27  386  			return vm86regs->gs;
32d0b95300db03 Ricardo Neri 2017-10-27  387  		case INAT_SEG_REG_IGNORE:
32d0b95300db03 Ricardo Neri 2017-10-27  388  		default:
32d0b95300db03 Ricardo Neri 2017-10-27  389  			return -EINVAL;
32d0b95300db03 Ricardo Neri 2017-10-27  390  		}
32d0b95300db03 Ricardo Neri 2017-10-27  391  	}
32d0b95300db03 Ricardo Neri 2017-10-27  392  
32d0b95300db03 Ricardo Neri 2017-10-27  393  	switch (seg_reg_idx) {
32d0b95300db03 Ricardo Neri 2017-10-27  394  	case INAT_SEG_REG_CS:
32d0b95300db03 Ricardo Neri 2017-10-27  395  		return (unsigned short)(regs->cs & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  396  	case INAT_SEG_REG_SS:
32d0b95300db03 Ricardo Neri 2017-10-27  397  		return (unsigned short)(regs->ss & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  398  	case INAT_SEG_REG_DS:
32d0b95300db03 Ricardo Neri 2017-10-27  399  		return (unsigned short)(regs->ds & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  400  	case INAT_SEG_REG_ES:
32d0b95300db03 Ricardo Neri 2017-10-27  401  		return (unsigned short)(regs->es & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  402  	case INAT_SEG_REG_FS:
32d0b95300db03 Ricardo Neri 2017-10-27  403  		return (unsigned short)(regs->fs & 0xffff);
32d0b95300db03 Ricardo Neri 2017-10-27  404  	case INAT_SEG_REG_GS:
3a24a60854d2ef Brian Gerst  2022-03-25  405  		savesegment(gs, sel);
3a24a60854d2ef Brian Gerst  2022-03-25  406  		return sel;
32d0b95300db03 Ricardo Neri 2017-10-27  407  	case INAT_SEG_REG_IGNORE:
32d0b95300db03 Ricardo Neri 2017-10-27  408  	default:
32d0b95300db03 Ricardo Neri 2017-10-27  409  		return -EINVAL;
32d0b95300db03 Ricardo Neri 2017-10-27  410  	}
32d0b95300db03 Ricardo Neri 2017-10-27  411  #endif /* CONFIG_X86_64 */
32d0b95300db03 Ricardo Neri 2017-10-27  412  }
32d0b95300db03 Ricardo Neri 2017-10-27  413  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
