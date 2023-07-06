Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249A9A4C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 02:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688611337; x=1720147337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fnkAzYAL2pVpzvID40jJA0fq8YFhI3/8XdAf9qSxLXU=;
  b=HNCvZlUILIfRZ00KfUm8sBQKQ/cPdcGSiiVfUJ5u8LjZRvppJAOik2tX
   FeSdBrRQvLkZZcFshLtXfMBK8XjfXkKQBLvabVK88GVwqwUuiefr3Mjxd
   QvBVimBPFRbATJLLk77mdrKD7aCrYnhR6ccO4WdBLpPd0UpLU2mC1sdMp
   /LR8cWP8XtAcr4/7vOZtS7kfTVlOL/aVc6944rCZDutmhuyrHA/8f4Fgv
   bYeuBdbFn66GHUftO29Uo+L08gaDF0Iuk9iJp38M25Tj7mJ8rJn6GYI3Q
   B/ZERheo1W5UaaehuhwQvYgm8RbjYoV2d/aSQzTH1vULJXWepw6eIkQpM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366063445"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="366063445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 19:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="754588889"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="754588889"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jul 2023 19:42:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHEwe-00010U-2F;
	Thu, 06 Jul 2023 02:42:12 +0000
Date: Thu, 6 Jul 2023 10:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/8] kernel/time/hrtimer.c:990:6: warning:
 no previous prototype for 'hrtimer_switch_to_lres'
Message-ID: <202307061038.d83cHmgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   b9937f09c9e0ab857c06ec9360be17f860be5d42
commit: b9937f09c9e0ab857c06ec9360be17f860be5d42 [8/8] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230706/202307061038.d83cHmgT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061038.d83cHmgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061038.d83cHmgT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
>> kernel/time/hrtimer.c:990:6: warning: no previous prototype for 'hrtimer_switch_to_lres' [-Wmissing-prototypes]
     990 | void hrtimer_switch_to_lres(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1667:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1667 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~


vim +/hrtimer_switch_to_lres +990 kernel/time/hrtimer.c

   986	
   987	/*
   988	 * Switch to low resolution mode
   989	 */
 > 990	void hrtimer_switch_to_lres(void)
   991	{
   992		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   993	
   994		if (!__hrtimer_hres_active(base))
   995			return;
   996	
   997		tick_nohz_hres_to_lres();
   998		base->hres_active = 0;
   999		hrtimer_resolution = LOW_RES_NSEC;
  1000	}
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
