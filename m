Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC602368
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 00:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675989450; x=1707525450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXyJgNPvZehyPMk+XcL+100g+1+DfTr5lbVyZtp1LCE=;
  b=e1WiNnX+p2tNW0WGA7f6CP1TmRSrmhOPcKTXlzor624Z9hV4L84xBy8W
   rLTlDXriXe9Zhgf8/s6eWtga/+949t5oVnzdsGT6M8GIpFVVfnw7c2eo7
   nNlkaFSAF9hxJLhNFPFsLhW0Cd+M7A6ZfDdOGBd/t+wiI9tzhIuSNMW2R
   q3/xnCQWrzWu0YjsE5fL0M+7CeL9U+O4iqWzsrJMKb/OO6hjEAmULc2Dw
   cMCUPCtsvZVtowYkT7q71mHDt2gdDzlpgtN78M9gXTdrqoTwvQeFIKBiO
   SsFZHFWZY/K1P1dP/ekLsj+4dQMGcUKTf1xrTbxoAsPRAb6SVJVFmktJ0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310656962"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="310656962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 16:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="756606662"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="756606662"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Feb 2023 16:37:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQHPc-0005PK-1M;
	Fri, 10 Feb 2023 00:37:12 +0000
Date: Fri, 10 Feb 2023 08:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:bleeding-edge 209/212] drivers/cpuidle/driver.c:187:
 undefined reference to `__divdi3'
Message-ID: <202302100849.6RI86Ten-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   ccf0090d0435abab1a8c84e595802e88ad90b357
commit: de375f9c854a136822d5409a92d4efb57ac65e32 [209/212] cpuidle: driver: Update microsecond values of state parameters as needed
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230210/202302100849.6RI86Ten-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?id=de375f9c854a136822d5409a92d4efb57ac65e32
        git remote add rafael-pm https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
        git fetch --no-tags rafael-pm bleeding-edge
        git checkout de375f9c854a136822d5409a92d4efb57ac65e32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100849.6RI86Ten-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cpuidle/driver.o: in function `__cpuidle_driver_init':
>> drivers/cpuidle/driver.c:187: undefined reference to `__divdi3'
>> ld: drivers/cpuidle/driver.c:194: undefined reference to `__divdi3'


vim +187 drivers/cpuidle/driver.c

   149	
   150	/**
   151	 * __cpuidle_driver_init - initialize the driver's internal data
   152	 * @drv: a valid pointer to a struct cpuidle_driver
   153	 */
   154	static void __cpuidle_driver_init(struct cpuidle_driver *drv)
   155	{
   156		int i;
   157	
   158		/*
   159		 * Use all possible CPUs as the default, because if the kernel boots
   160		 * with some CPUs offline and then we online one of them, the CPU
   161		 * notifier has to know which driver to assign.
   162		 */
   163		if (!drv->cpumask)
   164			drv->cpumask = (struct cpumask *)cpu_possible_mask;
   165	
   166		for (i = 0; i < drv->state_count; i++) {
   167			struct cpuidle_state *s = &drv->states[i];
   168	
   169			/*
   170			 * Look for the timer stop flag in the different states and if
   171			 * it is found, indicate that the broadcast timer has to be set
   172			 * up.
   173			 */
   174			if (s->flags & CPUIDLE_FLAG_TIMER_STOP)
   175				drv->bctimer = 1;
   176	
   177			/*
   178			 * The core will use the target residency and exit latency
   179			 * values in nanoseconds, but allow drivers to provide them in
   180			 * microseconds too.
   181			 */
   182			if (s->target_residency > 0)
   183				s->target_residency_ns = s->target_residency * NSEC_PER_USEC;
   184			else if (s->target_residency_ns < 0)
   185				s->target_residency_ns = 0;
   186			else
 > 187				s->target_residency = s->target_residency_ns / NSEC_PER_USEC;
   188	
   189			if (s->exit_latency > 0)
   190				s->exit_latency_ns = s->exit_latency * NSEC_PER_USEC;
   191			else if (s->exit_latency_ns < 0)
   192				s->exit_latency_ns =  0;
   193			else
 > 194				s->exit_latency = s->exit_latency_ns / NSEC_PER_USEC;
   195		}
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
