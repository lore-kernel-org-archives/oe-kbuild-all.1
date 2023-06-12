Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213E818AF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686575689; x=1718111689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7qB7z1YBk5KIH3YcadkHp3TFVfCs7fA8sRTG31SLlZ8=;
  b=Pkqr78VPUgEnlhAf9rIrdoakrHbaudTqLlma8BWdrHM2g1U+MDdXGlXA
   rkcW6idBRSqFzsMFh9ax0MXtxxvK/QXPjDzCnc7/vKAg8dqQzv8vsvZ7M
   mkgklM1SNYEIsQS9RO9BWztegGtr6iFbdEsdNLhgdiDB7hD9wEaZXcFlQ
   lY/eJkKjYpC7qWoWomkT5M3CcY2FMHZxNEyF4QH9224cTNLrfdvobL3tm
   WoflNWzHwQMZxIJ1IG9ba54M9VHjAwHkO3oBSikR1csMGWWBWDSAZ6IAx
   ie0I2ua7HTH0Rqi15we8HLTYUHb8qdY1zWzsl/vCR/uCC3uPTtkCe/7xK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361393521"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="361393521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 06:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="744324968"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744324968"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 06:14:47 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8hNe-0000GC-0f;
	Mon, 12 Jun 2023 13:14:46 +0000
Date: Mon, 12 Jun 2023 21:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/pid_rcu 3/3] arch/arm64/kvm/vgic/vgic-init.c:102:21:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202306122139.ZtsKSxaC-lkp@intel.com>
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
config: arm64-randconfig-s043-20230611 (https://download.01.org/0day-ci/archive/20230612/202306122139.ZtsKSxaC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/ virt/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306122139.ZtsKSxaC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-init.c:102:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> arch/arm64/kvm/vgic/vgic-init.c:102:21: sparse:    struct pid [noderef] __rcu *
>> arch/arm64/kvm/vgic/vgic-init.c:102:21: sparse:    struct pid *
--
>> arch/arm64/kvm/arm.c:389:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> arch/arm64/kvm/arm.c:389:13: sparse:    struct pid [noderef] __rcu *
>> arch/arm64/kvm/arm.c:389:13: sparse:    struct pid *
   arch/arm64/kvm/arm.c:586:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:586:13: sparse:    struct pid [noderef] __rcu *
   arch/arm64/kvm/arm.c:586:13: sparse:    struct pid *
   arch/arm64/kvm/arm.c:1235:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:1235:13: sparse:    struct pid [noderef] __rcu *
   arch/arm64/kvm/arm.c:1235:13: sparse:    struct pid *
--
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse:    struct pid [noderef] __rcu *
>> arch/arm64/kvm/../../../virt/kvm/kvm_main.c:499:17: sparse:    struct pid *
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1912:54: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1914:56: sparse: sparse: array of flexible structures
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_change_pte' - different lock contexts for basic block
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_start' - different lock contexts for basic block
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_end' - different lock contexts for basic block
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_flush_young' - different lock contexts for basic block
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_young' - different lock contexts for basic block
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:593:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_test_young' - different lock contexts for basic block
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:2635:9: sparse: sparse: context imbalance in 'hva_to_pfn_remapped' - unexpected unlock

vim +102 arch/arm64/kvm/vgic/vgic-init.c

5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   62  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   63  /**
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   64   * kvm_vgic_create: triggered by the instantiation of the VGIC device by
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   65   * user space, either through the legacy KVM_CREATE_IRQCHIP ioctl (v2 only)
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   66   * or through the generic KVM_CREATE_DEVICE API ioctl.
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   67   * irqchip_in_kernel() tells you if this function succeeded or not.
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   68   * @kvm: kvm struct pointer
ad275b8bb1e659 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   69   * @type: KVM_DEV_TYPE_ARM_VGIC_V[23]
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   70   */
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   71  int kvm_vgic_create(struct kvm *kvm, u32 type)
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   72  {
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   73  	struct kvm_vcpu *vcpu;
46808a4cb89708 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier        2021-11-16   74  	unsigned long i;
46808a4cb89708 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier        2021-11-16   75  	int ret;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   76  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   77  	/*
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   78  	 * This function is also called by the KVM_CREATE_IRQCHIP handler,
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   79  	 * which had no chance yet to check the availability of the GICv2
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   80  	 * emulation. So check this here again. KVM_CREATE_DEVICE does
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   81  	 * the proper checks already.
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   82  	 */
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   83  	if (type == KVM_DEV_TYPE_ARM_VGIC_V2 &&
a28ebea2adc4a2 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall    2016-08-09   84  		!kvm_vgic_global_state.can_emulate_gicv2)
a28ebea2adc4a2 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall    2016-08-09   85  		return -ENODEV;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   86  
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   87  	/* Must be held to avoid race with vCPU creation */
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   88  	lockdep_assert_held(&kvm->lock);
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   89  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   90  	ret = -EBUSY;
72a610f32e1f16 virt/kvm/arm/vgic/vgic-init.c   Miaohe Lin          2019-11-30   91  	if (!lock_all_vcpus(kvm))
72a610f32e1f16 virt/kvm/arm/vgic/vgic-init.c   Miaohe Lin          2019-11-30   92  		return ret;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21   93  
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   94  	mutex_lock(&kvm->arch.config_lock);
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   95  
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   96  	if (irqchip_in_kernel(kvm)) {
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   97  		ret = -EEXIST;
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   98  		goto out_unlock;
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27   99  	}
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27  100  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  101  	kvm_for_each_vcpu(i, vcpu, kvm) {
cc5705fb1bf119 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier        2021-10-14 @102  		if (vcpu_has_run_once(vcpu))
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  103  			goto out_unlock;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  104  	}
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  105  	ret = 0;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  106  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  107  	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)
f502cc568de95e arch/arm64/kvm/vgic/vgic-init.c Sean Christopherson 2022-03-04  108  		kvm->max_vcpus = VGIC_V2_MAX_CPUS;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  109  	else
f502cc568de95e arch/arm64/kvm/vgic/vgic-init.c Sean Christopherson 2022-03-04  110  		kvm->max_vcpus = VGIC_V3_MAX_CPUS;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  111  
f502cc568de95e arch/arm64/kvm/vgic/vgic-init.c Sean Christopherson 2022-03-04  112  	if (atomic_read(&kvm->online_vcpus) > kvm->max_vcpus) {
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  113  		ret = -E2BIG;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  114  		goto out_unlock;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  115  	}
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  116  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  117  	kvm->arch.vgic.in_kernel = true;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  118  	kvm->arch.vgic.vgic_model = type;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  119  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  120  	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2018-05-22  121  
dbd9733ab6742d virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2018-05-22  122  	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  123  		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2018-05-22  124  	else
dbd9733ab6742d virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2018-05-22  125  		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  126  
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  127  out_unlock:
f00327731131d1 arch/arm64/kvm/vgic/vgic-init.c Oliver Upton        2023-03-27  128  	mutex_unlock(&kvm->arch.config_lock);
72a610f32e1f16 virt/kvm/arm/vgic/vgic-init.c   Miaohe Lin          2019-11-30  129  	unlock_all_vcpus(kvm);
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  130  	return ret;
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  131  }
5e6431da8f3a04 virt/kvm/arm/vgic/vgic-init.c   Eric Auger          2015-12-21  132  

:::::: The code at line 102 was first introduced by commit
:::::: cc5705fb1bf119ebb693d594f0157e0dd418590e KVM: arm64: Drop vcpu->arch.has_run_once for vcpu->pid

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
