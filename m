Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C967F361DAB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980066; cv=none; b=hozBrqYd40VlaaDBFD4BoRxs3FZeaL5Ce5pFjEry63f5URZtRP9ttIc2QhRzI5sawAMfTlq+ILrCn1r190DA9kliv0x1+slGKKjH5kDyX5UJ2wpO81pwba/Du0tvH8L/bDcCk1bi81WEEC1tejjxaeyEFvAbc68yX5U1391Jc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980066; c=relaxed/simple;
	bh=vPW7bmgp9TKGvRqXb7MjCPdD1SZg8pl8fg0oxlGP8Hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DUdzfLFYaEla0CdZsYjsCsT/jzPwOZZVb4xmz0lhSLx1FGDOiV1M92esbmLxYoDoXVkMIQZRrMkEVAd0Zl4ee6WT0Bi++X18MFViEMt7F9x2WFZPIkih0WKOaACmnu4X/Q32AhS/a66JqArll0Xuv3aLSzcafbCtKxCCDewqzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDkadnAF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDkadnAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783980064; x=1815516064;
  h=date:from:to:cc:subject:message-id;
  bh=vPW7bmgp9TKGvRqXb7MjCPdD1SZg8pl8fg0oxlGP8Hg=;
  b=CDkadnAF53McAGdEiI5JDgjFYJz7Bm5x4n6uoGCN8JvI19/FqSpstnLH
   KXU595uOh+wNpSIisomfrIFHAlC7Lff8w92Dg9HgpIcukYMQ3vKtjjSms
   wa5Lu2NXfghspTvJVYMOOLip9FjNZeRGb0VBuStcw+42DR66WWa2XrdAN
   bW60/824PpefgT/u/2EdSiGa0XiQDFIcdr5H40iO7oR9hxH0+SXN5fvzm
   XlUv7/PKlFhAH+J0EFjCniofb7Uijexee1R/XPVEkPu42iRC2hx5V+GK3
   PkD6WkvhmkgRVVEU+BOzXS4VkbLgcR8Zv1cMPxRSWj5w4hXrpuuq2fYgZ
   w==;
X-CSE-ConnectionGUID: IziS0M/jRgWHcPEf4qKozA==
X-CSE-MsgGUID: 6tkFBVmiS3yGvENkJgWfIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84790407"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84790407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 15:01:04 -0700
X-CSE-ConnectionGUID: aR7KETmVSDa6rD8ASVYL4A==
X-CSE-MsgGUID: +A3J2ys8Sr2JMxOVYcaPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278935645"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 15:01:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjOhr-00000000M6N-0ukl;
	Mon, 13 Jul 2026 22:00:56 +0000
Date: Tue, 14 Jul 2026 05:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:probes/core 21/21] kernel/trace/trace_probe.c:361:14:
 warning: variable 'is_ptr' set but not used
Message-ID: <202607140501.lOrT6KpG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/core
head:   744d07442f343166a6eaee73361b039fa9ec5b7f
commit: 744d07442f343166a6eaee73361b039fa9ec5b7f [21/21] tracing/probes: Eliminate recursion in parse_probe_arg()
config: i386-randconfig-141-20260714 (https://download.01.org/0day-ci/archive/20260714/202607140501.lOrT6KpG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140501.lOrT6KpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140501.lOrT6KpG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_probe.c: In function 'parse_this_cpu':
>> kernel/trace/trace_probe.c:361:14: warning: variable 'is_ptr' set but not used [-Wunused-but-set-variable]
     361 |         bool is_ptr = false;
         |              ^~~~~~


vim +/is_ptr +361 kernel/trace/trace_probe.c

2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  353) 
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  354) static int
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  355) parse_probe_arg(char *arg, const struct fetch_type *type,
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  356) 		struct fetch_insn **pcode, struct fetch_insn *end,
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  357) 		struct traceprobe_parse_context *ctx);
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  358) 
744d07442f3431 Masami Hiramatsu          2026-07-13  359  static int parse_this_cpu(char *arg, struct traceprobe_parse_context *ctx)
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  360) {
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02 @361) 	bool is_ptr = false;
744d07442f3431 Masami Hiramatsu          2026-07-13  362  	bool is_read = false;
744d07442f3431 Masami Hiramatsu          2026-07-13  363  	char *tmp;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  364) 
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  365) 	/*
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  366) 	 * This is only for kernel probes, excluding eprobe, because per-cpu
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  367) 	 * pointer should not be recorded by events.
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  368) 	 */
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  369) 	if (!(ctx->flags & TPARG_FL_KERNEL) ||
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  370) 	    (ctx->flags & TPARG_FL_TEVENT)) {
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  371) 		trace_probe_log_err(ctx->offset, NOSUP_PERCPU);
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  372) 		return -EINVAL;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  373) 	}
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  374) 	if (str_has_prefix(arg, THIS_CPU_PTR_PREFIX)) {
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  375) 		arg += THIS_CPU_PTR_LEN;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  376) 		ctx->offset += THIS_CPU_PTR_LEN;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  377) 		is_ptr = true;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  378) 	} else if (str_has_prefix(arg, THIS_CPU_READ_PREFIX)) {
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  379) 		arg += THIS_CPU_READ_LEN;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  380) 		ctx->offset += THIS_CPU_READ_LEN;
744d07442f3431 Masami Hiramatsu          2026-07-13  381  		is_read = true;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  382) 	} else
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  383) 		return -EINVAL;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  384) 
744d07442f3431 Masami Hiramatsu          2026-07-13  385  	tmp = strrchr(arg, ')');
744d07442f3431 Masami Hiramatsu          2026-07-13  386  	if (!tmp) {
744d07442f3431 Masami Hiramatsu          2026-07-13  387  		trace_probe_log_err(ctx->offset + strlen(arg),
744d07442f3431 Masami Hiramatsu          2026-07-13  388  					DEREF_OPEN_BRACE);
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  389) 		return -EINVAL;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  390) 	}
744d07442f3431 Masami Hiramatsu          2026-07-13  391  	*tmp = '\0';
744d07442f3431 Masami Hiramatsu          2026-07-13  392  
744d07442f3431 Masami Hiramatsu          2026-07-13  393  	ctx->stack[ctx->depth].type = STATE_DEREF;
744d07442f3431 Masami Hiramatsu          2026-07-13  394  	ctx->stack[ctx->depth].deref.deref = FETCH_OP_CPU_PTR;
744d07442f3431 Masami Hiramatsu          2026-07-13  395  	ctx->stack[ctx->depth].deref.offset = 0;
744d07442f3431 Masami Hiramatsu          2026-07-13  396  	ctx->stack[ctx->depth].deref.cur_offs = ctx->offset;
744d07442f3431 Masami Hiramatsu          2026-07-13  397  	ctx->stack[ctx->depth].deref.inner_arg = arg;
744d07442f3431 Masami Hiramatsu          2026-07-13  398  	ctx->stack[ctx->depth].deref.is_cpu_read = is_read;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  399) 	return 0;
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  400) }
2c84fb76749e66 Masami Hiramatsu (Google  2026-07-02  401) 

:::::: The code at line 361 was first introduced by commit
:::::: 2c84fb76749e66bfd95259930c8ed7bc29633aca tracing/probes: Add this_cpu_read() and this_cpu_ptr() dereference method to fetcharg

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
