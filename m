Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6375EFBFD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691434510; x=1722970510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKFNVUBenPc8eQYz55tglVOopCORS/aF8eoKx+vD6Os=;
  b=L52s7mMQJmCecqH9bY6nIpVKB4YlaoY6ChCD8/mrbpgiAqDS0Nhoht0O
   sPPsOmuw4fuEPi+gv4lYhvGJxTPOn8EN0cbt3HBV6LYyJx5GhLKhjHBd0
   ESTqvU/+SOmRr9qxb2re0Z717YkcLU4c/FjqeWEUQhWhOEYLdb87RZKqR
   pnexbSX2mNPo9Y8sU8eVZjU8732b5LkCnwwqHCDLB2t/frZbM4Qv7eIDx
   CYea6FLv1EyJ2j8e50dcd+PIEmy9zo2h9NPdWpW64eO0MSjOzEKACDfLd
   Y8bU0J6hlnnhk8M1aNpjZab+XbyF9IrWjZf+csANcckhY8vminHes/YQl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350216632"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="350216632"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 11:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766096555"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="766096555"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Aug 2023 11:55:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT5Nj-0004p1-2e;
	Mon, 07 Aug 2023 18:55:07 +0000
Date: Tue, 8 Aug 2023 02:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 4/4]
 arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype
 for 'has_apple_feature'
Message-ID: <202308080237.oLpG1MjA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   6a8bd3529f0e9a26ebabd614ab6582cda3337142
commit: 6a8bd3529f0e9a26ebabd614ab6582cda3337142 [4/4] arm64: Implement Apple IMPDEF TSO memory model control
config: arm64-randconfig-r035-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080237.oLpG1MjA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080237.oLpG1MjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080237.oLpG1MjA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature_impdef.c:12:6: warning: no previous prototype for 'has_apple_feature' [-Wmissing-prototypes]
      12 | bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature_impdef.c:24:6: warning: no previous prototype for 'has_tso_fixed' [-Wmissing-prototypes]
      24 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature_impdef.c:59:13: warning: no previous prototype for 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
      59 | void __init init_cpu_hwcaps_indirect_list_impdef(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/has_apple_feature +12 arch/arm64/kernel/cpufeature_impdef.c

    11	
  > 12	bool has_apple_feature(const struct arm64_cpu_capabilities *entry, int scope)
    13	{
    14		u64 val;
    15		WARN_ON(scope != SCOPE_SYSTEM);
    16	
    17		if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
    18			return false;
    19	
    20		val = read_sysreg(aidr_el1);
    21		return feature_matches(val, entry);
    22	}
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
