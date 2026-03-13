Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FBAD4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773438445; cv=none; b=mNuAnjqurcHzEvR/Jx/Kwl/Ps+2fxnG6LjQ7+GwDJTrqwdpjgM7Vr9003TOhOAQVXQtFbV+NkT1beyBLVMKNwAuD0Q/YNH0jgW5owvVMGkGobi2MsdMkqzAKPnhUpHpyny8QU7bZdkdJAjprF1zPkS0QkwwALL+S/Lj1tyHBxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773438445; c=relaxed/simple;
	bh=EdyWVBBCt1OwJhfc1hGb7MXHdX0qydjk4sp4ODkbrEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZW3W2F8YCH+NxJhNFY3w18TWfJw7toin2IVt3C3r5X9gIS3Ic+3yWAmRXzCHBvfSQIReS5STdqlOuVYK5zG2c+oG7selYanY00KtlPUrmnrPriJbix1aZPNoN7IZW/O+6iVuoklrObWUZCu3t1DH0ZfhXajjs+J+AmbmwxZP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyb2+FP9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyb2+FP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773438442; x=1804974442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EdyWVBBCt1OwJhfc1hGb7MXHdX0qydjk4sp4ODkbrEI=;
  b=kyb2+FP9iWbxrsRI3LOTR19vDF3uucqy5R0uHf8oCMLlF1QuQcHFpmxA
   OQw423OBNMBWtaz1Clc/ECSexF1cFWegJ0bs03IHrOIActC4b3scnyNM3
   NEAEiu3R5BRVYB1QMCyfTCHFJeAyxMgEYhSIxo+kHxcBcaOntyjRlmE26
   udtQ9RoqUb6w/VvldfzC1hwt+lN9KYGn4S32kx43MZuYd9PvixIwhs80o
   hMyrQTNw0RM+GItgnSNUCMaZdTIerwUXd3GcOODLDcQMrsXhiyy4zcNzx
   DfHLM5ygMBFlA+i4DsqIRg0XwwqOMTtaU6+w30rAB3IqYh1geDmmgDHAz
   w==;
X-CSE-ConnectionGUID: b9+pTZIZQuy5h0PJwTb0xQ==
X-CSE-MsgGUID: x40YVZwiRVy0IL8VedoZ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74584231"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74584231"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 14:47:19 -0700
X-CSE-ConnectionGUID: 4EKvLaamTdWtAPOkRjwR8A==
X-CSE-MsgGUID: KX5QUk85Tbef7Dtral7FSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="219013091"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Mar 2026 14:47:18 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1ALk-000000004JN-0smp;
	Fri, 13 Mar 2026 21:47:16 +0000
Date: Sat, 14 Mar 2026 05:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] futex: Introduce __vdso_robust_futex_unlock_u32
 and __vdso_robust_pi_futex_try_unlock_u32
Message-ID: <202603140547.Wi2MxToc-lkp@intel.com>
References: <20260312181850.2156985-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312181850.2156985-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v7.0-rc3 next-20260311]
[cannot apply to tip/x86/core tip/x86/vdso]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/futex-Introduce-__vdso_robust_futex_unlock_u32-and-__vdso_robust_pi_futex_try_unlock_u32/20260313-201027
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260312181850.2156985-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH v3] futex: Introduce __vdso_robust_futex_unlock_u32 and __vdso_robust_pi_futex_try_unlock_u32
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260314/202603140547.Wi2MxToc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603140547.Wi2MxToc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603140547.Wi2MxToc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:13,
                    from include/linux/percpu.h:12,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from kernel/futex/core.c:34:
   kernel/futex/core.c: In function 'handle_futex_death':
>> arch/arm64/include/asm/processor.h:384:43: error: implicit declaration of function 'task_stack_page'; did you mean 'task_stack_vm_area'? [-Wimplicit-function-declaration]
     384 |         ((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
         |                                           ^~~~~~~~~~~~~~~
   kernel/futex/core.c:1148:38: note: in expansion of macro 'task_pt_regs'
    1148 |                 futex_vdso_exception(task_pt_regs(curr), &in_futex_vdso, &vdso_need_action);
         |                                      ^~~~~~~~~~~~


vim +384 arch/arm64/include/asm/processor.h

2f79d2fc391e4ba Peter Collingbourne 2021-03-18  378  
9cce7a435f89c9e Catalin Marinas     2012-03-05  379  /* Thread switching */
9cce7a435f89c9e Catalin Marinas     2012-03-05  380  extern struct task_struct *cpu_switch_to(struct task_struct *prev,
9cce7a435f89c9e Catalin Marinas     2012-03-05  381  					 struct task_struct *next);
9cce7a435f89c9e Catalin Marinas     2012-03-05  382  
9cce7a435f89c9e Catalin Marinas     2012-03-05  383  #define task_pt_regs(p) \
34be98f4944f990 Ard Biesheuvel      2017-07-20 @384  	((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
9cce7a435f89c9e Catalin Marinas     2012-03-05  385  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
