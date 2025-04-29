Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92726B09D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 21:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961263; cv=none; b=orpCnxAmWfCRRIDjgd4Pzd8cs+bQM1jEXd8iVySjUXQIH9JE8Yx1zvai4mETi7YljOd2+c5x4aaEum4CNU/XG7zPFY/Rfe+bJTTb4IP/yWabe2ho7KA3byiTAcKiaaL6+OM3GLujYBGQA9+Rkm2FZif6HsnxeLZ4zP1FlI05maE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961263; c=relaxed/simple;
	bh=TH5lMGSmLE+dQlUkLLDYKm0u56KH6U9rLKnY9wwf9qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWZu1u3sm2xgrAO0PCPr5dVdDlJ+y4uLVRY5uxb9yqyP+jdrp4/G4TATwN4ifdXhyTS71kRX9giIOBoyF98bK7d97M5yqfbS0fwmFFz8jtDiCYUZ3ZyhQCnt+ZDTsgrv0SeTQAJB2Lfyagy4NlBCorsKEArSqgo34vN3RYfutqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5wxYpd0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5wxYpd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745961261; x=1777497261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TH5lMGSmLE+dQlUkLLDYKm0u56KH6U9rLKnY9wwf9qg=;
  b=R5wxYpd0wIUhv3HG9MhZ7pwDK4BD1PR8ZdtsV6W9EfU5sipY8XQnBahx
   4YCm1WWh7Rjus6CZQZ5x313Dz+gozAGdFePaz4qpNab+b3JvAxelA8Tx/
   /1modL5f3L6DEiIrG84edVsFwk2nOrlSAxSyyd70j1erPcU6LJiu1sKBs
   ZeRsUJWFG1YqgRj8Tt5F601JFWbcJqJKW7cndytVajeERd+I4E3BgWfAu
   HDu/fpz33HesbvCakaQb1xljgj87/4H7ikYoZMFYBOQ+TCllNSeZfad3y
   kZHNqbtC6plaTjnU4ri2ezrBlEwCDh4eBOExdn6qeL8H6yVlEVOh8tVuv
   A==;
X-CSE-ConnectionGUID: mfO2ikXdQkORvDnI/u466w==
X-CSE-MsgGUID: 8hURphpPT9qIQHHTxbHqMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58238113"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58238113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 14:14:21 -0700
X-CSE-ConnectionGUID: 2IDhdWGESXm/OvnscH2nuQ==
X-CSE-MsgGUID: fZMpIpWAQySJ6KH8MHi5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="171173419"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2025 14:14:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9sHQ-0002xD-2J;
	Tue, 29 Apr 2025 21:14:16 +0000
Date: Wed, 30 Apr 2025 05:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V1 6/6] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <202504300413.Lm1Kilgl-lkp@intel.com>
References: <20250428152225.66044-9-mchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428152225.66044-9-mchauras@linux.ibm.com>

Hi Mukesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20250428-232533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250428152225.66044-9-mchauras%40linux.ibm.com
patch subject: [RFC V1 6/6] powerpc: Enable Generic Entry/Exit for syscalls.
config: powerpc-randconfig-003-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300413.Lm1Kilgl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300413.Lm1Kilgl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300413.Lm1Kilgl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5:0,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/powerpc/include/asm/processor.h:41,
                    from include/linux/sched.h:13,
                    from include/linux/context_tracking.h:5,
                    from arch/powerpc/kernel/interrupt.c:3:
   arch/powerpc/kernel/interrupt.c: In function 'syscall_exit_prepare':
>> arch/powerpc/kernel/interrupt.c:212:16: error: 'local_paca' undeclared (first use in this function); did you mean 'local_inc'?
     if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
                   ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   arch/powerpc/kernel/interrupt.c:212:16: note: each undeclared identifier is reported only once for each function it appears in
     if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
                   ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
--
   arch/powerpc/kernel/signal.c: In function 'arch_do_signal_or_restart':
>> arch/powerpc/kernel/signal.c:376:2: error: 'local_paca' undeclared (first use in this function); did you mean 'local_inc'?
     local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
     ^~~~~~~~~~
     local_inc
   arch/powerpc/kernel/signal.c:376:2: note: each undeclared identifier is reported only once for each function it appears in
--
>> arch/powerpc/kernel/ptrace/ptrace.c:196:12: warning: 'do_seccomp' defined but not used [-Wunused-function]
    static int do_seccomp(struct pt_regs *regs)
               ^~~~~~~~~~


vim +212 arch/powerpc/kernel/interrupt.c

   153	
   154	/*
   155	 * This should be called after a syscall returns, with r3 the return value
   156	 * from the syscall. If this function returns non-zero, the system call
   157	 * exit assembly should additionally load all GPR registers and CTR and XER
   158	 * from the interrupt frame.
   159	 *
   160	 * The function graph tracer can not trace the return side of this function,
   161	 * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
   162	 */
   163	notrace unsigned long syscall_exit_prepare(unsigned long r3,
   164						   struct pt_regs *regs,
   165						   long scv)
   166	{
   167		unsigned long ti_flags;
   168		unsigned long ret = 0;
   169		bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
   170	
   171		kuap_assert_locked();
   172	
   173		regs->result = r3;
   174	
   175		ti_flags = read_thread_flags();
   176	
   177		if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
   178			if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
   179				r3 = -r3;
   180				regs->ccr |= 0x10000000; /* Set SO bit in CR */
   181			}
   182		}
   183	
   184		if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
   185			if (ti_flags & _TIF_RESTOREALL)
   186				ret = _TIF_RESTOREALL;
   187			else
   188				regs->gpr[3] = r3;
   189			clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
   190		} else {
   191			regs->gpr[3] = r3;
   192		}
   193	
   194		if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
   195			ret |= _TIF_RESTOREALL;
   196		}
   197	
   198	again:
   199		syscall_exit_to_user_mode(regs);
   200	
   201		user_enter_irqoff();
   202		if (!prep_irq_for_enabled_exit(true)) {
   203			user_exit_irqoff();
   204			local_irq_enable();
   205			local_irq_disable();
   206			goto again;
   207		}
   208	
   209		/* Restore user access locks last */
   210		kuap_user_restore(regs);
   211	
 > 212		if (unlikely((local_paca->generic_fw_flags & GFW_RESTORE_ALL) == GFW_RESTORE_ALL)) {
   213			ret |= _TIF_RESTOREALL;
   214			local_paca->generic_fw_flags &= ~GFW_RESTORE_ALL;
   215		}
   216	#ifdef CONFIG_PPC64
   217		regs->exit_result = ret;
   218	#endif
   219	
   220		return ret;
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
