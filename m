Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024B282F0E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 05:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031464; cv=none; b=P0OF6/DABvDDqN+EF5TVuKnQaUNepGCwUDTyGIPbgdHkuAtK7eQNa4qAJcVVytzzo7bMGDbntOC17z4Ys2RCSxF7CFdCQVIA4ORkzRI+whaUTfQ0JML/iKSwrsXn9SBSNAkbXS2DmSlE3z6DjBQbdPrDdgK7cLtR5d7URVPxEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031464; c=relaxed/simple;
	bh=jIDcOJFUDrDXvvwAzXpnZcpNc5mJUXUpZM98fEuBo5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L+V6c4k8B2b4CThXN9we38oLwIo25SgWXOZ9lO7bXHpi4PFjO3y0AGJ9q1mo/dGryn0ZJCM99vKl/OX9VMjIOjAS+IFJGckytabZqQmiVykherklp3vuDWWa55VWWLi3cNTI6CVBip+iIGzQhV7OUzSTQkhAwHpACl/UcFLvZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HunAzJnT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HunAzJnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787031463; x=1818567463;
  h=date:from:to:cc:subject:message-id;
  bh=jIDcOJFUDrDXvvwAzXpnZcpNc5mJUXUpZM98fEuBo5Q=;
  b=HunAzJnT61h6d5iSusHBjIfeHeoKdi59cLCt0lSYBQbk50gah7yD4X64
   Xm4IGpcsBvoiaLENmDeDh0P83kCL9etsBTHu1iDorplr59Dj0yC7qJFaV
   6zf+PyKyGBwqI62+TNH5ig6LKZo7Y7pBshHjKHEUgS1XphP55Lt+g2CBV
   8Y5RhjL4eK69/KmyX9g0RgoHwuMicWM4ru5dp5HGgbHIjEOkee45tZ0i2
   LFSN/NQ/xI/d/qIAyjnF0OsmY0ir01nz6j7+f24kNqzD219Lk0jGwAYJ7
   FTokZ9GLuibT18tXNQ3YQ+JigjxsILlf9yRdoTaF+VkDJTBrJnVaT/321
   w==;
X-CSE-ConnectionGUID: OoViE2c+Tn65ZgzP/8Czcw==
X-CSE-MsgGUID: VsjHZR59QxSf6O/h4MI3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87427453"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87427453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 22:37:42 -0700
X-CSE-ConnectionGUID: qyHaXlf4RB+Yx/UjHEpkbg==
X-CSE-MsgGUID: CZ7TbrKdRSG2jjgocLJI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270337105"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2026 22:37:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwCW1-00000000e8g-1doh;
	Tue, 18 Aug 2026 05:37:37 +0000
Date: Tue, 18 Aug 2026 13:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Subject: [linux-next:master 14569/15982] arch/riscv/kvm/vcpu.c:650:2:
 error: call to undeclared function 'get_cpu_vector_context'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202608181349.HPGbyxoo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650 [14569/15982] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
config: riscv-randconfig-r071-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181349.HPGbyxoo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181349.HPGbyxoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181349.HPGbyxoo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu.c:650:2: error: call to undeclared function 'get_cpu_vector_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     650 |         get_cpu_vector_context();
         |         ^
>> arch/riscv/kvm/vcpu.c:654:2: error: call to undeclared function 'put_cpu_vector_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     654 |         put_cpu_vector_context();
         |         ^
   arch/riscv/kvm/vcpu.c:675:2: error: call to undeclared function 'get_cpu_vector_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     675 |         get_cpu_vector_context();
         |         ^
   arch/riscv/kvm/vcpu.c:679:2: error: call to undeclared function 'put_cpu_vector_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     679 |         put_cpu_vector_context();
         |         ^
>> arch/riscv/kvm/vcpu.c:826:3: error: call to undeclared function '__kvm_riscv_vector_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     826 |                 __kvm_riscv_vector_restore(gcntx);
         |                 ^
   5 errors generated.


