Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1787F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688609354; x=1720145354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSgKR/fcTPlZfN7T1Lx+F+XaJtD2ubR7cqncrnzO/kE=;
  b=fGTs0vaM7UcrlROP+WCzuK3gQV4jOH5QWJ8VlnCnWg1qe5FcTZoKMnwE
   gZqpYV3Gec2C9G+lXyL08ChFYvUqFvswE+TeGqsw0714f1e44tdp3aiJw
   iPA6eHsTiXwLH6R+QFZp8gqo87fVuiKhVjyNJjN56HKXfa77sdH/srnDV
   7VliKPmufcY7ctxCAbjCqnm/u+H0cbl4SKeOtu3Jlu2KMKtFmaUvdFg2d
   DYm2a5JZ+bPuixPsNwVI7sUrdG5YouEogxUEANWufVlKYOnl71Ka8xsJ5
   56O8k8KMFcOW2LLTG1xMG8846yx4Qxgu1Bv9CA6HISPU8fKdqZaGKQa9F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366969246"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="366969246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 19:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="784747542"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="784747542"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2023 19:09:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHEQh-0000yW-1s;
	Thu, 06 Jul 2023 02:09:11 +0000
Date: Thu, 6 Jul 2023 10:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/8] kernel/time/hrtimer.c:997:9: error:
 implicit declaration of function 'tick_nohz_hres_to_lres'
Message-ID: <202307061008.gQKv9sik-lkp@intel.com>
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
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230706/202307061008.gQKv9sik-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061008.gQKv9sik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061008.gQKv9sik-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   kernel/time/hrtimer.c:990:6: warning: no previous prototype for 'hrtimer_switch_to_lres' [-Wmissing-prototypes]
     990 | void hrtimer_switch_to_lres(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: In function 'hrtimer_switch_to_lres':
>> kernel/time/hrtimer.c:997:9: error: implicit declaration of function 'tick_nohz_hres_to_lres' [-Werror=implicit-function-declaration]
     997 |         tick_nohz_hres_to_lres();
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/hrtimer.c:999:28: error: lvalue required as left operand of assignment
     999 |         hrtimer_resolution = LOW_RES_NSEC;
         |                            ^
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1667:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1667 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
