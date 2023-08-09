Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E8E17754
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691589576; x=1723125576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79m8yEB/HAtah43v8kM3VecrZH+Mnq+lR61ulOtgdZE=;
  b=E3jAe5T/OwSiT3BUj7MKWrFOoL3etja+0J72egPSp1hY1nrgUWPIiok+
   BhnRYR9y46Uk/zJe+4XT+zUHWqjhhc7/PpFleC0xAfqT/XEK6IbDaxzOr
   Gc/TVwYOxvJMHqA5iDcjl4PFiXJxYZY8Zk/JKTpCtx66wTCv8Wr/5jxkJ
   Lr3R9FAJ0Hj+mFaSPMyeHK5UZLzIl/r86QyOP68oqn4kN89vXGnFeHpED
   P8byipjqhq1HUnULIwoLJEiwDrWjnSBsYMGw9RN+sw02qKiZ6b2oMepfR
   obo/4OkriIL7lGw0uApECANnmwFFsxyfpPe73UDp8X++ioxTKPRlwJ/ZR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373908653"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="373908653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 06:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821864796"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="821864796"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 06:59:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTjin-00068i-1x;
	Wed, 09 Aug 2023 13:59:33 +0000
Date: Wed, 9 Aug 2023 21:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Michael Kelley <mikelley@microsoft.com>
Subject: [lantianyu:test 18/29] arch/x86/kernel/cpu/mshyperv.c:543:17: error:
 implicit declaration of function 'hv_sev_init_mem_and_cpu'
Message-ID: <202308092100.Q7QllXq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: b1fb0b5fda3b4d47523c15ad6817f5111e3ba898 [18/29] x86/hyperv: Initialize cpu and memory for SEV-SNP enlightened guest
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230809/202308092100.Q7QllXq8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092100.Q7QllXq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092100.Q7QllXq8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mshyperv.c: In function 'ms_hyperv_init_platform':
>> arch/x86/kernel/cpu/mshyperv.c:543:17: error: implicit declaration of function 'hv_sev_init_mem_and_cpu' [-Werror=implicit-function-declaration]
     543 |                 hv_sev_init_mem_and_cpu();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hv_sev_init_mem_and_cpu +543 arch/x86/kernel/cpu/mshyperv.c

   529	
   530		/* Register Hyper-V specific clocksource */
   531		hv_init_clocksource();
   532		hv_vtl_init_platform();
   533	#endif
   534		/*
   535		 * TSC should be marked as unstable only after Hyper-V
   536		 * clocksource has been initialized. This ensures that the
   537		 * stability of the sched_clock is not altered.
   538		 */
   539		if (!(ms_hyperv.features & HV_ACCESS_TSC_INVARIANT))
   540			mark_tsc_unstable("running on Hyper-V");
   541	
   542		if (hv_isolation_type_en_snp())
 > 543			hv_sev_init_mem_and_cpu();
   544	
   545		hardlockup_detector_disable();
   546	}
   547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
