Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26B168488
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725090416; cv=none; b=Gir9KoL/R5BSOhMfAqd/kWM1ood4AiTyf5b6uPup2pYwsfnevDjOFqLXjdXdZJ1+KFOmF2LNV56z8vJESqgXlEqvUFGjUnYleUCQWpBYLw1TUXowTgnTp/mR1tUiI7utCleVDZLkSW0m+YDGPmE7hifYNTtV34xzhH0nUBmSsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725090416; c=relaxed/simple;
	bh=rJxovcKRrdfwbfQXC6CPex0R107RjfKFV15MDYhFcJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgPVIzuDVl8wMapZ/yFQPrpdE3ZORi+hyN7uEvc4yfS2RkjVviXOlXxXTwQMLJ5ySl/d4RO+VU0wyu2r1BzQpcywVwBK9wFpUL7xRwUSXLUTP8Ib0dYsd6P+ywfo0FJsi+ydNV6pQMZSLNqD7AMRabD1kSLWMxPbNoRuphoL8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksGNK17e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksGNK17e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725090414; x=1756626414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rJxovcKRrdfwbfQXC6CPex0R107RjfKFV15MDYhFcJ8=;
  b=ksGNK17eXhgatJz/Z/+smjtJJLzw496bnVNoCgZkdlockkfntnoIwKvb
   eJFEB9VNPrReKbUsHHgcjMo/m9TbE2KdjzpOSNN3WP7FSsxYxIvuwmbdX
   koY0fpWxy8G240L1dPLgFCaGitXnWVnrb6FXVnppStX6VWI/jCU/obE96
   gevl6QBBm+APAEyWxfRkRTFezHqATtXycPyaI4oPtq+kZDlxlwZE2ZVSK
   CjzEkCW6Rhbo2lCxpOngo6NyLWr9bRX/yuJzI7llIY0EabQKTzbbg3MIU
   /q4I2AIM2aJTVOO5JH/1z66ZpqCb09t2LT2lStP08/wA5ZS9IuG+KY82o
   g==;
X-CSE-ConnectionGUID: hgC9vwz5ROmMLjWxIofTJA==
X-CSE-MsgGUID: YCDbe8IcRmCDjeq5+RClKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23316046"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23316046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 00:46:52 -0700
X-CSE-ConnectionGUID: GZj8PqvbS+yT7UzLbTp8tw==
X-CSE-MsgGUID: qjsMBEbqRCiLSqhqVmFj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64471783"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 00:46:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skIoq-0002RA-25;
	Sat, 31 Aug 2024 07:46:48 +0000
Date: Sat, 31 Aug 2024 15:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 5522/23944]
 drivers/bytedance/trace_irqoff.c:41: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202408311537.Xyxw9p3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: bf331344145b453af2717206a21b29cfb6f862fb [5522/23944] bytedance: driver: trace_irqoff: Add trace_irqoff driver
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240831/202408311537.Xyxw9p3r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311537.Xyxw9p3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311537.Xyxw9p3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bytedance/trace_irqoff.c:41: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Default sampling period is 10000000ns. The minimum value is 1000000ns.
   drivers/bytedance/trace_irqoff.c:46: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * How many times should we record the stack trace.
>> drivers/bytedance/trace_irqoff.c:116: warning: Function parameter or member 'regs' not described in 'save_trace'
>> drivers/bytedance/trace_irqoff.c:116: warning: Function parameter or member 'hardirq' not described in 'save_trace'
>> drivers/bytedance/trace_irqoff.c:116: warning: Function parameter or member 'latency' not described in 'save_trace'
>> drivers/bytedance/trace_irqoff.c:116: warning: expecting prototype for Note(). Prototype was for save_trace() instead


