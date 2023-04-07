Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08B5AD22
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680895564; x=1712431564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zk4LjEo5RLrCFSs2d+qKt0ZHeE+M/hlai/b8s21UsGU=;
  b=T3G8mUnmV4IqzedS+rxfMKSecqB+pisVytHuAD04JzaRp5MegX7264/6
   id9LYVisdWlZ6A1Azb5lxtmDB6ukolneB4zDijW7WKPQfVHxZkLLrVsSG
   f8dykNANsmkjQ3FaTfnspbBK25C1ScsDJV2edDtFUav7ezaWg+A0yCEU0
   uOAYJkVRCiCEVaG15ssBOQOT+H7vLGU8IQsnw30LlFBqDAPwhAin96TxU
   etBNI1KWFPMY4bXekWLCoUE4driQNExx/7Tw97dzMWfnHuaqjlNsv0dpf
   jyDKzvdksffkAbtrtA/SbJeMZAgnJQkKfUg1Rqk/VlNVSCXTR8X7bRmrp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327141757"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="327141757"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 12:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690150003"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="690150003"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 12:26:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkrik-000Sp0-17;
	Fri, 07 Apr 2023 19:26:02 +0000
Date: Sat, 8 Apr 2023 03:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 312/335]
 arch/x86/kvm/mmu/mmu.c:713:5: sparse: sparse: symbol
 'kvm_mmu_topup_memory_cache_for_split' was not declared. Should it be
 static?
Message-ID: <202304080328.9zGgpWHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3e6762343e0ddcb90b2e49af3a341051541d1a3a
commit: 1acfebc5dc9575d565744fb6484ea615c0b27db0 [312/335] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080328.9zGgpWHJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/1acfebc5dc9575d565744fb6484ea615c0b27db0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 1acfebc5dc9575d565744fb6484ea615c0b27db0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080328.9zGgpWHJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/mmu.c:713:5: sparse: sparse: symbol 'kvm_mmu_topup_memory_cache_for_split' was not declared. Should it be static?
   arch/x86/kvm/mmu/mmu.c:646:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_begin' - wrong count at exit
   arch/x86/kvm/mmu/mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, arch/x86/kvm/irq.h):
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_end' - unexpected unlock
   arch/x86/kvm/mmu/mmu.c:3006:9: sparse: sparse: context imbalance in 'mmu_try_to_unsync_pages' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file:
   arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/paging_tmpl.h:426:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/mmu.c:5494:57: sparse: sparse: cast truncates bits from constant value (ffffff33 becomes 33)
   arch/x86/kvm/mmu/mmu.c:5496:56: sparse: sparse: cast truncates bits from constant value (ffffff0f becomes f)
   arch/x86/kvm/mmu/mmu.c:5498:57: sparse: sparse: cast truncates bits from constant value (ffffff55 becomes 55)

vim +/kvm_mmu_topup_memory_cache_for_split +713 arch/x86/kvm/mmu/mmu.c

   712	
 > 713	int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   714	{
   715		int r = 0;
   716	#ifdef CONFIG_INTEL_TDX_HOST_DEBUG_MEMORY_CORRUPT
   717		struct kvm_mmu_memory_cache *mc;
   718		int start, end, i;
   719	
   720		mutex_lock(&kvm->arch.private_spt_for_split_lock);
   721		mc = &kvm->arch.private_spt_for_split_cache;
   722		start = kvm_mmu_memory_cache_nr_free_objects(mc);
   723		r = kvm_mmu_topup_memory_cache(mc, KVM_MAX_HUGEPAGE_LEVEL *
   724					       kvm->created_vcpus);
   725		end = kvm_mmu_memory_cache_nr_free_objects(mc);
   726		for (i = start; i < end; i++)
   727			kvm_mmu_split_direct_map(virt_to_page(mc->objects[i]));
   728		mutex_unlock(&kvm->arch.private_spt_for_split_lock);
   729	#endif
   730		return r;
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
