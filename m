Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747215ECCC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 04:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762748718; cv=none; b=lltPKdzJ6+zHvfJCekyx9K4VhcaDXpU5k624lMAYRBHuXQUaG8mRCAgZaizW8NdO+Uf8Z25D9A6ibt5/H1YA1IkmlIpZsVqKbPJwiyJ7AIjODRAVvqtIc+In0lcepoS+UbSGQTp2P9Uvc1m6uesFBG5P4WqNH0tMY/yqxhV6L0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762748718; c=relaxed/simple;
	bh=fxe4nyMRnGAqt72BE3PboVoOVfJZydXVCCtksqsrGrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5UY7S+S23RuFNUZQEktBLd79aZfuIUmGEVk8jJDaW/FhyVk2RmKnyo1rsuNdEHh0Ub8p1c0OaSrbbnxwLtHgqyzYmyRFzkFainWQGG4fSKtwA5GthdlrqSF3CfcVSmxdjjVD5YjBC/I0XvWhVKQHiZHLXiEDaqP6vD98OUiVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJD0xEWa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJD0xEWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762748716; x=1794284716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fxe4nyMRnGAqt72BE3PboVoOVfJZydXVCCtksqsrGrk=;
  b=MJD0xEWaAwiTsOCFi4seuiGiRgmsD7apG6taonxR07s1P46B6H48R/FV
   MHtIkvB+xv1Aw1vBEVcFH1rKAgqva+cqUSVoz6qGAK1oLzbmM8Swyb2s6
   bpjpn2RSs7eP2x7wiyRdFhShNPwzF6lvd4KEBABiBlR5xRju7ZOJgAIo7
   m5on+VpcPF30W8AfHB6x8nt93EQN/MglGBV8BUKmoM99Wjhzel7OxQKCV
   QlAyZ1wb2sldiz/OQM16c2w7IewDx4EFC9T5AUPKOrZbf+eyxgEWCgdvQ
   FSDe2zrSLkSMfY+H8IvkFd1/rC35dDm1ToRmz/2x/4ziVNR5m8YaUsw6a
   Q==;
X-CSE-ConnectionGUID: mORwRsGGToCip3v13wPQOw==
X-CSE-MsgGUID: N0ynZ1aaQBmfAyTx1HlKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82422893"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="82422893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 20:25:15 -0800
X-CSE-ConnectionGUID: 8LzaAu9eSw2zPQTQJ7GrIw==
X-CSE-MsgGUID: zduEq96BTe+xeR6SG23aLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="211976744"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2025 20:25:14 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIJSp-0002el-31;
	Mon, 10 Nov 2025 04:25:11 +0000
Date: Mon, 10 Nov 2025 12:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	Sandipan Das <sandipan.das@amd.com>
Subject: [sean-jc:x86/mediated_pmu 37/44] arch/x86/kvm/pmu.c:1308:58: error:
 macro "rdmsrq" requires 2 arguments, but only 1 given
Message-ID: <202511101228.GDKvzPP4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   9b6b574f2d82517dd2018444e07f4b2ae84c2a49
commit: a0a470fa63f1bc6440fd4b0e3babcc847262b8ed [37/44] KVM: x86/pmu: Load/put mediated PMU context when entering/exiting guest
config: x86_64-buildonly-randconfig-003-20251110 (https://download.01.org/0day-ci/archive/20251110/202511101228.GDKvzPP4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101228.GDKvzPP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101228.GDKvzPP4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/pmu.c: In function 'kvm_mediated_pmu_load':
>> arch/x86/kvm/pmu.c:1308:58: error: macro "rdmsrq" requires 2 arguments, but only 1 given
    1308 |         WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
         |                                                          ^
   In file included from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs.h:11,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/resume_user_mode.h:8,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/pmu.c:15:
   arch/x86/include/asm/msr.h:194:9: note: macro "rdmsrq" defined here
     194 | #define rdmsrq(msr, val)                        \
         |         ^~~~~~
   In file included from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/segment.h:6,
                    from arch/x86/include/asm/ptrace.h:5,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6:
>> arch/x86/kvm/pmu.c:1308:22: error: 'rdmsrq' undeclared (first use in this function); did you mean 'wrmsrq'?
    1308 |         WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
         |                      ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   arch/x86/kvm/pmu.c:1308:22: note: each undeclared identifier is reported only once for each function it appears in
    1308 |         WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
         |                      ^~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/rdmsrq +1308 arch/x86/kvm/pmu.c

  1288	
  1289	void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
  1290	{
  1291		if (!kvm_vcpu_has_mediated_pmu(vcpu) ||
  1292		    KVM_BUG_ON(!lapic_in_kernel(vcpu), vcpu->kvm))
  1293			return;
  1294	
  1295		lockdep_assert_irqs_disabled();
  1296	
  1297		perf_load_guest_context();
  1298	
  1299		/*
  1300		 * Sanity check that "loading" guest context disabled all counters, as
  1301		 * modifying the LVTPC while host perf is active will cause explosions,
  1302		 * as will loading event selectors and PMCs with guest values.
  1303		 *
  1304		 * VMX will enable/disable counters at VM-Enter/VM-Exit by atomically
  1305		 * loading PERF_GLOBAL_CONTROL.  SVM effectively performs the switch by
  1306		 * configuring all events to be GUEST_ONLY.
  1307		 */
> 1308		WARN_ON_ONCE(rdmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL));
  1309	
  1310		perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
  1311	
  1312		kvm_pmu_load_guest_pmcs(vcpu);
  1313	
  1314		kvm_pmu_call(mediated_load)(vcpu);
  1315	}
  1316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
