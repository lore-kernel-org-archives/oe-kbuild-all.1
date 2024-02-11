Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817E81D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707610248; cv=none; b=dAZ60JwiyD5x4WlIhZ4S9v/ZPZ4XQOSUiEhV7GmFMJRrnHSXpHFlouCjIHFf5ggkXzXISeop+3uCbAOUqv/7e+GUY/CHzCxwQ4UDFXRKNUhI1Ziqr6a7D4z8uESnEpnLnmAOJEMMJDcSCp1vH46bd4q82OByjc3zKIVVyapWJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707610248; c=relaxed/simple;
	bh=HLNjpxaeBmu7+RG7o4c8/QI4zS0BrEeQtqM1svcWMcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njvGSc7BqhRegYkEjVyXg8CCr+DsbSUdCardCMP3qgsp3CBA4Nu773qyLqh7k30mW3RvhEDEaDh7wv7hQ9DXDjfMLmBYMu013fkeoGiH6tMvP9bbdTzQHLDwom9pOR2JmHhU2ERJiyQJxJDheDZNnbofcf2gKCWAay1sTy7D85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nr//e3kF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nr//e3kF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707610246; x=1739146246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLNjpxaeBmu7+RG7o4c8/QI4zS0BrEeQtqM1svcWMcc=;
  b=nr//e3kFG0anL+EduYSxwHdpbebGFc4/jK4Alc6c247LVHA+r7o3VCPT
   1qikUbHnio3f1jkLtzm4p8i3ood0iV1Al8U4a0d+1ac67MIA4Iw9adrhD
   mx4YSbaMpC8rA/jjHnJmoTG0ulupbDvgeDm2s+gXLqm/4J4dIVjieiDzg
   tt6pzOBeFOYq5HRZbSVXIAsNskTQdIhJaKHqP+HkuBtx95wivlV3e8t+I
   mKmskCxFIC5LUgX6lOxrMCzvNCMT1he84eYY0PPjcw25Iz7X62/AEKQ9e
   uAQuCPQWHlC3TTTZtdmOoJuMgQbBXlR+sPB6bixizjOwz49bYUnBSt9zA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12971861"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="12971861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 16:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2554730"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 16:10:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYxQd-0006CA-29;
	Sun, 11 Feb 2024 00:10:39 +0000
Date: Sun, 11 Feb 2024 08:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 27/70] kernel/trace/trace_osnoise.c:739:5:
 sparse: sparse: symbol 'hook_irq_events' was not declared. Should it be
 static?
