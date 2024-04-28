Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517810E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 02:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714271349; cv=none; b=jDnWYCyWiAXHqUVvv9CsX7dFT+46wRDNzfsaSrmuAbHr+rkMBAktaSfshABN6jN7VrlxaHXCaME3wlbP/XR/vCLNFdpKViIklrWlTknGfEL6m7UPbmHl9vI0GetEoiP+F4cGruH50MQHGmNHcvyWVaOWaGWqWSPSPfyYpsjMihE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714271349; c=relaxed/simple;
	bh=pegZXGyYG8ymawzXYLiz0GWHK/ic/0/s1yRMzHjXjQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLNxlTHjHmW0nX6ujHxNSv4+Y+fos9J+07K4uzEuBg9nH5YaSQXVEBprsJIboijPsBpW2lB2JpwD1/dJmK89xOl4xa6M8xIXC/Jeh0tuu6QVVBAsaX76xuhJpAj7smdOzvcK3TrQe/v2Hgjpuzu2vEM17dQQRNiMazlpWnlxbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5rCQRHw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5rCQRHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714271347; x=1745807347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pegZXGyYG8ymawzXYLiz0GWHK/ic/0/s1yRMzHjXjQE=;
  b=h5rCQRHwJNwv87R8JS22Rwq22X1OuPg1KQUGBU2zbzG7vImJT/IuQhPC
   tNla061BE8irx2j+0CRSdZqyUKaHbR0r2FyW8h4jgZ1g3T2aFB9YQsuwv
   W8C1sQ8SacjcwFs+taUxcE4HPoUHClsmYRph3r6CKG/8st8MzBzjk1ua+
   6/kAVDA0QdbCFNr8vwxAmiRUtk1Xq5Emji1cyM5cfv+g9A2oK2p2DqtFL
   ZsvbQGixPS0MQchXelbzDDuiYJSCeYkyE7krU6Fhi+Li2/iZ+Hej+ioRi
   yAmPb/ZrztrVXaPsmeXAtV2BgTuN6a7VhiILhOIP1IgfN2UVjoYjc4CYG
   w==;
X-CSE-ConnectionGUID: Vuwf5Yi7SP2KZ2zk1fo5sw==
X-CSE-MsgGUID: n+ko/TXHSw6bQFAFpmhgFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20652758"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="20652758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 19:29:04 -0700
X-CSE-ConnectionGUID: gZ90r8D1SHegz0tb7Gg2qQ==
X-CSE-MsgGUID: IZxanuBlQfKz2ED7OANVBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25758187"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Apr 2024 19:29:03 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0uHk-0005lK-27;
	Sun, 28 Apr 2024 02:29:00 +0000
Date: Sun, 28 Apr 2024 10:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/sched_in_cleanup 1/3] arch/arm64/kvm/arm.c:431:6:
 error: conflicting types for 'kvm_arch_vcpu_load'; have 'void(struct
 kvm_vcpu *, int)'
Message-ID: <202404281007.NrVBvqWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/sched_in_cleanup
head:   f857e355f9536935b6c96bf389119576043aeb75
commit: 5d14663b4abaf97f4e415eef00c813aeaf823bbc [1/3] KVM: Plumb in a @sched_in flag to kvm_arch_vcpu_load()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240428/202404281007.NrVBvqWs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281007.NrVBvqWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281007.NrVBvqWs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:431:6: error: conflicting types for 'kvm_arch_vcpu_load'; have 'void(struct kvm_vcpu *, int)'
     431 | void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
         |      ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/arm.c:12:
   include/linux/kvm_host.h:1501:6: note: previous declaration of 'kvm_arch_vcpu_load' with type 'void(struct kvm_vcpu *, int,  bool)' {aka 'void(struct kvm_vcpu *, int,  _Bool)'}
    1501 | void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
         |      ^~~~~~~~~~~~~~~~~~


vim +431 arch/arm64/kvm/arm.c

