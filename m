Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF81C2E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 05:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709442013; cv=none; b=UobLry2LyeK/TLxFuV2wzZlo0RNWUTzIDBnwreeqVBMGy6PCLrtTx6FLVgffSH9fgOHC023jG71YcjBqWKdrFlt0VbwXUE0dB8RUYvwd70tahQ35Dn0Z52u3nbqEwcSvVk6iKVvXwpk9v9D7MQsOTJtDU+G/ke8a+u5nZ9a0ZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709442013; c=relaxed/simple;
	bh=txvfkd3tDJYx+m5Vo+jLJ2bW6QFWs+aEq1cMIrl5ecY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYS1Buycpl5jFGqjoIzkIIBqXK0ots/1x6LO13eHkOGZOjPYuN3Ev6ckxCO2oU8RFjgZmP3paNE5dXyOsqJF56v9rtTvZTkQx1i2BYgFYM8TKOdC00H8iWH/Eq+OxbnVWGLPoVUYbRvWKu3iOE6DdJWLXwJih+NcoW3rmrRDTWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbDitfIV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbDitfIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709442011; x=1740978011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txvfkd3tDJYx+m5Vo+jLJ2bW6QFWs+aEq1cMIrl5ecY=;
  b=QbDitfIV/ohNYoUsM9zngO7tsWgC210h5GpuaCJgcEHoLKfxbgoQqXuC
   GHJA6YoVLf6WuLjCtRW9MF5nf7TzVneSspK+XM9OHwM6asKF0mPUO+p8Z
   PH1mAN9qP7+HVdpQVunum7bkrSTZES6bp/VGtoj83RlN5Vy7yCtjeobZS
   MtfDPTg9UiJDcncH+Vq8MrJl78U7UyR3TUYMfon4DteFowAX9qwjVxEvA
   VunxNmF5hUYbr4fzkw41QRwgnGeY+GHLVdBsRrEBEkzlWzvOcsPd3k3xv
   IL0Eb0Q3Vu7FWRMdSMOAeIayAE5Q+nUhL5oQUkYTuLMhE69i8PImSc9ZT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4119614"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4119614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 21:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13189066"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2024 21:00:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgdxF-0000WS-1z;
	Sun, 03 Mar 2024 05:00:05 +0000
Date: Sun, 3 Mar 2024 12:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 830/30000]
 arch/arm64/kernel/watchdog_sdei.c:28:5: warning: no previous prototype for
 'watchdog_sdei_enable'
