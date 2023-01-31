Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CCF63C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675197159; x=1706733159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+LRRe9dn+Ku2uwiptGW1sMe9B3d0pyr3HWNPSEPI0c=;
  b=WZ+G+Qzc/PzckvKwHC/Yfm8iLYH/UwFCoFgsbZnXhb3Oh1eYmURkbl+0
   TsbUL6UrPV7HMwbE+8YjuVbMdkw1Roj8ohKrjLUWeMCdFBhbQyO8865R9
   +YyB/9HLtYabQobXdbbdt94gsIchJ30WYwR21VCYPCxb/j6tOHUCbS1Sn
   14C79gi6CuD9ncCIh8gEPEe20oFA4AEnrhiMqUkZPghjEtAatZuOC+wm4
   fmSEKSYHIZC5drfTydEYp7Lc6s2J49hb2bkaP9iwPHPd3Xz9y6Y5NUhqj
   zqFRXfJY++4/Jc6ni7iwGTNolAno4i2nlZnFt3PoYbc8Sw+nZDAADynEF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311577305"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="311577305"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 12:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="773135740"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="773135740"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 12:31:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMxHn-0004gb-1P;
	Tue, 31 Jan 2023 20:31:23 +0000
Date: Wed, 1 Feb 2023 04:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Santosh Shukla <santosh.shukla@amd.com>
Subject: [sean-jc:svm/vnmi 16/17] arch/x86/kvm/svm/svm.c:4840:10: error:
 'struct kvm_x86_ops' has no member named 'get_hw_nmi_pending'; did you mean
 'set_vnmi_pending'?
Message-ID: <202302010400.H8UovHnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/vnmi
head:   1b255840b4258e213bb8c5b01375f6813152b12e
commit: 0c9e9a87ae0d3a6b1d0bb1dc5ac853d3b1adee09 [16/17] KVM: SVM: implement support for vNMI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302010400.H8UovHnk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/0c9e9a87ae0d3a6b1d0bb1dc5ac853d3b1adee09
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc svm/vnmi
        git checkout 0c9e9a87ae0d3a6b1d0bb1dc5ac853d3b1adee09
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:4840:10: error: 'struct kvm_x86_ops' has no member named 'get_hw_nmi_pending'; did you mean 'set_vnmi_pending'?
    4840 |         .get_hw_nmi_pending = svm_get_hw_nmi_pending,
         |          ^~~~~~~~~~~~~~~~~~
         |          set_vnmi_pending
>> arch/x86/kvm/svm/svm.c:4840:31: error: initialization of 'void (*)(struct kvm_vcpu *)' from incompatible pointer type 'bool (*)(struct kvm_vcpu *)' {aka '_Bool (*)(struct kvm_vcpu *)'} [-Werror=incompatible-pointer-types]
    4840 |         .get_hw_nmi_pending = svm_get_hw_nmi_pending,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:4840:31: note: (near initialization for 'svm_x86_ops.inject_exception')
>> arch/x86/kvm/svm/svm.c:4841:10: error: 'struct kvm_x86_ops' has no member named 'set_hw_nmi_pending'; did you mean 'set_vnmi_pending'?
    4841 |         .set_hw_nmi_pending = svm_set_hw_nmi_pending,
         |          ^~~~~~~~~~~~~~~~~~
         |          set_vnmi_pending
   arch/x86/kvm/svm/svm.c:4841:31: error: initialization of 'void (*)(struct kvm_vcpu *)' from incompatible pointer type 'bool (*)(struct kvm_vcpu *)' {aka '_Bool (*)(struct kvm_vcpu *)'} [-Werror=incompatible-pointer-types]
    4841 |         .set_hw_nmi_pending = svm_set_hw_nmi_pending,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:4841:31: note: (near initialization for 'svm_x86_ops.cancel_injection')
   arch/x86/kvm/svm/svm.c:4842:29: warning: initialized field overwritten [-Woverride-init]
    4842 |         .inject_exception = svm_inject_exception,
         |                             ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:4842:29: note: (near initialization for 'svm_x86_ops.inject_exception')
   arch/x86/kvm/svm/svm.c:4843:29: warning: initialized field overwritten [-Woverride-init]
    4843 |         .cancel_injection = svm_cancel_injection,
         |                             ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:4843:29: note: (near initialization for 'svm_x86_ops.cancel_injection')
   arch/x86/kvm/svm/svm.c: In function 'svm_hardware_setup':
   arch/x86/kvm/svm/svm.c:5138:29: error: 'struct kvm_x86_ops' has no member named 'get_hw_nmi_pending'; did you mean 'set_vnmi_pending'?
    5138 |                 svm_x86_ops.get_hw_nmi_pending = NULL;
         |                             ^~~~~~~~~~~~~~~~~~
         |                             set_vnmi_pending
   arch/x86/kvm/svm/svm.c:5139:29: error: 'struct kvm_x86_ops' has no member named 'set_hw_nmi_pending'; did you mean 'set_vnmi_pending'?
    5139 |                 svm_x86_ops.set_hw_nmi_pending = NULL;
         |                             ^~~~~~~~~~~~~~~~~~
         |                             set_vnmi_pending
   cc1: some warnings being treated as errors


