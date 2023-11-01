Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A911181
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLMxnKnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698838129; x=1730374129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PyWbWfvX163bAFehSTS7I3KAvJAQoYV+9MTqxA97jA4=;
  b=HLMxnKnxtPdozDQU0CwlCxZAcOiDayTPobzmavZtLkinWvOWT8h0QVXf
   LVMpDCmkaTeyImSorddWelDZoHmzoT5b11pbYS7+jdCsKLwdeNFdiIStz
   qRNbDXeByym2BLCt4WkJUukG+4ZKt8SvGiIz4xOjDmVFG3LSIj+4pAuMR
   CykQor1cOL3zIr72nr/U51GnCkUXzNLLNCjS9Mgbuh71cImCtw6aDeAR4
   liE/0GaF2J6Iwen/6JmyFT9W+Kqvp5QbXdV2XjHO2FtClqIjLYJKDOYhq
   pOjOmX49tdi0zLLJ5gOZoEV/CBtFKnK+xtj2MQy6hEiz8jQBAkY7UcFq1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388296460"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="388296460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 04:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851548055"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="851548055"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2023 04:28:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy9Ou-0000mA-38;
	Wed, 01 Nov 2023 11:28:44 +0000
Date: Wed, 1 Nov 2023 19:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Lukasz Luba <lukasz.luba@arm.com>
Subject: [vincent-guittot:sched/capacity-ref-freq 4/7]
 include/linux/cpufreq.h:1217:14: error: redefinition of
 'arch_scale_freq_ref'
Message-ID: <202311011909.pbxy5Icn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/capacity-ref-freq
head:   1cece4d361ca3f5830e5a94a1bd77913f556803e
commit: d40686c3c44b7588c20b1014c771625050ef9231 [4/7] energy_model: Use a fixed reference frequency
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231101/202311011909.pbxy5Icn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011909.pbxy5Icn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011909.pbxy5Icn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:31,
                    from kernel/sched/core.c:86:
>> include/linux/cpufreq.h:1217:14: error: redefinition of 'arch_scale_freq_ref'
    1217 | unsigned int arch_scale_freq_ref(int cpu)
         |              ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:90,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:13:
   include/linux/energy_model.h:209:14: note: previous definition of 'arch_scale_freq_ref' with type 'unsigned int(int)'
     209 | unsigned int arch_scale_freq_ref(int cpu)
         |              ^~~~~~~~~~~~~~~~~~~
--
   In file included from arch/sparc/kernel/time_64.c:29:
>> include/linux/cpufreq.h:1217:14: error: redefinition of 'arch_scale_freq_ref'
    1217 | unsigned int arch_scale_freq_ref(int cpu)
         |              ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:16,
                    from include/linux/rtc.h:37,
                    from include/linux/mc146818rtc.h:15,
                    from arch/sparc/kernel/time_64.c:24:
   include/linux/energy_model.h:209:14: note: previous definition of 'arch_scale_freq_ref' with type 'unsigned int(int)'
     209 | unsigned int arch_scale_freq_ref(int cpu)
         |              ^~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/time_64.c:880:20: error: no previous prototype for 'sched_clock' [-Werror=missing-prototypes]
     880 | unsigned long long sched_clock(void)
         |                    ^~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/arch_scale_freq_ref +1217 include/linux/cpufreq.h

27d3c93808c06d Vincent Guittot 2023-10-07  1214  
27d3c93808c06d Vincent Guittot 2023-10-07  1215  #ifndef arch_scale_freq_ref
27d3c93808c06d Vincent Guittot 2023-10-07  1216  static __always_inline
27d3c93808c06d Vincent Guittot 2023-10-07 @1217  unsigned int arch_scale_freq_ref(int cpu)
27d3c93808c06d Vincent Guittot 2023-10-07  1218  {
27d3c93808c06d Vincent Guittot 2023-10-07  1219  	return 0;
27d3c93808c06d Vincent Guittot 2023-10-07  1220  }
27d3c93808c06d Vincent Guittot 2023-10-07  1221  #endif
27d3c93808c06d Vincent Guittot 2023-10-07  1222  

:::::: The code at line 1217 was first introduced by commit
:::::: 27d3c93808c06d8346a75ef22495081285cf077e cpufreq: Use the fixed and coherent frequency for scaling capacity

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Vincent Guittot <vincent.guittot@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
