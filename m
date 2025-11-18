Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3132EC08D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448294; cv=none; b=WKEmlvzkj0bx4SOSmwCx0LM+dbWhsZCGrx64hveHKg7FJRA5WxU7NIsArciV5aTbQKffeU3cibfASgK2XKwCjC00vMh6KAU9cz27eR25Ojfre8UzJHcc8vp1gd0k5ew/scRPs5JrjsORNBwX30OB3CgUVeHny5sZe9mw8K98JUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448294; c=relaxed/simple;
	bh=3XWbJwlyVnUUv915xKLPc0YPEElp5xdZsX4aMI8wDVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3pu/zjMh3/4d9CE6Au0cOB3JNWo+Ers1VuHBvUqXWiFzWgPG2JfsqRqNBsgbUI5SwoHb8++lUvYRIHo1bz8zha4gvDagSksF7bOCmUo9OjVublJZsXCtdjOTZmvdNao2ZWazKp4D/dEqc3LPH9h4IE5Zv1i7XfpzSilUlfOu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nw7uorW8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nw7uorW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763448293; x=1794984293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XWbJwlyVnUUv915xKLPc0YPEElp5xdZsX4aMI8wDVA=;
  b=Nw7uorW8zDpuB0nQenTcjKQ224MGccM1h4XQU5m140n7M8O2bIBvSggR
   bUbwO15P+qAdRuwzGj5wpVJz3XMqMvowuW+uoWReWuQOzPYaIDHv7Bjb+
   hTj0pMShYf0X2ZdFZRoxLnQS7BIK+7VEiMj6zvMIDkXHPm/h0QLz1RUo3
   NtQagWnyx+dCi7KlwuMEZ7R07+bI7ob8lIblojPyW5npqxEfuT+hnzhpj
   pM1HtlsnCTzrgHvDzwQVJHasXRZDl4wDEJH1ev2PAK5PBcPLvD6Y0VZa2
   OMZyzh5H+wGJAEVSurPZ7MHcfRztJrPw1GxadjdQT2Y2nhZ5upMdfolrj
   A==;
X-CSE-ConnectionGUID: yzSEy3PSTnOAcbCF4GBzjQ==
X-CSE-MsgGUID: 2eY+jbKEQneLsqRXt9pZbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76137712"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76137712"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 22:44:50 -0800
X-CSE-ConnectionGUID: GtIrkrOnRi2NWauFt6eAQw==
X-CSE-MsgGUID: wV86kCDwT9y8TpdWHKW19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190903667"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2025 22:44:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLFSI-0001PZ-2X;
	Tue, 18 Nov 2025 06:44:46 +0000
Date: Tue, 18 Nov 2025 14:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kvm-riscv:riscv_kvm_nested_v1 14/15]
 arch/riscv/kvm/vcpu_nested_csr.c:436:5: error: call to undeclared function
 'kvm_riscv_vcpu_timer_vs_restart'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202511181436.2jOJaYNZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_nested_v1
head:   ee90dd59d6044feb99891c354aac47218dd3e941
commit: 6e5f032951fccd717d1e5b7ca967d6fc20c8bdef [14/15] RISC-V: KVM: Add CSR emulation for nested virtualization
config: riscv-randconfig-r064-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181436.2jOJaYNZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181436.2jOJaYNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181436.2jOJaYNZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_nested_csr.c:436:5: error: call to undeclared function 'kvm_riscv_vcpu_timer_vs_restart'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     436 |                                 kvm_riscv_vcpu_timer_vs_restart(vcpu);
         |                                 ^
   arch/riscv/kvm/vcpu_nested_csr.c:436:5: note: did you mean 'kvm_riscv_vcpu_timer_restore'?
   arch/riscv/include/asm/kvm_vcpu_timer.h:46:6: note: 'kvm_riscv_vcpu_timer_restore' declared here
      46 | void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
         |      ^
   1 error generated.