vim +4840 arch/x86/kvm/svm/svm.c

  4775	
  4776	static struct kvm_x86_ops svm_x86_ops __initdata = {
  4777		.name = KBUILD_MODNAME,
  4778	
  4779		.check_processor_compatibility = svm_check_processor_compat,
  4780	
  4781		.hardware_unsetup = svm_hardware_unsetup,
  4782		.hardware_enable = svm_hardware_enable,
  4783		.hardware_disable = svm_hardware_disable,
  4784		.has_emulated_msr = svm_has_emulated_msr,
  4785	
  4786		.vcpu_create = svm_vcpu_create,
  4787		.vcpu_free = svm_vcpu_free,
  4788		.vcpu_reset = svm_vcpu_reset,
  4789	
  4790		.vm_size = sizeof(struct kvm_svm),
  4791		.vm_init = svm_vm_init,
  4792		.vm_destroy = svm_vm_destroy,
  4793	
  4794		.prepare_switch_to_guest = svm_prepare_switch_to_guest,
  4795		.vcpu_load = svm_vcpu_load,
  4796		.vcpu_put = svm_vcpu_put,
  4797		.vcpu_blocking = avic_vcpu_blocking,
  4798		.vcpu_unblocking = avic_vcpu_unblocking,
  4799	
  4800		.update_exception_bitmap = svm_update_exception_bitmap,
  4801		.get_msr_feature = svm_get_msr_feature,
  4802		.get_msr = svm_get_msr,
  4803		.set_msr = svm_set_msr,
  4804		.get_segment_base = svm_get_segment_base,
  4805		.get_segment = svm_get_segment,
  4806		.set_segment = svm_set_segment,
  4807		.get_cpl = svm_get_cpl,
  4808		.get_cs_db_l_bits = svm_get_cs_db_l_bits,
  4809		.set_cr0 = svm_set_cr0,
  4810		.post_set_cr3 = sev_post_set_cr3,
  4811		.is_valid_cr4 = svm_is_valid_cr4,
  4812		.set_cr4 = svm_set_cr4,
  4813		.set_efer = svm_set_efer,
  4814		.get_idt = svm_get_idt,
  4815		.set_idt = svm_set_idt,
  4816		.get_gdt = svm_get_gdt,
  4817		.set_gdt = svm_set_gdt,
  4818		.set_dr7 = svm_set_dr7,
  4819		.sync_dirty_debug_regs = svm_sync_dirty_debug_regs,
  4820		.cache_reg = svm_cache_reg,
  4821		.get_rflags = svm_get_rflags,
  4822		.set_rflags = svm_set_rflags,
  4823		.get_if_flag = svm_get_if_flag,
  4824	
  4825		.flush_tlb_all = svm_flush_tlb_current,
  4826		.flush_tlb_current = svm_flush_tlb_current,
  4827		.flush_tlb_gva = svm_flush_tlb_gva,
  4828		.flush_tlb_guest = svm_flush_tlb_current,
  4829	
  4830		.vcpu_pre_run = svm_vcpu_pre_run,
  4831		.vcpu_run = svm_vcpu_run,
  4832		.handle_exit = svm_handle_exit,
  4833		.skip_emulated_instruction = svm_skip_emulated_instruction,
  4834		.update_emulated_instruction = NULL,
  4835		.set_interrupt_shadow = svm_set_interrupt_shadow,
  4836		.get_interrupt_shadow = svm_get_interrupt_shadow,
  4837		.patch_hypercall = svm_patch_hypercall,
  4838		.inject_irq = svm_inject_irq,
  4839		.inject_nmi = svm_inject_nmi,
> 4840		.get_hw_nmi_pending = svm_get_hw_nmi_pending,
> 4841		.set_hw_nmi_pending = svm_set_hw_nmi_pending,
  4842		.inject_exception = svm_inject_exception,
  4843		.cancel_injection = svm_cancel_injection,
  4844		.interrupt_allowed = svm_interrupt_allowed,
  4845		.nmi_allowed = svm_nmi_allowed,
  4846		.get_nmi_mask = svm_get_nmi_mask,
  4847		.set_nmi_mask = svm_set_nmi_mask,
  4848		.enable_nmi_window = svm_enable_nmi_window,
  4849		.enable_irq_window = svm_enable_irq_window,
  4850		.update_cr8_intercept = svm_update_cr8_intercept,
  4851		.set_virtual_apic_mode = avic_refresh_virtual_apic_mode,
  4852		.refresh_apicv_exec_ctrl = avic_refresh_apicv_exec_ctrl,
  4853		.apicv_post_state_restore = avic_apicv_post_state_restore,
  4854		.required_apicv_inhibits = AVIC_REQUIRED_APICV_INHIBITS,
  4855	
  4856		.get_exit_info = svm_get_exit_info,
  4857	
  4858		.vcpu_after_set_cpuid = svm_vcpu_after_set_cpuid,
  4859	
  4860		.has_wbinvd_exit = svm_has_wbinvd_exit,
  4861	
  4862		.get_l2_tsc_offset = svm_get_l2_tsc_offset,
  4863		.get_l2_tsc_multiplier = svm_get_l2_tsc_multiplier,
  4864		.write_tsc_offset = svm_write_tsc_offset,
  4865		.write_tsc_multiplier = svm_write_tsc_multiplier,
  4866	
  4867		.load_mmu_pgd = svm_load_mmu_pgd,
  4868	
  4869		.check_intercept = svm_check_intercept,
  4870		.handle_exit_irqoff = svm_handle_exit_irqoff,
  4871	
  4872		.request_immediate_exit = __kvm_request_immediate_exit,
  4873	
  4874		.sched_in = svm_sched_in,
  4875	
  4876		.nested_ops = &svm_nested_ops,
  4877	
  4878		.deliver_interrupt = svm_deliver_interrupt,
  4879		.pi_update_irte = avic_pi_update_irte,
  4880		.setup_mce = svm_setup_mce,
  4881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
