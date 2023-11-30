Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B13C696
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM37oxZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701345179; x=1732881179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erHcKxKvKNGdLbjJN5W+zkSgSAEKrnaZ+KztAnWkLB4=;
  b=cM37oxZNY4hH3GfzlzoI/RnqdQ3OimiCdkumLHk3YNt/HbRC9M1kDuKm
   xtzL6qhnvbVa/fPA4vFAYLaXhTTF5vbr/cnT0zrMDDVrrZ3xXAdmMkWnM
   5BUmXjyZWUgGw7CqNwghK2BFFseQWxqMGBKkAZiU+Zs3rROXzbO1TP/Bd
   ZSTgrHY6DkC0oesCGQQwEZ7ynupes5EIvVekQLEm6AGObbc1RCFzSfYwN
   04G53e8IOYAekTRB6oBGjDamHb6FWYhoSkDGJjdlh41CM/2Ql8/gI7tfy
   P+I+hVpVIenkYQJEtK4HAabqVl6G1mrCwioTw80vyD3Xmahta3Bw4V2Mk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372691976"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="372691976"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100918756"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="1100918756"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2023 03:52:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8fbB-0001o2-2q;
	Thu, 30 Nov 2023 11:52:54 +0000
Date: Thu, 30 Nov 2023 19:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: kernel/trace/fgraph.c:253: warning: Function parameter or member
 'retp' not described in 'ftrace_graph_ret_addr'
Message-ID: <202311301937.UkV28E7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 76b42b63ed0d004961097d3a3cd979129d4afd26 function_graph: Move ftrace_graph_ret_addr() to fgraph.c
date:   5 years ago
config: i386-buildonly-randconfig-006-20231101 (https://download.01.org/0day-ci/archive/20231130/202311301937.UkV28E7f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301937.UkV28E7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301937.UkV28E7f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/fgraph.c:209:15: warning: no previous prototype for 'ftrace_return_to_handler' [-Wmissing-prototypes]
     209 | unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:303:6: warning: no previous prototype for 'ftrace_graph_sleep_time_control' [-Wmissing-prototypes]
     303 | void ftrace_graph_sleep_time_control(bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:308:5: warning: no previous prototype for 'ftrace_graph_entry_stub' [-Wmissing-prototypes]
     308 | int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:315:25: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct pt_regs *)' to 'void (*)(struct ftrace_graph_ret *)' [-Wcast-function-type]
     315 |                         (trace_func_graph_ret_t)ftrace_stub;
         |                         ^
   kernel/trace/fgraph.c: In function 'unregister_ftrace_graph':
   kernel/trace/fgraph.c:595:31: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct pt_regs *)' to 'void (*)(struct ftrace_graph_ret *)' [-Wcast-function-type]
     595 |         ftrace_graph_return = (trace_func_graph_ret_t)ftrace_stub;
         |                               ^
   kernel/trace/fgraph.c:253: warning: Function parameter or member 'task' not described in 'ftrace_graph_ret_addr'
   kernel/trace/fgraph.c:253: warning: Function parameter or member 'idx' not described in 'ftrace_graph_ret_addr'
   kernel/trace/fgraph.c:253: warning: Function parameter or member 'ret' not described in 'ftrace_graph_ret_addr'
>> kernel/trace/fgraph.c:253: warning: Function parameter or member 'retp' not described in 'ftrace_graph_ret_addr'


vim +253 kernel/trace/fgraph.c

   234	
   235	/**
   236	 * ftrace_graph_ret_addr - convert a potentially modified stack return address
   237	 *			   to its original value
   238	 *
   239	 * This function can be called by stack unwinding code to convert a found stack
   240	 * return address ('ret') to its original value, in case the function graph
   241	 * tracer has modified it to be 'return_to_handler'.  If the address hasn't
   242	 * been modified, the unchanged value of 'ret' is returned.
   243	 *
   244	 * 'idx' is a state variable which should be initialized by the caller to zero
   245	 * before the first call.
   246	 *
   247	 * 'retp' is a pointer to the return address on the stack.  It's ignored if
   248	 * the arch doesn't have HAVE_FUNCTION_GRAPH_RET_ADDR_PTR defined.
   249	 */
   250	#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
   251	unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
   252					    unsigned long ret, unsigned long *retp)
 > 253	{
   254		int index = task->curr_ret_stack;
   255		int i;
   256	
   257		if (ret != (unsigned long)return_to_handler)
   258			return ret;
   259	
   260		if (index < 0)
   261			return ret;
   262	
   263		for (i = 0; i <= index; i++)
   264			if (task->ret_stack[i].retp == retp)
   265				return task->ret_stack[i].ret;
   266	
   267		return ret;
   268	}
   269	#else /* !HAVE_FUNCTION_GRAPH_RET_ADDR_PTR */
   270	unsigned long ftrace_graph_ret_addr(struct task_struct *task, int *idx,
   271					    unsigned long ret, unsigned long *retp)
   272	{
   273		int task_idx;
   274	
   275		if (ret != (unsigned long)return_to_handler)
   276			return ret;
   277	
   278		task_idx = task->curr_ret_stack;
   279	
   280		if (!task->ret_stack || task_idx < *idx)
   281			return ret;
   282	
   283		task_idx -= *idx;
   284		(*idx)++;
   285	
   286		return task->ret_stack[task_idx].ret;
   287	}
   288	#endif /* HAVE_FUNCTION_GRAPH_RET_ADDR_PTR */
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
