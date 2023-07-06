Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD5A5F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 03:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688613258; x=1720149258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bq/Qkk7GOr0egF6lK5Bx7utU9pWvBYxc1i+uYvYH/AU=;
  b=F7u9JjjL/uaKUTG2KJlZ3r+xTRoA6nb0E3Zpo6H+r1d2hBew70i8YC6l
   aOKGsuBZuwR0smi+6hLD3Qla2b8wxIHWv1T1ue80ScBHCYNDKPxTGnj+E
   RioC+V5EC2X3TuzK3ZvsRHp5Xgx0FanN8HcmV2W8V8gL3bUSMrHBj2SBe
   AWQDfM7FpzlLj5EgVgkDOkv5z4zJSA0W3b2cX5VlNoydCDCsCpTCrGFcq
   U+sM+AVGAf5ocbajh5pqi7+8xpHrZumsMqc8mGGwEOZ6jqVnStvZYYLMJ
   8GOa6R6gzUeFSpe+Jcv4kC7SQGuyZh92hRqPfq0gpClritB6Yucx29Plg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366068337"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="366068337"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 20:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="719449376"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="719449376"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jul 2023 20:14:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHFRe-00012q-0F;
	Thu, 06 Jul 2023 03:14:14 +0000
Date: Thu, 6 Jul 2023 11:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/8] kernel/time/hrtimer.c:997:2: error:
 call to undeclared function 'tick_nohz_hres_to_lres'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202307061134.pv0TBBM6-lkp@intel.com>
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
config: hexagon-alldefconfig (https://download.01.org/0day-ci/archive/20230706/202307061134.pv0TBBM6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061134.pv0TBBM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061134.pv0TBBM6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c:121:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_TAI]             = HRTIMER_BASE_TAI,
                                     ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/hrtimer.c:997:2: error: call to undeclared function 'tick_nohz_hres_to_lres'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           tick_nohz_hres_to_lres();
           ^
   kernel/time/hrtimer.c:999:21: error: expression is not assignable
           hrtimer_resolution = LOW_RES_NSEC;
           ~~~~~~~~~~~~~~~~~~ ^
   kernel/time/hrtimer.c:990:6: warning: no previous prototype for function 'hrtimer_switch_to_lres' [-Wmissing-prototypes]
   void hrtimer_switch_to_lres(void)
        ^
   kernel/time/hrtimer.c:990:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hrtimer_switch_to_lres(void)
   ^
   static 
   kernel/time/hrtimer.c:1667:7: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
           bool expires_in_hardirq;
                ^
   6 warnings and 2 errors generated.


vim +/tick_nohz_hres_to_lres +997 kernel/time/hrtimer.c

   986	
   987	/*
   988	 * Switch to low resolution mode
   989	 */
   990	void hrtimer_switch_to_lres(void)
   991	{
   992		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   993	
   994		if (!__hrtimer_hres_active(base))
   995			return;
   996	
 > 997		tick_nohz_hres_to_lres();
   998		base->hres_active = 0;
   999		hrtimer_resolution = LOW_RES_NSEC;
  1000	}
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