Message-ID: <202403031229.ycxCdpan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6adee00913b51cd59245584085cdaca64f74465c
commit: c7e03fb97fd2cfc439080387ea755846bc138a7f [830/30000] arm64: watchdog: add switch to select sdei_watchdog/pmu_watchdog
config: arm64-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031229.ycxCdpan-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031229.ycxCdpan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031229.ycxCdpan-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/watchdog_sdei.c:28:5: warning: no previous prototype for 'watchdog_sdei_enable' [-Wmissing-prototypes]
      28 | int watchdog_sdei_enable(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/watchdog_sdei.c:52:6: warning: no previous prototype for 'watchdog_sdei_disable' [-Wmissing-prototypes]
      52 | void watchdog_sdei_disable(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/watchdog_sdei.c:114:12: warning: no previous prototype for 'watchdog_sdei_probe' [-Wmissing-prototypes]
     114 | int __init watchdog_sdei_probe(void)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/watchdog_sdei_enable +28 arch/arm64/kernel/watchdog_sdei.c

    27	
  > 28	int watchdog_sdei_enable(unsigned int cpu)
    29	{
    30		int ret;
    31	
    32		if (!sdei_watchdog_registered)
    33			return -EINVAL;
    34	
    35	#ifdef CONFIG_HARDLOCKUP_CHECK_TIMESTAMP
    36		refresh_hld_last_timestamp();
    37	#endif
    38	
    39		__this_cpu_write(last_check_time, ktime_get_mono_fast_ns());
    40		sdei_api_set_secure_timer_period(watchdog_thresh);
    41	
    42		ret = sdei_api_event_enable(sdei_watchdog_event_num);
    43		if (ret) {
    44			pr_err("Enable NMI Watchdog failed on cpu%d\n",
    45					smp_processor_id());
    46			return ret;
    47		}
    48	
    49		return 0;
    50	}
    51	
  > 52	void watchdog_sdei_disable(unsigned int cpu)
    53	{
    54		int ret;
    55	
    56		if (!sdei_watchdog_registered)
    57			return;
    58	
    59		ret = sdei_api_event_disable(sdei_watchdog_event_num);
    60		if (ret)
    61			pr_err("Disable NMI Watchdog failed on cpu%d\n",
    62					smp_processor_id());
    63	}
    64	
    65	static int sdei_watchdog_callback(u32 event,
    66			struct pt_regs *regs, void *arg)
    67	{
    68		ktime_t delta, now = ktime_get_mono_fast_ns();
    69	
    70		delta = now - __this_cpu_read(last_check_time);
    71		__this_cpu_write(last_check_time, now);
    72	
    73		/*
    74		 * Set delta to 4/5 of the actual watchdog threshold period so the
    75		 * hrtimer is guaranteed to fire at least once within the real
    76		 * watchdog threshold.
    77		 */
    78		if (delta < watchdog_thresh * (u64)NSEC_PER_SEC * 4 / 5) {
    79			pr_err(FW_BUG "SDEI Watchdog event triggered too soon, "
    80				"time to last check:%lld ns\n", delta);
    81			WARN_ON(1);
    82			return 0;
    83		}
    84	
    85		watchdog_hardlockup_check(regs);
    86	
    87		return 0;
    88	}
    89	NOKPROBE_SYMBOL(sdei_watchdog_callback);
    90	
    91	static void sdei_nmi_watchdog_bind(void *data)
    92	{
    93		int ret;
    94	
    95		ret = sdei_api_event_interrupt_bind(SDEI_NMI_WATCHDOG_HWIRQ);
    96		if (ret < 0)
    97			pr_err("SDEI bind failed on cpu%d, return %d\n",
    98					smp_processor_id(), ret);
    99	}
   100	
   101	static int __init disable_sdei_nmi_watchdog_setup(char *str)
   102	{
   103		disable_sdei_nmi_watchdog = true;
   104		return 1;
   105	}
   106	__setup("disable_sdei_nmi_watchdog", disable_sdei_nmi_watchdog_setup);
   107	
   108	void sdei_watchdog_clear_eoi(void)
   109	{
   110		if (sdei_watchdog_registered)
   111			sdei_api_clear_eoi(SDEI_NMI_WATCHDOG_HWIRQ);
   112	}
   113	
 > 114	int __init watchdog_sdei_probe(void)
   115	{
   116		int ret;
   117	
   118		if (!is_hyp_mode_available()) {
   119			pr_err("Disable SDEI NMI Watchdog in VM\n");
   120			return -EINVAL;
   121		}
   122	
   123		sdei_watchdog_event_num = sdei_api_event_interrupt_bind(SDEI_NMI_WATCHDOG_HWIRQ);
   124		if (sdei_watchdog_event_num < 0) {
   125			pr_err("Bind interrupt failed. Firmware may not support SDEI !\n");
   126			return sdei_watchdog_event_num;
   127		}
   128	
   129		/*
   130		 * After we introduced 'sdei_api_set_secure_timer_period', we disselect
   131		 * 'CONFIG_HARDLOCKUP_CHECK_TIMESTAMP'. So we need to make sure that
   132		 * firmware can set the period of the secure timer and the timer
   133		 * interrupt doesn't trigger too soon.
   134		 */
   135		if (sdei_api_set_secure_timer_period(watchdog_thresh)) {
   136			pr_err("Firmware doesn't support setting the secure timer period, please update your BIOS !\n");
   137			return -EINVAL;
   138		}
   139	
   140		on_each_cpu(sdei_nmi_watchdog_bind, NULL, true);
   141	
   142		ret = sdei_event_register(sdei_watchdog_event_num,
   143						sdei_watchdog_callback, NULL);
   144		if (ret) {
   145			pr_err("SDEI Watchdog register callback failed\n");
   146			return ret;
   147		}
   148	
   149		sdei_watchdog_registered = true;
   150		pr_info("SDEI Watchdog registered successfully\n");
   151	
   152		return 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
