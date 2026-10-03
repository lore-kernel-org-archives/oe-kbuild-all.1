Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DF365A19
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023706; cv=none; b=lv6V0TgDrQj1VDxeUwA1ngtmV1jFyd3YJJnFQ7K0Date+NbVRIvPL/YlQ+uMpWVYSvRF+NRhJTuIWQ2mJS+zLFhhUlvhlw1chKEzoSqI4RH7l2gyjT3JbVRDhz+DnX/VwsQN55kG9RM9gsEeABgOPOU+P4EuHvkHhR6UYYFycLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023706; c=relaxed/simple;
	bh=OpkDrMObLdbxLU7FhcRiB5VaRnDcKfPE8rL+mt+UZQY=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUUP4Xkf95ZWOGbnUmWzeeklxP7xhWBaaHnXlPnnKkYcAflOP5zTegwh1y36/YfSQ4A4Aky8CXYIJ0TLfolhA6/vA+5iWyBqNWnmr2sCOHpQ3n1xCk+N82D1iRS/SoDZyi3ruVc1f8Dn86aqVxJpd2KPw2lvVzU/wZ1HPkb4zW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDd/URx6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDd/URx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791023704; x=1822559704;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=OpkDrMObLdbxLU7FhcRiB5VaRnDcKfPE8rL+mt+UZQY=;
  b=dDd/URx6D+3DJeH/kUK/VFaSwPGnMtP7eaA+FCyL9QrrNh6hNNWbc3ll
   XBxz8QOedgimVKgg4/TDlhOdBul0+hvSDvpYFhTz2ZfN/UHrYCDX/2PUn
   yrprNPlVCSCCjBW+I9PXur9fIi6y48Q189zuv/qC6dlsGBdFAINmMFFAX
   B/jbGh3teti238mC9uMHurMKVdqpgcuFjF4BByn6Wmpz/hlmvL3lUrrN/
   HeDY2NKgmK+eKHYqYyhj3lMJ4zCW1f52SLI2K/YteqoeoW7aiG7yHllgs
   q6ilVQI6vOwLZYu0l8ae7Fr0UbCJ6EPt2cuvtk7cbVtexhJsZRouVTiO0
   w==;
X-CSE-ConnectionGUID: pVgEWQO+TT2xfHcoD0uv9w==
X-CSE-MsgGUID: sBBAMQVfQJ64wkLZwaqj0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="113552236"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="113552236"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 03:35:03 -0700
X-CSE-ConnectionGUID: Gu3cn0XYQY2/KMjjidtb4Q==
X-CSE-MsgGUID: xz0Eh9SSStGgIJXCGP062g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2026 03:35:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCx52-00000000Tu7-0Z0Y
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Oct 2026 10:35:00 +0000
Date: Sat, 3 Oct 2026 18:34:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: powerpc64: move preempt count to paca
Message-ID: <202610031850.vR0XyAC2-lkp@intel.com>
References: <202610031850.vR0XyAC2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610031850.vR0XyAC2-lkp@intel.com>

