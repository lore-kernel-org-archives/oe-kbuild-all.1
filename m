Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744646B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 22:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682376365; x=1713912365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmZlBZ0HolrbGkRK8jkIWd0qzZNQRPv9L7rh6DDA108=;
  b=G94IPK9InHFDetdH/3PFScIoGZyPcyqIsDCFxQZMgi/x71BWSO6FCFuo
   +soYm9gpe5VWl48j6zskW2f/Bst8pTi+vysWrng8EYEtTzC7x14JDTwSM
   bjWd0P9BXXnsO8HfLP8JZ5tyFsgvfr7TixKGTMDL+u6P83Cbozgr/QA8+
   aDCKw7OO9d0Ul6kwp8iGh2iHCAaMUs2fGotWrvOccaIE8uCW5PBmt8tTA
   Y3l98FMKpCzXdAe0DZVqf9TNuS1HtQtaN1ceNbJhZWvSkrWcNQj8ySGVl
   Ze1gwD7R8btFPbSreZETrjgRok9GRe9h2zg6yBNLwmQUOGMaBbMhddd93
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411872775"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="411872775"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 15:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693253774"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="693253774"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2023 15:46:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr4wc-000ih6-2e;
	Mon, 24 Apr 2023 22:46:02 +0000
Date: Tue, 25 Apr 2023 06:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 312/338]
 arch/x86/kvm/mmu/mmu.c:713:5: warning: no previous prototype for
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202304250653.W9C4bcnH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   5217810067c6f32309d1473fc94649608330885c
commit: a51188903783ebbcbc6cd13b599fc53b3d5e6695 [312/338] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230425/202304250653.W9C4bcnH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/a51188903783ebbcbc6cd13b599fc53b3d5e6695
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout a51188903783ebbcbc6cd13b599fc53b3d5e6695
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250653.W9C4bcnH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:713:5: warning: no previous prototype for 'kvm_mmu_topup_memory_cache_for_split' [-Wmissing-prototypes]
     713 | int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
