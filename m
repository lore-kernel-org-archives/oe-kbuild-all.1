Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22CD1846
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461795; x=1724997795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqraNdJK0uGG4DGG29zQoVbDyxRvbJNYWbuED69zhHg=;
  b=ZXjl/XyiP7uUbaRTQ+cvVkr3f1e3zkpljnKKAVHboUa33C8XqXATjbsF
   UuyNn8I03w5Qh3wNfrG2iJQ447CwPuWLSKT+uaNW0pIILI868P5RQRSkT
   c0eIL/y454oa3S4cKexOCuy7Tl0PZOtuEab2/t38jE1VShUOdXMXJ1lMY
   9k9hrBuZ4m0RV4p2r+6ROsufkEpNwJV+7/94DTQjzS8OmzRGcmXoc3XYg
   ESJfjV4h26K/lN6WvY6uKWsnxuAoIqEmwxXkJju0H8EUbmqcNH3dCs8wE
   roG+RBPlEz+I7uVlUmKQ86PBZgttOSRZV+snG4AmPyuITeYjlPZau39cH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="406818690"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="406818690"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 23:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862891649"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="862891649"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2023 23:03:13 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qball-000Awr-0p;
	Thu, 31 Aug 2023 06:03:07 +0000
Date: Thu, 31 Aug 2023 14:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3281/24603]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for function 'max11801_read_adc'
Message-ID: <202308311331.OoFDdmJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robin,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: a414ba2296620d52817e64d747124b9f8efd2507 [3281/24603] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: riscv-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311331.OoFDdmJW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311331.OoFDdmJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311331.OoFDdmJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for function 'max11801_read_adc' [-Wmissing-prototypes]
   u32 max11801_read_adc(void)
       ^
   drivers/input/touchscreen/max11801_ts.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 max11801_read_adc(void)
   ^
   static 
   1 warning generated.


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
