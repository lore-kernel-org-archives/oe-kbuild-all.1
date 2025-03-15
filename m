Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7275319B3EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742067779; cv=none; b=iGBGpYCqXj6Vnkcpokeurx2c5LqMQT0y0jAkmcSngdVjwVb2VPcGHio7Lmr47uZJBestgiO6IF+dRr/MpPjjl2cHcb0Ye4xl0uKWtvu2Qvlt7y0n2aEe9Ffhn+VblLOWPorfS+sQzYIujry5/avM98ahBqjMra0m+EMja4sDm3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742067779; c=relaxed/simple;
	bh=WZQpwYAwtp8yscq/ZjK3f8Lef3vgsJ0lJf6dXTFLScI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUlpHPIqntlotNCUZmqihNBHGzG9+U60TxwrTy0cLZIXjHRlDm94KNUDXv15PCx5PtVB00n+rEGdQ7+SzZ+xHPDE9uTiaJ47WfmTh2rDBdk1VfEwK34c1jT00DiJ3ioe4QMUtb0nIOUEqyHM1qDG8Yn/ZfgR4pSEQ4mwlhiMUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMP95lhY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMP95lhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742067778; x=1773603778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WZQpwYAwtp8yscq/ZjK3f8Lef3vgsJ0lJf6dXTFLScI=;
  b=fMP95lhYf67dt2IHxtP6g442B8pN2Du6AOVi/fgQ/8eJuOKNGoska3bO
   QKFajXAIVm2WrO+MAFOGxCg3Zapy1+xS4QKQt+5o3BXSop9wgoJU9q9Xp
   MXTJritrX86Acu7oBtTtwWn1XM0D2snCSvf5sN6rJBi/dkAMP4GQnpK9w
   TLWCxnRA85jEheE+O3xrzvMFkggw0+Lvcu0RoTRjXcqt2bxKJMiV9QqRM
   fakUrc8/+Tpugm0BI1pKBXMTXEQ7WwAOPDpNLJs/6VAGdKI7Q9E4m4bV9
   m+XSmslwmsN/7IYJmdf+dunagqhbO9D26kiFBendze43bpx2mb0w41hIP
   A==;
X-CSE-ConnectionGUID: AqtwvHhaTO6CSC2jn/UCSA==
X-CSE-MsgGUID: 5orMJyJXR9CekUQRuQ1GCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65663120"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="65663120"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 12:42:56 -0700
X-CSE-ConnectionGUID: gqmTZa0SQS+oCcLCqAjDzg==
X-CSE-MsgGUID: NxCpi+muSoCiWyYgD7qYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="122065475"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2025 12:42:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttXPC-000Bbj-1F;
	Sat, 15 Mar 2025 19:42:46 +0000
Date: Sun, 16 Mar 2025 03:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de,
	bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v6 03/11] Drivers: hv: Enable VTL mode for
 arm64
Message-ID: <202503160303.T0x72MqJ-lkp@intel.com>
References: <20250315001931.631210-4-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-4-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9608f6dc3e3229a40e1db1dab573d6882f38c2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detecting-hypervisor-presence/20250315-082319
base:   d9608f6dc3e3229a40e1db1dab573d6882f38c2a
patch link:    https://lore.kernel.org/r/20250315001931.631210-4-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v6 03/11] Drivers: hv: Enable VTL mode for arm64
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250316/202503160303.T0x72MqJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160303.T0x72MqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160303.T0x72MqJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_system_desc_base':
   arch/x86/hyperv/hv_vtl.c:84:28: error: 'struct ldttss_desc' has no member named 'base3'; did you mean 'base0'?
      84 |         return ((u64)desc->base3 << 32) | ((u64)desc->base2 << 24) |
         |                            ^~~~~
         |                            base0
   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_ap_entry':
   arch/x86/hyperv/hv_vtl.c:96:35: error: 'secondary_startup_64' undeclared (first use in this function); did you mean 'secondary_startup_64_fn'?
      96 |         ((secondary_startup_64_fn)secondary_startup_64)(&boot_params, &boot_params);
         |                                   ^~~~~~~~~~~~~~~~~~~~
         |                                   secondary_startup_64_fn
   arch/x86/hyperv/hv_vtl.c:96:35: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_bringup_vcpu':
>> arch/x86/hyperv/hv_vtl.c:116:19: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     116 |         u64 rip = (u64)&hv_vtl_ap_entry;
         |                   ^
   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_system_desc_base':
>> arch/x86/hyperv/hv_vtl.c:86:1: warning: control reaches end of non-void function [-Wreturn-type]
      86 | }
         | ^


vim +116 arch/x86/hyperv/hv_vtl.c

