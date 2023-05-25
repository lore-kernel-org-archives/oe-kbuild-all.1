Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9A19C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 May 2023 02:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684982793; x=1716518793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zUODqKlt6dg1W/vLFbu7qwnHRO+NVmhRV4LTeWwL6T8=;
  b=J8Ut24fdemZ9UKxagYgLJCRrUaCRTTJV6EOgB8dLiT53Es5woiKHCBd4
   pJlem/vKjQX7H/0HEM14tLYMxilpIO6Kv+VJzfb8ip+QopKPjCgEWktNy
   NAlntjLJt/f5wn23wH87c82zrNEwjq0AwMCU6KSyye5w7ePd4v/st9+/1
   FacswG6K2hdJmMZigvHUpvgD+1bN75WxmUkbFENAYpk3gD+MmK3ieTHhB
   9OJrHK991EUGoqAxDrnid3zOS6ODQY/opkd9QHNYLe4+fEpSAAYMKI1gW
   kWihvKm4CQtvK1okDtLnCrCYomVT/jBhgGYs+uJfamuLgVb/6ZHmH0ccM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356112664"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="356112664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 19:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769691614"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769691614"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 19:46:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q20zl-000FNt-2s;
	Thu, 25 May 2023 02:46:29 +0000
Date: Thu, 25 May 2023 10:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 25/28] kernel/time/hrtimer.c:2179:36:
 error: lvalue required as left operand of assignment
Message-ID: <202305251031.cG2lDE2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   c32e5c1b5bba406f42a9d1255075b8b916359ffe
commit: 1b2f990db928c2533a3b7eb8361635da03701273 [25/28] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230525/202305251031.cG2lDE2G-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 1b2f990db928c2533a3b7eb8361635da03701273
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305251031.cG2lDE2G-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1546:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1546 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
>> kernel/time/hrtimer.c:2166:6: warning: no previous prototype for 'hrtimer_smp_call' [-Wmissing-prototypes]
    2166 | void hrtimer_smp_call(void *info)
         |      ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: In function 'hrtimer_smp_call':
>> kernel/time/hrtimer.c:2179:36: error: lvalue required as left operand of assignment
    2179 |                 hrtimer_resolution = LOW_RES_NSEC;
         |                                    ^
   kernel/time/hrtimer.c: In function 'hrtimer_hres_handler':
>> kernel/time/hrtimer.c:2195:21: error: 'hrtimer_hres_enabled' undeclared (first use in this function); did you mean 'hrtimer_is_hres_enabled'?
    2195 |                 if (hrtimer_hres_enabled == hres)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     hrtimer_is_hres_enabled
   kernel/time/hrtimer.c:2195:21: note: each undeclared identifier is reported only once for each function it appears in
   kernel/time/hrtimer.c: At top level:
>> kernel/time/hrtimer.c:2213:36: error: 'hrtimer_hres_enabled' undeclared here (not in a function); did you mean 'hrtimer_is_hres_enabled'?
    2213 |                 .data           = &hrtimer_hres_enabled,
         |                                    ^~~~~~~~~~~~~~~~~~~~
         |                                    hrtimer_is_hres_enabled


vim +2179 kernel/time/hrtimer.c

  2164	
  2165	void tick_nohz_switch_to_nohz(void);
> 2166	void hrtimer_smp_call(void *info)
  2167	{
  2168		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
  2169		bool hres = *((bool *)info);
  2170	
  2171		if (hres == __hrtimer_hres_active(base))
  2172			return;
  2173	
  2174		if (!hres) {
  2175			trace_printk("smp call: called stn\n");
  2176	
  2177			tick_nohz_switch_to_nohz();
  2178			base->hres_active = 0;
> 2179			hrtimer_resolution = LOW_RES_NSEC;
  2180			return;
  2181		}
  2182		hrtimer_switch_to_hres();
  2183	}
  2184	
  2185	static int hrtimer_hres_handler(struct ctl_table *table, int write,
  2186				      void *buffer, size_t *lenp, loff_t *ppos)
  2187	{
  2188		int ret = 0;
  2189		bool hres;
  2190	
  2191		if (!write) {
  2192			ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2193		} else {
  2194			hres = ((char *)buffer)[0] != '0';
> 2195			if (hrtimer_hres_enabled == hres)
  2196				return ret;
  2197	
  2198			if (hres)
  2199				printk("Trying to switch to high res\n");
  2200			else
  2201				printk("Trying to switch to low res\n");
  2202	
  2203			smp_call_function(hrtimer_smp_call, &hres, true);
  2204			hrtimer_hres_enabled = hres;
  2205		}
  2206	
  2207		return ret;
  2208	}
  2209	
  2210	static struct ctl_table timer_hres_sysctl[] = {
  2211		{
  2212			.procname	= "timer_highres",
> 2213			.data		= &hrtimer_hres_enabled,
  2214			.maxlen		= sizeof(unsigned int),
  2215			.mode		= 0644,
  2216			.proc_handler	= hrtimer_hres_handler,
  2217			.extra1		= SYSCTL_ZERO,
  2218			.extra2		= SYSCTL_ONE,
  2219		},
  2220		{}
  2221	};
  2222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
