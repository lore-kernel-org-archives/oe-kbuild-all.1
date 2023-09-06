Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB91094E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694022754; x=1725558754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNmgtHcWhgLb8cmndNQu/HPOV4bP/PLWkvwKVE6/ieQ=;
  b=Wxq75E62m/Bn8cJau8RYlvMi4TdxcltWDZhhQaY1WcxFLtl9Hjzs8UQ+
   0qdYQ7DL2UceNeATN/qCKfkj2dAIcbXoC7/3QBhJIL24rajQQIr5QhRut
   Hvdio1tBkUMgz7ag15hZjB55PGjXoJLsLIHSVxFPnW3vjqxLbXDfqL3LV
   uPIsw9qsJxqOqk/0UkiQzhujNJe1i6xfCNQhwvV0Fz/+PRfSW7oS090Ib
   t1bb50pml4/uOfOCymEtPp8OPrqzShqxhcJp9LWa77MvT/soE+9BnO4cy
   /8mEIZPmzawcgrA/kqq9jed020n2fmFHavx/lKfawkQzHuZb6EkPDpXRH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362171959"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="362171959"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988351569"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="988351569"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2023 10:43:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdwZ3-0000SN-1E;
	Wed, 06 Sep 2023 17:43:41 +0000
Date: Thu, 7 Sep 2023 01:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/640 3281/24604]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 declaration for 'max11801_read_adc'
Message-ID: <202309070114.sQxwmhLJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/640
head:   20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c
commit: a414ba2296620d52817e64d747124b9f8efd2507 [3281/24604] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: x86_64-randconfig-014-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070114.sQxwmhLJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070114.sQxwmhLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070114.sQxwmhLJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous declaration for 'max11801_read_adc' [-Wmissing-declarations]
    u32 max11801_read_adc(void)
        ^~~~~~~~~~~~~~~~~


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
