Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E3165F11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313902; cv=none; b=OkeJwCMKu2KPg0+cCu3sHaXIPm3LwdwQJbMIVs18wU1fVIyykRCLJtpnqVNasAGYdXKi7TcCAEZe9uQM45RfRoKKJ3w10R3/C2yTCTA5qhUdtt8C/vSTlkSNE2ew/2BKVtG7A0aj7NivPjRW3WrvB6esa1+n0y6CAJ0Mdbg6oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313902; c=relaxed/simple;
	bh=sDLm0GHt73mi8ytASWiSKPXEBXyTPVnTFT9dmSKM+7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUAbwOwO5Liojik1TQaKWKAp2z7h6rhA5B7UNA/Er7Wd5Jr5U7bkMI0+TfYa65XECPFU70wSlXLi+DPnIXFChFo+AShVIl8Vb9822/FO10Wi6pxv2cMRMGtNK5BkPIHSf9EAu9E1me116me27r0Ii2idT2zWNdoqBflp3s67qGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbgnZyZ0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbgnZyZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724313900; x=1755849900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDLm0GHt73mi8ytASWiSKPXEBXyTPVnTFT9dmSKM+7E=;
  b=lbgnZyZ0YTa6JKVWMKn6SOnWIYgz/Qr6zsmY4lHjZ8JYdQBsiLEZjVId
   185OwS4jlMCifCAtxnjlEwwWw1KAz7adVSvj43wRGeUeXbK2mg/WrekYI
   WNOrWb77bbY7D4OZTGWfz8ot4jwELKZ4UaJsW0OxuXl4nOTC2+6hVOtQZ
   Z8PMffmSqXEdhlOXetBSaIm3AqbNUygje/dsillitm3QkHT7SssVEhn4S
   WIP4QG7mbXNCazA1obKBmhFtBmbCKMyoyoISyS9Znc5/k83UgNObPWNxR
   Ip/Yec2DfsLuXYt5TlrNAvG+Jc0IY0wglQO1UFJkDKUH2VsppnxIl3F/1
   g==;
X-CSE-ConnectionGUID: iJFfnMDkR26kZAkDqc3nZg==
X-CSE-MsgGUID: 4PreQyfoQWyY6HKeT1wWQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40224130"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="40224130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 01:04:58 -0700
X-CSE-ConnectionGUID: 5G0JGIFHRISUP3O7/Es7lQ==
X-CSE-MsgGUID: bdjvpfwDRxuYL7chIT95TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66307760"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2024 01:04:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh2oQ-000CYm-2w;
	Thu, 22 Aug 2024 08:04:54 +0000
Date: Thu, 22 Aug 2024 16:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 24/35]
 arch/x86/kvm/vmx/vmx.c:6459:24: error: implicit declaration of function
 'read_msr'; did you mean 'readsl'?
Message-ID: <202408221530.z6SNgLS7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   50ac8a7a9a9861fa6ac817aa2507943ff26c562c
commit: 5a4a86d7b7513edc29495c252c30f7fe455dba9b [24/35] KVM: VMX: Dump FRED context in dump_vmcs()
config: i386-randconfig-005-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221530.z6SNgLS7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221530.z6SNgLS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221530.z6SNgLS7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
   arch/x86/kvm/vmx/vmx.c: In function 'dump_vmcs':
