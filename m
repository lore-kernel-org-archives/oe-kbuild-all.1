Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4782F537F6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706515783; cv=none; b=VAe6QwHrhKcebk0BPmcwCNYX7gN1WNLcAvHj5JWSAgHEqV5TRwV/5LsZNht7oBb8y4B7UO9v/X99BpeUTOg7mpKBgQue9hBG28XOTSHKSfA8NXHuS/NBqcxdV8p8ilKtHfL2ysnruuLTfJcq6Ar9M7kNanOH2UhB4gTXvN2AYu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706515783; c=relaxed/simple;
	bh=b9e0wC/xizIDj1rM6K7i2rxJpcPnyqPbBvZ2CfqqWQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PsI81u6tAoXL1HBa3PW3AkbAzqCHKcpAwX0BDgOBW0Cf7AY4QIUgNcC7Ko7IA+11xBhVY+gzisoYHG7z7aYKiDo14RDLayUvLPCh2DtCol8eyTvRd1sXfnuPa8CU0TsHnYEO4Hb6OowHrSIui3y+Q8cQzlXSZJj4Emsu45uuqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfX3r5Id; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfX3r5Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706515783; x=1738051783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9e0wC/xizIDj1rM6K7i2rxJpcPnyqPbBvZ2CfqqWQU=;
  b=KfX3r5IdIVwkK8YhUWGsoB8afE8Zy5AxO3SNxBXF4Asm6r992VT7+rJV
   uVWqR6104n9ha72+EVtIzzKrbP9qsP5XMT4+v+RNn+bNcgiH7A/llqtsI
   SomyMvoy8t4Lr7rT1rQya1ffaLUY9b3R9sG9kJ+8YpG81MxV91dXbSyr+
   V+1YE92aPDa0zFesTrT2o+ZNvh/LOD8hNEOVvNPWga7sHx6jmcR2JwnmH
   /ZHJ45vDy0w2htf5c3Txc2yxfqxd0dkYvTEY9AvaArsXhDq2shR2KQI1h
   sYog+1tcgmaOEJDH/NoliqbhBsqpJGqDM6GFU2Xx9BktlT6ebgh+gkTfx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9528456"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9528456"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 00:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858012559"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="858012559"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2024 00:09:38 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUMi0-00049Y-00;
	Mon, 29 Jan 2024 08:09:36 +0000
Date: Mon, 29 Jan 2024 16:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/hotplug 14/15]
 kernel/time/tick-sched.c:1575:6: error: redefinition of
 'tick_sched_timer_dying'
Message-ID: <202401291549.QU9vTGce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/hotplug
head:   378e195ce2fd96d90ed7c1cde9033cb7079a7274
commit: 9cd2efa0d41453db9d7e6bc813bde58daa3f0449 [14/15] tick: Shut down low-res tick from dying CPU
config: arm-randconfig-r052-20240128 (https://download.01.org/0day-ci/archive/20240129/202401291549.QU9vTGce-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291549.QU9vTGce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291549.QU9vTGce-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1575:6: error: redefinition of 'tick_sched_timer_dying'
    1575 | void tick_sched_timer_dying(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/time/tick-internal.h:9,
                    from kernel/time/tick-sched.c:32:
   kernel/time/tick-sched.h:111:20: note: previous definition of 'tick_sched_timer_dying' with type 'void(int)'
     111 | static inline void tick_sched_timer_dying(int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/tick_sched_timer_dying +1575 kernel/time/tick-sched.c

  1570	
  1571	/*
  1572	 * Shut down the tick and make sure the CPU won't try to retake the timekeeping
  1573	 * duty before disabling IRQs in idle for the last time.
  1574	 */
> 1575	void tick_sched_timer_dying(int cpu)
  1576	{
  1577		struct tick_device *td = &per_cpu(tick_cpu_device, cpu);
  1578		struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
  1579		struct clock_event_device *dev = td->evtdev;
  1580		ktime_t idle_sleeptime, iowait_sleeptime;
  1581	
  1582		/* This must happen before hrtimers are migrated! */
  1583		tick_sched_timer_cancel(ts);
  1584	
  1585		/*
  1586		 * If the clockevents doesn't support CLOCK_EVT_STATE_ONESHOT_STOPPED,
  1587		 * make sure not to call low-res tick handler.
  1588		 */
  1589		if (tick_sched_flag_test(ts, TS_FLAG_NOHZ))
  1590			dev->event_handler = clockevents_handle_noop;
  1591	
  1592		idle_sleeptime = ts->idle_sleeptime;
  1593		iowait_sleeptime = ts->iowait_sleeptime;
  1594		memset(ts, 0, sizeof(*ts));
  1595		ts->idle_sleeptime = idle_sleeptime;
  1596		ts->iowait_sleeptime = iowait_sleeptime;
  1597	}
  1598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
