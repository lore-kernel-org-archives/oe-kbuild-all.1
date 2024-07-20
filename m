Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344A1E515
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 12:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721480368; cv=none; b=Bm55VeAYOz2nyuypToYuHl4MFUQg8+QuallTdY/zRITA1/9jRKWnqkHBEUJR8kNu4mhkx26KSrfqkZh59G7q3O0Vji7cBDSe+GcxcPp2pTGjUrc/7BrMxClQAIuD45NceM7nTSubwv7nvla6V+NYqxdtFZavaVCJguL45xWgkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721480368; c=relaxed/simple;
	bh=SeUZJ5yWN3ZrsgcqYTr5YfWM4NcxJLrqJ+7x6BtmUDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQ279L/N3dnyf336C0SzYTtCBOFGSXkajMuvwYeEIh+eUO1CCyuwbYg8ePSVVwxlgyE9odRT2G+9SthvdaY56c1cDeRBCvnzaGH5ziuCxIna3BMdlpWnSx8Q/i31XJ9dbvLQNHD6flMC1vRKHZkAo+QUQVbfbpVy3X65Se9IY8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eU4BPL/0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eU4BPL/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721480366; x=1753016366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SeUZJ5yWN3ZrsgcqYTr5YfWM4NcxJLrqJ+7x6BtmUDY=;
  b=eU4BPL/0LkAKkLvQq+lZmbTHVhprAyTh0KA4d17kwtuoXuLPfCbX4CUs
   DHXHSct34Za+EdOCeW05LoP8/u6EOM3uJgB4DUZb8e0X9HwaQSls92gy2
   GA6O5iaonTXlBUxZJXxYjUl1YaEZl/cwe8RA0lEKmbiQdYgBMjTnAzx0G
   JJowTRhBwaAv2VD0cwhkcPWhJ8MT6XQQ8Mm8/i/fXfb/J1gcrrU/pV3A4
   FWtCjEHUlKGB1w37ogNBGgVdtLc1DJCUs3Zouo2sMZsDiLf2s9W9IEJuw
   7xNsIYf4GduBfNwcx4R3AhvHRKPlrmJ3dhjDXV7JaDrFNSQjy1Kq1MhKL
   g==;
X-CSE-ConnectionGUID: rYDnHBDqQvenZmVwTZBpkQ==
X-CSE-MsgGUID: FWc2oc06SX+L89Q7m83bLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18970169"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="18970169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 05:59:25 -0700
X-CSE-ConnectionGUID: 7J3aOuXHROaDxU4V+4cI4A==
X-CSE-MsgGUID: OeB8B/rhRVux6MyiyvyekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="55673984"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jul 2024 05:59:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV9gI-000jCs-0o;
	Sat, 20 Jul 2024 12:59:22 +0000
Date: Sat, 20 Jul 2024 20:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 6/6] arch/parisc/kernel/time.c:119:2-4:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <202407202026.UHp3KX5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   c6651f1420427f9225b173e4232eadae55acadd8
commit: c6651f1420427f9225b173e4232eadae55acadd8 [6/6] parisc: Improve monotonic clock_gettime() resolution on SMP machines
config: parisc-randconfig-r061-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202026.UHp3KX5y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202026.UHp3KX5y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/time.c:119:2-4: WARNING !A || A && B is equivalent to !A || B

