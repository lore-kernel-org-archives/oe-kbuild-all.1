Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF610963
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqMlJJHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699368035; x=1730904035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7uhZxNi87zSjledx5NI5ZHjd67i3bXzQV22z4XKYpzE=;
  b=NqMlJJHKyN7Yq0SjENbHjJT4gLJDISiuku+ZJ2ltd2llzQJzz9vqK399
   r3T1SP+eXg3hNP27fTvIKuB+DMOaFjE5Erhw2X1w+sIQhNQjbfeE9Zwar
   LgYoUnly4pl9IBKQUNX78HRQ4bjWEl+vqDqx+3yFTO3dZdk7sy8rSWHKf
   huijXbEMPiQE85U4w6O6OsiXsUkQCqM9geahYABiSoJF5vegme91Cot1P
   WyEzirbl9tXBYAFRI/cb9z+araV2ElGNJXpxDxrJzHthdEtNbrMm9dzWM
   sTXfNrfRPRKEOdKchW9rLO3Z/2oi5fpAd3+W3vhY+/2KbE/e3+QZfDXb5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2458206"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2458206"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 06:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="3813068"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2023 06:40:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0NFl-00079o-2E;
	Tue, 07 Nov 2023 14:40:29 +0000
Date: Tue, 7 Nov 2023 22:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 26/35]
 kernel/trace/fgraph.c:724:32: error: implicit declaration of function
 'ftrace_regs_return_value'; did you mean 'ftrace_regs_set_return_value'?
Message-ID: <202311072215.1M1lrGmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   7db6d2fcd150e3e6fca2c26833f7d09663cbf033
commit: 09b352e29fc2c7fb1cc43596838bfd47102cd13d [26/35] function_graph: Add a new exit handler with parent_ip and ftrace_regs
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311072215.1M1lrGmj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072215.1M1lrGmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072215.1M1lrGmj-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/fgraph.c: In function 'fgraph_call_retfunc':
>> kernel/trace/fgraph.c:724:32: error: implicit declaration of function 'ftrace_regs_return_value'; did you mean 'ftrace_regs_set_return_value'? [-Werror=implicit-function-declaration]
     724 |                 trace.retval = ftrace_regs_return_value(fregs);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                ftrace_regs_set_return_value
   cc1: some warnings being treated as errors


vim +724 kernel/trace/fgraph.c

   709	
   710	static void fgraph_call_retfunc(struct ftrace_regs *fregs,
   711					struct fgraph_ret_regs *ret_regs,
   712					struct ftrace_ret_stack *ret_stack,
   713					struct fgraph_ops *gops)
   714	{
   715		struct ftrace_graph_ret trace;
   716	
   717		trace.func = ret_stack->func;
   718		trace.calltime = ret_stack->calltime;
   719		trace.overrun = atomic_read(&current->trace_overrun);
   720		trace.depth = current->curr_ret_depth;
   721		trace.rettime = trace_clock_local();
   722	#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
   723		if (fregs)
 > 724			trace.retval = ftrace_regs_return_value(fregs);
   725		else
   726			trace.retval = fgraph_ret_regs_return_value(ret_regs);
   727	#endif
   728		gops->retfunc(&trace, gops);
   729	}
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