3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   81  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   82  static inline u64 hv_vtl_system_desc_base(struct ldttss_desc *desc)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   83  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   84  	return ((u64)desc->base3 << 32) | ((u64)desc->base2 << 24) |
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   85  		(desc->base1 << 16) | desc->base0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  @86  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   87  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   88  static inline u32 hv_vtl_system_desc_limit(struct ldttss_desc *desc)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   89  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   90  	return ((u32)desc->limit1 << 16) | (u32)desc->limit0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   91  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   92  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   93  typedef void (*secondary_startup_64_fn)(void*, void*);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   94  static void hv_vtl_ap_entry(void)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   95  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   96  	((secondary_startup_64_fn)secondary_startup_64)(&boot_params, &boot_params);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   97  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10   98  
2b4b90e053a2905 Saurabh Sengar 2024-03-03   99  static int hv_vtl_bringup_vcpu(u32 target_vp_index, int cpu, u64 eip_ignored)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  100  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  101  	u64 status;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  102  	int ret = 0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  103  	struct hv_enable_vp_vtl *input;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  104  	unsigned long irq_flags;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  105  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  106  	struct desc_ptr gdt_ptr;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  107  	struct desc_ptr idt_ptr;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  108  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  109  	struct ldttss_desc *tss;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  110  	struct ldttss_desc *ldt;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  111  	struct desc_struct *gdt;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  112  
2b4b90e053a2905 Saurabh Sengar 2024-03-03  113  	struct task_struct *idle = idle_thread_get(cpu);
2b4b90e053a2905 Saurabh Sengar 2024-03-03  114  	u64 rsp = (unsigned long)idle->thread.sp;
2b4b90e053a2905 Saurabh Sengar 2024-03-03  115  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10 @116  	u64 rip = (u64)&hv_vtl_ap_entry;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  117  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  118  	native_store_gdt(&gdt_ptr);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  119  	store_idt(&idt_ptr);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  120  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  121  	gdt = (struct desc_struct *)((void *)(gdt_ptr.address));
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  122  	tss = (struct ldttss_desc *)(gdt + GDT_ENTRY_TSS);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  123  	ldt = (struct ldttss_desc *)(gdt + GDT_ENTRY_LDT);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  124  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  125  	local_irq_save(irq_flags);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  126  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  127  	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  128  	memset(input, 0, sizeof(*input));
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  129  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  130  	input->partition_id = HV_PARTITION_ID_SELF;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  131  	input->vp_index = target_vp_index;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  132  	input->target_vtl.target_vtl = HV_VTL_MGMT;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  133  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  134  	/*
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  135  	 * The x86_64 Linux kernel follows the 16-bit -> 32-bit -> 64-bit
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  136  	 * mode transition sequence after waking up an AP with SIPI whose
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  137  	 * vector points to the 16-bit AP startup trampoline code. Here in
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  138  	 * VTL2, we can't perform that sequence as the AP has to start in
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  139  	 * the 64-bit mode.
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  140  	 *
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  141  	 * To make this happen, we tell the hypervisor to load a valid 64-bit
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  142  	 * context (most of which is just magic numbers from the CPU manual)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  143  	 * so that AP jumps right to the 64-bit entry of the kernel, and the
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  144  	 * control registers are loaded with values that let the AP fetch the
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  145  	 * code and data and carry on with work it gets assigned.
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  146  	 */
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  147  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  148  	input->vp_context.rip = rip;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  149  	input->vp_context.rsp = rsp;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  150  	input->vp_context.rflags = 0x0000000000000002;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  151  	input->vp_context.efer = __rdmsr(MSR_EFER);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  152  	input->vp_context.cr0 = native_read_cr0();
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  153  	input->vp_context.cr3 = __native_read_cr3();
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  154  	input->vp_context.cr4 = native_read_cr4();
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  155  	input->vp_context.msr_cr_pat = __rdmsr(MSR_IA32_CR_PAT);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  156  	input->vp_context.idtr.limit = idt_ptr.size;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  157  	input->vp_context.idtr.base = idt_ptr.address;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  158  	input->vp_context.gdtr.limit = gdt_ptr.size;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  159  	input->vp_context.gdtr.base = gdt_ptr.address;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  160  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  161  	/* Non-system desc (64bit), long, code, present */
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  162  	input->vp_context.cs.selector = __KERNEL_CS;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  163  	input->vp_context.cs.base = 0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  164  	input->vp_context.cs.limit = 0xffffffff;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  165  	input->vp_context.cs.attributes = 0xa09b;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  166  	/* Non-system desc (64bit), data, present, granularity, default */
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  167  	input->vp_context.ss.selector = __KERNEL_DS;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  168  	input->vp_context.ss.base = 0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  169  	input->vp_context.ss.limit = 0xffffffff;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  170  	input->vp_context.ss.attributes = 0xc093;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  171  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  172  	/* System desc (128bit), present, LDT */
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  173  	input->vp_context.ldtr.selector = GDT_ENTRY_LDT * 8;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  174  	input->vp_context.ldtr.base = hv_vtl_system_desc_base(ldt);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  175  	input->vp_context.ldtr.limit = hv_vtl_system_desc_limit(ldt);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  176  	input->vp_context.ldtr.attributes = 0x82;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  177  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  178  	/* System desc (128bit), present, TSS, 0x8b - busy, 0x89 -- default */
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  179  	input->vp_context.tr.selector = GDT_ENTRY_TSS * 8;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  180  	input->vp_context.tr.base = hv_vtl_system_desc_base(tss);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  181  	input->vp_context.tr.limit = hv_vtl_system_desc_limit(tss);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  182  	input->vp_context.tr.attributes = 0x8b;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  183  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  184  	status = hv_do_hypercall(HVCALL_ENABLE_VP_VTL, input, NULL);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  185  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  186  	if (!hv_result_success(status) &&
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  187  	    hv_result(status) != HV_STATUS_VTL_ALREADY_ENABLED) {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  188  		pr_err("HVCALL_ENABLE_VP_VTL failed for VP : %d ! [Err: %#llx\n]",
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  189  		       target_vp_index, status);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  190  		ret = -EINVAL;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  191  		goto free_lock;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  192  	}
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  193  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  194  	status = hv_do_hypercall(HVCALL_START_VP, input, NULL);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  195  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  196  	if (!hv_result_success(status)) {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  197  		pr_err("HVCALL_START_VP failed for VP : %d ! [Err: %#llx]\n",
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  198  		       target_vp_index, status);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  199  		ret = -EINVAL;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  200  	}
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  201  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  202  free_lock:
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  203  	local_irq_restore(irq_flags);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  204  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  205  	return ret;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  206  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