vim +119 arch/parisc/kernel/time.c

    50	
    51	/*
    52	 * We keep time on PA-RISC Linux by using the Interval Timer which is
    53	 * a pair of registers; one is read-only and one is write-only; both
    54	 * accessed through CR16.  The read-only register is 32 or 64 bits wide,
    55	 * and increments by 1 every CPU clock tick.  The architecture only
    56	 * guarantees us a rate between 0.5 and 2, but all implementations use a
    57	 * rate of 1.  The write-only register is 32-bits wide.  When the lowest
    58	 * 32 bits of the read-only register compare equal to the write-only
    59	 * register, it raises a maskable external interrupt.  Each processor has
    60	 * an Interval Timer of its own and they are not synchronised.  
    61	 *
    62	 * We want to generate an interrupt every 1/HZ seconds.  So we program
    63	 * CR16 to interrupt every @clocktick cycles.  The it_value in cpu_data
    64	 * is programmed with the intended time of the next tick.  We can be
    65	 * held off for an arbitrarily long period of time by interrupts being
    66	 * disabled, so we may miss one or more ticks.
    67	 *
    68	 * Note that on SMP machines the CR16 clocks are not syncronized between
    69	 * the CPUs. So, on such machines CR16 can not be used as high-res clock
    70	 * input for the monotonic clock_gettime64() syscall, which is why
    71	 * clock_gettime64() delivers poor resolution on SMP when configured with
    72	 * HZ=100 or HZ=250.  To work around this issue, let the CR16 timer
    73	 * interrupt trigger MONARCH_CLOCKTICK_FACTOR times more often, and
    74	 * increase the a cr16 counter everytime when interrupted. This counter is
    75	 * then used instead of the local CPU cr16 counter to get higher resolution
    76	 * than just using the jiffie-based timer.
    77	 */
    78	irqreturn_t __irq_entry timer_interrupt(int irq, void *dev_id)
    79	{
    80		unsigned long now;
    81		unsigned long next_tick;
    82		unsigned long ticks_elapsed = 0;
    83		unsigned int cpu = smp_processor_id();
    84		struct cpuinfo_parisc *cpuinfo = &per_cpu(cpu_data, cpu);
    85		int increase_monarch_tickrate = 0;
    86		static int monarch_tickrate_counter;
    87	
    88		/* gcc can optimize for "read-only" case with a local clocktick */
    89		unsigned long cpt = clocktick;
    90	
    91		/* let main clock tick faster if necessary */
    92		if (IS_ENABLED(CONFIG_SMP) &&
    93		    (IS_ENABLED(CONFIG_HZ_100) || IS_ENABLED(CONFIG_HZ_250)) &&
    94		    clock_use_monarch_cr16 && (cpu == time_keeper_id)) {
    95			increase_monarch_tickrate = 1;
    96			cpt /= MONARCH_CLOCKTICK_FACTOR;
    97			monarch_tickrate_counter++;
    98		}
    99	
   100		/* Initialize next_tick to the old expected tick time. */
   101		next_tick = cpuinfo->it_value;
   102	
   103		/* Calculate how many ticks have elapsed. */
   104		now = mfctl(16);
   105		do {
   106			++ticks_elapsed;
   107			next_tick += cpt;
   108		} while (next_tick - now > cpt);
   109	
   110		/* Store (in CR16 cycles) up to when we are accounting right now. */
   111		cpuinfo->it_value = next_tick;
   112	
   113		/* Go do system house keeping. */
   114		if (IS_ENABLED(CONFIG_SMP) && (cpu != time_keeper_id))
   115			ticks_elapsed = 0;
   116		else
   117			monarch_cr16_ticks++;
   118		if (!increase_monarch_tickrate || (increase_monarch_tickrate
 > 119			&& monarch_tickrate_counter == MONARCH_CLOCKTICK_FACTOR)) {
   120			legacy_timer_tick(ticks_elapsed);
   121			if (increase_monarch_tickrate)
   122				monarch_tickrate_counter = 0;
   123		}
   124	
   125		/* Skip clockticks on purpose if we know we would miss those.
   126		 * The new CR16 must be "later" than current CR16 otherwise
   127		 * itimer would not fire until CR16 wrapped - e.g 4 seconds
   128		 * later on a 1Ghz processor. We'll account for the missed
   129		 * ticks on the next timer interrupt.
   130		 * We want IT to fire modulo clocktick even if we miss/skip some.
   131		 * But those interrupts don't in fact get delivered that regularly.
   132		 *
   133		 * "next_tick - now" will always give the difference regardless
   134		 * if one or the other wrapped. If "now" is "bigger" we'll end up
   135		 * with a very large unsigned number.
   136		 */
   137		now = mfctl(16);
   138		while (next_tick - now > cpt)
   139			next_tick += cpt;
   140	
   141		/* Program the IT when to deliver the next interrupt.
   142		 * Only bottom 32-bits of next_tick are writable in CR16!
   143		 * Timer interrupt will be delivered at least a few hundred cycles
   144		 * after the IT fires, so if we are too close (<= 8000 cycles) to the
   145		 * next cycle, simply skip it.
   146		 */
   147		if (next_tick - now <= 8000)
   148			next_tick += cpt;
   149		mtctl(next_tick, 16);
   150	
   151		return IRQ_HANDLED;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
