Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789671BDD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv/87PDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808733; x=1729344733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I7Q98fNxJZhy/3Qv2UaONAK2epdUfL92XLHBmVp0KQ8=;
  b=Qv/87PDNiRFa/Zig8HrkBUocA4hhQiHbxZPIkOJ/rJcI7HJnGbaw9mrL
   l/EBafGGFBw57pr5HcbLYZacAEZWENIV7ZoEmPUy9ilPGhlLYKC/uGLHn
   6q9Wffu/CFV/vj4Vq0NirgFaas9ruDZqlH1uKm1IDmgQrs0262YQolhfT
   wWxmNRo/dkfI49icrRN50cIj95SAZScgTywKn3yRwIRp2Ob9dUeL/0nJo
   UNnHa1Liy34DgpUiF+I2fPt/WaM7G5TKFo2stHvSLxNhzRGcWWL1qEqhC
   QXQETwrnyMVulN2duTzJUgL1UaquNq3xC9tds7bZun2wLAzZXbuXFGMdQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8060212"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="8060212"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707226764"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707226764"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 06:32:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtpbl-0003ZK-0U;
	Fri, 20 Oct 2023 13:32:09 +0000
Date: Fri, 20 Oct 2023 21:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 5/5]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:850:9: warning: 'drain_shadow_vcpus'
 accessing 8 bytes in a region of size 0