>> arch/x86/kvm/vmx/vmx.c:6459:24: error: implicit declaration of function 'read_msr'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
    6459 |                        read_msr(MSR_IA32_FRED_RSP0),
         |                        ^~~~~~~~
   include/linux/printk.h:437:33: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/x86/kvm/vmx/vmx.c:6454:17: note: in expansion of macro 'pr_err'
    6454 |                 pr_err("FRED guest: config=0x%016llx, stack_levels=0x%016llx\n"
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_ERR'
     508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/x86/kvm/vmx/vmx.c:6454:17: note: in expansion of macro 'pr_err'
    6454 |                 pr_err("FRED guest: config=0x%016llx, stack_levels=0x%016llx\n"
         |                 ^~~~~~
   cc1: some warnings being treated as errors


vim +6459 arch/x86/kvm/vmx/vmx.c

  6388	
  6389	void dump_vmcs(struct kvm_vcpu *vcpu)
  6390	{
  6391		struct vcpu_vmx *vmx = to_vmx(vcpu);
  6392		u32 vmentry_ctl, vmexit_ctl;
  6393		u32 cpu_based_exec_ctrl, pin_based_exec_ctrl, secondary_exec_control;
  6394		u64 tertiary_exec_control, secondary_vmexit_ctl;
  6395		unsigned long cr4;
  6396		int efer_slot;
  6397	
  6398		if (!dump_invalid_vmcs) {
  6399			pr_warn_ratelimited("set kvm_intel.dump_invalid_vmcs=1 to dump internal KVM state.\n");
  6400			return;
  6401		}
  6402	
  6403		vmentry_ctl = vmcs_read32(VM_ENTRY_CONTROLS);
  6404		vmexit_ctl = vmcs_read32(VM_EXIT_CONTROLS);
  6405		secondary_vmexit_ctl = cpu_has_secondary_vmexit_ctrls() ?
  6406				       vmcs_read64(SECONDARY_VM_EXIT_CONTROLS) : 0;
  6407		cpu_based_exec_ctrl = vmcs_read32(CPU_BASED_VM_EXEC_CONTROL);
  6408		pin_based_exec_ctrl = vmcs_read32(PIN_BASED_VM_EXEC_CONTROL);
  6409		cr4 = vmcs_readl(GUEST_CR4);
  6410	
  6411		if (cpu_has_secondary_exec_ctrls())
  6412			secondary_exec_control = vmcs_read32(SECONDARY_VM_EXEC_CONTROL);
  6413		else
  6414			secondary_exec_control = 0;
  6415	
  6416		if (cpu_has_tertiary_exec_ctrls())
  6417			tertiary_exec_control = vmcs_read64(TERTIARY_VM_EXEC_CONTROL);
  6418		else
  6419			tertiary_exec_control = 0;
  6420	
  6421		pr_err("VMCS %p, last attempted VM-entry on CPU %d\n",
  6422		       vmx->loaded_vmcs->vmcs, vcpu->arch.last_vmentry_cpu);
  6423		pr_err("*** Guest State ***\n");
  6424		pr_err("CR0: actual=0x%016lx, shadow=0x%016lx, gh_mask=%016lx\n",
  6425		       vmcs_readl(GUEST_CR0), vmcs_readl(CR0_READ_SHADOW),
  6426		       vmcs_readl(CR0_GUEST_HOST_MASK));
  6427		pr_err("CR4: actual=0x%016lx, shadow=0x%016lx, gh_mask=%016lx\n",
  6428		       cr4, vmcs_readl(CR4_READ_SHADOW), vmcs_readl(CR4_GUEST_HOST_MASK));
  6429		pr_err("CR3 = 0x%016lx\n", vmcs_readl(GUEST_CR3));
  6430		if (cpu_has_vmx_ept()) {
  6431			pr_err("PDPTR0 = 0x%016llx  PDPTR1 = 0x%016llx\n",
  6432			       vmcs_read64(GUEST_PDPTR0), vmcs_read64(GUEST_PDPTR1));
  6433			pr_err("PDPTR2 = 0x%016llx  PDPTR3 = 0x%016llx\n",
  6434			       vmcs_read64(GUEST_PDPTR2), vmcs_read64(GUEST_PDPTR3));
  6435		}
  6436		pr_err("RSP = 0x%016lx  RIP = 0x%016lx\n",
  6437		       vmcs_readl(GUEST_RSP), vmcs_readl(GUEST_RIP));
  6438		pr_err("RFLAGS=0x%08lx         DR7 = 0x%016lx\n",
  6439		       vmcs_readl(GUEST_RFLAGS), vmcs_readl(GUEST_DR7));
  6440		pr_err("Sysenter RSP=%016lx CS:RIP=%04x:%016lx\n",
  6441		       vmcs_readl(GUEST_SYSENTER_ESP),
  6442		       vmcs_read32(GUEST_SYSENTER_CS), vmcs_readl(GUEST_SYSENTER_EIP));
  6443		vmx_dump_sel("CS:  ", GUEST_CS_SELECTOR);
  6444		vmx_dump_sel("DS:  ", GUEST_DS_SELECTOR);
  6445		vmx_dump_sel("SS:  ", GUEST_SS_SELECTOR);
  6446		vmx_dump_sel("ES:  ", GUEST_ES_SELECTOR);
  6447		vmx_dump_sel("FS:  ", GUEST_FS_SELECTOR);
  6448		vmx_dump_sel("GS:  ", GUEST_GS_SELECTOR);
  6449		vmx_dump_dtsel("GDTR:", GUEST_GDTR_LIMIT);
  6450		vmx_dump_sel("LDTR:", GUEST_LDTR_SELECTOR);
  6451		vmx_dump_dtsel("IDTR:", GUEST_IDTR_LIMIT);
  6452		vmx_dump_sel("TR:  ", GUEST_TR_SELECTOR);
  6453		if (vmentry_ctl & VM_ENTRY_LOAD_IA32_FRED)
  6454			pr_err("FRED guest: config=0x%016llx, stack_levels=0x%016llx\n"
  6455			       "RSP0=0x%016lx, RSP1=0x%016llx\n"
  6456			       "RSP2=0x%016llx, RSP3=0x%016llx\n",
  6457			       vmcs_read64(GUEST_IA32_FRED_CONFIG),
  6458			       vmcs_read64(GUEST_IA32_FRED_STKLVLS),
> 6459			       read_msr(MSR_IA32_FRED_RSP0),
  6460			       vmcs_read64(GUEST_IA32_FRED_RSP1),
  6461			       vmcs_read64(GUEST_IA32_FRED_RSP2),
  6462			       vmcs_read64(GUEST_IA32_FRED_RSP3));
  6463		efer_slot = vmx_find_loadstore_msr_slot(&vmx->msr_autoload.guest, MSR_EFER);
  6464		if (vmentry_ctl & VM_ENTRY_LOAD_IA32_EFER)
  6465			pr_err("EFER= 0x%016llx\n", vmcs_read64(GUEST_IA32_EFER));
  6466		else if (efer_slot >= 0)
  6467			pr_err("EFER= 0x%016llx (autoload)\n",
  6468			       vmx->msr_autoload.guest.val[efer_slot].value);
  6469		else if (vmentry_ctl & VM_ENTRY_IA32E_MODE)
  6470			pr_err("EFER= 0x%016llx (effective)\n",
  6471			       vcpu->arch.efer | (EFER_LMA | EFER_LME));
  6472		else
  6473			pr_err("EFER= 0x%016llx (effective)\n",
  6474			       vcpu->arch.efer & ~(EFER_LMA | EFER_LME));
  6475		if (vmentry_ctl & VM_ENTRY_LOAD_IA32_PAT)
  6476			pr_err("PAT = 0x%016llx\n", vmcs_read64(GUEST_IA32_PAT));
  6477		pr_err("DebugCtl = 0x%016llx  DebugExceptions = 0x%016lx\n",
  6478		       vmcs_read64(GUEST_IA32_DEBUGCTL),
  6479		       vmcs_readl(GUEST_PENDING_DBG_EXCEPTIONS));
  6480		if (cpu_has_load_perf_global_ctrl() &&
  6481		    vmentry_ctl & VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL)
  6482			pr_err("PerfGlobCtl = 0x%016llx\n",
  6483			       vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL));
  6484		if (vmentry_ctl & VM_ENTRY_LOAD_BNDCFGS)
  6485			pr_err("BndCfgS = 0x%016llx\n", vmcs_read64(GUEST_BNDCFGS));
  6486		pr_err("Interruptibility = %08x  ActivityState = %08x\n",
  6487		       vmcs_read32(GUEST_INTERRUPTIBILITY_INFO),
  6488		       vmcs_read32(GUEST_ACTIVITY_STATE));
  6489		if (secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
  6490			pr_err("InterruptStatus = %04x\n",
  6491			       vmcs_read16(GUEST_INTR_STATUS));
  6492		if (vmcs_read32(VM_ENTRY_MSR_LOAD_COUNT) > 0)
  6493			vmx_dump_msrs("guest autoload", &vmx->msr_autoload.guest);
  6494		if (vmcs_read32(VM_EXIT_MSR_STORE_COUNT) > 0)
  6495			vmx_dump_msrs("guest autostore", &vmx->msr_autostore.guest);
  6496	
  6497		pr_err("*** Host State ***\n");
  6498		pr_err("RIP = 0x%016lx  RSP = 0x%016lx\n",
  6499		       vmcs_readl(HOST_RIP), vmcs_readl(HOST_RSP));
  6500		pr_err("CS=%04x SS=%04x DS=%04x ES=%04x FS=%04x GS=%04x TR=%04x\n",
  6501		       vmcs_read16(HOST_CS_SELECTOR), vmcs_read16(HOST_SS_SELECTOR),
  6502		       vmcs_read16(HOST_DS_SELECTOR), vmcs_read16(HOST_ES_SELECTOR),
  6503		       vmcs_read16(HOST_FS_SELECTOR), vmcs_read16(HOST_GS_SELECTOR),
  6504		       vmcs_read16(HOST_TR_SELECTOR));
  6505		pr_err("FSBase=%016lx GSBase=%016lx TRBase=%016lx\n",
  6506		       vmcs_readl(HOST_FS_BASE), vmcs_readl(HOST_GS_BASE),
  6507		       vmcs_readl(HOST_TR_BASE));
  6508		pr_err("GDTBase=%016lx IDTBase=%016lx\n",
  6509		       vmcs_readl(HOST_GDTR_BASE), vmcs_readl(HOST_IDTR_BASE));
  6510		if (vmexit_ctl & SECONDARY_VM_EXIT_LOAD_IA32_FRED)
  6511			pr_err("FRED host: config=0x%016llx, stack_levels=0x%016llx\n"
  6512			       "RSP0=0x%016lx, RSP1=0x%016llx\n"
  6513			       "RSP2=0x%016llx, RSP3=0x%016llx\n",
  6514			       vmcs_read64(HOST_IA32_FRED_CONFIG),
  6515			       vmcs_read64(HOST_IA32_FRED_STKLVLS),
  6516			       (unsigned long)task_stack_page(current) + THREAD_SIZE,
  6517			       vmcs_read64(HOST_IA32_FRED_RSP1),
  6518			       vmcs_read64(HOST_IA32_FRED_RSP2),
  6519			       vmcs_read64(HOST_IA32_FRED_RSP3));
  6520		pr_err("CR0=%016lx CR3=%016lx CR4=%016lx\n",
  6521		       vmcs_readl(HOST_CR0), vmcs_readl(HOST_CR3),
  6522		       vmcs_readl(HOST_CR4));
  6523		pr_err("Sysenter RSP=%016lx CS:RIP=%04x:%016lx\n",
  6524		       vmcs_readl(HOST_IA32_SYSENTER_ESP),
  6525		       vmcs_read32(HOST_IA32_SYSENTER_CS),
  6526		       vmcs_readl(HOST_IA32_SYSENTER_EIP));
  6527		if (vmexit_ctl & VM_EXIT_LOAD_IA32_EFER)
  6528			pr_err("EFER= 0x%016llx\n", vmcs_read64(HOST_IA32_EFER));
  6529		if (vmexit_ctl & VM_EXIT_LOAD_IA32_PAT)
  6530			pr_err("PAT = 0x%016llx\n", vmcs_read64(HOST_IA32_PAT));
  6531		if (cpu_has_load_perf_global_ctrl() &&
  6532		    vmexit_ctl & VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL)
  6533			pr_err("PerfGlobCtl = 0x%016llx\n",
  6534			       vmcs_read64(HOST_IA32_PERF_GLOBAL_CTRL));
  6535		if (vmcs_read32(VM_EXIT_MSR_LOAD_COUNT) > 0)
  6536			vmx_dump_msrs("host autoload", &vmx->msr_autoload.host);
  6537	
  6538		pr_err("*** Control State ***\n");
  6539		pr_err("CPUBased=0x%08x SecondaryExec=0x%08x TertiaryExec=0x%016llx\n",
  6540		       cpu_based_exec_ctrl, secondary_exec_control, tertiary_exec_control);
  6541		pr_err("PinBased=0x%08x EntryControls=0x%08x\n",
  6542		       pin_based_exec_ctrl, vmentry_ctl);
  6543		pr_err("ExitControls=0x%08x SecondaryExitControls=0x%016llx\n",
  6544		       vmexit_ctl, secondary_vmexit_ctl);
  6545		pr_err("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
  6546		       vmcs_read32(EXCEPTION_BITMAP),
  6547		       vmcs_read32(PAGE_FAULT_ERROR_CODE_MASK),
  6548		       vmcs_read32(PAGE_FAULT_ERROR_CODE_MATCH));
  6549		pr_err("VMEntry: intr_info=%08x errcode=%08x ilen=%08x event_data=%016llx\n",
  6550		       vmcs_read32(VM_ENTRY_INTR_INFO_FIELD),
  6551		       vmcs_read32(VM_ENTRY_EXCEPTION_ERROR_CODE),
  6552		       vmcs_read32(VM_ENTRY_INSTRUCTION_LEN),
  6553		       kvm_cpu_cap_has(X86_FEATURE_FRED) ? vmcs_read64(INJECTED_EVENT_DATA) : 0);
  6554		pr_err("VMExit: intr_info=%08x errcode=%08x ilen=%08x\n",
  6555		       vmcs_read32(VM_EXIT_INTR_INFO),
  6556		       vmcs_read32(VM_EXIT_INTR_ERROR_CODE),
  6557		       vmcs_read32(VM_EXIT_INSTRUCTION_LEN));
  6558		pr_err("        reason=%08x qualification=%016lx\n",
  6559		       vmcs_read32(VM_EXIT_REASON), vmcs_readl(EXIT_QUALIFICATION));
  6560		pr_err("IDTVectoring: info=%08x errcode=%08x event_data=%016llx\n",
  6561		       vmcs_read32(IDT_VECTORING_INFO_FIELD),
  6562		       vmcs_read32(IDT_VECTORING_ERROR_CODE),
  6563		       kvm_cpu_cap_has(X86_FEATURE_FRED) ? vmcs_read64(ORIGINAL_EVENT_DATA) : 0);
  6564		pr_err("TSC Offset = 0x%016llx\n", vmcs_read64(TSC_OFFSET));
  6565		if (secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
  6566			pr_err("TSC Multiplier = 0x%016llx\n",
  6567			       vmcs_read64(TSC_MULTIPLIER));
  6568		if (cpu_based_exec_ctrl & CPU_BASED_TPR_SHADOW) {
  6569			if (secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY) {
  6570				u16 status = vmcs_read16(GUEST_INTR_STATUS);
  6571				pr_err("SVI|RVI = %02x|%02x ", status >> 8, status & 0xff);
  6572			}
  6573			pr_cont("TPR Threshold = 0x%02x\n", vmcs_read32(TPR_THRESHOLD));
  6574			if (secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
  6575				pr_err("APIC-access addr = 0x%016llx ", vmcs_read64(APIC_ACCESS_ADDR));
  6576			pr_cont("virt-APIC addr = 0x%016llx\n", vmcs_read64(VIRTUAL_APIC_PAGE_ADDR));
  6577		}
  6578		if (pin_based_exec_ctrl & PIN_BASED_POSTED_INTR)
  6579			pr_err("PostedIntrVec = 0x%02x\n", vmcs_read16(POSTED_INTR_NV));
  6580		if ((secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT))
  6581			pr_err("EPT pointer = 0x%016llx\n", vmcs_read64(EPT_POINTER));
  6582		if (secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
  6583			pr_err("PLE Gap=%08x Window=%08x\n",
  6584			       vmcs_read32(PLE_GAP), vmcs_read32(PLE_WINDOW));
  6585		if (secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
  6586			pr_err("Virtual processor ID = 0x%04x\n",
  6587			       vmcs_read16(VIRTUAL_PROCESSOR_ID));
  6588		if (secondary_exec_control & SECONDARY_EXEC_EPT_VIOLATION_VE) {
  6589			struct vmx_ve_information *ve_info = vmx->ve_info;
  6590			u64 ve_info_pa = vmcs_read64(VE_INFORMATION_ADDRESS);
  6591	
  6592			/*
  6593			 * If KVM is dumping the VMCS, then something has gone wrong
  6594			 * already.  Derefencing an address from the VMCS, which could
  6595			 * very well be corrupted, is a terrible idea.  The virtual
  6596			 * address is known so use it.
  6597			 */
  6598			pr_err("VE info address = 0x%016llx%s\n", ve_info_pa,
  6599			       ve_info_pa == __pa(ve_info) ? "" : "(corrupted!)");
  6600			pr_err("ve_info: 0x%08x 0x%08x 0x%016llx 0x%016llx 0x%016llx 0x%04x\n",
  6601			       ve_info->exit_reason, ve_info->delivery,
  6602			       ve_info->exit_qualification,
  6603			       ve_info->guest_linear_address,
  6604			       ve_info->guest_physical_address, ve_info->eptp_index);
  6605		}
  6606	}
  6607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