vim +/get_cpu_vector_context +650 arch/riscv/kvm/vcpu.c

   588	
   589	void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
   590	{
   591		void *nsh;
   592		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   593	
   594		/*
   595		 * If VCPU is being reloaded on the same physical CPU and no
   596		 * other KVM VCPU has run on this CPU since it was last put,
   597		 * we can skip the expensive CSR and HGATP writes.
   598		 *
   599		 * Note: If a new CSR is added to this fast-path skip block,
   600		 * make sure that 'csr_dirty' is set to true in any
   601		 * ioctl (e.g., KVM_SET_ONE_REG) that modifies it.
   602		 */
   603		if (vcpu != __this_cpu_read(kvm_former_vcpu))
   604			__this_cpu_write(kvm_former_vcpu, vcpu);
   605		else if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)
   606			goto csr_restore_done;
   607	
   608		vcpu->arch.csr_dirty = false;
   609	
   610		/*
   611		 * Load VCPU config CSRs before other CSRs because
   612		 * the read/write behaviour of certain CSRs change
   613		 * based on VCPU config CSRs.
   614		 */
   615		kvm_riscv_vcpu_config_load(vcpu);
   616	
   617		if (kvm_riscv_nacl_sync_csr_available()) {
   618			nsh = nacl_shmem();
   619			nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
   620			nacl_csr_write(nsh, CSR_VSIE, csr->vsie);
   621			nacl_csr_write(nsh, CSR_VSTVEC, csr->vstvec);
   622			nacl_csr_write(nsh, CSR_VSSCRATCH, csr->vsscratch);
   623			nacl_csr_write(nsh, CSR_VSEPC, csr->vsepc);
   624			nacl_csr_write(nsh, CSR_VSCAUSE, csr->vscause);
   625			nacl_csr_write(nsh, CSR_VSTVAL, csr->vstval);
   626			nacl_csr_write(nsh, CSR_HVIP, csr->hvip);
   627			nacl_csr_write(nsh, CSR_VSATP, csr->vsatp);
   628		} else {
   629			csr_write(CSR_VSSTATUS, csr->vsstatus);
   630			csr_write(CSR_VSIE, csr->vsie);
   631			csr_write(CSR_VSTVEC, csr->vstvec);
   632			csr_write(CSR_VSSCRATCH, csr->vsscratch);
   633			csr_write(CSR_VSEPC, csr->vsepc);
   634			csr_write(CSR_VSCAUSE, csr->vscause);
   635			csr_write(CSR_VSTVAL, csr->vstval);
   636			csr_write(CSR_HVIP, csr->hvip);
   637			csr_write(CSR_VSATP, csr->vsatp);
   638		}
   639	
   640		kvm_riscv_mmu_update_hgatp(vcpu);
   641	
   642		kvm_riscv_vcpu_aia_load(vcpu, cpu);
   643	
   644	csr_restore_done:
   645		kvm_riscv_vcpu_timer_restore(vcpu);
   646	
   647		kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
   648		kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
   649						vcpu->arch.isa);
 > 650		get_cpu_vector_context();
   651		kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
   652		kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
   653						    vcpu->arch.isa);
 > 654		put_cpu_vector_context();
   655	
   656		kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
   657	
   658		vcpu->cpu = cpu;
   659	}
   660	
   661	void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
   662	{
   663		void *nsh;
   664		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   665	
   666		vcpu->cpu = -1;
   667	
   668		kvm_riscv_vcpu_aia_put(vcpu);
   669	
   670		kvm_riscv_vcpu_guest_fp_save(&vcpu->arch.guest_context,
   671					     vcpu->arch.isa);
   672		kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
   673	
   674		kvm_riscv_vcpu_timer_save(vcpu);
   675		get_cpu_vector_context();
   676		kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
   677						 vcpu->arch.isa);
   678		kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
   679		put_cpu_vector_context();
   680	
   681		if (kvm_riscv_nacl_available()) {
   682			nsh = nacl_shmem();
   683			csr->vsstatus = nacl_csr_read(nsh, CSR_VSSTATUS);
   684			csr->vsie = nacl_csr_read(nsh, CSR_VSIE);
   685			csr->vstvec = nacl_csr_read(nsh, CSR_VSTVEC);
   686			csr->vsscratch = nacl_csr_read(nsh, CSR_VSSCRATCH);
   687			csr->vsepc = nacl_csr_read(nsh, CSR_VSEPC);
   688			csr->vscause = nacl_csr_read(nsh, CSR_VSCAUSE);
   689			csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
   690			csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
   691			csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
   692		} else {
   693			csr->vsstatus = csr_read(CSR_VSSTATUS);
   694			csr->vsie = csr_read(CSR_VSIE);
   695			csr->vstvec = csr_read(CSR_VSTVEC);
   696			csr->vsscratch = csr_read(CSR_VSSCRATCH);
   697			csr->vsepc = csr_read(CSR_VSEPC);
   698			csr->vscause = csr_read(CSR_VSCAUSE);
   699			csr->vstval = csr_read(CSR_VSTVAL);
   700			csr->hvip = csr_read(CSR_HVIP);
   701			csr->vsatp = csr_read(CSR_VSATP);
   702		}
   703	}
   704	
   705	/**
   706	 * kvm_riscv_check_vcpu_requests - check and handle pending vCPU requests
   707	 * @vcpu:	the VCPU pointer
   708	 *
   709	 * Return: 1 if we should enter the guest
   710	 *	    0 if we should exit to userspace
   711	 */
   712	static int kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
   713	{
   714		struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
   715	
   716		if (kvm_request_pending(vcpu)) {
   717			if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
   718				kvm_vcpu_srcu_read_unlock(vcpu);
   719				rcuwait_wait_event(wait,
   720					(!kvm_riscv_vcpu_stopped(vcpu)) && (!vcpu->arch.pause),
   721					TASK_INTERRUPTIBLE);
   722				kvm_vcpu_srcu_read_lock(vcpu);
   723	
   724				if (kvm_riscv_vcpu_stopped(vcpu) || vcpu->arch.pause) {
   725					/*
   726					 * Awaken to handle a signal, request to
   727					 * sleep again later.
   728					 */
   729					kvm_make_request(KVM_REQ_SLEEP, vcpu);
   730				}
   731			}
   732	
   733			if (kvm_check_request(KVM_REQ_VCPU_RESET, vcpu))
   734				kvm_riscv_reset_vcpu(vcpu, true);
   735	
   736			if (kvm_check_request(KVM_REQ_UPDATE_HGATP, vcpu))
   737				kvm_riscv_mmu_update_hgatp(vcpu);
   738	
   739			if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
   740				kvm_riscv_fence_i_process(vcpu);
   741	
   742			if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
   743				kvm_riscv_tlb_flush_process(vcpu);
   744	
   745			if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
   746				kvm_riscv_hfence_vvma_all_process(vcpu);
   747	
   748			if (kvm_check_request(KVM_REQ_HFENCE, vcpu))
   749				kvm_riscv_hfence_process(vcpu);
   750	
   751			if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
   752				kvm_riscv_vcpu_record_steal_time(vcpu);
   753	
   754			if (kvm_dirty_ring_check_request(vcpu))
   755				return 0;
   756		}
   757	
   758		return 1;
   759	}
   760	
   761	static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
   762	{
   763		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   764	
   765		ncsr_write(CSR_HVIP, csr->hvip);
   766		kvm_riscv_vcpu_aia_update_hvip(vcpu);
   767	}
   768	
   769	static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
   770	{
   771		struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
   772		struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
   773		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   774	
   775		vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
   776		vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
   777		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
   778			vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
   779		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
   780			csr_write(CSR_SSP, zicficsr->ssp);
   781	}
   782	
   783	static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
   784	{
   785		struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
   786		struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
   787		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   788	
   789		csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
   790		csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
   791		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
   792			smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
   793		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
   794			zicficsr->ssp = csr_swap(CSR_SSP, 0);
   795	}
   796	
   797	/*
   798	 * Actually run the vCPU, entering an RCU extended quiescent state (EQS) while
   799	 * the vCPU is running.
   800	 *
   801	 * This must be noinstr as instrumentation may make use of RCU, and this is not
   802	 * safe during the EQS.
   803	 */
   804	static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
   805						      struct kvm_cpu_trap *trap)
   806	{
   807		void *nsh;
   808		struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
   809		struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
   810	
   811		/*
   812		 * We save trap CSRs (such as SEPC, SCAUSE, STVAL, HTVAL, and
   813		 * HTINST) here because we do local_irq_enable() after this
   814		 * function in kvm_arch_vcpu_ioctl_run() which can result in
   815		 * an interrupt immediately after local_irq_enable() and can
   816		 * potentially change trap CSRs.
   817		 */
   818	
   819		kvm_riscv_vcpu_swap_in_guest_state(vcpu);
   820		guest_state_enter_irqoff();
   821	
   822		/* sstatus.VS != SR_VS_OFF is guaranteed when NEED_RESTORE is set */
   823		if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
   824			current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
   825			current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
 > 826			__kvm_riscv_vector_restore(gcntx);
   827			gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
   828		}
   829	
   830		if (kvm_riscv_nacl_sync_sret_available()) {
   831			nsh = nacl_shmem();
   832	
   833			if (kvm_riscv_nacl_autoswap_csr_available()) {
   834				hcntx->hstatus =
   835					nacl_csr_read(nsh, CSR_HSTATUS);
   836				nacl_scratch_write_long(nsh,
   837							SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   838							SBI_NACL_SHMEM_AUTOSWAP_HSTATUS,
   839							gcntx->hstatus);
   840				nacl_scratch_write_long(nsh,
   841							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   842							SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS);
   843			} else if (kvm_riscv_nacl_sync_csr_available()) {
   844				hcntx->hstatus = nacl_csr_swap(nsh,
   845							       CSR_HSTATUS, gcntx->hstatus);
   846			} else {
   847				hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   848			}
   849	
   850			nacl_scratch_write_longs(nsh,
   851						 SBI_NACL_SHMEM_SRET_OFFSET +
   852						 SBI_NACL_SHMEM_SRET_X(1),
   853						 &gcntx->ra,
   854						 SBI_NACL_SHMEM_SRET_X_LAST);
   855	
   856			__kvm_riscv_nacl_switch_to(&vcpu->arch, SBI_EXT_NACL,
   857						   SBI_EXT_NACL_SYNC_SRET);
   858	
   859			if (kvm_riscv_nacl_autoswap_csr_available()) {
   860				nacl_scratch_write_long(nsh,
   861							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   862							0);
   863				gcntx->hstatus = nacl_scratch_read_long(nsh,
   864									SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   865									SBI_NACL_SHMEM_AUTOSWAP_HSTATUS);
   866			} else {
   867				gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   868			}
   869	
   870			trap->htval = nacl_csr_read(nsh, CSR_HTVAL);
   871			trap->htinst = nacl_csr_read(nsh, CSR_HTINST);
   872		} else {
   873			hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   874	
   875			__kvm_riscv_switch_to(&vcpu->arch);
   876	
   877			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   878	
   879			trap->htval = csr_read(CSR_HTVAL);
   880			trap->htinst = csr_read(CSR_HTINST);
   881		}
   882	
   883		trap->sepc = gcntx->sepc;
   884		trap->scause = csr_read(CSR_SCAUSE);
   885		trap->stval = csr_read(CSR_STVAL);
   886	
   887		vcpu->arch.last_exit_cpu = vcpu->cpu;
   888		guest_state_exit_irqoff();
   889		kvm_riscv_vcpu_swap_in_host_state(vcpu);
   890	}
   891	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
