Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994386118
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 19:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686164755; x=1717700755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BhfHyzC3Q8HnWcexD2xvyUkWJhoImpK6XAnhV5jHFEc=;
  b=jBCjksOmhXdBausBOUJRuRync9/Q3dPcwNhPVe2VSIucuTIEYv1lQqyO
   +eEQ/OGTULr/OAkG1yFw1bGgYcWb8Jwp2t7Lz1OZB+ueKlP7DeWE28q3U
   cD17McovQvOmL1LLPRJUnnDfhpSYbd3giCaEtf9FV+Tyc3A8QQbD+UxHI
   VvUKZTCO2RMyq7g6jtBIPPzR9zChS+Qp7tcOSpkELUNGt7iTuw4K5VvOb
   0NoFcW3808E92hNEG+JgOnbWL8T+Jjjin8GFSIenvTsXXhU7BESIqnWcH
   jX+ZJYDlZzKir80Id0vEJ4O+LMNvpVBavY2BceS7SRJm6XbbMWngWqdrC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357093561"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="357093561"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 12:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739392401"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="739392401"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 12:05:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6yTR-0006qT-33;
	Wed, 07 Jun 2023 19:05:37 +0000
Date: Thu, 8 Jun 2023 03:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/pid_rcu 3/3]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202306080249.DFkpb7xx-lkp@intel.com>
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
config: s390-randconfig-s041-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080249.DFkpb7xx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/sean-jc/linux/commit/5d00dce3a81797c0ce156d4270f833b94a78b3dd
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/pid_rcu
        git checkout 5d00dce3a81797c0ce156d4270f833b94a78b3dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080249.DFkpb7xx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse:    struct pid [noderef] __rcu *
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse:    struct pid *
   arch/s390/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1912:54: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1914:56: sparse: sparse: array of flexible structures
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:2635:9: sparse: sparse: context imbalance in 'hva_to_pfn_remapped' - unexpected unlock

vim +499 arch/s390/kvm/../../../virt/kvm/kvm_main.c

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
