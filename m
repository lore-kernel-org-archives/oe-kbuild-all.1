Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61A469E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708867178; cv=none; b=mvg9PLuQ0Inzh5K2Bvcdy88DhJezPz8e9jczDh1tKTG63a+bstViNfc8AflIGWxBvMhKxFW/lyQTlM7d8J6kTF24Ojw8QPPz1iW73LW3SLYiCKPn/wvcbJkrMwv+hweneQRmW3KS6chznb8La2f2r2QDPz1wUgCxQmYbSZk2F84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708867178; c=relaxed/simple;
	bh=Snah0oVeMCcnsCjZVynbp2eBkFkCX+vIzXf+VGQh/Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXoi1B3hgVI3b704tkGPStWwovh7ZTY17RVZkzteU9TR1jpNuH9KVeJUcehUjSYhUn3Jt2tfBZfiGBu8YNfzSO3TN3YOx7Hg+2GRMhqxJkOagVQu60I9JeZ2sgcjO7uNgq1EMfX+ngggmDfx5DKWwnZDOmV2rh4Py6GJch09Bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLX/Q+bP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLX/Q+bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708867176; x=1740403176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Snah0oVeMCcnsCjZVynbp2eBkFkCX+vIzXf+VGQh/Vs=;
  b=cLX/Q+bP3/YsI8Z7KZrOJrziHJWXa0DlR4qpuziMP+gigMFvSmihsuVS
   SnPc10GzklBV9LtHZUveEIb269gZz/DLPqqsoiJVc0I3X8FbrDgRzB3U4
   er3sAi+WV8za7tP6a5jyRLAJDEY7RFiZ39ONj6PYJneFYf+OofKxG4V4H
   4qVPiwPkNMosYxw3iZ4YnNZGNf0hM8MRwh5qeSVnjc9EHOLb30Zv5bE7D
   nigtQqDcKMF2UG2/1UFfCx4uaKOEtYIRtpif2U/IcyAp9kWki9fb5V/BT
   uKNNWU1oTy0rSNPJY9s17uByLz9wy42zbuKe9hxTEX1kyE81sR9n0p5Ek
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="14284513"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="14284513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 05:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6895516"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Feb 2024 05:19:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reEPj-0009XQ-0s;
	Sun, 25 Feb 2024 13:19:31 +0000
Date: Sun, 25 Feb 2024 21:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:tick/keep-tick-on-hrt 13/15]
 include/trace/events/timer.h:444:19: warning: format '%lu' expects argument
 of type 'long unsigned int', but argument 4 has type 'long long int'
Message-ID: <202402252158.FzKcxr3F-lkp@intel.com>
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
commit: 30beac287e56cba2668a905e56b9879f23972ae2 [13/15] trace: tick: Trace the restarting of tick (split)
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240225/202402252158.FzKcxr3F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252158.FzKcxr3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252158.FzKcxr3F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/timer.h:474,
                    from kernel/time/timer.c:58:
   include/trace/events/timer.h: In function 'trace_raw_output_tick_stop':
>> include/trace/events/timer.h:444:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat=]
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
   include/trace/events/timer.h:465:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long int' [-Wformat=]
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
   include/trace/events/timer.h:465:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'long long int' [-Wformat=]
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


vim +444 include/trace/events/timer.h

   427	
   428		TP_PROTO(int success, int dependency),
   429	
   430		TP_ARGS(success, dependency),
   431	
   432		TP_STRUCT__entry(
   433			__field( int ,		success	)
   434			__field( int ,		dependency )
   435			__field( s64,		now	)
   436		),
   437	
   438		TP_fast_assign(
   439			__entry->success	= success;
   440			__entry->dependency	= dependency;
   441			__entry->now		= ktime_get();	// TODO: Look into using ktime_get_ts64 however this is not what tick-sched does.
   442		),
   443	
 > 444		TP_printk("now=%llu.%06lu success=%d dependency=%s",
   445				__entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
   446				__entry->success, show_tick_dep_name(__entry->dependency))
   447	);
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
