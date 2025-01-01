Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68860746E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 01:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735695823; cv=none; b=i684F0ggTA/gOBwacTH6GfGgytl9uY4Bypma2oK0qY+K+StAWZvKGAoWLNTWuv/8m2Rox1HnCDtPh5bPzg5XU7yZ2GctIfPV9oDLB99nhmPlCEixK5cY0T9vYTRmM1roIDG5QUWVZBLlanmXQIdDuzbzOO3xY4S9qftMCgvWbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735695823; c=relaxed/simple;
	bh=O8SiFdrL5gDRtPnDyJxKwMAgScKqu59zg5hfXEJM0GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khwR0E8/QCL3+OvT5tNis7fTugE2371SwdEYAtE9bBGy/98S6zIJ5Zm6vyCrHkfWk6MfueFZLTrWWrVooTNIlqlCflb9ttsUOzNPJ4NhwN4Xm5jpKea+vX+1Zs3AI2F+vPs5HKfzFQdmDD9yC8RFac+ugS2yN4FEJHetsbPb/DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIufQbe5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIufQbe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735695821; x=1767231821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8SiFdrL5gDRtPnDyJxKwMAgScKqu59zg5hfXEJM0GQ=;
  b=GIufQbe5a0ACgy/bBlE+CxJj/pJZQ49Rup559i+6cVGgHwgB77JElbjM
   AO0awxjifh0n2EiSWwjz6GHC38dt1SrM1/ms9chOoxdFdWJ3gTqV3mZeK
   xpVjU5xcr8h1h3j26vyyF0eY1f7UmJus6A7jRbc1TT6LstImRCeFpiSAS
   ogFvBHN9n/j8+WPiCSpFjmqXRnD7gtafFCpCx3ZolEXJebah4nVe1+C8l
   /LlfIcqAiWPpoKYTpu0VllEagvmMgM65x4Eo6kAqjn65J3ogmvasqXZWD
   wr5s7gNK31ydsmMyX1So4EL7PkpLnKfNZEfFNjI5HaUZvJiBNED0e7+pR
   w==;
X-CSE-ConnectionGUID: yjLFL8CyQaiO0s3gtjboqw==
X-CSE-MsgGUID: SAIdkrEXTUiiQXlAV+cHLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35845444"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="35845444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 17:43:41 -0800
X-CSE-ConnectionGUID: /OISef7cQvuIVFrLy7n1KA==
X-CSE-MsgGUID: dPGfmbcFRUOxqjfH68NonQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132106052"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Dec 2024 17:43:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSnlp-0007Z9-1E;
	Wed, 01 Jan 2025 01:43:37 +0000
Date: Wed, 1 Jan 2025 09:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [jolsa-perf:tmp 3/5] kernel/trace/trace_functions_graph.c:908:23:
 warning: variable 'func' set but not used
