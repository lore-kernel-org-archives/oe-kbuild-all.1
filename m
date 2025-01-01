Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C163CB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 01:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735695082; cv=none; b=AeFwkKpPtOKcGkvwoTdokJEodfTH+xo/mklZrtneKLvdpjBEijbE9URo0Sz/MYBGDtDUyxodrCpOGpWfqli5woNqeJ/+fhF65VC/KruwjJCs1/m4+y6xBtqA2p7jMyK5UNmiCmwqjoqyD6I3vOk4rHmZUDbeGZM64e/J1aTRrto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735695082; c=relaxed/simple;
	bh=of4tOU8pXi6GVOipUy4Blt9Td4pAAvjdr3nUHsmpniE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSbZf8VDE9IsIG0koPspMXgkI2U/2nfejHmV0xt5knhOKMSL5sHUuMKGJyd7bNReY8z0+xXaCF1kCgtUwqeReR9VGvjnGNLDlsA8rU23j6BycXOWLqKns952Las3cV6eEFMPHfJgpIIJk2NK3KWUs3KDX3Lp0bk63QtQ/gNOfjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhHGavl8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhHGavl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735695081; x=1767231081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=of4tOU8pXi6GVOipUy4Blt9Td4pAAvjdr3nUHsmpniE=;
  b=jhHGavl8IWBLNxbAUnvR+cX0kMiALgj13pkUGmO4ILt0aOMu18JirABG
   ipYQCMpRHwISINpJBvIRBmgI8TBxq9hhOnQhJat/fm8eJOojsQWY5LkbE
   EYADWx/VVOuIgnOfKMrxVdm9b3s2EN8ZXmQyFBezCAk2Pd4TQUKJtMdvk
   XCoti226gOQC7XGXsjEtIr1tJZmO7QFbB/8opqODFLMHrLFb+37bAmCZa
   NPsvxPQhZxnsymGxdy+bHVSMAA0G6oUFTbf7nbrl/q7mfwUPeClsliikc
   LvRqv8Fst0x9OEoRV3Fydg7+o2VXVNuMyJwi8e1uq+QEFrTiJc6gp8p6o
   w==;
X-CSE-ConnectionGUID: xJbYouGaQt6EP3SEBkf/BQ==
X-CSE-MsgGUID: EXRnwRISTaCs3mXq5Dh40Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35987070"
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="35987070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 17:31:19 -0800
X-CSE-ConnectionGUID: vwliMk10T1i4WAQwPrrejg==
X-CSE-MsgGUID: ot8sCdzORwankxXd/nY/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="101343093"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2024 17:31:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSnZr-0007Ym-01;
	Wed, 01 Jan 2025 01:31:15 +0000
Date: Wed, 1 Jan 2025 09:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [jolsa-perf:tmp 5/5] kernel/trace/trace_output.c:1110:26: error:
 'FTRACE_REGS_MAX_ARGS' undeclared
Message-ID: <202501010955.Js0ZSSjD-lkp@intel.com>
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
commit: e2a63411ac4e1b7b36da9f4c2245570d92842d2e [5/5] ftrace: Add arguments to function tracer
config: arc-randconfig-001-20250101 (https://download.01.org/0day-ci/archive/20250101/202501010955.Js0ZSSjD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010955.Js0ZSSjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010955.Js0ZSSjD-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_output.c: In function 'trace_fn_trace':
>> kernel/trace/trace_output.c:1110:26: error: 'FTRACE_REGS_MAX_ARGS' undeclared (first use in this function)
    1110 |         if (args_size >= FTRACE_REGS_MAX_ARGS * sizeof(long))
         |                          ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_output.c:1110:26: note: each undeclared identifier is reported only once for each function it appears in
--
   kernel/trace/trace.c: In function 'trace_function':
>> kernel/trace/trace.c:2907:17: error: 'FTRACE_REGS_MAX_ARGS' undeclared (first use in this function)
    2907 |         size += FTRACE_REGS_MAX_ARGS * !!fregs * sizeof(long);
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:2907:17: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/trace.c:2919:42: error: implicit declaration of function 'ftrace_regs_get_argument' [-Werror=implicit-function-declaration]
    2919 |                         entry->args[i] = ftrace_regs_get_argument(fregs, i);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FTRACE_REGS_MAX_ARGS +1110 kernel/trace/trace_output.c

  1097	
  1098	/* TRACE_FN */
  1099	static enum print_line_t trace_fn_trace(struct trace_iterator *iter, int flags,
  1100						struct trace_event *event)
  1101	{
  1102		struct ftrace_entry *field;
  1103		struct trace_seq *s = &iter->seq;
  1104		unsigned long *args;
  1105		int args_size;
  1106	
  1107		trace_assign_type(field, iter->ent);
  1108	
  1109		args_size = iter->ent_size - offsetof(struct ftrace_entry, args);
> 1110		if (args_size >= FTRACE_REGS_MAX_ARGS * sizeof(long))
  1111			args = field->args;
  1112		else
  1113			args = NULL;
  1114	
  1115		print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta,
  1116			       args, flags);
  1117		trace_seq_putc(s, '\n');
  1118	
  1119		return trace_handle_return(s);
  1120	}
  1121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
