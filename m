Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABAB18785B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731777356; cv=none; b=bDA+6TtLHZ8cyhVnD3Qb56eRIwQ9CNyxK4r1f2IFHdK4N1dqSnc0KviAKe6wyWrdsV56didrzm9qg6L7kvNdEjbVYCMl6PErt9/zI/Uphgm4A7WsTEb88cdoYChjOkl2gyA9RlUDwxlgn+BPqMMsXUMxFrF1Mx06IWB6CMT+iSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731777356; c=relaxed/simple;
	bh=4NZZlniXijKx4ByitBzog03YM/oHUp+gjOebrzVhINE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sat8H45t2n76aTb1fvvPiQi5lTb1V8G9eB8omLYCOFExPYGLvvxQ/KqcI9ayoYqRDjLMz9TdDg+VpoXiQvx8GvBzxclljMzHFD0EYG3t5a54Wn2CCauoxFNI48o2j3KDoZbefYKictwdYfAhi2Ytf4BGAukotQnGXxYrGW0M0vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXWox6ZI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXWox6ZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731777355; x=1763313355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NZZlniXijKx4ByitBzog03YM/oHUp+gjOebrzVhINE=;
  b=AXWox6ZIfRY4bmAt4w81X5FvlvvixZoIhB2z9CK8EAEb+oo4fYyFdw0e
   KCypfzUJrOMUMqaZ6cZZk66oWNZKphcnSaQfASs/y73T8KVHwPHhHSrYL
   v76tfGT1lwOFs8NWHe5WppuxHXRHyq+LKQ5ZOWM6g7pofYS9nbJ1ylwwF
   Qppb8tFvgeAA+PxSlHVJpUmZ2+quqVWVdizn+dr7VRue4LQS5UW36raGN
   03erwLHT/y5PKswh8wwIu9m313vifeo92aonTGCLXnDOiwM9fo/iyxMEv
   oNDkRRshgd7/UodRtyyKFYwp8xggFbAATTvDektlJv4c4arQn0/vGuUW2
   w==;
X-CSE-ConnectionGUID: d+UUrqEkRpmNNvih/2Rn6w==
X-CSE-MsgGUID: oYwWZbQcQQCwIWdefsbVGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43166974"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="43166974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:15:51 -0800
X-CSE-ConnectionGUID: VQSvdH3JRG+Ugfbg6fvVhQ==
X-CSE-MsgGUID: VkVOXkmAQsW1NQGiljMnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93928617"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2024 09:15:51 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMOh-000103-2F;
	Sat, 16 Nov 2024 17:15:47 +0000
Date: Sun, 17 Nov 2024 01:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 156/259]
 arch/x86/kvm/x86.c:9954:5: warning: no previous prototype for function
 'kvm_pkvm_hypercall'
Message-ID: <202411170120.eGheVAR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: f8f823218b4ef3fc30f8cb32735799b1ede9a4c9 [156/259] ANDROID: pkvm: x86: Add the handler for hypercalls of PV MMIO operations
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241117/202411170120.eGheVAR3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170120.eGheVAR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170120.eGheVAR3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:20:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:9970:7: error: use of undeclared identifier 'PKVM_GHC_IOREAD'
    9970 |         case PKVM_GHC_IOREAD:
         |              ^
   arch/x86/kvm/x86.c:9974:7: error: use of undeclared identifier 'PKVM_GHC_IOWRITE'
    9974 |         case PKVM_GHC_IOWRITE:
         |              ^
>> arch/x86/kvm/x86.c:9954:5: warning: no previous prototype for function 'kvm_pkvm_hypercall' [-Wmissing-prototypes]
    9954 | int kvm_pkvm_hypercall(struct kvm_vcpu *vcpu)
         |     ^
   arch/x86/kvm/x86.c:9954:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9954 | int kvm_pkvm_hypercall(struct kvm_vcpu *vcpu)
         | ^
         | static 
   6 warnings and 2 errors generated.


vim +/kvm_pkvm_hypercall +9954 arch/x86/kvm/x86.c

  9953	
> 9954	int kvm_pkvm_hypercall(struct kvm_vcpu *vcpu)
  9955	{
  9956		unsigned long val, nr;
  9957		int size;
  9958		gpa_t gpa;
  9959		int ret;
  9960	
  9961		nr = kvm_rax_read(vcpu);
  9962		gpa = kvm_rbx_read(vcpu);
  9963		size = kvm_rcx_read(vcpu);
  9964		val = kvm_rdx_read(vcpu);
  9965	
  9966		/*
  9967		 * Reuse the sev_es handler to emulate the mmio.
  9968		 */
  9969		switch (nr) {
> 9970		case PKVM_GHC_IOREAD:
  9971			ret = kvm_sev_es_mmio_read(vcpu, gpa, size,
  9972					&vcpu->arch.regs[VCPU_REGS_RAX]);
  9973			break;
  9974		case PKVM_GHC_IOWRITE:
  9975			ret = kvm_sev_es_mmio_write(vcpu, gpa, size, &val);
  9976			break;
  9977		default:
  9978			ret = 1;
  9979			break;
  9980		}
  9981	
  9982		/*
  9983		 * We assume calling this function will always success which will update
  9984		 * the GUEST_RIP to skip the current instruction.
  9985		 */
  9986		static_call(kvm_x86_skip_emulated_instruction)(vcpu);
  9987	
  9988		return ret;
  9989	}
  9990	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