vim +41 drivers/bytedance/trace_irqoff.c

    39	
    40	/**
  > 41	 * Default sampling period is 10000000ns. The minimum value is 1000000ns.
    42	 */
    43	static u64 sampling_period = 10 * 1000 * 1000UL;
    44	
    45	/**
    46	 * How many times should we record the stack trace.
    47	 * Default is 50000000ns.
    48	 */
    49	static u64 trace_irqoff_latency = 50 * 1000 * 1000UL;
    50	
    51	struct irqoff_trace {
    52		unsigned int nr_entries;
    53		unsigned long *entries;
    54	};
    55	
    56	struct stack_trace_metadata {
    57		u64 last_timestamp;
    58		unsigned long nr_irqoff_trace;
    59		struct irqoff_trace trace[MAX_STACE_TRACE_ENTRIES];
    60		unsigned long nr_entries;
    61		unsigned long entries[MAX_TRACE_ENTRIES];
    62		unsigned long latency_count[MAX_LATENCY_RECORD];
    63	
    64		/* Task command names*/
    65		char comms[MAX_STACE_TRACE_ENTRIES][TASK_COMM_LEN];
    66	
    67		/* Task pids*/
    68		pid_t pids[MAX_STACE_TRACE_ENTRIES];
    69	
    70		struct {
    71			u64 nsecs:63;
    72			u64 more:1;
    73		} latency[MAX_STACE_TRACE_ENTRIES];
    74	};
    75	
    76	struct per_cpu_stack_trace {
    77		struct timer_list timer;
    78		struct hrtimer hrtimer;
    79		struct stack_trace_metadata hardirq_trace;
    80		struct stack_trace_metadata softirq_trace;
    81	
    82		bool softirq_delayed;
    83	};
    84	
    85	static struct per_cpu_stack_trace __percpu *cpu_stack_trace;
    86	
    87	static unsigned int (*stack_trace_save_skip_hardirq)(struct pt_regs *regs,
    88							     unsigned long *store,
    89							     unsigned int size,
    90							     unsigned int skipnr);
    91	
    92	static inline void stack_trace_skip_hardirq_init(void)
    93	{
    94		stack_trace_save_skip_hardirq = (void *)kallsyms_lookup_name("stack_trace_save_regs");
    95	}
    96	
    97	static inline void store_stack_trace(struct pt_regs *regs,
    98					     struct irqoff_trace *trace,
    99					     unsigned long *entries,
   100					     unsigned int max_entries, int skip)
   101	{
   102		trace->entries = entries;
   103		if (regs && stack_trace_save_skip_hardirq)
   104			trace->nr_entries = stack_trace_save_skip_hardirq(regs, entries,
   105									  max_entries,
   106									  skip);
   107		else
   108			trace->nr_entries = stack_trace_save(entries, max_entries,
   109							     skip);
   110	}
   111	
   112	/**
   113	 * Note: Must be called with irq disabled.
   114	 */
   115	static bool save_trace(struct pt_regs *regs, bool hardirq, u64 latency)
 > 116	{
   117		unsigned long nr_entries, nr_irqoff_trace;
   118		struct irqoff_trace *trace;
   119		struct stack_trace_metadata *stack_trace;
   120	
   121		stack_trace = hardirq ? this_cpu_ptr(&cpu_stack_trace->hardirq_trace) :
   122			      this_cpu_ptr(&cpu_stack_trace->softirq_trace);
   123	
   124		nr_irqoff_trace = stack_trace->nr_irqoff_trace;
   125		if (unlikely(nr_irqoff_trace >= MAX_STACE_TRACE_ENTRIES))
   126			return false;
   127	
   128		nr_entries = stack_trace->nr_entries;
   129		if (unlikely(nr_entries >= MAX_TRACE_ENTRIES - 1))
   130			return false;
   131	
   132		strlcpy(stack_trace->comms[nr_irqoff_trace], current->comm,
   133			TASK_COMM_LEN);
   134		stack_trace->pids[nr_irqoff_trace] = current->pid;
   135		stack_trace->latency[nr_irqoff_trace].nsecs = latency;
   136		stack_trace->latency[nr_irqoff_trace].more = !hardirq && regs;
   137	
   138		trace = stack_trace->trace + nr_irqoff_trace;
   139		store_stack_trace(regs, trace, stack_trace->entries + nr_entries,
   140				  MAX_TRACE_ENTRIES - nr_entries, 0);
   141		stack_trace->nr_entries += trace->nr_entries;
   142	
   143		/**
   144		 * Ensure that the initialisation of @trace is complete before we
   145		 * update the @nr_irqoff_trace.
   146		 */
   147		smp_store_release(&stack_trace->nr_irqoff_trace, nr_irqoff_trace + 1);
   148	
   149		if (unlikely(stack_trace->nr_entries >= MAX_TRACE_ENTRIES - 1)) {
   150			pr_info("BUG: MAX_TRACE_ENTRIES too low!");
   151	
   152			return false;
   153		}
   154	
   155		return true;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
