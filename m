Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA023DEB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579469; cv=none; b=Sb4j+wfQjXNWz2mkT3YFpvH7nIMyH85DRC1m6gocn3DImG8avziu+Bu9EO40DiiCEj5W3dMFP4oXaZxtUWnP7GoOoqNCg6rDtS/kr90QeuGDl4od5mP65pqEeE1FEqA8aOo1w4Xkyr7B7noiHdInAM2wdM84eiNoMmEhYPMgSv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579469; c=relaxed/simple;
	bh=VrGBZYCUwc+jeWjU1cK4oKDyKruWqftAdMgR1aBo6V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKBitauFhoJlLX+35AEBgudutpszfZtkJLIVDgKCRrFLRHUKaNi8dcya15UFGxendDOO8UCsFNVFCSyFYNexIdikjoh76lF+iVFIIYVzVEcGrW5VGWgqg7ydUC/qYUJHAfqefI1RIyzjh1Gzkk79v6FOGmySOBPNwsQRVh72BIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4lvEuTY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4lvEuTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745579468; x=1777115468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrGBZYCUwc+jeWjU1cK4oKDyKruWqftAdMgR1aBo6V4=;
  b=k4lvEuTYj0w6iAGAJQimhSjn9KU2rMnlDBm7jIGfCXbRDNereE+Abh28
   TcVDT0lSUCDNpvyW8DXH/j3pA2esjwg7/1DEI+/E2/8896BDaRiko8dCR
   xogeU1YDORWMhTpy7y2Hyx2c6LkuGGktfTZNsup2oBMw+0X37HZzpnqba
   DltyLJmM2FNc2GV/xU3K0xY2t3a0Cs7VVXMXyg/REKzjg34AZ0+dfjCE0
   JX9cHS27D+l00GkUV7m8YhtJxF5xPTo7fVhfNx2OfwfySr0ETWlRthhYL
   OKQQLxtkZ15E4UCkZkWm9uXRDDkWBHM92HOQwUvBhrwfjfWD3UumAZPMy
   A==;
X-CSE-ConnectionGUID: If0vauedQlCZRgX8QWY4yA==
X-CSE-MsgGUID: U2z1jxoIQrikK6FV556N1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47149423"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47149423"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:11:07 -0700
X-CSE-ConnectionGUID: VVw93Pi0RJ6RnOSmn7vlmA==
X-CSE-MsgGUID: 7xI4MfiES5mr2eu4R30jGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132621250"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2025 04:11:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8GxT-00056q-2E;
	Fri, 25 Apr 2025 11:11:03 +0000
Date: Fri, 25 Apr 2025 19:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2167/2167]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202504251906.GEM88oi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tianrui,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6f8a0f52903845ede4602b637dd1323aef3592
commit: 07db411edd838080fb7c42b9f56bc08dd60d9af6 [2167/2167] LoongArch: KVM: Enable kvm config and add the makefile
config: loongarch-randconfig-r113-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251906.GEM88oi2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250425/202504251906.GEM88oi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251906.GEM88oi2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     got struct cpumask *[noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     got struct cpumask *[noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     got struct cpumask *[noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:300:16: sparse:     got struct cpumask *[noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     got struct cpumask *[noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     got struct cpumask *[noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     got struct cpumask *[noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct cpumask *[noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:327:16: sparse:     got struct cpumask *[noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1946:54: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1948:56: sparse: sparse: array of flexible structures
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_change_pte' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_start' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_end' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_flush_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_test_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:2678:9: sparse: sparse: context imbalance in 'hva_to_pfn_remapped' - unexpected unlock

vim +300 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

7053df4edb3ae3 Vitaly Kuznetsov 2018-05-16  289  
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  290  bool kvm_make_vcpus_request_mask(struct kvm *kvm, unsigned int req,
620b2438abf98f Vitaly Kuznetsov 2021-09-03  291  				 unsigned long *vcpu_bitmap)
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  292  {
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  293  	struct kvm_vcpu *vcpu;
620b2438abf98f Vitaly Kuznetsov 2021-09-03  294  	struct cpumask *cpus;
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  295  	int i, me;
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  296  	bool called;
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  297  
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  298  	me = get_cpu();
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  299  
620b2438abf98f Vitaly Kuznetsov 2021-09-03 @300  	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
620b2438abf98f Vitaly Kuznetsov 2021-09-03  301  	cpumask_clear(cpus);
620b2438abf98f Vitaly Kuznetsov 2021-09-03  302  
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  303  	for_each_set_bit(i, vcpu_bitmap, KVM_MAX_VCPUS) {
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  304  		vcpu = kvm_get_vcpu(kvm, i);
381cecc5d7b777 Vitaly Kuznetsov 2021-09-03  305  		if (!vcpu)
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  306  			continue;
b56bd8e03cf4d5 Jinrong Liang    2022-01-25  307  		kvm_make_vcpu_request(vcpu, req, cpus, me);
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  308  	}
ae0946cd360175 Vitaly Kuznetsov 2021-09-03  309  
620b2438abf98f Vitaly Kuznetsov 2021-09-03  310  	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
3cba41307a2b13 Xiao Guangrong   2011-01-12  311  	put_cpu();
7053df4edb3ae3 Vitaly Kuznetsov 2018-05-16  312  
7053df4edb3ae3 Vitaly Kuznetsov 2018-05-16  313  	return called;
7053df4edb3ae3 Vitaly Kuznetsov 2018-05-16  314  }
7053df4edb3ae3 Vitaly Kuznetsov 2018-05-16  315  

:::::: The code at line 300 was first introduced by commit
:::::: 620b2438abf98f09e19802cbc3bc2e98179cdbe2 KVM: Make kvm_make_vcpus_request_mask() use pre-allocated cpu_kick_mask

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
