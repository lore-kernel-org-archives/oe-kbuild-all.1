Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3315A6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 03:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691207411; x=1722743411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9LC6Ems030i941y9wTYJfyBt3QDODWyS99RcLnj+OM=;
  b=hxDRCk/agzAXHcp9zCWQmo/ZdiXQSuJoZtnEKQeq7Wc+B31MXoZ2oosE
   rZZSSGXkL8lIhf+WYCKHiQG931hx5e7NGphMH6wgbZ5AOOc9OKk3LyeAv
   TEpsHPYMVjHrbra/EcxnfjCcj9PCPxWTaUFBXW8CydOv9jhCLxzBKqx3k
   gzxWrT1pXzBTPFvuJf10cw9P7EcGhhah/FCk/LfxAG5DqywPsrSr4lugy
   /UAiseoOa6Vv2DTNhefXEYUEb0D1jkmXliVg4HrKNcKQ+mXiktB5XQel9
   DFfsj5/yDkTwFH9TcYS1TSLLj2puni52/cmi45+aBGHyOHCtw7LsZusB7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401249135"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="401249135"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 20:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="795670350"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="795670350"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Aug 2023 20:50:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS8Ir-0003IF-10;
	Sat, 05 Aug 2023 03:50:09 +0000
Date: Sat, 5 Aug 2023 11:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 2/3] kernel/kprobes.c:2134:32:
 error: implicit declaration of function 'ftrace_get_regs'
Message-ID: <202308051129.wf2KLovu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   5a524ad2b9f37524f51bd16099d16814c3b624a1
commit: 5d93c6a3e4c0b1911bb29f888466aea92f1fae05 [2/3] fprobe: rethook: Use fprobe_regs in fprobe exit handler and rethook
config: x86_64-buildonly-randconfig-r003-20230731 (https://download.01.org/0day-ci/archive/20230805/202308051129.wf2KLovu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051129.wf2KLovu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051129.wf2KLovu-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kprobes.c: In function 'kretprobe_rethook_handler':
>> kernel/kprobes.c:2134:32: error: implicit declaration of function 'ftrace_get_regs' [-Werror=implicit-function-declaration]
    2134 |         struct pt_regs *regs = ftrace_get_regs(fregs);
         |                                ^~~~~~~~~~~~~~~
   kernel/kprobes.c:2134:32: warning: initialization of 'struct pt_regs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/rethook.c: In function 'arch_rethook_fixup_return':
>> arch/x86/kernel/rethook.c:111:32: error: implicit declaration of function 'ftrace_get_regs' [-Werror=implicit-function-declaration]
     111 |         struct pt_regs *regs = ftrace_get_regs(fregs);
         |                                ^~~~~~~~~~~~~~~
   arch/x86/kernel/rethook.c:111:32: warning: initialization of 'struct pt_regs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/x86/kernel/rethook.c: In function 'arch_rethook_prepare':
   arch/x86/kernel/rethook.c:121:32: warning: initialization of 'struct pt_regs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         struct pt_regs *regs = ftrace_get_regs(fregs);
         |                                ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   kernel/trace/rethook.c: In function 'rethook_trampoline_handler':
>> kernel/trace/rethook.c:298:9: error: implicit declaration of function 'ftrace_regs_set_instruction_pointer' [-Werror=implicit-function-declaration]
     298 |         ftrace_regs_set_instruction_pointer(fregs, correct_ret_addr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ftrace_get_regs +2134 kernel/kprobes.c

  2128	
  2129	static void kretprobe_rethook_handler(struct rethook_node *rh, void *data,
  2130					      unsigned long ret_addr,
  2131					      struct ftrace_regs *fregs)
  2132	{
  2133		struct kretprobe *rp = (struct kretprobe *)data;
> 2134		struct pt_regs *regs = ftrace_get_regs(fregs);
  2135		struct kretprobe_instance *ri;
  2136		struct kprobe_ctlblk *kcb;
  2137	
  2138		/* This is bug because this depends on HAVE_PT_REGS_COMPAT_FTRACE_REGS */
  2139		if (WARN_ON_ONCE(!regs))
  2140			return;
  2141	
  2142		/* The data must NOT be null. This means rethook data structure is broken. */
  2143		if (WARN_ON_ONCE(!data) || !rp->handler)
  2144			return;
  2145	
  2146		__this_cpu_write(current_kprobe, &rp->kp);
  2147		kcb = get_kprobe_ctlblk();
  2148		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
  2149	
  2150		ri = container_of(rh, struct kretprobe_instance, node);
  2151		rp->handler(ri, regs);
  2152	
  2153		__this_cpu_write(current_kprobe, NULL);
  2154	}
  2155	NOKPROBE_SYMBOL(kretprobe_rethook_handler);
  2156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
