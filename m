Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B329408
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791419297; cv=none; b=n3biqGw0WE9VCUr1oQnjsWPUXXh/Ah/QaRF6Z0EQAw6KJm8NCrZD4+CBqQzQ60u6gZAJq1aznMI1M4R3HJ//66R/bRS4bu8hSItD/hzNCpAN70HxiUdFqfSgel0qvrOZAi+cScOECY2p7UiQBRVlE+UvdflvgjFBTe2w+qefFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791419297; c=relaxed/simple;
	bh=cDScBxxSyUKX+NXdUlEgtAAhe8YqsSrTsG0CUqyNG3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nkkCVFN752RbhibpsE0UHzb1dLK6hz9iFkEmhYp+upbo8NukCfeBxDBeZNSnM7AYbdbMz72kV11oJmjdxT9zwuGwt72OQQE+sJGrGsloPevBtbzx8Dqly46VEhhAvTFmE8kMv3gcT7pWt95wueWC5C6Ur0+E+/5m1ISk00Eo6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn1/9FU9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn1/9FU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791419296; x=1822955296;
  h=date:from:to:cc:subject:message-id;
  bh=cDScBxxSyUKX+NXdUlEgtAAhe8YqsSrTsG0CUqyNG3w=;
  b=hn1/9FU9cl78TT+2K+P9Oqr/lh2umzt9alZ4mCc7aPG5dHbKSOblMaiq
   d8jRJomvYFqTvdWqmTrt1XyNfhOCPcP4b0atOVCBxWo1HQJLjz4Or+CZw
   sMG4IXdaDWoOL9AVGczf6nZ5TUrFxh7ifgndErZOj5wK8tydN2GzEG3Sl
   uvP/kCJ8s79T6WBEVZHPgCMCXhLIq7+6RtOFM9m14XWLnDuJ9PngW2Bdm
   MbHnPunJg6F3FWPT7mRmFrxoJF9RHc/xQSOTc1cRAJUu5aezsem9NXms9
   9WaRXSZYP6yv9CF1XCvZ9jR5yMLQPV+nAJVvmRn8NOGjb3De48SVWHERU
   A==;
X-CSE-ConnectionGUID: JHLchCw6T+qvwyMNo7yvIA==
X-CSE-MsgGUID: BJQU23RGSMmaQUGh4lTxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="78514"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="78514"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 17:28:15 -0700
X-CSE-ConnectionGUID: ywTzUEg8QmyY52iWycRfBw==
X-CSE-MsgGUID: KrhHxwWpTKSnsOej3Jly5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1685709"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 07 Oct 2026 17:28:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEbzW-000000003lc-0Mho;
	Thu, 08 Oct 2026 00:28:10 +0000
Date: Thu, 08 Oct 2026 08:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [pjw-riscv:temp-testing 20/24] arch/riscv/kvm/vcpu.c:825:17:
 error: implicit declaration of function 'kvm_riscv_vector_restore'; did you
 mean 'kvm_riscv_vcpu_timer_restore'?
Message-ID: <202610080810.lybQ7p9g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git temp-testing
head:   1a5c75ee3d09a160e58bb01950cbd4a8cf66a409
commit: 1b4a3e814c3249d78ec44f09294fd6535621f480 [20/24] riscv: vector: refactor vector context operations
config: riscv-randconfig-1000-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080810.lybQ7p9g-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080810.lybQ7p9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080810.lybQ7p9g-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/vcpu.c: In function 'kvm_arch_vcpu_load':
   arch/riscv/kvm/vcpu.c:649:9: error: implicit declaration of function 'get_cpu_vector_context' [-Werror=implicit-function-declaration]
     649 |         get_cpu_vector_context();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu.c:653:9: error: implicit declaration of function 'put_cpu_vector_context' [-Werror=implicit-function-declaration]
     653 |         put_cpu_vector_context();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/vcpu.c: In function 'kvm_riscv_vcpu_enter_exit':
