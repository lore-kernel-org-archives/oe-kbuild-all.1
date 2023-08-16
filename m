Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80734F9F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692213772; x=1723749772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQWA9+K0srZ/EI2XrNoorxaZGrVBpEo2G4oiw/X3TQg=;
  b=C5wXGEX40A6eREnR4GRiIOVYUaBEYG+KDp2qZyJh6wXtKoeaMx6UJmwA
   L67wpfltmd+ayYIRIept94s+gDVDhxr7RsJEIAlBr/arizI31hlQnEVuN
   oG/qX0drQZg4OmRZZK+Jxdc3d0cZ9CqOgH2HM3p8NVEAi/tBzwwStM+/m
   rsXjHz6mDZM7+eZhddwQbH1dh609r/w2OUH45XZtf2GndiPMTXEhVfWPV
   FSH5Iou1m+UFpQflP7k2yaDyfq0hYLG7D8g4M5ESvjus63VEUnQul3Zbs
   aBanp9or4MnvVlVaaF8x1gJsN42boAxTPKs30ijiGO18qvLz6WodjAHAy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352939174"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="352939174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 12:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684174761"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="684174761"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2023 12:22:50 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWM6T-0000Vd-1X;
	Wed, 16 Aug 2023 19:22:49 +0000
Date: Thu, 17 Aug 2023 03:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 147/147]
 arch/x86/include/asm/resctrl.h:149:40: error: macro "rdmsr" requires 3
 arguments, but only 1 given
Message-ID: <202308170348.y4k2ctWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   d2210e80c29bdd622cb88af630aa4de57a01181c
commit: d2210e80c29bdd622cb88af630aa4de57a01181c [147/147] fs/resctrl: Add cranky debug for reading CPU msr values
config: x86_64-randconfig-r031-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170348.y4k2ctWo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170348.y4k2ctWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170348.y4k2ctWo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/resctrl.h:12,
                    from fs/proc/base.c:97:
   arch/x86/include/asm/resctrl.h: In function 'resctrl_arch_get_cpu_msr':
>> arch/x86/include/asm/resctrl.h:149:40: error: macro "rdmsr" requires 3 arguments, but only 1 given
     149 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                                        ^
   In file included from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from fs/proc/base.c:51:
   arch/x86/include/asm/msr.h:245: note: macro "rdmsr" defined here
     245 | #define rdmsr(msr, low, high)                                   \
         | 
>> arch/x86/include/asm/resctrl.h:149:16: error: 'rdmsr' undeclared (first use in this function)
     149 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                ^~~~~
   arch/x86/include/asm/resctrl.h:149:16: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from include/linux/resctrl.h:12,
                    from fs/resctrl/internal.h:5,
                    from fs/resctrl/monitor.c:22:
   arch/x86/include/asm/resctrl.h: In function 'resctrl_arch_get_cpu_msr':
>> arch/x86/include/asm/resctrl.h:149:40: error: macro "rdmsr" requires 3 arguments, but only 1 given
     149 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                                        ^
   In file included from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from fs/resctrl/monitor.c:18:
   arch/x86/include/asm/msr.h:245: note: macro "rdmsr" defined here
     245 | #define rdmsr(msr, low, high)                                   \
         | 
>> arch/x86/include/asm/resctrl.h:149:16: error: 'rdmsr' undeclared (first use in this function)
     149 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                ^~~~~
   arch/x86/include/asm/resctrl.h:149:16: note: each undeclared identifier is reported only once for each function it appears in
   fs/resctrl/monitor.c: In function 'cqm_handle_limbo':
   fs/resctrl/monitor.c:590:30: warning: variable 'r' set but not used [-Wunused-but-set-variable]
     590 |         struct rdt_resource *r;
         |                              ^
--
   In file included from fs/resctrl/rdtgroup.c:36:
   arch/x86/include/asm/resctrl.h: In function 'resctrl_arch_get_cpu_msr':
>> arch/x86/include/asm/resctrl.h:149:40: error: macro "rdmsr" requires 3 arguments, but only 1 given
     149 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                                        ^
   In file included from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from fs/resctrl/rdtgroup.c:16:
   arch/x86/include/asm/msr.h:245: note: macro "rdmsr" defined here
     245 | #define rdmsr(msr, low, high)                                   \
         | 
>> arch/x86/include/asm/resctrl.h:149:16: error: 'rdmsr' undeclared (first use in this function)
     149 |         return rdmsr(MSR_IA32_PQR_ASSOC);
         |                ^~~~~
   arch/x86/include/asm/resctrl.h:149:16: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/resctrl.h:150:1: error: control reaches end of non-void function [-Werror=return-type]
     150 | }
         | ^
   cc1: some warnings being treated as errors


vim +/rdmsr +149 arch/x86/include/asm/resctrl.h

   146	
   147	static inline u64 resctrl_arch_get_cpu_msr(void)
   148	{
 > 149		return rdmsr(MSR_IA32_PQR_ASSOC);
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