d35268da66870d arch/arm/kvm/arm.c   Christoffer Dall 2015-08-25  430  
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20 @431  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  432  {
a0e50aa3f4a8a5 arch/arm64/kvm/arm.c Christoffer Dall 2019-01-04  433  	struct kvm_s2_mmu *mmu;
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  434  	int *last_ran;
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  435  
a0e50aa3f4a8a5 arch/arm64/kvm/arm.c Christoffer Dall 2019-01-04  436  	mmu = vcpu->arch.hw_mmu;
a0e50aa3f4a8a5 arch/arm64/kvm/arm.c Christoffer Dall 2019-01-04  437  	last_ran = this_cpu_ptr(mmu->last_vcpu_ran);
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  438  
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  439  	/*
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  440  	 * We guarantee that both TLBs and I-cache are private to each
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  441  	 * vcpu. If detecting that a vcpu from the same VM has
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  442  	 * previously run on the same physical CPU, call into the
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  443  	 * hypervisor code to nuke the relevant contexts.
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  444  	 *
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  445  	 * We might get preempted before the vCPU actually runs, but
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  446  	 * over-invalidation doesn't affect correctness.
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  447  	 */
5f4bd815ec7189 arch/arm64/kvm/arm.c Marc Zyngier     2023-09-27  448  	if (*last_ran != vcpu->vcpu_idx) {
01dc9262ff5797 arch/arm64/kvm/arm.c Marc Zyngier     2021-03-03  449  		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
5f4bd815ec7189 arch/arm64/kvm/arm.c Marc Zyngier     2023-09-27  450  		*last_ran = vcpu->vcpu_idx;
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  451  	}
94d0e5980d6791 arch/arm/kvm/arm.c   Marc Zyngier     2016-10-18  452  
86ce85352f0da7 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  453  	vcpu->cpu = cpu;
5b3e5e5bf230f5 arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  454  
328e5664794491 arch/arm/kvm/arm.c   Christoffer Dall 2016-03-24  455  	kvm_vgic_load(vcpu);
b103cc3f10c06f virt/kvm/arm/arm.c   Christoffer Dall 2016-10-16  456  	kvm_timer_vcpu_load(vcpu);
13aeb9b400c5d7 arch/arm64/kvm/arm.c David Brazdil    2020-06-25  457  	if (has_vhe())
27cde4c0fe28ea arch/arm64/kvm/arm.c Oliver Upton     2023-10-18  458  		kvm_vcpu_load_vhe(vcpu);
e6b673b741ea0d virt/kvm/arm/arm.c   Dave Martin      2018-04-06  459  	kvm_arch_vcpu_load_fp(vcpu);
435e53fb5e21ad virt/kvm/arm/arm.c   Andrew Murray    2019-04-09  460  	kvm_vcpu_pmu_restore_guest(vcpu);
8564d6372a7d8a virt/kvm/arm/arm.c   Steven Price     2019-10-21  461  	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
8564d6372a7d8a virt/kvm/arm/arm.c   Steven Price     2019-10-21  462  		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
de73708915adc1 virt/kvm/arm/arm.c   Marc Zyngier     2018-06-21  463  
de73708915adc1 virt/kvm/arm/arm.c   Marc Zyngier     2018-06-21  464  	if (single_task_running())
ef2e78ddadbb93 virt/kvm/arm/arm.c   Marc Zyngier     2019-11-07  465  		vcpu_clear_wfx_traps(vcpu);
de73708915adc1 virt/kvm/arm/arm.c   Marc Zyngier     2018-06-21  466  	else
ef2e78ddadbb93 virt/kvm/arm/arm.c   Marc Zyngier     2019-11-07  467  		vcpu_set_wfx_traps(vcpu);
384b40caa8afae virt/kvm/arm/arm.c   Mark Rutland     2019-04-23  468  
29eb5a3c57f7e0 arch/arm64/kvm/arm.c Marc Zyngier     2020-06-04  469  	if (vcpu_has_ptrauth(vcpu))
ef3e40a7ea8dbe arch/arm64/kvm/arm.c Marc Zyngier     2020-06-03  470  		vcpu_ptrauth_disable(vcpu);
d2602bb4f5a450 arch/arm64/kvm/arm.c Suzuki K Poulose 2021-04-05  471  	kvm_arch_vcpu_load_debug_state_flags(vcpu);
583cda1b0e7d5d arch/arm64/kvm/arm.c Alexandru Elisei 2022-01-27  472  
1ba11daef0a9b0 arch/arm64/kvm/arm.c Shaoqin Huang    2023-07-27  473  	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
583cda1b0e7d5d arch/arm64/kvm/arm.c Alexandru Elisei 2022-01-27  474  		vcpu_set_on_unsupported_cpu(vcpu);
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  475  }
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall 2013-01-20  476  

:::::: The code at line 431 was first introduced by commit
:::::: 749cf76c5a363e1383108a914ea09530bfa0bd43 KVM: ARM: Initial skeleton to compile KVM support

:::::: TO: Christoffer Dall <c.dall@virtualopensystems.com>
:::::: CC: Christoffer Dall <c.dall@virtualopensystems.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
