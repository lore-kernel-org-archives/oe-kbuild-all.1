Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA15382
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6R22AAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700307355; x=1731843355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ja6HrVuMXilDIkOPcRXQfVQIcaoRFysTQKJAuBqMXtE=;
  b=D6R22AAz9nR24rtjPkrP26W7uubTmOSVGolj8GESKfTsVB7rAg+oi7Ky
   cmxUvmMW7ciuyYCbsE6F3S8wGOhWKULZ4Re9tjNXxHZMgVocSSbT/8ChU
   KhTwpQwvK7oqX4MJW0wSbL+cWsVgW8JeCe3DHJMEbnyOc2CPF+LAvCGft
   u2s4cLVvkYappkvzpU0pNDwvoNBH9C4+K7LxS1ZluvbVQ0uBYptTm8h4J
   oTOAiZFwVvoSqLw2+88ZjROa+mTpHINQ7F5LwHb8vE9Uoo8xwRbQwIpDc
   KUQX7gJKzAtL/I5fJlTCQE73OnhdBnflIuCUZryMMuuPIxLCRh+3fkHpt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422516685"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="422516685"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 03:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="7097218"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2023 03:35:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Jc7-0003rf-17;
	Sat, 18 Nov 2023 11:35:51 +0000
Date: Sat, 18 Nov 2023 19:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 10/26] arch/arm64/kvm/reset.c:212:17:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202311181951.ZaSwe02k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   8a76f0a3874718ecb420e3c8915c591d751b5d6c
commit: 002089863122296e54484c81d66b0ea77386eca9 [10/26] KVM: arm64: Rename SVE finalization constants to be more general
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231118/202311181951.ZaSwe02k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181951.ZaSwe02k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181951.ZaSwe02k-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/reset.c: In function 'kvm_reset_vcpu':
>> arch/arm64/kvm/reset.c:212:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     212 |                 ret = -EINVAL;
         |                 ^~~
         |                 net
   arch/arm64/kvm/reset.c:212:17: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/kernel.h:23,
                    from arch/arm64/kvm/reset.c:12:
>> arch/arm64/kvm/reset.c:217:58: error: 'struct kvm_vcpu_arch' has no member named 'features'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                                                          ^
   include/linux/bitops.h:50:44: note: in definition of macro 'bitop'
      50 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   arch/arm64/kvm/reset.c:217:21: note: in expansion of macro 'test_bit'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                     ^~~~~~~~
>> arch/arm64/kvm/reset.c:217:58: error: 'struct kvm_vcpu_arch' has no member named 'features'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                                                          ^
   include/linux/bitops.h:51:23: note: in definition of macro 'bitop'
      51 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   arch/arm64/kvm/reset.c:217:21: note: in expansion of macro 'test_bit'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                     ^~~~~~~~
>> arch/arm64/kvm/reset.c:217:58: error: 'struct kvm_vcpu_arch' has no member named 'features'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                                                          ^
   include/linux/bitops.h:52:57: note: in definition of macro 'bitop'
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   arch/arm64/kvm/reset.c:217:21: note: in expansion of macro 'test_bit'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                     ^~~~~~~~
>> arch/arm64/kvm/reset.c:217:58: error: 'struct kvm_vcpu_arch' has no member named 'features'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                                                          ^
   include/linux/bitops.h:53:24: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   arch/arm64/kvm/reset.c:217:21: note: in expansion of macro 'test_bit'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                     ^~~~~~~~
>> arch/arm64/kvm/reset.c:217:58: error: 'struct kvm_vcpu_arch' has no member named 'features'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                                                          ^
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   arch/arm64/kvm/reset.c:217:21: note: in expansion of macro 'test_bit'
     217 |                 if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
         |                     ^~~~~~~~
>> arch/arm64/kvm/reset.c:220:33: error: label 'out' used but not defined
     220 |                                 goto out;
         |                                 ^~~~