vim +/kvm_riscv_vcpu_timer_vs_restart +436 arch/riscv/kvm/vcpu_nested_csr.c

   147	
   148	static int __riscv_vcpu_nested_hext_csr_rmw(struct kvm_vcpu *vcpu,
   149						    bool priv_check, unsigned int csr_num,
   150						    unsigned long *val, unsigned long new_val,
   151						    unsigned long wr_mask)
   152	{
   153		unsigned int csr_priv = (csr_num >> CSR_NUM_PRIV_SHIFT) & CSR_NUM_PRIV_MASK;
   154		struct kvm_vcpu_nested_csr *nsc = &vcpu->arch.nested.csr;
   155		unsigned long mode, zero = 0, writeable_mask = 0;
   156		unsigned long *csr, tmpcsr = 0, csr_rdor = 0;
   157		bool read_only = false, nuke_swtlb = false;
   158		int csr_shift = 0;
   159		u64 tmp64;
   160	
   161		/*
   162		 * If H-extension is not available for VCPU then forward trap
   163		 * as illegal instruction trap to virtual-HS mode.
   164		 */
   165		if (!riscv_isa_extension_available(vcpu->arch.isa, h))
   166			return KVM_INSN_ILLEGAL_TRAP;
   167	
   168		/*
   169		 * Trap from virtual-VS and virtual-VU modes should be forwarded
   170		 * to virtual-HS mode as a virtual instruction trap.
   171		 */
   172		if (kvm_riscv_vcpu_nested_virt(vcpu))
   173			return (csr_priv == CSR_PRIV_HYPERVISOR) ?
   174				KVM_INSN_VIRTUAL_TRAP : KVM_INSN_ILLEGAL_TRAP;
   175	
   176		/*
   177		 * H-extension CSRs not allowed in virtual-U mode so forward trap
   178		 * as illegal instruction trap to virtual-HS mode.
   179		 */
   180		if (priv_check && !(vcpu->arch.guest_context.hstatus & HSTATUS_SPVP))
   181			return KVM_INSN_ILLEGAL_TRAP;
   182	
   183		switch (csr_num) {
   184		case CSR_HSTATUS:
   185			csr = &nsc->hstatus;
   186			writeable_mask = HSTATUS_VTSR | HSTATUS_VTW | HSTATUS_VTVM |
   187					 HSTATUS_HU | HSTATUS_SPVP | HSTATUS_SPV |
   188					 HSTATUS_GVA;
   189			if (wr_mask & HSTATUS_SPV) {
   190				/*
   191				 * If hstatus.SPV == 1 then enable host SRET
   192				 * trapping for the virtual-HS mode which will
   193				 * allow host to do nested world-switch upon
   194				 * next SRET instruction executed by the
   195				 * virtual-HS-mode.
   196				 *
   197				 * If hstatus.SPV == 0 then disable host SRET
   198				 * trapping for the virtual-HS mode which will
   199				 * ensure that host does not do any nested
   200				 * world-switch for SRET instruction executed
   201				 * virtual-HS mode for general interrupt and
   202				 * trap handling.
   203				 */
   204				vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTSR;
   205				vcpu->arch.guest_context.hstatus |= (new_val & HSTATUS_SPV) ?
   206								    HSTATUS_VTSR : 0;
   207			}
   208			break;
   209		case CSR_HEDELEG:
   210			csr = &nsc->hedeleg;
   211			writeable_mask = NESTED_HEDELEG_WRITEABLE;
   212			break;
   213		case CSR_HIDELEG:
   214			csr = &nsc->hideleg;
   215			writeable_mask = NESTED_HIDELEG_WRITEABLE;
   216			break;
   217		case CSR_HVIP:
   218			csr = &nsc->hvip;
   219			writeable_mask = NESTED_HVIP_WRITEABLE;
   220			break;
   221		case CSR_HIE:
   222			csr = &nsc->vsie;
   223			csr_shift = -VSIP_TO_HVIP_SHIFT;
   224			writeable_mask = NESTED_HVIP_WRITEABLE;
   225			break;
   226		case CSR_HIP:
   227			csr = &nsc->hvip;
   228			csr_rdor = kvm_riscv_vcpu_nested_timer_irq(vcpu) ? BIT(IRQ_VS_TIMER) : 0;
   229			writeable_mask = BIT(IRQ_VS_SOFT);
   230			break;
   231		case CSR_HGEIP:
   232			csr = &zero;
   233			read_only = true;
   234			break;
   235		case CSR_HGEIE:
   236			csr = &zero;
   237			break;
   238		case CSR_HCOUNTEREN:
   239			csr = &nsc->hcounteren;
   240			writeable_mask = NESTED_HCOUNTEREN_WRITEABLE;
   241			break;
   242		case CSR_HTIMEDELTA:
   243			csr = &nsc->htimedelta;
   244			writeable_mask = -1UL;
   245			break;
   246	#ifndef CONFIG_64BIT
   247		case CSR_HTIMEDELTAH:
   248			csr = &nsc->htimedeltah;
   249			writeable_mask = -1UL;
   250			break;
   251	#endif
   252		case CSR_HTVAL:
   253			csr = &nsc->htval;
   254			writeable_mask = -1UL;
   255			break;
   256		case CSR_HTINST:
   257			csr = &nsc->htinst;
   258			writeable_mask = -1UL;
   259			break;
   260		case CSR_HGATP:
   261			csr = &nsc->hgatp;
   262			writeable_mask = HGATP_MODE | HGATP_VMID | HGATP_PPN;
   263			if (wr_mask & HGATP_MODE) {
   264				mode = (new_val & HGATP_MODE) >> HGATP_MODE_SHIFT;
   265				switch (mode) {
   266				/*
   267				 * Intentionally support only Sv39x4 on RV64 and
   268				 * Sv32x4 on RV32 for guest G-stage so that software
   269				 * page table walks on guest G-stage are faster.
   270				 */
   271	#ifdef CONFIG_64BIT
   272				case HGATP_MODE_SV39X4:
   273					if (kvm_riscv_gstage_mode != HGATP_MODE_SV57X4 &&
   274					    kvm_riscv_gstage_mode != HGATP_MODE_SV48X4 &&
   275					    kvm_riscv_gstage_mode != HGATP_MODE_SV39X4)
   276						mode = HGATP_MODE_OFF;
   277					break;
   278	#else
   279				case HGATP_MODE_SV32X4:
   280					if (kvm_riscv_gstage_mode != HGATP_MODE_SV32X4)
   281						mode = HGATP_MODE_OFF;
   282					break;
   283	#endif
   284				default:
   285					mode = HGATP_MODE_OFF;
   286					break;
   287				}
   288				new_val &= ~HGATP_MODE;
   289				new_val |= (mode << HGATP_MODE_SHIFT) & HGATP_MODE;
   290				if ((new_val ^ nsc->hgatp) & HGATP_MODE)
   291					nuke_swtlb = true;
   292			}
   293			if (wr_mask & HGATP_VMID) {
   294				if ((new_val ^ nsc->hgatp) & HGATP_VMID)
   295					nuke_swtlb = true;
   296			}
   297			break;
   298		case CSR_HENVCFG:
   299			csr = &nsc->henvcfg;
   300	#ifdef CONFIG_64BIT
   301			writeable_mask = ENVCFG_STCE;
   302	#endif
   303			break;
   304	#ifdef CONFIG_32BIT
   305		case CSR_HENVCFGH:
   306			csr = &nsc->henvcfgh;
   307			writeable_mask = ENVCFG_STCE >> 32;
   308			break;
   309	#endif
   310		case CSR_VSSTATUS:
   311			csr = &nsc->vsstatus;
   312			writeable_mask = SR_SIE | SR_SPIE | SR_SPP | SR_SUM | SR_MXR | SR_FS | SR_VS;
   313			break;
   314		case CSR_VSIP:
   315			csr = &nsc->hvip;
   316			csr_rdor = kvm_riscv_vcpu_nested_timer_irq(vcpu) ? BIT(IRQ_VS_TIMER) : 0;
   317			csr_shift = VSIP_TO_HVIP_SHIFT;
   318			writeable_mask = BIT(IRQ_VS_SOFT) & nsc->hideleg;
   319			break;
   320		case CSR_VSIE:
   321			csr = &nsc->vsie;
   322			writeable_mask = NESTED_VSIE_WRITEABLE & (nsc->hideleg >> VSIP_TO_HVIP_SHIFT);
   323			break;
   324		case CSR_VSTVEC:
   325			csr = &nsc->vstvec;
   326			writeable_mask = -1UL;
   327			break;
   328		case CSR_VSSCRATCH:
   329			csr = &nsc->vsscratch;
   330			writeable_mask = -1UL;
   331			break;
   332		case CSR_VSEPC:
   333			csr = &nsc->vsepc;
   334			writeable_mask = -1UL;
   335			break;
   336		case CSR_VSCAUSE:
   337			csr = &nsc->vscause;
   338			writeable_mask = NESTED_VSCAUSE_WRITEABLE;
   339			break;
   340		case CSR_VSTVAL:
   341			csr = &nsc->vstval;
   342			writeable_mask = -1UL;
   343			break;
   344		case CSR_VSATP:
   345			csr = &nsc->vsatp;
   346			writeable_mask = SATP_MODE | SATP_ASID | SATP_PPN;
   347			if (wr_mask & SATP_MODE) {
   348				mode = new_val & SATP_MODE;
   349				switch (mode) {
   350	#ifdef CONFIG_64BIT
   351				case SATP_MODE_57:
   352					if (!pgtable_l5_enabled)
   353						mode = SATP_MODE_OFF;
   354					break;
   355				case SATP_MODE_48:
   356					if (!pgtable_l5_enabled && !pgtable_l4_enabled)
   357						mode = SATP_MODE_OFF;
   358					break;
   359				case SATP_MODE_39:
   360					break;
   361	#else
   362				case SATP_MODE_32:
   363					break;
   364	#endif
   365				default:
   366					mode = SATP_MODE_OFF;
   367					break;
   368				}
   369				new_val &= ~SATP_MODE;
   370				new_val |= mode & SATP_MODE;
   371			}
   372			break;
   373		case CSR_VSTIMECMP:
   374			if (!riscv_isa_extension_available(vcpu->arch.isa, SSTC))
   375				return KVM_INSN_ILLEGAL_TRAP;
   376			tmpcsr = kvm_riscv_vcpu_nested_timer_cycles(vcpu);
   377			csr = &tmpcsr;
   378			writeable_mask = -1UL;
   379			break;
   380	#ifdef CONFIG_32BIT
   381		case CSR_VSTIMECMPH:
   382			if (!riscv_isa_extension_available(vcpu->arch.isa, SSTC))
   383				return KVM_INSN_ILLEGAL_TRAP;
   384			tmpcsr = kvm_riscv_vcpu_nested_timer_cycles(vcpu) >> 32;
   385			csr = &tmpcsr;
   386			writeable_mask = -1UL;
   387			break;
   388	#endif
   389		default:
   390			return KVM_INSN_ILLEGAL_TRAP;
   391		}
   392	
   393		if (val)
   394			*val = (csr_shift < 0) ? (*csr | csr_rdor) << -csr_shift :
   395						 (*csr | csr_rdor) >> csr_shift;
   396	
   397		if (read_only) {
   398			return KVM_INSN_ILLEGAL_TRAP;
   399		} else if (wr_mask) {
   400			writeable_mask = (csr_shift < 0) ?
   401					  writeable_mask >> -csr_shift :
   402					  writeable_mask << csr_shift;
   403			wr_mask = (csr_shift < 0) ?
   404				   wr_mask >> -csr_shift : wr_mask << csr_shift;
   405			new_val = (csr_shift < 0) ?
   406				   new_val >> -csr_shift : new_val << csr_shift;
   407			wr_mask &= writeable_mask;
   408			*csr = (*csr & ~wr_mask) | (new_val & wr_mask);
   409	
   410			switch (csr_num) {
   411			case CSR_VSTIMECMP:
   412	#ifdef CONFIG_32BIT
   413				tmp64 = kvm_riscv_vcpu_nested_timer_cycles(vcpu);
   414				tmp64 &= ~0xffffffffULL;
   415				tmp64 |= tmpcsr;
   416	#else
   417				tmp64 = tmpcsr;
   418	#endif
   419				kvm_riscv_vcpu_nested_timer_start(vcpu, tmp64);
   420				break;
   421	#ifdef CONFIG_32BIT
   422			case CSR_VSTIMECMPH:
   423				tmp64 = kvm_riscv_vcpu_nested_timer_cycles(vcpu);
   424				tmp64 &= ~0xffffffff00000000ULL;
   425				tmp64 |= ((u64)tmpcsr) << 32;
   426				kvm_riscv_vcpu_nested_timer_start(vcpu, tmp64);
   427				break;
   428	#endif
   429			case CSR_HTIMEDELTA:
   430				if (riscv_isa_extension_available(vcpu->arch.isa, SSTC))
   431					kvm_riscv_vcpu_nested_timer_restart(vcpu);
   432				break;
   433	#ifdef CONFIG_32BIT
   434			case CSR_HTIMEDELTAH:
   435				if (riscv_isa_extension_available(vcpu->arch.isa, SSTC))
 > 436					kvm_riscv_vcpu_timer_vs_restart(vcpu);
   437				break;
   438	#endif
   439			default:
   440				break;
   441			}
   442		}
   443	
   444		if (nuke_swtlb)
   445			kvm_riscv_vcpu_nested_swtlb_gvma_flush(vcpu, 0, 0, 0);
   446	
   447		return KVM_INSN_CONTINUE_NEXT_SEPC;
   448	}
   449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