Hi Shrikanth,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/powerpc64-move-preempt-count-to-paca/20261002-221617
base:   
patch link:    https://lore.kernel.org/r/202610031850.vR0XyAC2-lkp%40intel.com
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261003/202610031850.vR0XyAC2-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031850.vR0XyAC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610031850.vR0XyAC2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7502:22: warning: no previous prototype for 'dynamic_preempt_schedule' [-Wmissing-prototypes]
    7502 | void __sched notrace dynamic_preempt_schedule(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:7575:22: warning: no previous prototype for 'dynamic_preempt_schedule_notrace' [-Wmissing-prototypes]
    7575 | void __sched notrace dynamic_preempt_schedule_notrace(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dynamic_preempt_schedule +7502 kernel/sched/core.c

009f60e2763568 Oleg Nesterov          2014-10-05  7491  
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7492) #ifdef CONFIG_PREEMPT_DYNAMIC
b7ebb758568b60 Ingo Molnar            2025-05-28  7493  # ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
8a69fe0be143b0 Mark Rutland           2022-02-14  7494  #  ifndef preempt_schedule_dynamic_enabled
8a69fe0be143b0 Mark Rutland           2022-02-14  7495  #   define preempt_schedule_dynamic_enabled	preempt_schedule
8a69fe0be143b0 Mark Rutland           2022-02-14  7496  #   define preempt_schedule_dynamic_disabled	NULL
8a69fe0be143b0 Mark Rutland           2022-02-14  7497  #  endif
8a69fe0be143b0 Mark Rutland           2022-02-14  7498  DEFINE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
ef72661e28c64a Peter Zijlstra         2021-01-25  7499  EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7500  # elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
99cf983cc8bca4 Mark Rutland           2022-02-14  7501  static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14 @7502  void __sched notrace dynamic_preempt_schedule(void)
99cf983cc8bca4 Mark Rutland           2022-02-14  7503  {
99cf983cc8bca4 Mark Rutland           2022-02-14  7504  	if (!static_branch_unlikely(&sk_dynamic_preempt_schedule))
99cf983cc8bca4 Mark Rutland           2022-02-14  7505  		return;
99cf983cc8bca4 Mark Rutland           2022-02-14  7506  	preempt_schedule();
99cf983cc8bca4 Mark Rutland           2022-02-14  7507  }
99cf983cc8bca4 Mark Rutland           2022-02-14  7508  NOKPROBE_SYMBOL(dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7509  EXPORT_SYMBOL(dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7510  # endif
b7ebb758568b60 Ingo Molnar            2025-05-28  7511  #endif /* CONFIG_PREEMPT_DYNAMIC */
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7512) 
009f60e2763568 Oleg Nesterov          2014-10-05  7513  /**
4eaca0a887eaee Frederic Weisbecker    2015-06-04  7514   * preempt_schedule_notrace - preempt_schedule called by tracing
009f60e2763568 Oleg Nesterov          2014-10-05  7515   *
009f60e2763568 Oleg Nesterov          2014-10-05  7516   * The tracing infrastructure uses preempt_enable_notrace to prevent
009f60e2763568 Oleg Nesterov          2014-10-05  7517   * recursion and tracing preempt enabling caused by the tracing
009f60e2763568 Oleg Nesterov          2014-10-05  7518   * infrastructure itself. But as tracing can happen in areas coming
009f60e2763568 Oleg Nesterov          2014-10-05  7519   * from userspace or just about to enter userspace, a preempt enable
009f60e2763568 Oleg Nesterov          2014-10-05  7520   * can occur before user_exit() is called. This will cause the scheduler
009f60e2763568 Oleg Nesterov          2014-10-05  7521   * to be called when the system is still in usermode.
009f60e2763568 Oleg Nesterov          2014-10-05  7522   *
009f60e2763568 Oleg Nesterov          2014-10-05  7523   * To prevent this, the preempt_enable_notrace will use this function
009f60e2763568 Oleg Nesterov          2014-10-05  7524   * instead of preempt_schedule() to exit user context if needed before
009f60e2763568 Oleg Nesterov          2014-10-05  7525   * calling the scheduler.
009f60e2763568 Oleg Nesterov          2014-10-05  7526   */
4eaca0a887eaee Frederic Weisbecker    2015-06-04  7527  asmlinkage __visible void __sched notrace preempt_schedule_notrace(void)
009f60e2763568 Oleg Nesterov          2014-10-05  7528  {
009f60e2763568 Oleg Nesterov          2014-10-05  7529  	enum ctx_state prev_ctx;
009f60e2763568 Oleg Nesterov          2014-10-05  7530  
009f60e2763568 Oleg Nesterov          2014-10-05  7531  	if (likely(!preemptible()))
009f60e2763568 Oleg Nesterov          2014-10-05  7532  		return;
009f60e2763568 Oleg Nesterov          2014-10-05  7533  
009f60e2763568 Oleg Nesterov          2014-10-05  7534  	do {
47252cfbac0364 Steven Rostedt         2016-03-21  7535  		/*
47252cfbac0364 Steven Rostedt         2016-03-21  7536  		 * Because the function tracer can trace preempt_count_sub()
47252cfbac0364 Steven Rostedt         2016-03-21  7537  		 * and it also uses preempt_enable/disable_notrace(), if
47252cfbac0364 Steven Rostedt         2016-03-21  7538  		 * NEED_RESCHED is set, the preempt_enable_notrace() called
47252cfbac0364 Steven Rostedt         2016-03-21  7539  		 * by the function tracer will call this function again and
47252cfbac0364 Steven Rostedt         2016-03-21  7540  		 * cause infinite recursion.
47252cfbac0364 Steven Rostedt         2016-03-21  7541  		 *
47252cfbac0364 Steven Rostedt         2016-03-21  7542  		 * Preemption must be disabled here before the function
47252cfbac0364 Steven Rostedt         2016-03-21  7543  		 * tracer can trace. Break up preempt_disable() into two
47252cfbac0364 Steven Rostedt         2016-03-21  7544  		 * calls. One to disable preemption without fear of being
47252cfbac0364 Steven Rostedt         2016-03-21  7545  		 * traced. The other to still record the preemption latency,
47252cfbac0364 Steven Rostedt         2016-03-21  7546  		 * which can also be traced by the function tracer.
47252cfbac0364 Steven Rostedt         2016-03-21  7547  		 */
3d8f74dd4ca1da Peter Zijlstra         2015-09-28  7548  		preempt_disable_notrace();
47252cfbac0364 Steven Rostedt         2016-03-21  7549  		preempt_latency_start(1);
009f60e2763568 Oleg Nesterov          2014-10-05  7550  		/*
009f60e2763568 Oleg Nesterov          2014-10-05  7551  		 * Needs preempt disabled in case user_exit() is traced
009f60e2763568 Oleg Nesterov          2014-10-05  7552  		 * and the tracer calls preempt_enable_notrace() causing
009f60e2763568 Oleg Nesterov          2014-10-05  7553  		 * an infinite recursion.
009f60e2763568 Oleg Nesterov          2014-10-05  7554  		 */
009f60e2763568 Oleg Nesterov          2014-10-05  7555  		prev_ctx = exception_enter();
b4bfa3fcfe3b82 Thomas Gleixner        2021-08-15  7556  		__schedule(SM_PREEMPT);
009f60e2763568 Oleg Nesterov          2014-10-05  7557  		exception_exit(prev_ctx);
009f60e2763568 Oleg Nesterov          2014-10-05  7558  
47252cfbac0364 Steven Rostedt         2016-03-21  7559  		preempt_latency_stop(1);
3d8f74dd4ca1da Peter Zijlstra         2015-09-28  7560  		preempt_enable_no_resched_notrace();
009f60e2763568 Oleg Nesterov          2014-10-05  7561  	} while (need_resched());
009f60e2763568 Oleg Nesterov          2014-10-05  7562  }
4eaca0a887eaee Frederic Weisbecker    2015-06-04  7563  EXPORT_SYMBOL_GPL(preempt_schedule_notrace);
009f60e2763568 Oleg Nesterov          2014-10-05  7564  
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7565) #ifdef CONFIG_PREEMPT_DYNAMIC
99cf983cc8bca4 Mark Rutland           2022-02-14  7566  # if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
8a69fe0be143b0 Mark Rutland           2022-02-14  7567  #  ifndef preempt_schedule_notrace_dynamic_enabled
8a69fe0be143b0 Mark Rutland           2022-02-14  7568  #   define preempt_schedule_notrace_dynamic_enabled	preempt_schedule_notrace
8a69fe0be143b0 Mark Rutland           2022-02-14  7569  #   define preempt_schedule_notrace_dynamic_disabled	NULL
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7570) #  endif
8a69fe0be143b0 Mark Rutland           2022-02-14  7571  DEFINE_STATIC_CALL(preempt_schedule_notrace, preempt_schedule_notrace_dynamic_enabled);
ef72661e28c64a Peter Zijlstra         2021-01-25  7572  EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
99cf983cc8bca4 Mark Rutland           2022-02-14  7573  # elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
99cf983cc8bca4 Mark Rutland           2022-02-14  7574  static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule_notrace);
99cf983cc8bca4 Mark Rutland           2022-02-14 @7575  void __sched notrace dynamic_preempt_schedule_notrace(void)
c597bfddc9e9e8 Frederic Weisbecker    2021-09-14  7576  {
99cf983cc8bca4 Mark Rutland           2022-02-14  7577  	if (!static_branch_unlikely(&sk_dynamic_preempt_schedule_notrace))
99cf983cc8bca4 Mark Rutland           2022-02-14  7578  		return;
99cf983cc8bca4 Mark Rutland           2022-02-14  7579  	preempt_schedule_notrace();
c597bfddc9e9e8 Frederic Weisbecker    2021-09-14  7580  }
99cf983cc8bca4 Mark Rutland           2022-02-14  7581  NOKPROBE_SYMBOL(dynamic_preempt_schedule_notrace);
99cf983cc8bca4 Mark Rutland           2022-02-14  7582  EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
99cf983cc8bca4 Mark Rutland           2022-02-14  7583  # endif
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7584) #endif
c597bfddc9e9e8 Frederic Weisbecker    2021-09-14  7585  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