Message-ID: <202310202144.VBGsp8ms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ac178987584017ed6d85752157b8af6ab3e429fa
commit: c0a7deb29d91907f72eb49bb6114e7cd135db378 [5/5] ANDROID: KVM: arm64: Donate memory per vcpu for each vcpu shadow state
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231020/202310202144.VBGsp8ms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202144.VBGsp8ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202144.VBGsp8ms-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:60:22: warning: 'pkvm_ffa_id' defined but not used [-Wunused-const-variable=]
      60 | static const pkvm_id pkvm_ffa_id        = pkvm_hyp_id + 1; /* Secure world */
         |                      ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:58:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
      58 | static const pkvm_id pkvm_host_id       = 0;
         |                      ^~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function '__pkvm_teardown_shadow':
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:850:9: warning: 'drain_shadow_vcpus' accessing 8 bytes in a region of size 0 [-Wstringop-overflow=]
     850 |         drain_shadow_vcpus(vm->shadow_vcpus, nr_vcpus, mc);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:850:9: note: referencing argument 1 of type 'struct shadow_vcpu_state *[0]'
   arch/arm64/kvm/hyp/nvhe/pkvm.c:612:13: note: in a call to function 'drain_shadow_vcpus'
     612 | static void drain_shadow_vcpus(struct shadow_vcpu_state *shadow_vcpus[],
         |             ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:851:9: warning: 'unpin_host_vcpus' accessing 8 bytes in a region of size 0 [-Wstringop-overflow=]
     851 |         unpin_host_vcpus(vm->shadow_vcpus, nr_vcpus);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c:851:9: note: referencing argument 1 of type 'struct shadow_vcpu_state *[0]'
   arch/arm64/kvm/hyp/nvhe/pkvm.c:385:13: note: in a call to function 'unpin_host_vcpus'
     385 | static void unpin_host_vcpus(struct shadow_vcpu_state *shadow_vcpus[], int nr_vcpus)
         |             ^~~~~~~~~~~~~~~~


vim +/drain_shadow_vcpus +850 arch/arm64/kvm/hyp/nvhe/pkvm.c

bf94ae1300cd15 Fuad Tabba     2022-10-10  803  
0856ec2e5348c1 Fuad Tabba     2022-01-28  804  int __pkvm_teardown_shadow(int shadow_handle)
1669999c8da7c9 Fuad Tabba     2021-02-03  805  {
4fc088eb4d38b7 Quentin Perret 2021-11-03  806  	struct kvm_hyp_memcache *mc;
1669999c8da7c9 Fuad Tabba     2021-02-03  807  	struct kvm_shadow_vm *vm;
4fc088eb4d38b7 Quentin Perret 2021-11-03  808  	struct kvm *host_kvm;
76094a9979e303 Fuad Tabba     2022-10-10  809  	unsigned int nr_vcpus;
0856ec2e5348c1 Fuad Tabba     2022-01-28  810  	int err;
e88313ab7cc5d3 Fuad Tabba     2022-05-05  811  	int i;
1669999c8da7c9 Fuad Tabba     2021-02-03  812  
1669999c8da7c9 Fuad Tabba     2021-02-03  813  	/* Lookup then remove entry from the shadow table. */
6f93dc7bb931a0 Quentin Perret 2021-10-26  814  	hyp_spin_lock(&shadow_lock);
1669999c8da7c9 Fuad Tabba     2021-02-03  815  	vm = find_shadow_by_handle(shadow_handle);
6f93dc7bb931a0 Quentin Perret 2021-10-26  816  	if (!vm) {
6f93dc7bb931a0 Quentin Perret 2021-10-26  817  		err = -ENOENT;
6f93dc7bb931a0 Quentin Perret 2021-10-26  818  		goto err_unlock;
6f93dc7bb931a0 Quentin Perret 2021-10-26  819  	}
1669999c8da7c9 Fuad Tabba     2021-02-03  820  
6f93dc7bb931a0 Quentin Perret 2021-10-26  821  	if (WARN_ON(hyp_page_count(vm))) {
6f93dc7bb931a0 Quentin Perret 2021-10-26  822  		err = -EBUSY;
6f93dc7bb931a0 Quentin Perret 2021-10-26  823  		goto err_unlock;
6f93dc7bb931a0 Quentin Perret 2021-10-26  824  	}
6f93dc7bb931a0 Quentin Perret 2021-10-26  825  
bf94ae1300cd15 Fuad Tabba     2022-10-10  826  	host_kvm = vm->host_kvm;
76094a9979e303 Fuad Tabba     2022-10-10  827  	nr_vcpus = vm->nr_vcpus;
bf94ae1300cd15 Fuad Tabba     2022-10-10  828  
e88313ab7cc5d3 Fuad Tabba     2022-05-05  829  	/*
e88313ab7cc5d3 Fuad Tabba     2022-05-05  830  	 * Clear the tracking for last_loaded_vcpu for all cpus for this vm in
e88313ab7cc5d3 Fuad Tabba     2022-05-05  831  	 * case the same addresses for those vcpus are reused for future vms.
e88313ab7cc5d3 Fuad Tabba     2022-05-05  832  	 */
e88313ab7cc5d3 Fuad Tabba     2022-05-05  833  	for (i = 0; i < hyp_nr_cpus; i++) {
e88313ab7cc5d3 Fuad Tabba     2022-05-05  834  		struct kvm_vcpu **last_loaded_vcpu_ptr =
e88313ab7cc5d3 Fuad Tabba     2022-05-05  835  			per_cpu_ptr(&last_loaded_vcpu, i);
e88313ab7cc5d3 Fuad Tabba     2022-05-05  836  		struct kvm_vcpu *vcpu = *last_loaded_vcpu_ptr;
e88313ab7cc5d3 Fuad Tabba     2022-05-05  837  
e88313ab7cc5d3 Fuad Tabba     2022-05-05  838  		if (vcpu && vcpu->arch.pkvm.shadow_vm == vm)
e88313ab7cc5d3 Fuad Tabba     2022-05-05  839  			*last_loaded_vcpu_ptr = NULL;
e88313ab7cc5d3 Fuad Tabba     2022-05-05  840  	}
e88313ab7cc5d3 Fuad Tabba     2022-05-05  841  
5715f9497bab67 Will Deacon    2022-03-23  842  	/* Ensure the VMID is clean before it can be reallocated */
5715f9497bab67 Will Deacon    2022-03-23  843  	__kvm_tlb_flush_vmid(&vm->arch.mmu);
3e7a2c016c472a Will Deacon    2022-03-10  844  	remove_shadow_table(shadow_handle);
6f93dc7bb931a0 Quentin Perret 2021-10-26  845  	hyp_spin_unlock(&shadow_lock);
1669999c8da7c9 Fuad Tabba     2021-02-03  846  
4fc088eb4d38b7 Quentin Perret 2021-11-03  847  	/* Reclaim guest pages, and page-table pages */
bf94ae1300cd15 Fuad Tabba     2022-10-10  848  	mc = &host_kvm->arch.pkvm.teardown_mc;
4fc088eb4d38b7 Quentin Perret 2021-11-03  849  	reclaim_guest_pages(vm, mc);
76094a9979e303 Fuad Tabba     2022-10-10 @850  	drain_shadow_vcpus(vm->shadow_vcpus, nr_vcpus, mc);
76094a9979e303 Fuad Tabba     2022-10-10 @851  	unpin_host_vcpus(vm->shadow_vcpus, nr_vcpus);
1669999c8da7c9 Fuad Tabba     2021-02-03  852  
c0a7deb29d9190 Fuad Tabba     2022-10-10  853  	for (i = 0; i < nr_vcpus; i++)
c0a7deb29d9190 Fuad Tabba     2022-10-10  854  		teardown_donated_memory(mc, vm->shadow_vcpus[i],
c0a7deb29d9190 Fuad Tabba     2022-10-10  855  					PAGE_ALIGN(sizeof(vm->shadow_vcpus[i])));
bf94ae1300cd15 Fuad Tabba     2022-10-10  856  	teardown_donated_memory(mc, vm, vm->shadow_area_size);
1669999c8da7c9 Fuad Tabba     2021-02-03  857  
bf94ae1300cd15 Fuad Tabba     2022-10-10  858  	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
1669999c8da7c9 Fuad Tabba     2021-02-03  859  	return 0;
6f93dc7bb931a0 Quentin Perret 2021-10-26  860  
6f93dc7bb931a0 Quentin Perret 2021-10-26  861  err_unlock:
6f93dc7bb931a0 Quentin Perret 2021-10-26  862  	hyp_spin_unlock(&shadow_lock);
6f93dc7bb931a0 Quentin Perret 2021-10-26  863  	return err;
1669999c8da7c9 Fuad Tabba     2021-02-03  864  }
96da61b2fa8495 Fuad Tabba     2021-11-11  865  

:::::: The code at line 850 was first introduced by commit
:::::: 76094a9979e30381f1beb7cd534050000dcd107c ANDROID: KVM: arm64: Initialize shadow vcpus with separate hypercalls

:::::: TO: Fuad Tabba <tabba@google.com>
:::::: CC: Will Deacon <willdeacon@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