Message-ID: <202402110827.7RQzdcaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   bd1fff5696924f04e2d09be6bdc13203aea86ba4
commit: 23a8f0f9d326e3a4af5e8b1c10982ca7615b0497 [27/70] UPSTREAM: trace: Add a generic function to read/write u64 values from tracefs
config: x86_64-randconfig-121-20240210 (https://download.01.org/0day-ci/archive/20240211/202402110827.7RQzdcaZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110827.7RQzdcaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110827.7RQzdcaZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_osnoise.c:223:14: sparse: sparse: symbol 'interface_lock' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:739:5: sparse: sparse: symbol 'hook_irq_events' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:771:6: sparse: sparse: symbol 'unhook_irq_events' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:788:6: sparse: sparse: symbol 'trace_softirq_entry_callback' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:811:6: sparse: sparse: symbol 'trace_softirq_exit_callback' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:953:1: sparse: sparse: symbol 'trace_sched_switch_callback' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:971:5: sparse: sparse: symbol 'hook_thread_events' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:988:6: sparse: sparse: symbol 'unhook_thread_events' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:1000:6: sparse: sparse: symbol 'save_osn_sample_stats' was not declared. Should it be static?
>> kernel/trace/trace_osnoise.c:1015:6: sparse: sparse: symbol 'diff_osn_sample_stats' was not declared. Should it be static?
   kernel/trace/trace_osnoise.c:1657:5: sparse: sparse: symbol 'timerlat_min_period' was not declared. Should it be static?
   kernel/trace/trace_osnoise.c:1658:5: sparse: sparse: symbol 'timerlat_max_period' was not declared. Should it be static?

vim +/hook_irq_events +739 kernel/trace/trace_osnoise.c

45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  732  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  733  /*
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  734   * hook_irq_events - Hook IRQ handling events
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  735   *
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  736   * This function hooks the IRQ related callbacks to the respective trace
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  737   * events.
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  738   */
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22 @739  int hook_irq_events(void)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  740  {
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  741  	int ret;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  742  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  743  	ret = register_trace_irq_handler_entry(trace_irqentry_callback, NULL);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  744  	if (ret)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  745  		goto out_err;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  746  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  747  	ret = register_trace_irq_handler_exit(trace_irqexit_callback, NULL);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  748  	if (ret)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  749  		goto out_unregister_entry;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  750  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  751  	ret = osnoise_arch_register();
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  752  	if (ret)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  753  		goto out_irq_exit;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  754  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  755  	return 0;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  756  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  757  out_irq_exit:
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  758  	unregister_trace_irq_handler_exit(trace_irqexit_callback, NULL);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  759  out_unregister_entry:
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  760  	unregister_trace_irq_handler_entry(trace_irqentry_callback, NULL);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  761  out_err:
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  762  	return -EINVAL;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  763  }
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  764  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  765  /*
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  766   * unhook_irq_events - Unhook IRQ handling events
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  767   *
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  768   * This function unhooks the IRQ related callbacks to the respective trace
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  769   * events.
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  770   */
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22 @771  void unhook_irq_events(void)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  772  {
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  773  	osnoise_arch_unregister();
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  774  	unregister_trace_irq_handler_exit(trace_irqexit_callback, NULL);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  775  	unregister_trace_irq_handler_entry(trace_irqentry_callback, NULL);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  776  }
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  777  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  778  #ifndef CONFIG_PREEMPT_RT
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  779  /*
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  780   * trace_softirq_entry_callback - Note the starting of a softirq
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  781   *
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  782   * Save the starting time of a softirq. As softirqs are non-preemptive to
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  783   * other softirqs, it is safe to use a single variable (ons_var->softirq)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  784   * to save the statistics. The arrival_time is used to report... the
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  785   * arrival time. The delta_start is used to compute the duration at the
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  786   * softirq exit handler. See cond_move_softirq_delta_start().
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  787   */
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22 @788  void trace_softirq_entry_callback(void *data, unsigned int vec_nr)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  789  {
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  790  	struct osnoise_variables *osn_var = this_cpu_osn_var();
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  791  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  792  	if (!osn_var->sampling)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  793  		return;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  794  	/*
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  795  	 * This value will be used in the report, but not to compute
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  796  	 * the execution time, so it is safe to get it unsafe.
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  797  	 */
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  798  	osn_var->softirq.arrival_time = time_get();
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  799  	set_int_safe_time(osn_var, &osn_var->softirq.delta_start);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  800  	osn_var->softirq.count++;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  801  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  802  	local_inc(&osn_var->int_counter);
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  803  }
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  804  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  805  /*
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  806   * trace_softirq_exit_callback - Note the end of an softirq
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  807   *
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  808   * Computes the duration of the softirq noise, and trace it. Also discounts the
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  809   * interference from other sources of noise could be currently being accounted.
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  810   */
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22 @811  void trace_softirq_exit_callback(void *data, unsigned int vec_nr)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  812  {
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  813  	struct osnoise_variables *osn_var = this_cpu_osn_var();
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  814  	int duration;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  815  
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  816  	if (!osn_var->sampling)
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  817  		return;
45b80aaf51c5a5 Daniel Bristot de Oliveira 2021-06-22  818  

:::::: The code at line 739 was first introduced by commit
:::::: 45b80aaf51c5a5cf48bd828095b1e8f7462c5905 UPSTREAM: trace: Add osnoise tracer

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
