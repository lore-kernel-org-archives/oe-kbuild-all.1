Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9DA7E9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688613256; x=1720149256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nKiU8w+RW6h4Udi/nnNGe/qP9lnNeM4OKZr3kMBya8=;
  b=NcD6LT0SMc+daw/17sI9eyp12teZ9lkLsrFNrPSjfwByvOPoxRNpZgiT
   DSFokqUp9ND5MqpCbgs4vYj/Y3XOfG2LhY3/Fto2BSGRkrXqaVfb5LmVr
   +VENRC09l3RGDnmNN0KE+VN86vHPPcUZ9PErvkB4EZ05PbwsM2ZlWqRby
   J7mDOmDzFKxtlKAPFWBISs2RtgzmZWbGxaudiaL8kIA8Dl1q+RV/EPRma
   tZQEmejIByf4M0UzqkfawjjHrntHEitNpc7SZ37RbyhbqNdFfUBrgpqzx
   yQCJ+vZgbjZQf61AT++JlbRIbFjx47MZ5Jho8/lfyemSGJ6hUp+yusm/6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366068334"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="366068334"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 20:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="719449378"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="719449378"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jul 2023 20:14:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHFRe-00012s-0I;
	Thu, 06 Jul 2023 03:14:14 +0000
Date: Thu, 6 Jul 2023 11:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/8] kernel/time/hrtimer.c:997:2: error:
 call to undeclared function 'tick_nohz_hres_to_lres'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202307061113.hxQMUaeb-lkp@intel.com>
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
config: hexagon-randconfig-r045-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061113.hxQMUaeb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061113.hxQMUaeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061113.hxQMUaeb-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c:121:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
     119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
     119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
     119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:119:27: note: previous initialization is here
     119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/hrtimer.c:997:2: error: call to undeclared function 'tick_nohz_hres_to_lres'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     997 |         tick_nohz_hres_to_lres();
         |         ^
>> kernel/time/hrtimer.c:999:21: error: expression is not assignable
     999 |         hrtimer_resolution = LOW_RES_NSEC;
         |         ~~~~~~~~~~~~~~~~~~ ^
   kernel/time/hrtimer.c:990:6: warning: no previous prototype for function 'hrtimer_switch_to_lres' [-Wmissing-prototypes]
     990 | void hrtimer_switch_to_lres(void)
         |      ^
   kernel/time/hrtimer.c:990:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     990 | void hrtimer_switch_to_lres(void)
         | ^
         | static 
   kernel/time/hrtimer.c:1667:7: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1667 |         bool expires_in_hardirq;
         |              ^
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
 > 999		hrtimer_resolution = LOW_RES_NSEC;
  1000	}
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
