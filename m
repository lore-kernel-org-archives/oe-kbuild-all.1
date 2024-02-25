Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A75256
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708839686; cv=none; b=sGbD0SQeSddr+uyBqj0/PkXCukBgs/N43d5JkJsSPIKnykUFMR8RW0gIwoU0hSTMk1AuZmz383m13UktDBkLuxWyOpBsVaQpdNND/OfB75ryzA4aUwn2mpRZOs6WX2wmpcHWzmk2nB0xmcuYm389nkQW8tT8CGDgw4w5NJKZmf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708839686; c=relaxed/simple;
	bh=DZfWh8LkPBmMQC+X7Kqg+XwElUkbuLSPr1Yf/rbHnVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CllOUPxm1PUF5+5IuhlYQxIVHiQqZSVB2pyRCiUjwaOki2HQunrEOdNhlcF/3IggDv/YcdNTMbhQ0n67rsdy/q/FAPyIpCNrBCTQA1PCqkKHNaHVgxdzzCdNnwaknCWorwkCaOmQmN+EFVhMxsWq2WyQwWlCt1MBohBsgoDL8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXpLieGK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXpLieGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708839685; x=1740375685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZfWh8LkPBmMQC+X7Kqg+XwElUkbuLSPr1Yf/rbHnVg=;
  b=MXpLieGKWgcxJ7dkYOkKfjJvfR3ZxEBu/dAU8MKIc9UxxvA47ya8VsvZ
   jb11jj0n3uQttzcEU9PyevpTP9XNrxbMfVs/D9uMcsk3c82E83tQnt7TD
   Gn17D4NSUhDT1HPsUQ0TrkPCgh1r3GwxhGCmGXevrrzxEA4zBADYGv2cz
   Jp0v3Ne+BQgfHE9q317ru0LTo45lgK6NE74M6mYGDf+olg/SYSQQKSzl3
   m/Zj1TfzgKl1X/SMNoGGU6035kjVMf8HrF1KqX1CK6VoJUoA2e5h/Euf8
   Tma1nLUCikpCylDFs1QcafFrUgvOkWzRXSuM+efotpCQB0F1XMgplQQqn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3055502"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3055502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 21:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="10891740"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2024 21:41:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re7GK-0009M0-06;
	Sun, 25 Feb 2024 05:41:20 +0000
Date: Sun, 25 Feb 2024 13:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:tick/keep-tick-on-hrt 12/13]
 include/trace/events/timer.h:449: undefined reference to `__moddi3'
Message-ID: <202402251325.MMFeDlxv-lkp@intel.com>
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
config: i386-randconfig-013-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251325.MMFeDlxv-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251325.MMFeDlxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251325.MMFeDlxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/timer.o: in function `trace_raw_output_tick_restart':
>> include/trace/events/timer.h:449: undefined reference to `__moddi3'
   ld: include/trace/events/timer.h:449: undefined reference to `__divdi3'
   ld: include/trace/events/timer.h:449: undefined reference to `__divdi3'
>> ld: include/trace/events/timer.h:449: undefined reference to `__moddi3'
   ld: include/trace/events/timer.h:449: undefined reference to `__divdi3'
   ld: include/trace/events/timer.h:449: undefined reference to `__divdi3'
   ld: kernel/time/timer.o: in function `trace_raw_output_tick_stop':
   include/trace/events/timer.h:426: undefined reference to `__moddi3'
   ld: include/trace/events/timer.h:426: undefined reference to `__divdi3'
   ld: include/trace/events/timer.h:426: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.o: in function `tick_nohz_next_event':
>> kernel/time/tick-sched.c:854: undefined reference to `__umoddi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__udivdi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__udivdi3'
>> ld: kernel/time/tick-sched.c:854: undefined reference to `__umoddi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__udivdi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__udivdi3'
>> ld: kernel/time/tick-sched.c:854: undefined reference to `__umoddi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__udivdi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__udivdi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__moddi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.c:854: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.o: in function `tick_nohz_idle_stop_tick':
>> kernel/time/tick-sched.c:1149: undefined reference to `__moddi3'
   ld: kernel/time/tick-sched.c:1149: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.c:1149: undefined reference to `__divdi3'
>> ld: kernel/time/tick-sched.c:1149: undefined reference to `__moddi3'
   ld: kernel/time/tick-sched.c:1149: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.c:1149: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.c:1162: undefined reference to `__moddi3'
   ld: kernel/time/tick-sched.c:1162: undefined reference to `__divdi3'
   ld: kernel/time/tick-sched.c:1162: undefined reference to `__divdi3'


vim +449 include/trace/events/timer.h

   448	
 > 449	TRACE_EVENT(tick_restart,
   450	
   451		TP_PROTO(s64 expiry),
   452	
   453		TP_ARGS(expiry),
   454	
   455		TP_STRUCT__entry(
   456			__field( s64,		now	)
   457			__field( s64,		expiry	)
   458		),
   459	
   460		TP_fast_assign(
   461			__entry->now	= ktime_get();
   462			__entry->expiry	= expiry;
   463		),
   464	
   465		TP_printk("now=%llu.%06lu expiry=%llu.%06lu",
   466				__entry->now / NSEC_PER_SEC, (__entry->now % NSEC_PER_SEC) / NSEC_PER_USEC,
   467				__entry->expiry / NSEC_PER_SEC, (__entry->expiry % NSEC_PER_SEC) / NSEC_PER_USEC)
   468	);
   469	#endif /* CONFIG_NO_HZ_COMMON */
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
