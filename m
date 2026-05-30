Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531C3932C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780127789; cv=none; b=pYmejdJ6h/uR/Z0D4joQKCForrYuWIh3MgqNgkm7uDcFj2hF1rwjjeG8BDthuob/xnBiO3aj2FS+igM+qDEvCCfeicpNBi6EDA4dmHX1R2pZrENCUrcrlhAASjhjnltulrJFAiQXTacyqDRtt25SsRsA5mmTc3zzhBqnzo0P5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780127789; c=relaxed/simple;
	bh=JYX4BbSqa54d2jcrnqb6DRcPjt4rAgprTrcEHA+HUBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ffCy5jN6WJh6zvyFKCqb0Nijtcc8SQW95dTqsqd2qvO/KIjPIVdreMG4Df7HIEIC17JeiZTQHm/WEpIzTKBFM5BlMtpsst1XlRUB9TF+IHqtiainxLWPxxIVojBXirD3df22Lu0KSZOLaHmUwRgJiAYhcRu5tO5CSoEeB0ReG8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQJTVe3l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQJTVe3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780127788; x=1811663788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYX4BbSqa54d2jcrnqb6DRcPjt4rAgprTrcEHA+HUBc=;
  b=HQJTVe3ly7veHddPsyeVPi8XpEjUh+fArEg+2oMbTBC14vB08P9bWyJV
   O3lqKSEj3g9dNkR7kx7UBryQVwnvbyKBD1YP1VeCASeWa3t2Pq9SwdzcP
   Z6P9mvxZXIJgxIuSF7GUbTc0Kzu4PVItayr0+DjNphClXQsn+rdKyDuGC
   my2IK/t7RanYA5H6t/43iYyylQPHmQ9l35/oNwdv+iAB/J2SLv4wbvPPc
   m+BvTpG6Nu2N8p7GnEdPpIXlBsJ1TAKJllckww3qIclKYbZJ206mKIRKX
   JqVuWlv3M5LpaSAERxtaXsUZRfDnSCcD7/YArEAHCJu7uXtjBYg6i79TA
   Q==;
X-CSE-ConnectionGUID: ZREyTMqrRgaPxNG3Kv5log==
X-CSE-MsgGUID: 1BqM/4vYS6Sgv4nFCeXPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84829479"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="84829479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 00:56:28 -0700
X-CSE-ConnectionGUID: iZ8Ir06HTse2DlTxHu7CWg==
X-CSE-MsgGUID: Co8S6S3USS2neiXUarJIOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="240046554"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 May 2026 00:56:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTEYR-000000008Eo-1YaE;
	Sat, 30 May 2026 07:56:23 +0000
Date: Sat, 30 May 2026 15:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>,
 Jacob Keller <jacob.e.keller@intel.com>
Subject: [tglx-devel:timers/ptp/timekeeping 5/25]
 arch/arm64/kvm/hyp_trace.c:121:31: warning: passing argument 1 of
 'ktime_get_snapshot_id' makes integer from pointer without a cast
Message-ID: <202605301510.VzE2siex-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/timekeeping
head:   cce2d296ed625dd88668132db78630d56cf395b8
commit: 3eefddc1140e90aca653f4234915cf65959d2fdc [5/25] KVM: arm64: Use ktime_get_snapshot_id() to retrieve CLOCK_BOOTTIME
config: arm64-randconfig-003-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301510.VzE2siex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301510.VzE2siex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301510.VzE2siex-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_clock_enable':
>> arch/arm64/kvm/hyp_trace.c:121:31: warning: passing argument 1 of 'ktime_get_snapshot_id' makes integer from pointer without a cast [-Wint-conversion]
     121 |         ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
         |                               ^~~~~
         |                               |
         |                               struct system_time_snapshot *
   In file included from include/linux/ktime.h:235,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_remote.h:7,
                    from arch/arm64/kvm/hyp_trace.c:8:
   include/linux/timekeeping.h:355:45: note: expected 'clockid_t' {aka 'int'} but argument is of type 'struct system_time_snapshot *'
     355 | extern void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *systime_snapshot);
         |                                   ~~~~~~~~~~^~~~~~~~
   In file included from include/linux/time64.h:11,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from arch/arm64/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from arch/arm64/include/asm/percpu.h:8,
                    from include/linux/irqflags.h:19,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/dcache.h:8,
                    from include/linux/trace_remote.h:6:
>> include/uapi/linux/time.h:56:41: warning: passing argument 2 of 'ktime_get_snapshot_id' makes pointer from integer without a cast [-Wint-conversion]
      56 | #define CLOCK_BOOTTIME                  7
         |                                         ^
         |                                         |
         |                                         int
   arch/arm64/kvm/hyp_trace.c:121:38: note: in expansion of macro 'CLOCK_BOOTTIME'
     121 |         ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
         |                                      ^~~~~~~~~~~~~~
   include/linux/timekeeping.h:355:84: note: expected 'struct system_time_snapshot *' but argument is of type 'int'
     355 | extern void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *systime_snapshot);
         |                                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~


vim +/ktime_get_snapshot_id +121 arch/arm64/kvm/hyp_trace.c

   108	
   109	static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enable)
   110	{
   111		struct system_time_snapshot snap;
   112	
   113		if (hyp_clock->running == enable)
   114			return;
   115	
   116		if (!enable) {
   117			cancel_delayed_work_sync(&hyp_clock->work);
   118			hyp_clock->running = false;
   119		}
   120	
 > 121		ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
   122	
   123		hyp_clock->boot = ktime_to_ns(snap.systime);
   124		hyp_clock->cycles = snap.cycles;
   125		hyp_clock->mult = 0;
   126	
   127		init_completion(&hyp_clock->ready);
   128		INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
   129		schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
   130		wait_for_completion(&hyp_clock->ready);
   131		hyp_clock->running = true;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