Message-ID: <202501010959.yBqmoVAR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git tmp
head:   e2a63411ac4e1b7b36da9f4c2245570d92842d2e
commit: bbfdb6f3823d9d8d161544701d6e7f829a984ac3 [3/5] ftrace: Add support for function argument to graph tracer
config: csky-randconfig-001-20250101 (https://download.01.org/0day-ci/archive/20250101/202501010959.yBqmoVAR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010959.yBqmoVAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010959.yBqmoVAR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/ftrace.h:115,
                    from kernel/trace/trace_functions_graph.c:11:
   kernel/trace/trace_functions_graph.c: In function '__graph_entry':
>> include/linux/ftrace_regs.h:22:9: error: implicit declaration of function 'regs_get_kernel_argument'; did you mean 'regs_get_kernel_stack_nth'? [-Wimplicit-function-declaration]
      22 |         regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions_graph.c:139:42: note: in expansion of macro 'ftrace_regs_get_argument'
     139 |                         entry->args[i] = ftrace_regs_get_argument(fregs, i);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions_graph.c: In function 'print_graph_entry_leaf':
>> kernel/trace/trace_functions_graph.c:908:23: warning: variable 'func' set but not used [-Wunused-but-set-variable]
     908 |         unsigned long func;
         |                       ^~~~


vim +/func +908 kernel/trace/trace_functions_graph.c

a1be9ccc57f07d5 Donglin Peng             2023-04-08  894  
83a8df618eb04bd Frederic Weisbecker      2008-11-27  895  /* Case of a leaf function on its call entry */
287b6e68ca7209c Frederic Weisbecker      2008-11-26  896  static enum print_line_t
83a8df618eb04bd Frederic Weisbecker      2008-11-27  897  print_graph_entry_leaf(struct trace_iterator *iter,
b91facc367366b3 Frederic Weisbecker      2009-02-06  898  		struct ftrace_graph_ent_entry *entry,
d7a8d9e907cc294 Jiri Olsa                2010-04-02  899  		struct ftrace_graph_ret_entry *ret_entry,
d7a8d9e907cc294 Jiri Olsa                2010-04-02  900  		struct trace_seq *s, u32 flags)
fb52607afcd0629 Frederic Weisbecker      2008-11-25  901  {
2fbcdb35aca614f Steven Rostedt           2009-03-19  902  	struct fgraph_data *data = iter->private;
983f938ae695852 Steven Rostedt (Red Hat  2015-09-30  903) 	struct trace_array *tr = iter->tr;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  904  	struct ftrace_graph_ret *graph_ret;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  905  	struct ftrace_graph_ent *call;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  906  	unsigned long long duration;
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  907  	unsigned long ret_func;
4c57d0be528b125 Steven Rostedt           2024-08-13 @908  	unsigned long func;
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  909  	int args_size;
1fe4293f4b8de75 Changbin Du              2018-01-31  910  	int cpu = iter->cpu;
1a056155edd458e Frederic Weisbecker      2008-11-28  911  	int i;
fb52607afcd0629 Frederic Weisbecker      2008-11-25  912  
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  913  	args_size = iter->ent_size - offsetof(struct ftrace_graph_ent_entry, args);
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  914  
83a8df618eb04bd Frederic Weisbecker      2008-11-27  915  	graph_ret = &ret_entry->ret;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  916  	call = &entry->graph_ent;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  917  	duration = graph_ret->rettime - graph_ret->calltime;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  918  
4c57d0be528b125 Steven Rostedt           2024-08-13  919  	func = call->func + iter->tr->text_delta;
4c57d0be528b125 Steven Rostedt           2024-08-13  920  
2fbcdb35aca614f Steven Rostedt           2009-03-19  921  	if (data) {
f1c7f517a5dc23b Steven Rostedt           2010-02-26  922  		struct fgraph_cpu_data *cpu_data;
f1c7f517a5dc23b Steven Rostedt           2010-02-26  923  
f1c7f517a5dc23b Steven Rostedt           2010-02-26  924  		cpu_data = per_cpu_ptr(data->cpu_data, cpu);
2fbcdb35aca614f Steven Rostedt           2009-03-19  925  
2fbcdb35aca614f Steven Rostedt           2009-03-19  926  		/*
2fbcdb35aca614f Steven Rostedt           2009-03-19  927  		 * Comments display at + 1 to depth. Since
2fbcdb35aca614f Steven Rostedt           2009-03-19  928  		 * this is a leaf function, keep the comments
2fbcdb35aca614f Steven Rostedt           2009-03-19  929  		 * equal to this depth.
2fbcdb35aca614f Steven Rostedt           2009-03-19  930  		 */
f1c7f517a5dc23b Steven Rostedt           2010-02-26  931  		cpu_data->depth = call->depth - 1;
f1c7f517a5dc23b Steven Rostedt           2010-02-26  932  
f1c7f517a5dc23b Steven Rostedt           2010-02-26  933  		/* No need to keep this function around for this depth */
794de08a16cf1fc Steven Rostedt (Red Hat  2016-12-08  934) 		if (call->depth < FTRACE_RETFUNC_DEPTH &&
794de08a16cf1fc Steven Rostedt (Red Hat  2016-12-08  935) 		    !WARN_ON_ONCE(call->depth < 0))
f1c7f517a5dc23b Steven Rostedt           2010-02-26  936  			cpu_data->enter_funcs[call->depth] = 0;
2fbcdb35aca614f Steven Rostedt           2009-03-19  937  	}
2fbcdb35aca614f Steven Rostedt           2009-03-19  938  
ffeb80fc30acbf6 Jiri Olsa                2011-06-03  939  	/* Overhead and duration */
983f938ae695852 Steven Rostedt (Red Hat  2015-09-30  940) 	print_graph_duration(tr, duration, s, flags);
437f24fb897d409 Steven Rostedt           2008-11-26  941  
83a8df618eb04bd Frederic Weisbecker      2008-11-27  942  	/* Function */
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  943) 	for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  944) 		trace_seq_putc(s, ' ');
287b6e68ca7209c Frederic Weisbecker      2008-11-26  945  
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  946  	ret_func = graph_ret->func + iter->tr->text_delta;
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  947  
a1be9ccc57f07d5 Donglin Peng             2023-04-08  948  	/*
21e92806d39c68a Donglin Peng             2024-09-14  949  	 * Write out the function return value or return address
a1be9ccc57f07d5 Donglin Peng             2023-04-08  950  	 */
21e92806d39c68a Donglin Peng             2024-09-14  951  	if (flags & (__TRACE_GRAPH_PRINT_RETVAL | __TRACE_GRAPH_PRINT_RETADDR)) {
21e92806d39c68a Donglin Peng             2024-09-14  952  		print_graph_retval(s, entry, graph_ret,
21e92806d39c68a Donglin Peng             2024-09-14  953  				   (void *)graph_ret->func + iter->tr->text_delta,
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  954  				   flags, tr->trace_flags, args_size);
21e92806d39c68a Donglin Peng             2024-09-14  955  	} else {
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  956  		trace_seq_printf(s, "%ps", (void *)ret_func);
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  957  
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  958  		if (args_size >= FTRACE_REGS_MAX_ARGS * sizeof(long)) {
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  959  			print_function_args(s, entry->args, ret_func);
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  960  			trace_seq_putc(s, ';');
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  961  		} else
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  962  			trace_seq_puts(s, "();");
21e92806d39c68a Donglin Peng             2024-09-14  963  	}
bbfdb6f3823d9d8 Sven Schnelle            2024-12-23  964  	trace_seq_printf(s, "\n");
83a8df618eb04bd Frederic Weisbecker      2008-11-27  965  
1fe4293f4b8de75 Changbin Du              2018-01-31  966  	print_graph_irq(iter, graph_ret->func, TRACE_GRAPH_RET,
1fe4293f4b8de75 Changbin Du              2018-01-31  967  			cpu, iter->ent->pid, flags);
1fe4293f4b8de75 Changbin Du              2018-01-31  968  
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  969) 	return trace_handle_return(s);
83a8df618eb04bd Frederic Weisbecker      2008-11-27  970  }
83a8df618eb04bd Frederic Weisbecker      2008-11-27  971  

:::::: The code at line 908 was first introduced by commit
:::::: 4c57d0be528b1255abe61d8277f3213d4d22e85f tracing/fgraph: Have fgraph handle previous boot function addresses

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
