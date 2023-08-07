Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B8125B3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 18:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691431471; x=1722967471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JpY8T4foe3a9ZKYmueB7hz3pm6q0OviaSQ8HCUZPA0A=;
  b=EXCuh/djA2vYnbJTVtID3RHqIdh1CTe+Xu+AXvNi4Li173131RriL3qF
   mQa7qMJxHrWO4T5O3xuK3I+bqoELrYmM1PH5uakomvh5scHaCREPcYbKH
   oPXSyUe717qqDJAIfNwvzcHn/XP7C8zQONFwOSW4n4VPJEoNSho5mTeoC
   JC2rBbU98B4Bm7Gv0dd4EiZzi8U16X20m8LwuI/9n3Dkt7gyEncnZxRpI
   FRUmbI2UdbFT/ZYSAO5vSAKYiT8V0bu83Rb12aOthgyIrBuUyDJbqZ9kW
   t/SX3xwwbowhTpiYyej6unZqowo6ziufaw5bpSMfbqzpDL9jGyA035uO6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370609090"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="370609090"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 11:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724602504"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="724602504"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Aug 2023 11:04:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT4aN-0004o9-0m;
	Mon, 07 Aug 2023 18:04:07 +0000
Date: Tue, 8 Aug 2023 02:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4] arch/arm64/kernel/cpufeature.c:959:1:
 warning: no previous prototype for
 'init_cpu_hwcaps_indirect_list_from_array'
Message-ID: <202308080129.7eSwUKGe-lkp@intel.com>
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
commit: 2a13d04cf14b7cb9432177840c840fb42fb411a6 [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-randconfig-r035-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080129.7eSwUKGe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080129.7eSwUKGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080129.7eSwUKGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:959:1: warning: no previous prototype for 'init_cpu_hwcaps_indirect_list_from_array' [-Wmissing-prototypes]
     959 | init_cpu_hwcaps_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:1428:1: warning: no previous prototype for 'feature_matches' [-Wmissing-prototypes]
    1428 | feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
         | ^~~~~~~~~~~~~~~
--
>> arch/arm64/kernel/process.c:544:5: warning: no previous prototype for 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
     544 | int arch_prctl_mem_model_get(struct task_struct *t)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/process.c:549:5: warning: no previous prototype for 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
     549 | int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for 'has_tso_fixed' [-Wmissing-prototypes]
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
      36 | void __init init_cpu_hwcaps_indirect_list_impdef(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/init_cpu_hwcaps_indirect_list_from_array +959 arch/arm64/kernel/cpufeature.c

82a3a21b236f96 Suzuki K Poulose 2018-11-30  957  
2a13d04cf14b7c Hector Martin    2023-05-08  958  void __init
82a3a21b236f96 Suzuki K Poulose 2018-11-30 @959  init_cpu_hwcaps_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
82a3a21b236f96 Suzuki K Poulose 2018-11-30  960  {
82a3a21b236f96 Suzuki K Poulose 2018-11-30  961  	for (; caps->matches; caps++) {
82a3a21b236f96 Suzuki K Poulose 2018-11-30  962  		if (WARN(caps->capability >= ARM64_NCAPS,
82a3a21b236f96 Suzuki K Poulose 2018-11-30  963  			"Invalid capability %d\n", caps->capability))
82a3a21b236f96 Suzuki K Poulose 2018-11-30  964  			continue;
82a3a21b236f96 Suzuki K Poulose 2018-11-30  965  		if (WARN(cpu_hwcaps_ptrs[caps->capability],
82a3a21b236f96 Suzuki K Poulose 2018-11-30  966  			"Duplicate entry for capability %d\n",
82a3a21b236f96 Suzuki K Poulose 2018-11-30  967  			caps->capability))
82a3a21b236f96 Suzuki K Poulose 2018-11-30  968  			continue;
82a3a21b236f96 Suzuki K Poulose 2018-11-30  969  		cpu_hwcaps_ptrs[caps->capability] = caps;
82a3a21b236f96 Suzuki K Poulose 2018-11-30  970  	}
82a3a21b236f96 Suzuki K Poulose 2018-11-30  971  }
82a3a21b236f96 Suzuki K Poulose 2018-11-30  972  

:::::: The code at line 959 was first introduced by commit
:::::: 82a3a21b236f96f84b715c46ac1b2a669da8916f arm64: capabilities: Speed up capability lookup

:::::: TO: Suzuki K Poulose <suzuki.poulose@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
