Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B0315AF6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695253590; x=1726789590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6yjhO8s3JLmmN+GK8nM2fzh61RzIokUVL7C5YG6fRI=;
  b=GMlgQWbDUUtDAoRsMtyGhIw56nDLXUDENmZlCSTSxCfHm+PfOUwPYcFy
   Z8uyJM47XpgSvmE+KMMRPZtFGtBHNRVlu7OGzjQP3vI+owe/CKFXC/mjI
   dlNk9yxWdzXuwDGv95N3IIZDJL/CJG5Itm5lvVeVRlJnuUzgiqmwrljvg
   ZZ/gRsuNZFkendHXIo95shivNH9AnkguVp6jCaAr6RR5+NAVtBj1E7wMU
   3JNQXOCnKbiMoez49jI5RvI0G+bqoubv1a0oVP5FRECiVcRgTR6DVdUOk
   Upyj2tCRVRepImVONE/Ahj4Tx8pUOFM4OcBSRV3nbNgpYysT48QltTpgO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380284249"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="380284249"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 16:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993834606"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="993834606"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2023 16:46:29 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj6tn-0009HK-0L;
	Wed, 20 Sep 2023 23:46:27 +0000
Date: Thu, 21 Sep 2023 07:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/5] arch/arm64/kernel/cpufeature.c:970:1:
 warning: no previous prototype for 'init_cpucap_indirect_list_from_array'
Message-ID: <202309210716.LikLE9u0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   1c741458c55fa5926ca4d157946248cac0772fad
commit: a45a628376bb37bba009a5399aceaf903bd54ff7 [3/5] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230921/202309210716.LikLE9u0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210716.LikLE9u0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210716.LikLE9u0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:970:1: warning: no previous prototype for 'init_cpucap_indirect_list_from_array' [-Wmissing-prototypes]
     970 | init_cpucap_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c: In function 'init_cpu_features':
   arch/arm64/kernel/cpufeature.c:1069:1: error: version control conflict marker in file
    1069 | <<<<<<< HEAD
         | ^~~~~~~
   arch/arm64/kernel/cpufeature.c:1071:1: error: expected expression before '||' token
    1071 | ||||||| parent of 2a13d04cf14b (arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs)
         | ^~
   arch/arm64/kernel/cpufeature.c:1071:19: error: invalid suffix "a13d04cf14b" on integer constant
    1071 | ||||||| parent of 2a13d04cf14b (arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs)
         |                   ^~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:1073:1: error: version control conflict marker in file
    1073 | =======
         | ^~~~~~~
   arch/arm64/kernel/cpufeature.c:1075:9: error: implicit declaration of function 'init_cpu_hwcaps_indirect_list_impdef'; did you mean 'init_cpucap_indirect_list_impdef'? [-Werror=implicit-function-declaration]
    1075 |         init_cpu_hwcaps_indirect_list_impdef();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         init_cpucap_indirect_list_impdef
   arch/arm64/kernel/cpufeature.c:1076:1: error: version control conflict marker in file
    1076 | >>>>>>> 2a13d04cf14b (arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs)
         | ^~~~~~~
   arch/arm64/kernel/cpufeature.c:1076:9: error: invalid suffix "a13d04cf14b" on integer constant
    1076 | >>>>>>> 2a13d04cf14b (arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs)
         |         ^~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c: At top level:
   arch/arm64/kernel/cpufeature.c:1449:1: warning: no previous prototype for 'feature_matches' [-Wmissing-prototypes]
    1449 | feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
         | ^~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:3271:20: warning: 'setup_boot_cpu_capabilities' defined but not used [-Wunused-function]
    3271 | static void __init setup_boot_cpu_capabilities(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:984:20: warning: 'init_cpucap_indirect_list' defined but not used [-Wunused-function]
     984 | static void __init init_cpucap_indirect_list(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for 'has_tso_fixed' [-Wmissing-prototypes]
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for 'init_cpucap_indirect_list_impdef' [-Wmissing-prototypes]
      36 | void __init init_cpucap_indirect_list_impdef(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/init_cpucap_indirect_list_from_array +970 arch/arm64/kernel/cpufeature.c

82a3a21b236f96f Suzuki K Poulose 2018-11-30  968  
a45a628376bb37b Hector Martin    2023-05-08  969  void __init
1c8ae42975bd708 Mark Rutland     2023-06-07 @970  init_cpucap_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
82a3a21b236f96f Suzuki K Poulose 2018-11-30  971  {
82a3a21b236f96f Suzuki K Poulose 2018-11-30  972  	for (; caps->matches; caps++) {
82a3a21b236f96f Suzuki K Poulose 2018-11-30  973  		if (WARN(caps->capability >= ARM64_NCAPS,
82a3a21b236f96f Suzuki K Poulose 2018-11-30  974  			"Invalid capability %d\n", caps->capability))
82a3a21b236f96f Suzuki K Poulose 2018-11-30  975  			continue;
1c8ae42975bd708 Mark Rutland     2023-06-07  976  		if (WARN(cpucap_ptrs[caps->capability],
82a3a21b236f96f Suzuki K Poulose 2018-11-30  977  			"Duplicate entry for capability %d\n",
82a3a21b236f96f Suzuki K Poulose 2018-11-30  978  			caps->capability))
82a3a21b236f96f Suzuki K Poulose 2018-11-30  979  			continue;
1c8ae42975bd708 Mark Rutland     2023-06-07  980  		cpucap_ptrs[caps->capability] = caps;
82a3a21b236f96f Suzuki K Poulose 2018-11-30  981  	}
82a3a21b236f96f Suzuki K Poulose 2018-11-30  982  }
82a3a21b236f96f Suzuki K Poulose 2018-11-30  983  

:::::: The code at line 970 was first introduced by commit
:::::: 1c8ae42975bd708f6c8c73d011025868b23076b3 arm64: cpufeature: use cpucap naming

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