>> arch/riscv/kvm/vcpu.c:825:17: error: implicit declaration of function 'kvm_riscv_vector_restore'; did you mean 'kvm_riscv_vcpu_timer_restore'? [-Werror=implicit-function-declaration]
     825 |                 kvm_riscv_vector_restore(gcntx);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_riscv_vcpu_timer_restore
   cc1: some warnings being treated as errors


vim +825 arch/riscv/kvm/vcpu.c

   587	
   588	void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
   589	{
   590		void *nsh;
   591		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   592	
   593		/*
   594		 * If VCPU is being reloaded on the same physical CPU and no
   595		 * other KVM VCPU has run on this CPU since it was last put,
   596		 * we can skip the expensive CSR and HGATP writes.
   597		 *
   598		 * Note: If a new CSR is added to this fast-path skip block,
   599		 * make sure that 'csr_dirty' is set to true in any
   600		 * ioctl (e.g., KVM_SET_ONE_REG) that modifies it.
   601		 */
   602		if (vcpu != __this_cpu_read(kvm_former_vcpu))
   603			__this_cpu_write(kvm_former_vcpu, vcpu);
   604		else if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)
   605			goto csr_restore_done;
   606	
   607		vcpu->arch.csr_dirty = false;
   608	
   609		/*
   610		 * Load VCPU config CSRs before other CSRs because
   611		 * the read/write behaviour of certain CSRs change
   612		 * based on VCPU config CSRs.
   613		 */
   614		kvm_riscv_vcpu_config_load(vcpu);
   615	
   616		if (kvm_riscv_nacl_sync_csr_available()) {
   617			nsh = nacl_shmem();
   618			nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
   619			nacl_csr_write(nsh, CSR_VSIE, csr->vsie);
   620			nacl_csr_write(nsh, CSR_VSTVEC, csr->vstvec);
   621			nacl_csr_write(nsh, CSR_VSSCRATCH, csr->vsscratch);
   622			nacl_csr_write(nsh, CSR_VSEPC, csr->vsepc);
   623			nacl_csr_write(nsh, CSR_VSCAUSE, csr->vscause);
   624			nacl_csr_write(nsh, CSR_VSTVAL, csr->vstval);
   625			nacl_csr_write(nsh, CSR_HVIP, csr->hvip);
   626			nacl_csr_write(nsh, CSR_VSATP, csr->vsatp);
   627		} else {
   628			csr_write(CSR_VSSTATUS, csr->vsstatus);
   629			csr_write(CSR_VSIE, csr->vsie);
   630			csr_write(CSR_VSTVEC, csr->vstvec);
   631			csr_write(CSR_VSSCRATCH, csr->vsscratch);
   632			csr_write(CSR_VSEPC, csr->vsepc);
   633			csr_write(CSR_VSCAUSE, csr->vscause);
   634			csr_write(CSR_VSTVAL, csr->vstval);
   635			csr_write(CSR_HVIP, csr->hvip);
   636			csr_write(CSR_VSATP, csr->vsatp);
   637		}
   638	
   639		kvm_riscv_mmu_update_hgatp(vcpu);
   640	
   641		kvm_riscv_vcpu_aia_load(vcpu, cpu);
   642	
   643	csr_restore_done:
   644		kvm_riscv_vcpu_timer_restore(vcpu);
   645	
   646		kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
   647		kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
   648						vcpu->arch.isa);
 > 649		get_cpu_vector_context();
   650		kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
   651		kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
   652						    vcpu->arch.isa);
   653		put_cpu_vector_context();
   654	
   655		kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
   656	
   657		vcpu->cpu = cpu;
   658	}
   659	
   660	void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
   661	{
   662		void *nsh;
   663		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   664	
   665		vcpu->cpu = -1;
   666	
   667		kvm_riscv_vcpu_aia_put(vcpu);
   668	
   669		kvm_riscv_vcpu_guest_fp_save(&vcpu->arch.guest_context,
   670					     vcpu->arch.isa);
   671		kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
   672	
   673		kvm_riscv_vcpu_timer_save(vcpu);
   674		get_cpu_vector_context();
   675		kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
   676						 vcpu->arch.isa);
   677		kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
   678		put_cpu_vector_context();
   679	
   680		if (kvm_riscv_nacl_available()) {
   681			nsh = nacl_shmem();
   682			csr->vsstatus = nacl_csr_read(nsh, CSR_VSSTATUS);
   683			csr->vsie = nacl_csr_read(nsh, CSR_VSIE);
   684			csr->vstvec = nacl_csr_read(nsh, CSR_VSTVEC);
   685			csr->vsscratch = nacl_csr_read(nsh, CSR_VSSCRATCH);
   686			csr->vsepc = nacl_csr_read(nsh, CSR_VSEPC);
   687			csr->vscause = nacl_csr_read(nsh, CSR_VSCAUSE);
   688			csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
   689			csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
   690			csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
   691		} else {
   692			csr->vsstatus = csr_read(CSR_VSSTATUS);
   693			csr->vsie = csr_read(CSR_VSIE);
   694			csr->vstvec = csr_read(CSR_VSTVEC);
   695			csr->vsscratch = csr_read(CSR_VSSCRATCH);
   696			csr->vsepc = csr_read(CSR_VSEPC);
   697			csr->vscause = csr_read(CSR_VSCAUSE);
   698			csr->vstval = csr_read(CSR_VSTVAL);
   699			csr->hvip = csr_read(CSR_HVIP);
   700			csr->vsatp = csr_read(CSR_VSATP);
   701		}
   702	}
   703	
   704	/**
   705	 * kvm_riscv_check_vcpu_requests - check and handle pending vCPU requests
   706	 * @vcpu:	the VCPU pointer
   707	 *
   708	 * Return: 1 if we should enter the guest
   709	 *	    0 if we should exit to userspace
   710	 */
   711	static int kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
   712	{
   713		struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
   714	
   715		if (kvm_request_pending(vcpu)) {
   716			if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
   717				kvm_vcpu_srcu_read_unlock(vcpu);
   718				rcuwait_wait_event(wait,
   719					(!kvm_riscv_vcpu_stopped(vcpu)) && (!vcpu->arch.pause),
   720					TASK_INTERRUPTIBLE);
   721				kvm_vcpu_srcu_read_lock(vcpu);
   722	
   723				if (kvm_riscv_vcpu_stopped(vcpu) || vcpu->arch.pause) {
   724					/*
   725					 * Awaken to handle a signal, request to
   726					 * sleep again later.
   727					 */
   728					kvm_make_request(KVM_REQ_SLEEP, vcpu);
   729				}
   730			}
   731	
   732			if (kvm_check_request(KVM_REQ_VCPU_RESET, vcpu))
   733				kvm_riscv_reset_vcpu(vcpu, true);
   734	
   735			if (kvm_check_request(KVM_REQ_UPDATE_HGATP, vcpu))
   736				kvm_riscv_mmu_update_hgatp(vcpu);
   737	
   738			if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
   739				kvm_riscv_fence_i_process(vcpu);
   740	
   741			if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
   742				kvm_riscv_tlb_flush_process(vcpu);
   743	
   744			if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
   745				kvm_riscv_hfence_vvma_all_process(vcpu);
   746	
   747			if (kvm_check_request(KVM_REQ_HFENCE, vcpu))
   748				kvm_riscv_hfence_process(vcpu);
   749	
   750			if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
   751				kvm_riscv_vcpu_record_steal_time(vcpu);
   752	
   753			if (kvm_dirty_ring_check_request(vcpu))
   754				return 0;
   755		}
   756	
   757		return 1;
   758	}
   759	
   760	static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
   761	{
   762		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   763	
   764		ncsr_write(CSR_HVIP, csr->hvip);
   765		kvm_riscv_vcpu_aia_update_hvip(vcpu);
   766	}
   767	
   768	static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
   769	{
   770		struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
   771		struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
   772		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   773	
   774		vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
   775		vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
   776		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
   777			vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
   778		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
   779			csr_write(CSR_SSP, zicficsr->ssp);
   780	}
   781	
   782	static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
   783	{
   784		struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
   785		struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
   786		struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
   787	
   788		csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
   789		csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
   790		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
   791			smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
   792		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
   793			zicficsr->ssp = csr_swap(CSR_SSP, 0);
   794	}
   795	
   796	/*
   797	 * Actually run the vCPU, entering an RCU extended quiescent state (EQS) while
   798	 * the vCPU is running.
   799	 *
   800	 * This must be noinstr as instrumentation may make use of RCU, and this is not
   801	 * safe during the EQS.
   802	 */
   803	static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
   804						      struct kvm_cpu_trap *trap)
   805	{
   806		void *nsh;
   807		struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
   808		struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
   809	
   810		/*
   811		 * We save trap CSRs (such as SEPC, SCAUSE, STVAL, HTVAL, and
   812		 * HTINST) here because we do local_irq_enable() after this
   813		 * function in kvm_arch_vcpu_ioctl_run() which can result in
   814		 * an interrupt immediately after local_irq_enable() and can
   815		 * potentially change trap CSRs.
   816		 */
   817	
   818		kvm_riscv_vcpu_swap_in_guest_state(vcpu);
   819		guest_state_enter_irqoff();
   820	
   821		/* sstatus.VS != SR_VS_OFF is guaranteed when NEED_RESTORE is set */
   822		if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
   823			current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
   824			current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
 > 825			kvm_riscv_vector_restore(gcntx);
   826			gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
   827		}
   828	
   829		if (kvm_riscv_nacl_sync_sret_available()) {
   830			nsh = nacl_shmem();
   831	
   832			if (kvm_riscv_nacl_autoswap_csr_available()) {
   833				hcntx->hstatus =
   834					nacl_csr_read(nsh, CSR_HSTATUS);
   835				nacl_scratch_write_long(nsh,
   836							SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   837							SBI_NACL_SHMEM_AUTOSWAP_HSTATUS,
   838							gcntx->hstatus);
   839				nacl_scratch_write_long(nsh,
   840							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   841							SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS);
   842			} else if (kvm_riscv_nacl_sync_csr_available()) {
   843				hcntx->hstatus = nacl_csr_swap(nsh,
   844							       CSR_HSTATUS, gcntx->hstatus);
   845			} else {
   846				hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   847			}
   848	
   849			nacl_scratch_write_longs(nsh,
   850						 SBI_NACL_SHMEM_SRET_OFFSET +
   851						 SBI_NACL_SHMEM_SRET_X(1),
   852						 &gcntx->ra,
   853						 SBI_NACL_SHMEM_SRET_X_LAST);
   854	
   855			__kvm_riscv_nacl_switch_to(&vcpu->arch, SBI_EXT_NACL,
   856						   SBI_EXT_NACL_SYNC_SRET);
   857	
   858			if (kvm_riscv_nacl_autoswap_csr_available()) {
   859				nacl_scratch_write_long(nsh,
   860							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   861							0);
   862				gcntx->hstatus = nacl_scratch_read_long(nsh,
   863									SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   864									SBI_NACL_SHMEM_AUTOSWAP_HSTATUS);
   865			} else {
   866				gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   867			}
   868	
   869			trap->htval = nacl_csr_read(nsh, CSR_HTVAL);
   870			trap->htinst = nacl_csr_read(nsh, CSR_HTINST);
   871		} else {
   872			hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   873	
   874			__kvm_riscv_switch_to(&vcpu->arch);
   875	
   876			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   877	
   878			trap->htval = csr_read(CSR_HTVAL);
   879			trap->htinst = csr_read(CSR_HTINST);
   880		}
   881	
   882		trap->sepc = gcntx->sepc;
   883		trap->scause = csr_read(CSR_SCAUSE);
   884		trap->stval = csr_read(CSR_STVAL);
   885	
   886		vcpu->arch.last_exit_cpu = vcpu->cpu;
   887		guest_state_exit_irqoff();
   888		kvm_riscv_vcpu_swap_in_host_state(vcpu);
   889	}
   890	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
