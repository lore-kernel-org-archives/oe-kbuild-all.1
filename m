Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B432DEA9E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 05:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764825113; cv=none; b=IO3pFBDOFu0e0+EhrFHe2KZw2BA5TNJLG0tXXssOC0EKbtvsFujTnaofmYuXYkTb0oD+w5q9G+8KPIpKsm4D777U9DRVitq/Cwlx5x18uyg6UV7Fta7FrmZDiCXrk0avrPNXLgy+1Ghb5MbiFbzhUqIFi4KWUQotaYWjbCxZG14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764825113; c=relaxed/simple;
	bh=CPhN+P3+1bg2aYgAkxS8rEy4jTgD7fUM36k+XkJzzNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGQfUJ7ZuLAba9AUmuldcz1awnnTZX0xwBa5gy5tpR5ZLPNuk1zvMcl0dCg7skoVIE3tKhvnP/DWO5UeiKI8KGT2OQP+DoLwXx2qZ2l1d0cjgjfL2HyKBLMi9gZJoFXg+iZsGuN4Bnb8L9mVKDqHsRSNa9ouDiotEmv3OZn3CNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Azmaj0Op; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Azmaj0Op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764825112; x=1796361112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPhN+P3+1bg2aYgAkxS8rEy4jTgD7fUM36k+XkJzzNQ=;
  b=Azmaj0OpF/viysHHBzhlYz/nzeBCyO8Tfo3Awl1rnjCejmX5ws9MRhX/
   AIXnB9LmugmvgoQp65sp6AzhtUZ5InW2i73B7wkYr/jJdDnRGKwI276/W
   zYpp0YdCv4mVI5NRcV+8eHQ1EPiQ0Chfblf4HBMwHj2pzbsnRhtFWRVak
   9OLsoI6/xPwZKw2qyUN6jlsuFra0kvFipaSpwmm7urVLHt4Ycr2CTBKH/
   uPHicTAX9HVsvvdEiGJkgXdFbAR/kwKul77O5TTXQkZBmaunZZq6jvHvg
   AGp40KiGd3IjoA/OjqWOGMD+iu1cmBhzdeMz4BWxSfE0PRdZME99aZ0Zp
   A==;
X-CSE-ConnectionGUID: 3/dspGxVQYCQgDt605eA3A==
X-CSE-MsgGUID: GqLPH6UpSoCglkPzA7dwwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66998311"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66998311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 21:11:52 -0800
X-CSE-ConnectionGUID: CNhZmaDSSny9BQKiB9xA2A==
X-CSE-MsgGUID: a5e6m/JYSuG+MXkHP4cGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="194921212"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 21:11:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR1d5-00000000DT5-2Kvn;
	Thu, 04 Dec 2025 05:11:47 +0000
Date: Thu, 4 Dec 2025 13:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: pengdonglin <pengdonglin@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [linux-next:master 11689/13147] kernel/trace/trace.h:1130
 ftrace_graph_ignore_func() warn: unsigned 'trace->depth' is never less than
 zero.
Message-ID: <202512041327.GVZ26aRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b2c27842ba853508b0da00187a7508eb3a96c8f7
commit: f83ac7544fbf7ba3f77c122e16ab5319f75bbdfd [11689/13147] function_graph: Enable funcgraph-args and funcgraph-retaddr to work simultaneously
config: i386-randconfig-141-20251203 (https://download.01.org/0day-ci/archive/20251204/202512041327.GVZ26aRY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041327.GVZ26aRY-lkp@intel.com/

smatch warnings:
kernel/trace/trace.h:1130 ftrace_graph_ignore_func() warn: unsigned 'trace->depth' is never less than zero.
kernel/trace/trace.h:1130 ftrace_graph_ignore_func() warn: unsigned 'trace->depth' is never less than zero.
kernel/trace/trace_functions_graph.c:978 print_graph_entry_leaf() warn: unsigned 'call->depth' is never less than zero.
kernel/trace/trace_functions_graph.c:1036 print_graph_entry_nested() warn: unsigned 'call->depth' is never less than zero.

vim +1130 kernel/trace/trace.h

1a41442864e35b Steven Rostedt (Red Hat  2016-12-08  1121) 
12117f3307b63f Steven Rostedt (VMware   2024-06-03  1122) static inline bool
12117f3307b63f Steven Rostedt (VMware   2024-06-03  1123) ftrace_graph_ignore_func(struct fgraph_ops *gops, struct ftrace_graph_ent *trace)
1a41442864e35b Steven Rostedt (Red Hat  2016-12-08  1124) {
12117f3307b63f Steven Rostedt (VMware   2024-06-03  1125) 	unsigned long *task_var = fgraph_get_task_var(gops);
12117f3307b63f Steven Rostedt (VMware   2024-06-03  1126) 
1a41442864e35b Steven Rostedt (Red Hat  2016-12-08  1127) 	/* trace it when it is-nested-in or is a function enabled. */
12117f3307b63f Steven Rostedt (VMware   2024-06-03  1128) 	return !((*task_var & TRACE_GRAPH_FL) ||
12117f3307b63f Steven Rostedt (VMware   2024-06-03  1129) 		 ftrace_graph_addr(task_var, trace)) ||
1a41442864e35b Steven Rostedt (Red Hat  2016-12-08 @1130) 		(trace->depth < 0) ||
1a41442864e35b Steven Rostedt (Red Hat  2016-12-08  1131) 		(fgraph_max_depth && trace->depth >= fgraph_max_depth);
1a41442864e35b Steven Rostedt (Red Hat  2016-12-08  1132) }
1a41442864e35b Steven Rostedt (Red Hat  2016-12-08  1133) 

:::::: The code at line 1130 was first introduced by commit
:::::: 1a41442864e35bff859582fe9c5d051d0b1040ba tracing/fgraph: Have wakeup and irqsoff tracers ignore graph functions too

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
