Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB0B4A2C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688549879; x=1720085879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WMCitZpWM36yraYwFLdQszbnbrYojEgJ3tzp2ou0HY=;
  b=LqKauxKAWs9aLIpPaf2lEzZ1TCCEitx3177m+iqUCPL3iG4EXkQ7mg7p
   YPNqLMzWy+MCqSbfMUUMKK70CLX3PDxEZfDRPKUBzchZwSl5fplr6zDRK
   AS5chFvU/jvZyqd4XntxMjXds6Z+fwcOgKaVXSevN3MQq88KR+0BztOI6
   DI6t+hgyW6DJos7aHu5VuF2UiCe4kaId5kcbZMFZNRvgnoAe5KLRpeoKu
   p4Fw2zr9j/5ERMgSRwWB7oeVjZJPbtIfXgeosJxJPlu3vdoCadd9d0q7g
   rfC0cS7IlnZa82F57/1cmgwteUVuwAMv2c0MfWvy1Pn5UQt1OZ6ArHiNm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="365866178"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="365866178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 02:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="789100891"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="789100891"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2023 02:37:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGyxO-0000Yc-20;
	Wed, 05 Jul 2023 09:37:54 +0000
Date: Wed, 5 Jul 2023 17:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 2/4] kernel/time/hrtimer.c:701:6: sparse:
 sparse: symbol 'hrtimer_switch_to_lres' was not declared. Should it be
 static?
Message-ID: <202307051706.IT9utuCJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   4d89af6ae49b62b28be9c5bacc14997e409188d3
commit: cdc5027eae87be4fbce2aa7892bdd12b38388f63 [2/4] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: i386-randconfig-i062-20230703 (https://download.01.org/0day-ci/archive/20230705/202307051706.IT9utuCJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051706.IT9utuCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051706.IT9utuCJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:701:6: sparse: sparse: symbol 'hrtimer_switch_to_lres' was not declared. Should it be static?
>> kernel/time/hrtimer.c:716:6: sparse: sparse: symbol 'hrtimer_switch_to_hres' was not declared. Should it be static?
   kernel/time/hrtimer.c:151:33: sparse: sparse: context imbalance in 'lock_hrtimer_base' - wrong count at exit
   kernel/time/hrtimer.c:1020:28: sparse: sparse: context imbalance in 'hrtimer_start_range_ns' - unexpected unlock
   kernel/time/hrtimer.c:1054:28: sparse: sparse: context imbalance in 'hrtimer_try_to_cancel' - unexpected unlock
   kernel/time/hrtimer.c:1086:9: sparse: sparse: context imbalance in '__hrtimer_get_remaining' - unexpected unlock
   kernel/time/hrtimer.c:1251:25: sparse: sparse: context imbalance in '__run_hrtimer' - unexpected unlock
   kernel/time/hrtimer.c:104:21: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_REALTIME] = HRTIMER_BASE_REALTIME,
                        ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:104:21: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:105:22: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_MONOTONIC] = HRTIMER_BASE_MONOTONIC,
                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:105:22: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:106:21: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_BOOTTIME] = HRTIMER_BASE_BOOTTIME,
                        ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:106:21: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:107:17: warning: initialized field overwritten [-Woverride-init]
     [CLOCK_TAI]  = HRTIMER_BASE_TAI,
                    ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:107:17: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c:701:6: warning: no previous declaration for 'hrtimer_switch_to_lres' [-Wmissing-declarations]
    void hrtimer_switch_to_lres(void)
         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:716:6: warning: no previous declaration for 'hrtimer_switch_to_hres' [-Wmissing-declarations]
    void hrtimer_switch_to_hres(void)
         ^~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
