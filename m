Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BB1878
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 05:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NN8X2fcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697349039; x=1728885039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GJZTaZe/Er1Gmoady2JuN+ViHc/kdv/SnSvaCFGEPNI=;
  b=NN8X2fcyZX8UblhW1N+HlZBkyiT5eYCfDSKmlX3QpUUGqvp0YbqXbPUL
   Fo3z66x8BGRAUYi+xMe6MMlmLmKigVdMTuyIBCOmKL68DTXVrEz1+2oNC
   /K5vyoD15nNseeciTt6S15BNPYMlWEJQFayMzHIHieDJBWH+h4wIlFAJd
   dm2H8+9z5V7YH5EMDTNIbMFHJcd7XDlJpTyqP6rfycZhCM5Hcxan56vXD
   r3Q0zXMmLRHTuy4MM45ExdIlIlL/0Xhy59/IBGdfLD63Ka4yIj2/HNfUc
   VSMPnbCfIrcGnDaQYdb1dsuDW48fhNAIGH5XmMAMq7BPKiAq1R1WuaSZh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370438886"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="370438886"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 22:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002490970"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1002490970"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 22:50:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qru1L-00074l-0G;
	Sun, 15 Oct 2023 05:50:35 +0000
Date: Sun, 15 Oct 2023 13:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/6] energy_model: use a fixed reference frequency
Message-ID: <202310151334.IkthZxxd-lkp@intel.com>
References: <20231009103621.374412-6-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009103621.374412-6-vincent.guittot@linaro.org>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on rafael-pm/linux-next arm64/for-next/core driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc5]
[cannot apply to next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/sched-consolidate-and-cleanup-access-to-CPU-s-max-compute-capacity/20231009-183827
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231009103621.374412-6-vincent.guittot%40linaro.org
patch subject: [PATCH v2 5/6] energy_model: use a fixed reference frequency
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151334.IkthZxxd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151334.IkthZxxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151334.IkthZxxd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/events/power.h:8,
                    from kernel/cpu.c:41:
>> include/linux/cpufreq.h:1217:14: error: redefinition of 'arch_scale_freq_ref'
    1217 | unsigned int arch_scale_freq_ref(int cpu)
         |              ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cpu.c:17:
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

49940a9adc5211 Vincent Guittot 2023-10-09  1214  
49940a9adc5211 Vincent Guittot 2023-10-09  1215  #ifndef arch_scale_freq_ref
49940a9adc5211 Vincent Guittot 2023-10-09  1216  static __always_inline
49940a9adc5211 Vincent Guittot 2023-10-09 @1217  unsigned int arch_scale_freq_ref(int cpu)
49940a9adc5211 Vincent Guittot 2023-10-09  1218  {
49940a9adc5211 Vincent Guittot 2023-10-09  1219  	return 0;
49940a9adc5211 Vincent Guittot 2023-10-09  1220  }
49940a9adc5211 Vincent Guittot 2023-10-09  1221  #endif
49940a9adc5211 Vincent Guittot 2023-10-09  1222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
