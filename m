Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814BB12B79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686172365; x=1717708365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRvEhASRof8A8IDuxIpToYa+gJCyrayoBKD0BNihRtE=;
  b=h7bxiIDmFxKGB2QSL7u+zntCvIsOG5SmWIBSZuikZG2NPVzXdSnU4cSt
   2mxoT9PWa4yCx2uw/Gc/9hZ3AWkUPjfYPa3a1dkNQidkZxc03j9igkY1K
   5EDTgZc0UDYZqsh2Tw3Leto54+aw/HWLPgcv7v1GyrQhFtW0M89qXaet+
   75qKepCrU67VTcvbnrbvOPdM1g6EqpYdZ3fLpf+jkvjN3FPH2KGlJZLCC
   3w3XA82hmAo/1h3lIQAWvM0Pk0n+wch158+vuzeO7O6mrpBx/vJ7l/prD
   mW36szJ3GjjCIgtpsM0zZhypd/SboQSm0X1jsEZDIyiU+02+R+rEVVNLO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="422955571"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="422955571"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 14:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709698904"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="709698904"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 14:12:43 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q70SQ-0006ux-33;
	Wed, 07 Jun 2023 21:12:42 +0000
Date: Thu, 8 Jun 2023 05:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/pid_rcu 3/3]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202306080522.ejCePh8u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/pid_rcu
head:   5d00dce3a81797c0ce156d4270f833b94a78b3dd
commit: 5d00dce3a81797c0ce156d4270f833b94a78b3dd [3/3] KVM: Protect vCPU's "last run PID" with rwlock, not RCU
config: x86_64-randconfig-s021-20230606 (https://download.01.org/0day-ci/archive/20230608/202306080522.ejCePh8u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/sean-jc/linux/commit/5d00dce3a81797c0ce156d4270f833b94a78b3dd
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/pid_rcu
        git checkout 5d00dce3a81797c0ce156d4270f833b94a78b3dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080522.ejCePh8u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse:    struct pid [noderef] __rcu *
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse:    struct pid *
   arch/x86/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1912:54: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1914:56: sparse: sparse: array of flexible structures
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_change_pte' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_start' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_end' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_flush_young' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_young' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_test_young' - different lock contexts for basic block
   arch/x86/kvm/../../../virt/kvm/kvm_main.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:2635:9: sparse: sparse: context imbalance in 'hva_to_pfn_remapped' - unexpected unlock

vim +499 arch/x86/kvm/../../../virt/kvm/kvm_main.c

fb3f0f51d92d14 drivers/kvm/kvm_main.c Rusty Russell       2007-07-27  488  
27592ae8dbe410 virt/kvm/kvm_main.c    Marc Zyngier        2021-11-16  489  static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
4543bdc08857e8 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  490  {
4543bdc08857e8 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  491  	kvm_arch_vcpu_destroy(vcpu);
5593473a1e6c74 virt/kvm/kvm_main.c    Paolo Bonzini       2022-04-06  492  	kvm_dirty_ring_free(&vcpu->dirty_ring);
e529ef66e6b53b virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  493  
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  494  	/*
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  495  	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  496  	 * the vcpu->pid pointer, and at destruction time all file descriptors
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  497  	 * are already gone.
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  498  	 */
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18 @499  	put_pid(rcu_dereference_protected(vcpu->pid, 1));
9941d224fb7c76 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  500  
8bd826d629d6ff virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  501  	free_page((unsigned long)vcpu->run);
e529ef66e6b53b virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  502  	kmem_cache_free(kvm_vcpu_cache, vcpu);
4543bdc08857e8 virt/kvm/kvm_main.c    Sean Christopherson 2019-12-18  503  }
27592ae8dbe410 virt/kvm/kvm_main.c    Marc Zyngier        2021-11-16  504  

:::::: The code at line 499 was first introduced by commit
:::::: 9941d224fb7c765bc20f3cb6c747786adc5cd002 KVM: Move putting of vcpu->pid to kvm_vcpu_destroy()

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
