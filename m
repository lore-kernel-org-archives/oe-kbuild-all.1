Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9560FE56C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692344367; x=1723880367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pF0nx3KRAAtkRrsXL/umn/4TS+eRhTWfbgMXtXsQEaE=;
  b=R5gOod8FCkcRtGJoIQQBr0XyMSiwK8ey1mNGv+FKeDYSMw31gA03t2Pl
   MpHSn0N0uJN4yK/OGDvrD3ghUPdnNsxydHX1bAjjG73jnEoRFB9LTzruH
   TDp/S39d6bPCqMEQsu0nuTpZfHj+sg0Bwu4EalTMdyX6fzS1ZSPHNJoRW
   zcxeTyjAyHbfsRGx276X368+M+mlvakbAsZi+x6MDy7VZynkRXAQaB7Gc
   t892aCMaLZJ4xlRbVuHl9L1b4NNLtEOq2MKV9CgJT/QCct6TtdebI44gc
   Edp8Rczce5ZBIEzRszGmtdWMjCaohLFEbmOKQL83PGzfQ9RVDMzFKj4+W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352627620"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="352627620"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 00:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728511799"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="728511799"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Aug 2023 00:39:05 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWu4W-0002E8-1I;
	Fri, 18 Aug 2023 07:39:04 +0000
Date: Fri, 18 Aug 2023 15:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 21/22] mm/swap_slots.c:95:6: warning:
 no previous declaration for 'is_swap_slot_cache_enabled'
Message-ID: <202308181512.kFZZxztG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   28b82089b299db6fa9efaeac2cee2c5b4fa7d5f0
commit: e064059673798b931f95f724c7e377fa8cd15df7 [21/22] ANDROID: create and export is_swap_slot_cache_enabled
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230818/202308181512.kFZZxztG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181512.kFZZxztG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181512.kFZZxztG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_slots.c:95:6: warning: no previous declaration for 'is_swap_slot_cache_enabled' [-Wmissing-declarations]
    bool is_swap_slot_cache_enabled(void)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_slots.c:101:6: warning: no previous declaration for 'check_cache_active' [-Wmissing-declarations]
    bool check_cache_active(void)
         ^~~~~~~~~~~~~~~~~~


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
