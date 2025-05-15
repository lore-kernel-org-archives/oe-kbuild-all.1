Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088AB20E01E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340123; cv=none; b=e+j3ZTPcsX2li+3hba5DgSVwFrWovlECgV31D3OABrVPQxNHqu/paaCb8Z9M38M2EJko+cpTaoShb5yEzoxE8Q5lZty0ne2MjCWTbCRuwm+erKlIIoPjqpVwngKhqEoQXN+uKWsg3inpVvXH1VRAQ+B6W0F5j4214ZaFURvlvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340123; c=relaxed/simple;
	bh=3ceGSFNHZlsfH+qHEJjrHxlnEzzgwdLVa5M0MlngHdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMJx6ENj6cYUlzq+1CGVhwLN3pV1re4kGma8mVneIxuvwIMAHXqYPjKWytZO/q2ttk4RrezfdoczpxO4A+/emhLJnjBNL5Fq8A54Hk0NtCP4rkJPN550QxEQamY06idkvOKYPF8HK7MGHGI9mFig8YOX1AG5uqAwNrWrfqTIUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL6U9OSX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL6U9OSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747340121; x=1778876121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ceGSFNHZlsfH+qHEJjrHxlnEzzgwdLVa5M0MlngHdM=;
  b=VL6U9OSXIrnmg3rMODCbD+Z3XwXxm+xL5qvCzU6y0cW/7IVT/G7RPZ0s
   4+sY8eRUYMJoJ0UpcVg9GMHqEgiHcO6OlvhTrWnxwPKhGk1flX++q2QnA
   pk9wfYmylOoym+MRPvEiWWGrag0JvBFB8EtOlG+viiPnvAeTFZows87Hu
   L6PKpYtXNHh3cEfZT6mrb7c02Wc5nZR9KtKFQWB+mDdcCgJ9v+ME+vog7
   6/Me2BwRomG3XVsLjhVYE4Dcg6mP8AWal6KZH5Vaw6FGpl0DyIQZI4R0C
   ACTGUFP+OGLg8o5+DIo1l6+7wNHz9pHaDRXg8yq/xuTmGd75GrKKsieE1
   A==;
X-CSE-ConnectionGUID: lw5HakCYQCKw6gE9iom+vg==
X-CSE-MsgGUID: Nm4ZUmApR9iq5ZGuIUKbeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59937988"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="59937988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 13:15:20 -0700
X-CSE-ConnectionGUID: LpHxS673SAa0f3Zr+AttXQ==
X-CSE-MsgGUID: Ie6pfMwKRRqyEi65hICXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138976242"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2025 13:15:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFez7-000Iin-19;
	Thu, 15 May 2025 20:15:17 +0000
Date: Fri, 16 May 2025 04:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1636/1636]
 arch/x86/kernel/fpu/core.c:175:14: warning: mixing declarations and code is
 a C99 extension
Message-ID: <202505160438.vuslIGAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   60611bd206ba7e11ef429b2653fdada76eff4d77
commit: 1e3cb18ebe2976b3294e85c3d162736cc3c7c92b [1636/1636] x86: Enhanced copy capabilities for Hygon processor
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250516/202505160438.vuslIGAx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160438.vuslIGAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160438.vuslIGAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/fpu/core.c:149:14: warning: no previous prototype for function 'get_fpustate_free_space' [-Wmissing-prototypes]
     149 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^
   arch/x86/kernel/fpu/core.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     149 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         | ^
         | static 
>> arch/x86/kernel/fpu/core.c:175:14: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     175 |         struct fpu *fpu = &current->thread.fpu;
         |                     ^
   2 warnings generated.


vim +175 arch/x86/kernel/fpu/core.c

   144	
   145	#if defined(CONFIG_X86_HYGON_LMC_SSE2_ON) || \
   146		defined(CONFIG_X86_HYGON_LMC_AVX2_ON)
   147	
   148	extern unsigned int fpu_kernel_nonatomic_xstate_size;
 > 149	unsigned int get_fpustate_free_space(struct fpu *fpu)
   150	{
   151		if ((fpu_kernel_xstate_size + fpu_kernel_nonatomic_xstate_size) >
   152		    sizeof(fpu->state))
   153			return 0;
   154		return fpu_kernel_nonatomic_xstate_size;
   155	}
   156	
   157	unsigned long get_fpu_registers_pos(struct fpu *fpu, unsigned int off)
   158	{
   159		unsigned long addr = 0;
   160	
   161		if (fpu && (fpu_kernel_nonatomic_xstate_size > off)) {
   162			addr = (unsigned long)&fpu->state.__padding[0];
   163			addr += fpu_kernel_xstate_size + off;
   164		}
   165		return addr;
   166	}
   167	
   168	/*
   169	 * We can call kernel_fpu_begin_nonatomic in non-atomic task context.
   170	 */
   171	int kernel_fpu_begin_nonatomic_mask(void)
   172	{
   173		preempt_disable();
   174	
 > 175		struct fpu *fpu = &current->thread.fpu;
   176	
   177		/* we not support Nested call */
   178		if (test_thread_flag(TIF_USING_FPU_NONATOMIC))
   179			goto err;
   180	
   181		if (KERNEL_FPU_NONATOMIC_SIZE >
   182		    get_fpustate_free_space(&current->thread.fpu))
   183			goto err;
   184	
   185		/*
   186	       * This means we call kernel_fpu_begin_nonatomic after kernel_fpu_begin,
   187	       * but before kernel_fpu_end.
   188	       */
   189		if (this_cpu_read(in_kernel_fpu))
   190			goto err;
   191	
   192		if (in_interrupt())
   193			goto err;
   194	
   195		if (current->flags & PF_KTHREAD)
   196			goto err;
   197	
   198		if (fpu->initialized)
   199			copy_fpregs_to_fpstate(&current->thread.fpu);
   200	
   201		/* Set thread flag: TIC_USING_FPU_NONATOMIC */
   202		set_thread_flag(TIF_USING_FPU_NONATOMIC);
   203	
   204		__cpu_invalidate_fpregs_state();
   205	
   206		preempt_enable();
   207	
   208		return 0;
   209	
   210	err:
   211		preempt_enable();
   212	
   213		return -1;
   214	}
   215	EXPORT_SYMBOL_GPL(kernel_fpu_begin_nonatomic_mask);
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
