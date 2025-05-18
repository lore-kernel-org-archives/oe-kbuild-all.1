Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062A78F32
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747539535; cv=none; b=JP8F/Vr85yjFG/6oaSsw0DM/eEgRsIAr5wAdupG426Vl3RLNdajmJ6KKGnYGWsrYZMCgxTdmOgJxPIbkCRvO71Yq/gZLQ7qTMLqzK4V1S/GKBiza4YISkd6IM7KOc9/f/i0nXUyP7KcU1EJ40iKB9VnRReU7YSvToChjVGddvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747539535; c=relaxed/simple;
	bh=+XVONGPdrlBEjJm9pvLAio9GY/7EvrwVBtX4qTD3TAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfWsD7196q2apCYn8fPm9CUH/gDQTiARjttOWkbr1NvE1UYCMPNNPbqBYGY7Hwuj1IBnCOLi4Nalj9wJ+iyEQ/GByCryttdaqXHUD99cvlYi9g5pSFy2bFlWlj5UM1mYU3tqatelJ+tGIituNjWiEjpyOQKOo4q5YV9zVoY+kDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUBS5a45; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUBS5a45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747539534; x=1779075534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XVONGPdrlBEjJm9pvLAio9GY/7EvrwVBtX4qTD3TAs=;
  b=UUBS5a45uX4CcOv+v6M0PfSGxzB5Zkpky/YZHIJy+2xxRHRxv1MXgadW
   WNS/AmC96BeSIadtnD+mJKRqvr7AeCPj3m0cPLJ66Kc1Ud6u9LWSe9CbS
   9z22Ov2UOxXDO6aVxyRgGZexm68PKGZ/A43Fh1a/4zGklVLsZn9k6eo36
   rH4tEvZcLbtZsfsSF6t6+K2cqqvrDp/SEDWkXkeXXGFOCHaPgY9/O8sYo
   vkTuYbxx1KF4U0jMZDYx1KCxZSsba3S0LAo5gwSP/iZJ1lW69/sQJeWcj
   kc2ajIt3mfpwuouHT5nFLUtjRIdaaxfdK7Sip1dgtiA8sIxB0e9jCmB6y
   g==;
X-CSE-ConnectionGUID: 5M/lJqbmRwSS35cUxPDLIQ==
X-CSE-MsgGUID: dNl15VTuQPeTWFUc3RVY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="59698953"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="59698953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 20:38:51 -0700
X-CSE-ConnectionGUID: L8OmcDeFQR6t1IcZEYnZTA==
X-CSE-MsgGUID: 9zQ5qteNQaC/KVbWIFHZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="169981723"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2025 20:38:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGUrO-000KaT-2o;
	Sun, 18 May 2025 03:38:46 +0000
Date: Sun, 18 May 2025 11:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 kernel/trace/trace_osnoise.c:707:6: warning: no previous prototype for
 function 'osnoise_trace_irq_entry'
Message-ID: <202505181106.v9z6VNQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 83cd91d08e23cf54f62f254117f61f66ecde3e8d [11/11] trace: Add osnoise tracer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250518/202505181106.v9z6VNQt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181106.v9z6VNQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181106.v9z6VNQt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_osnoise.c:707:6: warning: no previous prototype for function 'osnoise_trace_irq_entry' [-Wmissing-prototypes]
     707 | void osnoise_trace_irq_entry(int id)
         |      ^
   kernel/trace/trace_osnoise.c:707:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     707 | void osnoise_trace_irq_entry(int id)
         | ^
         | static 
>> kernel/trace/trace_osnoise.c:730:6: warning: no previous prototype for function 'osnoise_trace_irq_exit' [-Wmissing-prototypes]
     730 | void osnoise_trace_irq_exit(int id, const char *desc)
         |      ^
   kernel/trace/trace_osnoise.c:730:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     730 | void osnoise_trace_irq_exit(int id, const char *desc)
         | ^
         | static 
   2 warnings generated.


vim +/osnoise_trace_irq_entry +707 kernel/trace/trace_osnoise.c

2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  697) 
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  698) /*
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  699)  * osnoise_trace_irq_entry - Note the starting of an IRQ
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  700)  *
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  701)  * Save the starting time of an IRQ. As IRQs are non-preemptive to other IRQs,
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  702)  * it is safe to use a single variable (ons_var->irq) to save the statistics.
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  703)  * The arrival_time is used to report... the arrival time. The delta_start
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  704)  * is used to compute the duration at the IRQ exit handler. See
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  705)  * cond_move_irq_delta_start().
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  706)  */
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18 @707) void osnoise_trace_irq_entry(int id)
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  708) {
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  709) 	struct osnoise_variables *osn_var = this_cpu_osn_var();
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  710) 
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  711) 	if (!osn_var->sampling)
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  712) 		return;
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  713) 	/*
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  714) 	 * This value will be used in the report, but not to compute
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  715) 	 * the execution time, so it is safe to get it unsafe.
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  716) 	 */
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  717) 	osn_var->irq.arrival_time = time_get();
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  718) 	set_int_safe_time(osn_var, &osn_var->irq.delta_start);
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  719) 	osn_var->irq.count++;
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  720) 
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  721) 	local_inc(&osn_var->int_counter);
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  722) }
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  723) 
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  724) /*
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  725)  * osnoise_irq_exit - Note the end of an IRQ, sava data and trace
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  726)  *
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  727)  * Computes the duration of the IRQ noise, and trace it. Also discounts the
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  728)  * interference from other sources of noise could be currently being accounted.
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  729)  */
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18 @730) void osnoise_trace_irq_exit(int id, const char *desc)
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  731) {
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  732) 	struct osnoise_variables *osn_var = this_cpu_osn_var();
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  733) 	int duration;
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  734) 
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  735) 	if (!osn_var->sampling)
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  736) 		return;
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  737) 
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  738) 	duration = get_int_safe_duration(osn_var, &osn_var->irq.delta_start);
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  739) 	trace_irq_noise(id, desc, osn_var->irq.arrival_time, duration);
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  740) 	osn_var->irq.arrival_time = 0;
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  741) 	cond_move_softirq_delta_start(osn_var, duration);
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  742) 	cond_move_thread_delta_start(osn_var, duration);
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  743) }
2cad40f10a86ef Steven Rostedt (VMware  2021-08-18  744) 

:::::: The code at line 707 was first introduced by commit
:::::: 2cad40f10a86ef42b1cec9c77fa273f696de20e9 tracing: Disable "other" permission bits in the tracefs files

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Xunlei Pang <xlpang@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