vim +212 arch/arm64/kvm/reset.c

   172	
   173	/**
   174	 * kvm_reset_vcpu - sets core registers and sys_regs to reset value
   175	 * @vcpu: The VCPU pointer
   176	 *
   177	 * This function sets the registers on the virtual CPU struct to their
   178	 * architecturally defined reset values, except for registers whose reset is
   179	 * deferred until kvm_arm_vcpu_finalize().
   180	 *
   181	 * Note: This function can be called from two paths: The KVM_ARM_VCPU_INIT
   182	 * ioctl or as part of handling a request issued by another VCPU in the PSCI
   183	 * handling code.  In the first case, the VCPU will not be loaded, and in the
   184	 * second case the VCPU will be loaded.  Because this function operates purely
   185	 * on the memory-backed values of system registers, we want to do a full put if
   186	 * we were loaded (handling a request) and load the values back at the end of
   187	 * the function.  Otherwise we leave the state alone.  In both cases, we
   188	 * disable preemption around the vcpu reset as we would otherwise race with
   189	 * preempt notifiers which also call put/load.
   190	 */
   191	void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
   192	{
   193		struct vcpu_reset_state reset_state;
   194		bool loaded;
   195		u32 pstate;
   196	
   197		spin_lock(&vcpu->arch.mp_state_lock);
   198		reset_state = vcpu->arch.reset_state;
   199		vcpu->arch.reset_state.reset = false;
   200		spin_unlock(&vcpu->arch.mp_state_lock);
   201	
   202		/* Reset PMU outside of the non-preemptible section */
   203		kvm_pmu_vcpu_reset(vcpu);
   204	
   205		preempt_disable();
   206		loaded = (vcpu->cpu != -1);
   207		if (loaded)
   208			kvm_arch_vcpu_put(vcpu);
   209	
   210		/* Disallow NV+SVE for the time being */
   211		if (vcpu_has_nv(vcpu) && vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
 > 212			ret = -EINVAL;
   213			goto out;
   214		}
   215	
   216		if (!kvm_arm_vcpu_vec_finalized(vcpu)) {
 > 217			if (test_bit(KVM_ARM_VCPU_SVE, vcpu->arch.features)) {
   218				ret = kvm_vcpu_enable_sve(vcpu);
   219				if (ret)
 > 220					goto out;
   221			}
   222		} else {
   223			kvm_vcpu_reset_sve(vcpu);
   224		}
   225	
   226		if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_ADDRESS) ||
   227		    vcpu_has_feature(vcpu, KVM_ARM_VCPU_PTRAUTH_GENERIC))
   228			kvm_vcpu_enable_ptrauth(vcpu);
   229	
   230		if (vcpu_el1_is_32bit(vcpu))
   231			pstate = VCPU_RESET_PSTATE_SVC;
   232		else if (vcpu_has_nv(vcpu))
   233			pstate = VCPU_RESET_PSTATE_EL2;
   234		else
   235			pstate = VCPU_RESET_PSTATE_EL1;
   236	
   237		/* Reset core registers */
   238		memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
   239		memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
   240		vcpu->arch.ctxt.spsr_abt = 0;
   241		vcpu->arch.ctxt.spsr_und = 0;
   242		vcpu->arch.ctxt.spsr_irq = 0;
   243		vcpu->arch.ctxt.spsr_fiq = 0;
   244		vcpu_gp_regs(vcpu)->pstate = pstate;
   245	
   246		/* Reset system registers */
   247		kvm_reset_sys_regs(vcpu);
   248	
   249		/*
   250		 * Additional reset state handling that PSCI may have imposed on us.
   251		 * Must be done after all the sys_reg reset.
   252		 */
   253		if (reset_state.reset) {
   254			unsigned long target_pc = reset_state.pc;
   255	
   256			/* Gracefully handle Thumb2 entry point */
   257			if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
   258				target_pc &= ~1UL;
   259				vcpu_set_thumb(vcpu);
   260			}
   261	
   262			/* Propagate caller endianness */
   263			if (reset_state.be)
   264				kvm_vcpu_set_be(vcpu);
   265	
   266			*vcpu_pc(vcpu) = target_pc;
   267			vcpu_set_reg(vcpu, 0, reset_state.r0);
   268		}
   269	
   270		/* Reset timer */
   271		kvm_timer_vcpu_reset(vcpu);
   272	
   273		if (loaded)
   274			kvm_arch_vcpu_load(vcpu, smp_processor_id());
   275		preempt_enable();
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
