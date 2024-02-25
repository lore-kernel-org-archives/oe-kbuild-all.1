Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F724C96
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 04:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708837105; cv=none; b=FWMshKmKjd+jDccxwvTpHAB9kCBoPTxENdV48et9KzNWz23oYQW4ND8+2VpEwoSX4rbHhSEsWmAhP3ycFkJ1NYKraaAKdQg4WdrNJ9tbs0L5P8X07l6vXRkyjgbJNuQoKqr4EGlEtcxBBXgacwsP7uIC4ItzRjJJWscbn3FINO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708837105; c=relaxed/simple;
	bh=R5ASdPpjXSARdf3itz9WZ9uWAXi6RVtsZt1hNq037pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEeo3QUGBiZUg0n8oNHBMC9eEI4me1WJ7nsw4MyY2r+iJqQ2B/Hkwc11fuPXRAvtDEBSr35Aykl6H6QHHF6NoWHEoI+JPTxtogQAitR/blnwVPWtNz0z1w1P3Pn/QgQFee7qDHuYaAL/yqu5qKeWA9jGtvi8AbRFaCCrGyhML50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjWNm6Ce; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjWNm6Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708837103; x=1740373103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5ASdPpjXSARdf3itz9WZ9uWAXi6RVtsZt1hNq037pg=;
  b=MjWNm6CetoOcoK+CYRS/tkDLEqHc3k9ZdVQoIcc/UL+qmy6JMqLqEwDf
   wUpVjn9ZoarDTa4AhQFD0USwvUEJrd3lZnyUUb509oO94JvtmRFj+ygmv
   kYZJpwJ1FxXLAqDIVRt3VnPLIDrg94vV1Sv3MJC5gzv4n92N3Pi562ZJH
   sGkVldxCu9vM6ILvIPksGcB0bjH97mCHKgj9lIppxTWzTlmWA0n5cRRI0
   z7jDuTH/uzhjfdAQJeO8bFUT4zm/CMfJtuUAkVSBSmIIWAF9+ouymSJgs
   WTN17p2voYURpSZqGnIrBg1WLpwtxG32nVIU8o6b9vf+qCmfz45A6K9sD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3668197"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="3668197"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 20:58:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="11013778"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Feb 2024 20:58:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re6ag-0009Ku-2e;
	Sun, 25 Feb 2024 04:58:18 +0000
Date: Sun, 25 Feb 2024 12:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:tick/keep-tick-on-hrt 12/13] tick-sched.c:undefined reference
 to `__udivmoddi4'
Message-ID: <202402251218.wfqVjtvt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git tick/keep-tick-on-hrt
head:   9a7f9b220850f08cf58f16872c84b08bc461a806
commit: f0b7e48995407d4df5a145fafc9940953a34006c [12/13] trace: tick: Trace the restarting of tick (split)
config: i386-buildonly-randconfig-001-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251218.wfqVjtvt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251218.wfqVjtvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251218.wfqVjtvt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/timer.h:474,
                    from kernel/time/timer.c:58:
   include/trace/events/timer.h: In function 'trace_raw_output_tick_stop':
>> include/trace/events/timer.h:444:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 's64' {aka 'long long int'} [-Wformat=]
     444 |         TP_printk("now=%llu.%06lu success=%d dependency=%s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/timer.h:426:1: note: in expansion of macro 'TRACE_EVENT'
     426 | TRACE_EVENT(tick_stop,
         | ^~~~~~~~~~~
   include/trace/events/timer.h:444:9: note: in expansion of macro 'TP_printk'
     444 |         TP_printk("now=%llu.%06lu success=%d dependency=%s",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   include/trace/events/timer.h:444:33: note: format string is defined here
     444 |         TP_printk("now=%llu.%06lu success=%d dependency=%s",
         |                             ~~~~^
         |                                 |
         |                                 long unsigned int
         |                             %06llu
   include/trace/events/timer.h: In function 'trace_raw_output_tick_restart':
   include/trace/events/timer.h:465:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 's64' {aka 'long long int'} [-Wformat=]
     465 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/timer.h:449:1: note: in expansion of macro 'TRACE_EVENT'
     449 | TRACE_EVENT(tick_restart,
         | ^~~~~~~~~~~
   include/trace/events/timer.h:465:9: note: in expansion of macro 'TP_printk'
     465 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |         ^~~~~~~~~
   include/trace/events/timer.h:465:33: note: format string is defined here
     465 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |                             ~~~~^
         |                                 |
         |                                 long unsigned int
         |                             %06llu
   include/trace/events/timer.h:465:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 's64' {aka 'long long int'} [-Wformat=]
     465 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/timer.h:449:1: note: in expansion of macro 'TRACE_EVENT'
     449 | TRACE_EVENT(tick_restart,
         | ^~~~~~~~~~~
   include/trace/events/timer.h:465:9: note: in expansion of macro 'TP_printk'
     465 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |         ^~~~~~~~~
   include/trace/events/timer.h:465:51: note: format string is defined here
     465 |         TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
         |                                               ~~~~^
         |                                                   |
         |                                                   long unsigned int
         |                                               %06llu
--
   ld: kernel/time/timer.o: in function `trace_raw_output_tick_restart':
>> timer.c:(.text+0x19ec): undefined reference to `__divmoddi4'
>> ld: timer.c:(.text+0x1a20): undefined reference to `__divmoddi4'
>> ld: timer.c:(.text+0x1a3e): undefined reference to `__divdi3'
   ld: timer.c:(.text+0x1a70): undefined reference to `__divdi3'
   ld: kernel/time/timer.o: in function `trace_raw_output_tick_stop':
   timer.c:(.text+0x1d2f): undefined reference to `__divmoddi4'
   ld: timer.c:(.text+0x1d5d): undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.o: in function `tick_nohz_next_event':
>> tick-sched.c:(.text+0x26e): undefined reference to `__udivmoddi4'
>> ld: tick-sched.c:(.text+0x29c): undefined reference to `__udivdi3'
>> ld: tick-sched.c:(.text+0x2c9): undefined reference to `__udivmoddi4'
   ld: tick-sched.c:(.text+0x2f1): undefined reference to `__udivdi3'
   ld: tick-sched.c:(.text+0x31a): undefined reference to `__udivmoddi4'
   ld: tick-sched.c:(.text+0x342): undefined reference to `__udivdi3'
>> ld: tick-sched.c:(.text+0x36f): undefined reference to `__divmoddi4'
>> ld: tick-sched.c:(.text+0x395): undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.o: in function `tick_nohz_idle_stop_tick':
>> tick-sched.c:(.text+0x1613): undefined reference to `__divmoddi4'
   ld: tick-sched.c:(.text+0x1635): undefined reference to `__divdi3'
   ld: tick-sched.c:(.text+0x165f): undefined reference to `__divmoddi4'
   ld: tick-sched.c:(.text+0x1681): undefined reference to `__divdi3'
>> ld: tick-sched.c:(.text+0x172d): undefined reference to `__moddi3'
   ld: tick-sched.c:(.text+0x173d): undefined reference to `__divdi3'
   ld: tick-sched.c:(.text+0x1758): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
