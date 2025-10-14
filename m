Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E522BF3CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 00:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760401020; cv=none; b=qlvhi3yKBFqscMP6fznNBX+FigJ+amHJHhMaqHkPrAYuxHfl27VBgYLRSZEPholRh+4Q1O9KnSiPqPpMwJxJI4yjs1qZsz5+LD95yT1hOvHzN0i/HQfyJnE7+uiIBcSGYmk4N42cQaywSmI58p+C+c7jK3BEdrotAwHs+yoTaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760401020; c=relaxed/simple;
	bh=DuO/8GWBJBfDpCvkOq8mQ3HXvQc7UvI88VJvRO4Pomk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lO1NvDWZWzdZP7Eh1rk3GB5s9KBPWmvBGmleuBd2ZIYu+bRDqqASPi1csPHFsjAhEqiYEUEZk7yAJAE2+Spo1Vv1i30X9NGHH67KmpFujhqXDCgu+UYdsICPoGoMDPQ8tILCTcmkwzWXuEKrXGydSFl4rKbHCRkzdAR4+7osdx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcGqCNd+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcGqCNd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760401018; x=1791937018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DuO/8GWBJBfDpCvkOq8mQ3HXvQc7UvI88VJvRO4Pomk=;
  b=BcGqCNd+IMXAEIIWQEwznEb7KgUEyseMfI+yo3WMtM4GPYQBHxBWGWNn
   YfqCKiSfnZDcc8BpTP5rO6Jc63e4sBUy3qzE6voZ2R4nb8emAsR0WtlRe
   Ea/hM9gwC7AhHV3r80FXTpeIdMEd+eKeWJs6uP0ZZrEJi0OvXz+uoPTpT
   G5H1//PzYpWrcatfj/IOY9cSSq4bjtjrzXkW8VAID/hYzwCZ4zc8+L9zd
   W7+ABmkYPcjEx2XDWEcQRrlcMeOfJR7yL405GN6eWpaGmqHyIL1pgLZBF
   ynVbAMCX0WeUaRcpL44N0OLtatluhvUeeR6FdbhRKmXiAsEmhTUXMU7L7
   w==;
X-CSE-ConnectionGUID: aG7tE1i5RJ6bxU6t+rL2tw==
X-CSE-MsgGUID: o2t694h2Q7G4IQuVfUtjPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62446570"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="62446570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 17:16:57 -0700
X-CSE-ConnectionGUID: QaItrlm1Sj20b6Y5GXOhzQ==
X-CSE-MsgGUID: X2Fdj9DxQsmdBF9kByw2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="185756988"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Oct 2025 17:16:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Sik-0002BI-17;
	Tue, 14 Oct 2025 00:16:54 +0000
Date: Tue, 14 Oct 2025 08:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:faultable-syscalls 6/10] kernel/trace/trace.c:11430:32:
 error: use of undeclared identifier 'CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT'
Message-ID: <202510140800.z72gsgUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace faultable-syscalls
head:   66d20821bfc64b78f00866e06d9b297c9c616413
commit: 6834549be2989daee79e249f4cd481ea0b657dc7 [6/10] tracing: Add syscall_user_buf_size to limit amount written
config: x86_64-randconfig-161-20251014 (https://download.01.org/0day-ci/archive/20251014/202510140800.z72gsgUE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140800.z72gsgUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140800.z72gsgUE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:11430:32: error: use of undeclared identifier 'CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT'
    11430 |         global_trace.syscall_buf_sz = CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT;
          |                                       ^
   1 error generated.


vim +/CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT +11430 kernel/trace/trace.c

 11412	
 11413		init_trace_flags_index(&global_trace);
 11414	
 11415		register_tracer(&nop_trace);
 11416	
 11417		/* Function tracing may start here (via kernel command line) */
 11418		init_function_trace();
 11419	
 11420		/* All seems OK, enable tracing */
 11421		tracing_disabled = 0;
 11422	
 11423		atomic_notifier_chain_register(&panic_notifier_list,
 11424					       &trace_panic_notifier);
 11425	
 11426		register_die_notifier(&trace_die_notifier);
 11427	
 11428		global_trace.flags = TRACE_ARRAY_FL_GLOBAL;
 11429	
 11430		global_trace.syscall_buf_sz = CONFIG_TRACE_SYSCALL_BUF_SIZE_DEFAULT;
 11431	
 11432		INIT_LIST_HEAD(&global_trace.systems);
 11433		INIT_LIST_HEAD(&global_trace.events);
 11434		INIT_LIST_HEAD(&global_trace.hist_vars);
 11435		INIT_LIST_HEAD(&global_trace.err_log);
 11436		list_add(&global_trace.marker_list, &marker_copies);
 11437		list_add(&global_trace.list, &ftrace_trace_arrays);
 11438	
 11439		apply_trace_boot_options();
 11440	
 11441		register_snapshot_cmd();
 11442	
 11443		return 0;
 11444	
 11445	out_free_pipe_cpumask:
 11446		free_cpumask_var(global_trace.pipe_cpumask);
 11447	out_free_savedcmd:
 11448		trace_free_saved_cmdlines_buffer();
 11449	out_free_temp_buffer:
 11450		ring_buffer_free(temp_buffer);
 11451	out_rm_hp_state:
 11452		cpuhp_remove_multi_state(CPUHP_TRACE_RB_PREPARE);
 11453	out_free_cpumask:
 11454		free_cpumask_var(global_trace.tracing_cpumask);
 11455	out_free_buffer_mask:
 11456		free_cpumask_var(tracing_buffer_mask);
 11457		return ret;
 11458	}
 11459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
