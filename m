Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613B12FF6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 22:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720736588; cv=none; b=D198ygyq6ox9/SuDkey8eVRz4H3rpEOZownVwyLnavOIkkfDohipl00HMZcJWjdrqFO3fNmFO2MQM+XJ37UyEr6ArXWr5GF9L5KsOLRIj/tA04ZcIAeXPK/Ow/y9r4rj0GOS5BIf0Df1xyY1NY4HvK7vgZCwCr7eDDuZIdZG5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720736588; c=relaxed/simple;
	bh=NMpOHPORZNiIszPd1xmJQDSXELAPTH4cuTGhM1HiWDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8Nbb+F4KCpDG72bCqp5P4ZCaBQNCzBEsuLe6HAhD/H3XimbCTmBziHN5AfK9BhBOab5l/7wdZZQuqpGLmBsi8d0QeKq69jVBaw2wesj/cUOsmpKDnLb4JRNyFkH4oMRJ4YlDyPNlggT5FnRiyTbOlrd4tR9DRt6UhkUFqh11IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcgeeaA6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcgeeaA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720736585; x=1752272585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMpOHPORZNiIszPd1xmJQDSXELAPTH4cuTGhM1HiWDo=;
  b=DcgeeaA6vhePXCobiM5dqehX/KQhHoOzWE6D3G2bcXvCR2RGmsqjn23B
   STXv6nw/4Skg1RrcMp/oQ4fuuDwmhIvSpxIqRKi8bSbvPgDy5No+kioya
   8j1niJeYA+pAYaZWCmrU4DFyAMrlK68IUAeXaif0624dilT+6QQ0AIAN0
   N3SxmJrnfXDN3pjkPCtHgHAu7qdrSADeMk6M/6sQO7FHC2PDe/GZslFA0
   m7iFBQmd7E6YrFlkEipXO1habvNiwqGhY/Dr5AcYshYtNoDSJRShS6bVC
   KBgUzBFDGyYLrNqomCkGg/bgN8SljlUAZWpVdhxNO3oRIi9vgqvP/4jWP
   g==;
X-CSE-ConnectionGUID: obbaJfT2QG+vRIbIyc4bUg==
X-CSE-MsgGUID: kfJje/pUSJK/oBHxV3mLRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18273768"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="18273768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 15:22:54 -0700
X-CSE-ConnectionGUID: jonTN6ofRV+9TxDzNF2iVA==
X-CSE-MsgGUID: ALBlhl1uR1Wt5lvjuH4eMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="53020136"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2024 15:22:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS2Be-000Zzi-1X;
	Thu, 11 Jul 2024 22:22:50 +0000
Date: Fri, 12 Jul 2024 06:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3761/10661]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:426:53: warning:
 'kvmalloc_array' sizes specified with 'sizeof' in the earlier argument and
 not in the later argument
Message-ID: <202407120630.mHZS1KSZ-lkp@intel.com>
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
head:   15f539c4a521c5ae892554d0046e24f050ec0e00
commit: 07db411edd838080fb7c42b9f56bc08dd60d9af6 [3761/10661] LoongArch: KVM: Enable kvm config and add the makefile
config: loongarch-randconfig-001-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120630.mHZS1KSZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120630.mHZS1KSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120630.mHZS1KSZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_mmu_topup_memory_cache':
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:426:53: warning: 'kvmalloc_array' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
     426 |                 mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
         |                                                     ^~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:426:53: note: earlier argument should specify number of elements, later size of each element


vim +426 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

6926f95accee3f Sean Christopherson 2020-07-02  413  
837f66c7120754 David Matlack       2022-06-22  414  int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
6926f95accee3f Sean Christopherson 2020-07-02  415  {
63f4b210414b65 Paolo Bonzini       2022-07-29  416  	gfp_t gfp = mc->gfp_custom ? mc->gfp_custom : GFP_KERNEL_ACCOUNT;
6926f95accee3f Sean Christopherson 2020-07-02  417  	void *obj;
6926f95accee3f Sean Christopherson 2020-07-02  418  
6926f95accee3f Sean Christopherson 2020-07-02  419  	if (mc->nobjs >= min)
6926f95accee3f Sean Christopherson 2020-07-02  420  		return 0;
837f66c7120754 David Matlack       2022-06-22  421  
837f66c7120754 David Matlack       2022-06-22  422  	if (unlikely(!mc->objects)) {
837f66c7120754 David Matlack       2022-06-22  423  		if (WARN_ON_ONCE(!capacity))
837f66c7120754 David Matlack       2022-06-22  424  			return -EIO;
837f66c7120754 David Matlack       2022-06-22  425  
837f66c7120754 David Matlack       2022-06-22 @426  		mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
837f66c7120754 David Matlack       2022-06-22  427  		if (!mc->objects)
837f66c7120754 David Matlack       2022-06-22  428  			return -ENOMEM;
837f66c7120754 David Matlack       2022-06-22  429  
837f66c7120754 David Matlack       2022-06-22  430  		mc->capacity = capacity;
837f66c7120754 David Matlack       2022-06-22  431  	}
837f66c7120754 David Matlack       2022-06-22  432  
837f66c7120754 David Matlack       2022-06-22  433  	/* It is illegal to request a different capacity across topups. */
837f66c7120754 David Matlack       2022-06-22  434  	if (WARN_ON_ONCE(mc->capacity != capacity))
837f66c7120754 David Matlack       2022-06-22  435  		return -EIO;
837f66c7120754 David Matlack       2022-06-22  436  
837f66c7120754 David Matlack       2022-06-22  437  	while (mc->nobjs < mc->capacity) {
837f66c7120754 David Matlack       2022-06-22  438  		obj = mmu_memory_cache_alloc_obj(mc, gfp);
6926f95accee3f Sean Christopherson 2020-07-02  439  		if (!obj)
6926f95accee3f Sean Christopherson 2020-07-02  440  			return mc->nobjs >= min ? 0 : -ENOMEM;
6926f95accee3f Sean Christopherson 2020-07-02  441  		mc->objects[mc->nobjs++] = obj;
6926f95accee3f Sean Christopherson 2020-07-02  442  	}
6926f95accee3f Sean Christopherson 2020-07-02  443  	return 0;
6926f95accee3f Sean Christopherson 2020-07-02  444  }
6926f95accee3f Sean Christopherson 2020-07-02  445  

:::::: The code at line 426 was first introduced by commit
:::::: 837f66c71207542283831d0762c5dca3db5b397a KVM: Allow for different capacities in kvm_mmu_memory_cache structs

:::::: TO: David Matlack <dmatlack@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
