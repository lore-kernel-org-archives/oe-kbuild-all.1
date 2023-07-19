Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DA2C138
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689769731; x=1721305731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AyLGumE/zzrf5/v/8B8OJ04nmhvvyCRXOOk4W46qiZ8=;
  b=STb8Y1kPc//+aeIg/qzNJvvmx//palf7iuFSjRtdPSjh0lD1DWe27ftf
   kOlBz6zI0R9mdrXmVeFLd1+/qnwgmKLfdWAsrlyJfOkZ668UbFzNGPZyu
   qMNopUw2p/sDCMYblmPlGLCf4YsAaVZ4lq5QLhPKUmi5S0RtgR1sHkemj
   ymoi+SFX7EmlWxG9CE1XXa85oddMN1AoujiAHTpzugklEXGKzzAE7TOL/
   z05b9qDcnvbtzpoIbf9lATp5OtYjNO83YeitM+78WHphQF5p2FeJoDVsW
   HQIubGTRBPKtZNjXTbrnhHX1QdJeKPPfOglAKbLOTunhPu26z+MTHOe38
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="363905417"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="363905417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 05:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="727282794"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727282794"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2023 05:28:42 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM6IL-0004nB-0o;
	Wed, 19 Jul 2023 12:28:41 +0000
Date: Wed, 19 Jul 2023 20:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/apic 52/57] arch/x86/kernel/kvm.c:828:17: error:
 implicit declaration of function 'apic_update_callback'
Message-ID: <202307192049.N709R8Bu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/apic
head:   11f85db0679f4f37798c648f3028126b6f7c6163
commit: 563b4877399ffc4f19b51186533f237f0ff13802 [52/57] x86/apic: Replace acpi_wake_cpu_handler_update() and apic_set_eoi_cb()
config: i386-randconfig-i053-20230716 (https://download.01.org/0day-ci/archive/20230719/202307192049.N709R8Bu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192049.N709R8Bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192049.N709R8Bu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/kvm.c: In function 'kvm_guest_apic_eoi_write':
   arch/x86/kernel/kvm.c:346:9: error: implicit declaration of function 'apic_native_eoi'; did you mean 'apic_set_eoi'? [-Werror=implicit-function-declaration]
     346 |         apic_native_eoi();
         |         ^~~~~~~~~~~~~~~
         |         apic_set_eoi
   arch/x86/kernel/kvm.c: In function 'kvm_guest_init':
>> arch/x86/kernel/kvm.c:828:17: error: implicit declaration of function 'apic_update_callback' [-Werror=implicit-function-declaration]
     828 |                 apic_update_callback(eoi, kvm_guest_apic_eoi_write);
         |                 ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/kvm.c:828:38: error: 'eoi' undeclared (first use in this function); did you mean 'efi'?
     828 |                 apic_update_callback(eoi, kvm_guest_apic_eoi_write);
         |                                      ^~~
         |                                      efi
   arch/x86/kernel/kvm.c:828:38: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/apic_update_callback +828 arch/x86/kernel/kvm.c

   809	
   810	static void __init kvm_guest_init(void)
   811	{
   812		int i;
   813	
   814		paravirt_ops_setup();
   815		register_reboot_notifier(&kvm_pv_reboot_nb);
   816		for (i = 0; i < KVM_TASK_SLEEP_HASHSIZE; i++)
   817			raw_spin_lock_init(&async_pf_sleepers[i].lock);
   818	
   819		if (kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
   820			has_steal_clock = 1;
   821			static_call_update(pv_steal_clock, kvm_steal_clock);
   822	
   823			pv_ops.lock.vcpu_is_preempted =
   824				PV_CALLEE_SAVE(__kvm_vcpu_is_preempted);
   825		}
   826	
   827		if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
 > 828			apic_update_callback(eoi, kvm_guest_apic_eoi_write);
   829	
   830		if (kvm_para_has_feature(KVM_FEATURE_ASYNC_PF_INT) && kvmapf) {
   831			static_branch_enable(&kvm_async_pf_enabled);
   832			alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, asm_sysvec_kvm_asyncpf_interrupt);
   833		}
   834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
