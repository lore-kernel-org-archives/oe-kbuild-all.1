Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA957464
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKkc8ind"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697382913; x=1728918913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ev8ODZm7Oik/0AiGxqFrvS5qjwy977e5kSRudzs3gvg=;
  b=MKkc8ind+KWhLCLaQSSowCUOSfnboou144S90gZC94glE4rxc4uEqLOS
   X1bWRdI9UioVsEjVu0E6DkWWMIlIFUfojsaeC0Jua50+PGX1Rkdbc19GR
   lIu1UXDmPyDGJ4wyu6pdj0Vh2gl/rS1YpFn7/IJlTJNaSdkHx+JovmzhR
   +2ivDrgLjvWFuKnyvqN72ejm6tMLlZpoDrXBQCkSnKM/VUGw0IYIkxWu8
   qSBCzSJci19SeA+WojTUfNX/qCqVbUDq3Ali+k6qqQlUZyLiJn5BM1aC4
   4xQvyja84YMcdGTDga+6N0duTJAwes39Z8l0MbYs0ax8leFI4bkxFeswk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6962278"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6962278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 08:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825700292"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="825700292"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 08:15:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs2pg-0007W3-2T;
	Sun, 15 Oct 2023 15:15:08 +0000
Date: Sun, 15 Oct 2023 23:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [mhiramat:topic/fgraph-multi 4/15] kernel/trace/fgraph.c:491:34:
 warning: variable 'ret_stack' set but not used
Message-ID: <202310152338.dita7rK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   f89a72328944cb3136c9c44850970a9c8cc7021a
commit: 49747e3c4191db0faa25fe527d5e8406fc76419d [4/15] function_graph: Allow multiple users to attach to function graph
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310152338.dita7rK5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310152338.dita7rK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152338.dita7rK5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/fgraph.c: In function '__ftrace_return_to_handler':
>> kernel/trace/fgraph.c:491:34: warning: variable 'ret_stack' set but not used [-Wunused-but-set-variable]
     491 |         struct ftrace_ret_stack *ret_stack;
         |                                  ^~~~~~~~~


vim +/ret_stack +491 kernel/trace/fgraph.c

   483	
   484	/*
   485	 * Send the trace to the ring-buffer.
   486	 * @return the original return address.
   487	 */
   488	static unsigned long __ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs,
   489							unsigned long frame_pointer)
   490	{
 > 491		struct ftrace_ret_stack *ret_stack;
   492		struct ftrace_graph_ret trace;
   493		unsigned long ret;
   494		int offset;
   495		int index;
   496		int idx;
   497		int i;
   498	
   499		ret_stack = ftrace_pop_return_trace(&trace, &ret, frame_pointer);
   500	
   501		if (unlikely(!ret)) {
   502			ftrace_graph_stop();
   503			WARN_ON(1);
   504			/* Might as well panic. What else to do? */
   505			return (unsigned long)panic;
   506		}
   507	
   508		trace.rettime = trace_clock_local();
   509	#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
   510		trace.retval = fgraph_ret_regs_return_value(ret_regs);
   511	#endif
   512	
   513		offset = current->curr_ret_stack - 1;
   514		index = get_ret_stack_index(current, offset);
   515	
   516		/* index has to be at least one! Optimize for it */
   517		i = 0;
   518		do {
   519			idx = get_fgraph_array(current, offset - i);
   520			fgraph_array[idx]->retfunc(&trace);
   521			i++;
   522		} while (i < index);
   523	
   524		/*
   525		 * The ftrace_graph_return() may still access the current
   526		 * ret_stack structure, we need to make sure the update of
   527		 * curr_ret_stack is after that.
   528		 */
   529		barrier();
   530		current->curr_ret_stack -= index + FGRAPH_RET_INDEX;
   531		current->curr_ret_depth--;
   532		return ret;
   533	}
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
