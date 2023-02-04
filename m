Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176961FB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675510245; x=1707046245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bD+yYyQ17B86qBgKLxGS70HWrJLJNeUTAoS28OJG9w=;
  b=UtiYeklWAQpjrAsSqE5W4o82cs3hFaBaCkC4ngq/eQdpcVCUiMcYMOZU
   sC+b5xFCQIdvYnf+L+ig1LkfIASPWKMyCJEzI5Az0Tqoyg7woFc2n9kWJ
   2k37HaLiJKwnpyai+cy/MpkfFjPrPaEwu9XSBfa3/8kRpnh3aUUmBkmi0
   dgjDvBSh7JwTSqcblOeGueEmNRJdD921uTu/l7v86X/B05bgn+BpGBW3W
   MVn8E9MDS/c3Bz1KL0trWR0MNb7uzUv4AN3eu25iSgvJBFu78yiNKV2P4
   c5HqdJqVipQO0LiFmhO7UlVXm0QuBXko31HF/T2Gx/62nU2RzX0dswgox
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327572634"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="327572634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 03:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643546994"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="643546994"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 03:30:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOGkj-0001Gk-2z;
	Sat, 04 Feb 2023 11:30:41 +0000
Date: Sat, 4 Feb 2023 19:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15-arcvm
 94/138] kernel/time/timekeeping.c:1658:2: error: use of undeclared
 identifier 'boot_delta'
Message-ID: <202302041947.KexHdig2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hikaru,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15-arcvm
head:   573344b8d137d3584c918c7efa8d4b949d0414d4
commit: 7833de03e339af4c25a58b24cc29ad75b98672fc [94/138] CHROMIUM: timekeeping: Remove CLOCK_BOOTTIME hack except for ARM64
config: arm64-buildonly-randconfig-r005-20230204 (https://download.01.org/0day-ci/archive/20230204/202302041947.KexHdig2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/7833de03e339af4c25a58b24cc29ad75b98672fc
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15-arcvm
        git checkout 7833de03e339af4c25a58b24cc29ad75b98672fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/time/timekeeping.c:1658:2: error: use of undeclared identifier 'boot_delta'
           boot_delta.tv_sec = 5;
           ^
   kernel/time/timekeeping.c:1659:2: error: use of undeclared identifier 'boot_delta'
           boot_delta.tv_nsec = 0;
           ^
   kernel/time/timekeeping.c:1660:47: error: use of undeclared identifier 'boot_delta'
           tk_update_sleep_time(tk, timespec64_to_ktime(boot_delta));
                                                        ^
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
https://github.com/intel/lkp-tests
