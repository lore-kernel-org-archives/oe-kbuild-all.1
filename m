Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051C2900
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZMxuYaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698177444; x=1729713444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7lajDPduR9Pct1aTb5JjMd2FHg7RLykYJL9MT1bxglg=;
  b=PZMxuYawNIbZOHnA0dZhnQIQpIu/qJ7XKKs0jQQIYzXN7fl4yTqiLfg0
   XRf/AbdjyBgIAhzCtrQV6/pwSadiDsNdqW9lXbv499CFKz4oLav80DCJP
   dH71QzW6yWDjyOlfmT1tM52X5SeTRvWfI7XKbyyvbMlU7tWVDiCyWMYCq
   5w11Qm/qcSYVJCRXp+vbcdrOE36M6EZ23/B2Sbwurc4g3xWk7bq0pFkMY
   O107eGPGO/U9rqXUyGKAn9nHN/I46rFMw7Z6vvQwBfdRhWKi0TcIDh559
   64XkberaHkbbQFVpU7QK0Ux0b3SpYmrZlzB5qDzboILHabA0q8lM4rVTo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="367375139"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="367375139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 12:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="849265699"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="849265699"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2023 12:57:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvNWi-0008EX-0S;
	Tue, 24 Oct 2023 19:57:20 +0000
Date: Wed, 25 Oct 2023 03:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 06/13] KVM: arm64: Sanitize PM{C,I}NTEN{SET,CLR},
 PMOVS{SET,CLR} before first run
Message-ID: <202310250322.y4kBQsJS-lkp@intel.com>
References: <20231020214053.2144305-7-rananta@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020214053.2144305-7-rananta@google.com>

Hi Raghavendra,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0a3a1665cbc59ee8d6326aa6c0b4a8d1cd67dda3]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-Rao-Ananta/KVM-arm64-PMU-Introduce-helpers-to-set-the-guest-s-PMU/20231021-054721
base:   0a3a1665cbc59ee8d6326aa6c0b4a8d1cd67dda3
patch link:    https://lore.kernel.org/r/20231020214053.2144305-7-rananta%40google.com
patch subject: [PATCH v8 06/13] KVM: arm64: Sanitize PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR} before first run
config: arm64-randconfig-004-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250322.y4kBQsJS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250322.y4kBQsJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250322.y4kBQsJS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/arm.c: In function 'check_vcpu_requests':
>> arch/arm64/kvm/arm.c:860:25: error: implicit declaration of function 'kvm_vcpu_handle_request_reload_pmu'; did you mean 'vm_vcpu_handle_request_reload_pmu'? [-Werror=implicit-function-declaration]
     860 |                         kvm_vcpu_handle_request_reload_pmu(vcpu);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         vm_vcpu_handle_request_reload_pmu
   cc1: some warnings being treated as errors


vim +860 arch/arm64/kvm/arm.c

   823	
   824	/**
   825	 * check_vcpu_requests - check and handle pending vCPU requests
   826	 * @vcpu:	the VCPU pointer
   827	 *
   828	 * Return: 1 if we should enter the guest
   829	 *	   0 if we should exit to userspace
   830	 *	   < 0 if we should exit to userspace, where the return value indicates
   831	 *	   an error
   832	 */
   833	static int check_vcpu_requests(struct kvm_vcpu *vcpu)
   834	{
   835		if (kvm_request_pending(vcpu)) {
   836			if (kvm_check_request(KVM_REQ_SLEEP, vcpu))
   837				kvm_vcpu_sleep(vcpu);
   838	
   839			if (kvm_check_request(KVM_REQ_VCPU_RESET, vcpu))
   840				kvm_reset_vcpu(vcpu);
   841	
   842			/*
   843			 * Clear IRQ_PENDING requests that were made to guarantee
   844			 * that a VCPU sees new virtual interrupts.
   845			 */
   846			kvm_check_request(KVM_REQ_IRQ_PENDING, vcpu);
   847	
   848			if (kvm_check_request(KVM_REQ_RECORD_STEAL, vcpu))
   849				kvm_update_stolen_time(vcpu);
   850	
   851			if (kvm_check_request(KVM_REQ_RELOAD_GICv4, vcpu)) {
   852				/* The distributor enable bits were changed */
   853				preempt_disable();
   854				vgic_v4_put(vcpu);
   855				vgic_v4_load(vcpu);
   856				preempt_enable();
   857			}
   858	
   859			if (kvm_check_request(KVM_REQ_RELOAD_PMU, vcpu))
 > 860				kvm_vcpu_handle_request_reload_pmu(vcpu);
   861	
   862			if (kvm_check_request(KVM_REQ_RESYNC_PMU_EL0, vcpu))
   863				kvm_vcpu_pmu_restore_guest(vcpu);
   864	
   865			if (kvm_check_request(KVM_REQ_SUSPEND, vcpu))
   866				return kvm_vcpu_suspend(vcpu);
   867	
   868			if (kvm_dirty_ring_check_request(vcpu))
   869				return 0;
   870		}
   871	
   872		return 1;
   873	}
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
