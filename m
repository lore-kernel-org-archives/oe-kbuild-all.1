Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB01848B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXKGr1/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702133981; x=1733669981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54DBfgGSJpHZ70Kt+T+NJ/r8Q2UOF5LKoelg9bMMmJ4=;
  b=aXKGr1/TY9Sw7hnhKZhp8B2234blkyoCSNy69mUk6fbFUH90wEyi/ZXw
   cFQhPnIZ9j2qRbvSguRN8+MljCmjZbh5itBCrgfzgzHMuyxI1qvp+RPat
   DS97WQsbQgaTNoQUAHV+bMtVvu+p7H6K/8Pm8A67q2Ih6BxmMJSHAh9HX
   LFAZbdHcdwW3TwqyDpGt03bZAb2xL7kzHq3ROL77SwJO8RUv/vubar2UK
   G6cXHxar4X7zBCwew4vMG74s0FhR0d4BV2nUqn2XXP055uy6XCoXJiMXQ
   7ahy9lvBo5FhmjRl1/F6q+RicGUFyasv7/0tI0dn9dTR4priEj8JwrW7I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374023188"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="374023188"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 06:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="20437620"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Dec 2023 06:59:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBynp-000FT5-1B;
	Sat, 09 Dec 2023 14:59:37 +0000
Date: Sat, 9 Dec 2023 22:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 94/138]
 kernel/time/timekeeping.c:1658:2: error: use of undeclared identifier
 'boot_delta'
Message-ID: <202312092239.Tf61nP9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   b26894471e7a8f8d1dc4c3c233e3e606540bbdd3
commit: 7833de03e339af4c25a58b24cc29ad75b98672fc [94/138] CHROMIUM: timekeeping: Remove CLOCK_BOOTTIME hack except for ARM64
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231209/202312092239.Tf61nP9H-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092239.Tf61nP9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092239.Tf61nP9H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timekeeping.c:1658:2: error: use of undeclared identifier 'boot_delta'
    1658 |         boot_delta.tv_sec = 5;
         |         ^
   kernel/time/timekeeping.c:1659:2: error: use of undeclared identifier 'boot_delta'
    1659 |         boot_delta.tv_nsec = 0;
         |         ^
   kernel/time/timekeeping.c:1660:47: error: use of undeclared identifier 'boot_delta'
    1660 |         tk_update_sleep_time(tk, timespec64_to_ktime(boot_delta));
         |                                                      ^
   3 errors generated.


vim +/boot_delta +1658 kernel/time/timekeeping.c

  1610	
  1611	/*
  1612	 * timekeeping_init - Initializes the clocksource and common timekeeping values
  1613	 */
  1614	void __init timekeeping_init(void)
  1615	{
  1616		struct timespec64 wall_time, boot_offset, wall_to_mono;
  1617		struct timekeeper *tk = &tk_core.timekeeper;
  1618		struct clocksource *clock;
  1619		unsigned long flags;
  1620	
  1621		read_persistent_wall_and_boot_offset(&wall_time, &boot_offset);
  1622		if (timespec64_valid_settod(&wall_time) &&
  1623		    timespec64_to_ns(&wall_time) > 0) {
  1624			persistent_clock_exists = true;
  1625		} else if (timespec64_to_ns(&wall_time) != 0) {
  1626			pr_warn("Persistent clock returned invalid value");
  1627			wall_time = (struct timespec64){0};
  1628		}
  1629	
  1630		if (timespec64_compare(&wall_time, &boot_offset) < 0)
  1631			boot_offset = (struct timespec64){0};
  1632	
  1633		/*
  1634		 * We want set wall_to_mono, so the following is true:
  1635		 * wall time + wall_to_mono = boot time
  1636		 */
  1637		wall_to_mono = timespec64_sub(boot_offset, wall_time);
  1638	
  1639		raw_spin_lock_irqsave(&timekeeper_lock, flags);
  1640		write_seqcount_begin(&tk_core.seq);
  1641		ntp_init();
  1642	
  1643		clock = clocksource_default_clock();
  1644		if (clock->enable)
  1645			clock->enable(clock);
  1646		tk_setup_internals(tk, clock);
  1647	
  1648		tk_set_xtime(tk, &wall_time);
  1649		tk->raw_sec = 0;
  1650	
  1651		tk_set_wall_to_mono(tk, wall_to_mono);
  1652	
  1653	#ifdef CONFIG_ARM64
  1654		// TODO(b/162547792): Remove following CLOCK_BOOTTIME adjustment
  1655		// once the underlying issue is resolved.
  1656		// The gap added here is larger enough than
  1657		// MIN_DELTA_BETWEEN_CLOCKS_MS which is expected by CTS Verifier.
> 1658		boot_delta.tv_sec = 5;
  1659		boot_delta.tv_nsec = 0;
  1660		tk_update_sleep_time(tk, timespec64_to_ktime(boot_delta));
  1661	#endif
  1662	
  1663		timekeeping_update(tk, TK_MIRROR | TK_CLOCK_WAS_SET);
  1664	
  1665		write_seqcount_end(&tk_core.seq);
  1666		raw_spin_unlock_irqrestore(&timekeeper_lock, flags);
  1667	}
  1668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
