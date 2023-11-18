Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0619451
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLqW1F3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700340099; x=1731876099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SNOxp2VKi69QamJfV6FHH/Q0V+/45fY4L6p3Mwj1vf0=;
  b=QLqW1F3IBxaISXlcCkcz8rbiTn57eUDZGztlo0IzrcYV/SUgSZtX15dt
   bZz+KuqtaI2AsBkuXWlhzL2gZBdFqPPlRYaJwuj0GIRwPGW1z0+i7W6Ca
   e2dJvWXJ/vDSOoItos5weJbF/jmniCIpnjPWl9BNhAQJzJgWg8u/wCRvI
   FhcuziwleFrZuwXe0+5nRFX4nBgZHrD1aCNU3D9DwT4vxlyHWrh1cZRFk
   wkGAGzrM4vaFb/gS3Na9Yx3Hrd/k3rKFstQ3GS1/Zh81Z/a8X7jpaGXWb
   Xk//WIg1+pCfY7SMZ8HHC42HqhcpSskq1vzT3kuUSzK6FgUhXHjkSWJ6s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="477670337"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="477670337"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 12:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="742376792"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="742376792"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Nov 2023 12:41:35 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4S8D-0004GV-1o;
	Sat, 18 Nov 2023 20:41:33 +0000
Date: Sun, 19 Nov 2023 04:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: qiwuchen55@gmail.com, catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chenqiwu <qiwu.chen@transsion.com>
Subject: Re: [PATCH] arm64: Add user stacktrace support
Message-ID: <202311190405.QUvoF0b3-lkp@intel.com>
References: <20231118134504.154842-1-qiwu.chen@transsion.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118134504.154842-1-qiwu.chen@transsion.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/qiwuchen55-gmail-com/arm64-Add-user-stacktrace-support/20231118-214756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231118134504.154842-1-qiwu.chen%40transsion.com
patch subject: [PATCH] arm64: Add user stacktrace support
config: arm64-randconfig-r071-20231119 (https://download.01.org/0day-ci/archive/20231119/202311190405.QUvoF0b3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190405.QUvoF0b3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190405.QUvoF0b3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/stacktrace.c:393: warning: expecting prototype for stack_trace_save_user(). Prototype was for arch_stack_walk_user() instead


vim +393 arch/arm64/kernel/stacktrace.c

   384	
   385	/**
   386	 * stack_trace_save_user - Save user space stack traces into a storage array
   387	 * @consume_entry: Callback for save a user space stack trace
   388	 * @cookie:	Caller supplied pointer handed back by arch_stack_walk()
   389	 * @regs: The pt_regs pointer of current task
   390	 */
   391	void arch_stack_walk_user(stack_trace_consume_fn consume_entry, void *cookie,
   392				  const struct pt_regs *regs)
 > 393	{
   394		struct stack_frame_user frame;
   395		struct vm_area_struct *vma;
   396		unsigned long userstack_start, userstack_end;
   397		struct task_struct *tsk = current;
   398	
   399		/* TODO: support stack unwind for compat user mode */
   400		if (!regs || !user_mode(regs) || compat_user_mode(regs))
   401			return;
   402	
   403		userstack_start = regs->user_regs.sp;
   404		vma = find_user_stack_vma(tsk, userstack_start);
   405		if (!vma)
   406			return;
   407	
   408		userstack_end = vma->vm_end;
   409		frame.fp = regs->user_regs.regs[29];
   410		frame.sp = userstack_start;
   411		frame.pc = regs->user_regs.pc;
   412	
   413		while (1) {
   414			unsigned long where = frame.pc;
   415	
   416			/* Sanity check: ABI requires pc to be aligned 4 bytes. */
   417			if (!where || where & 0x3)
   418				break;
   419			if (!consume_entry(cookie, where))
   420				break;
   421			if (arch_unwind_user_frame(tsk, userstack_end, &frame) < 0)
   422				break;
   423		}
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
