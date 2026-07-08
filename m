Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06703C9437
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498596; cv=none; b=jO9xfIFNxswjjUGfXPQMvPVHshxoCK4JcDtlPVnF95iLLf2uzcfhm4KQhIFe88F5NtuWPkhN1+mZI+Cm4ckxHY3Vr8yxm5UrJG6EwATbQZrCrZIuKzK0KKd5cSQ4/35c/Y65z7SdnrtDD9bpia6v5lNOoY/IuALza9dPtTOKOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498596; c=relaxed/simple;
	bh=Vlk9zgTQCJh7B+InWOX98APYQ9g3LI2B+CY4yY6KhAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YWr18/1u9oQADbpwdmKwYgbERybntjM0GKc5jHT3aJ9Uw2X491gSsbExRPKAag//YpXmv9RDMF9PwknXxnZm/zUpGwnT3rWKKYr/ibJ3lLO7zflQ+325blR9GeRWKwyHptYxziZa83RfpwVJArgK31FmeFBfZza4Vtlsfg4ix1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaXwRwhI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaXwRwhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783498594; x=1815034594;
  h=date:from:to:cc:subject:message-id;
  bh=Vlk9zgTQCJh7B+InWOX98APYQ9g3LI2B+CY4yY6KhAk=;
  b=eaXwRwhIg2S2GzU7aOeaI6UXfbtVgkK6ImlOFjcEQMwRiJQeQ1eaVlYw
   lv93p7oQKuXqga5KbkewAx7eyIMGjF32bx10jfGBL3QpRQWjR3AaGu22j
   6Si9Acic4TKuvJTj8vTPRWa1vOfzSFrVPwCMvrUiiRJabLsqJZZL1rgcW
   gPPg359wtL8AvDeep/CJMbr5qldg949WR0tBF+3W2C/ZQU8b4TwFjb93J
   9cXHlFXV0K6StMlN2B5Ir25OAOVBLjyvuYnvI8V7dJEh/1tVacryFBQKT
   fZCb/S75QGjdsb+fIDinPMEcbZorhqewFdJyK2T+WBF5KgkiR5h9tixtJ
   Q==;
X-CSE-ConnectionGUID: ZxMUkYOuTrGnxr5YIn/ElA==
X-CSE-MsgGUID: +fjnSbLxSSqW+OSgfh/FoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84128650"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84128650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:16:34 -0700
X-CSE-ConnectionGUID: eVMox2PrRxu9RurMkh+SZQ==
X-CSE-MsgGUID: mOOuXoSERkCmecqR9A2Omg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257803340"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Jul 2026 01:16:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whNRz-00000000G9t-1Box;
	Wed, 08 Jul 2026 08:16:14 +0000
Date: Wed, 08 Jul 2026 16:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:core/entry 2/3]
 include/linux/user-return-notifier.h:39:56: warning: 'struct task_struct'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202607081618.nuPYnSk5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   34ef6308418f138395a664bf9f5d80ace9825ac6
commit: 7fc04d7044aaa5ffe2afe78979fe6ddd5da24f10 [2/3] syscall_user_dispatch: Make it configurable in Kconfig
config: i386-buildonly-randconfig-006-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081618.nuPYnSk5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081618.nuPYnSk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081618.nuPYnSk5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/entry-common.h:6,
                    from include/linux/entry-common.h:5,
                    from kernel/entry/syscall_user_dispatch.c:6:
>> include/linux/user-return-notifier.h:39:56: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
      39 | static inline void propagate_user_return_notify(struct task_struct *prev,
         |                                                        ^~~~~~~~~~~
   include/linux/user-return-notifier.h:46:54: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
      46 | static inline void clear_user_return_notifier(struct task_struct *p) {}
         |                                                      ^~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/nospec-branch.h:10,
                    from arch/x86/include/asm/entry-common.h:8:
   arch/x86/include/asm/entry-common.h: In function 'arch_enter_from_user_mode':
   arch/x86/include/asm/processor.h:650:46: error: implicit declaration of function 'task_stack_page'; did you mean 'task_spread_page'? [-Wimplicit-function-declaration]
     650 |         unsigned long __ptr = (unsigned long)task_stack_page(task);     \
         |                                              ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/include/asm/entry-common.h:43:38: note: in expansion of macro 'task_pt_regs'
      43 |                 WARN_ON_ONCE(regs != task_pt_regs(current));
         |                                      ^~~~~~~~~~~~
   In file included from arch/x86/include/asm/switch_to.h:5,
                    from arch/x86/include/asm/stacktrace.h:14,
                    from arch/x86/include/asm/perf_event.h:721,
                    from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/irq-entry-common.h:9,
                    from include/linux/entry-common.h:8:
   include/linux/sched/task_stack.h: At top level:
   include/linux/sched/task_stack.h:21:30: error: conflicting types for 'task_stack_page'; have 'void *(const struct task_struct *)'
      21 | static __always_inline void *task_stack_page(const struct task_struct *task)
         |                              ^~~~~~~~~~~~~~~
   arch/x86/include/asm/processor.h:650:46: note: previous implicit declaration of 'task_stack_page' with type 'int()'
     650 |         unsigned long __ptr = (unsigned long)task_stack_page(task);     \
         |                                              ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/include/asm/entry-common.h:43:38: note: in expansion of macro 'task_pt_regs'
      43 |                 WARN_ON_ONCE(regs != task_pt_regs(current));
         |                                      ^~~~~~~~~~~~


vim +39 include/linux/user-return-notifier.h

7c68af6e32c739 Avi Kivity 2009-09-19  38  
7c68af6e32c739 Avi Kivity 2009-09-19 @39  static inline void propagate_user_return_notify(struct task_struct *prev,
7c68af6e32c739 Avi Kivity 2009-09-19  40  						struct task_struct *next)
7c68af6e32c739 Avi Kivity 2009-09-19  41  {
7c68af6e32c739 Avi Kivity 2009-09-19  42  }
7c68af6e32c739 Avi Kivity 2009-09-19  43  

:::::: The code at line 39 was first introduced by commit
:::::: 7c68af6e32c73992bad24107311f3433c89016e2 core, x86: Add user return notifiers

:::::: TO: Avi Kivity <avi@redhat.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
