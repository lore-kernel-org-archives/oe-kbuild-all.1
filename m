Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699980;
	b=Q8EAbq9iEB+tWtxZD6rpUkmRo7zmq3eGrLLSR+kaQjSGJXSxe59wxudK7Nr3qSyf4T0/
	 wC/BjiMrWkBW7dse3FT2746qPCcO+scj9aqJHjtqLLrNLFzTKzKC5at3/NucA66KRoprq
	 erW+eLqX6qTs0rCcNFHrOsPetRKYCYJPT4+C8VyQc74tmQvtISZ9omlEaaFm+K1SgBF2z
	 0cLsOLETermu7Gfe8Wr3siukmNo5xVl09xxPF7S4sAxdjeob9QQ3kszw1yXhkaC3oDKrL
	 yRfumK4tVzSE7KkYUJN8nAoxMhipDy15+/BYPnejLCCjJmGie8lZ63PvPTDKRO0z+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699980;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GNLMUzB6zTS7hPdFSS3LKd+hyAih6/J2fzEU83dR3vE=;
	b=VxFQ8wuvGzgLEge8bVLw/TF8BlywKJdVEz5h3mH7pv8g8Gn2xeoYYzAPBFyYU+7/LJ4+
	 8j/Ob+UBFmjWsKHauS3DGwAdFJH1GansZoywTBH8RfkAaT854L4XjLciEE865RlnSzZsc
	 oMCZ9QEC0Q7Scjje1KuhwrH8hZYPMGmsTAXPz/0IVaV/jd9YXAS9kjaXB+Ky3I+ExyoHq
	 IgRf3V2lg3wXoBAiBhgauA6K701imUmn8jKxF/2hn3UmYrfHm7UD5OF3FSXczlIiVwP6Y
	 fgpePhXWs0M/nzsv2u9Yfs7bAnmMqps+xYzY46rN18KFXmXMIn3NpPWvKGrkeTiU8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n59jSHqQ;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F896606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 13:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F896606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n59jSHqQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795699980; x=1827235980;
  h=date:from:to:cc:subject:message-id;
  bh=wQoJjEA7ZvhUc6AbQRUUiHT6QIjnyU7WlpFgscjuebY=;
  b=n59jSHqQhT58tBo2QZQZ09E3xbtxCdE0EU056FFUXo1DsKU3K+z9WpSY
   n8bbrAOAUTpIUDvJj9Yk6I3jBc1hKcrPcytUfl7HHVdeDWE+oxpswOmRL
   ryQCQwJFlfgXPH0eW1W8wWDwHe4jB/6b/0y8D/uLSqA8yao8eczbtl3nW
   3hOO1HRmiHIw9l2ZwXgzJ8zGE8cwyMiuwKlKNXSj4l5YS4FlO08+8F08p
   vypoN/6q0ILtMpmTPsXi6ZcyiuWa2CmSCFCcUpbSSCgz0qQ9Y5qyxIF8q
   zRtsX5wYXSIpJ6ukZGbYV54qJNgf4l8T95nhVLZ7VdGUOrGorqw90gH6Z
   Q==;
X-CSE-ConnectionGUID: aYuQQqVGQ3uMEARWjuLuPg==
X-CSE-MsgGUID: i0GJBzAwTa6ibkf7l5K/Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4679810"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4679810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:33:00 -0800
X-CSE-ConnectionGUID: P175iGG2SlamW+xkDGX2vQ==
X-CSE-MsgGUID: XCifXrH8Siu5EYgDvsyLnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12088263"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2026 05:32:59 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWZap-0000000004M-1IwR;
	Thu, 26 Nov 2026 13:32:55 +0000
Date: Thu, 26 Nov 2026 14:31:55 +0100
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, Cong Wang <cwang@multikernel.io>
Subject: [congwang:riscv-vector-discard 1/5]
 arch/riscv/kvm/vcpu.c:825:3: error: implicit declaration of function
 'kvm_riscv_vector_restore'; did you mean 'kvm_riscv_vcpu_timer_restore'?
Message-ID: <20261126142427.nhAJg6U1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/congwang/linux.git riscv-vector-discard
head:   82089161ab902778cdd13a9cd126871c69aa4e87
commit: b1ea6b7e02031d2767b5871f3fc669ee61975cf2 [1/5] riscv: vector: refactor vector context operations
config: riscv-randconfig-2000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126142427.nhAJg6U1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126142427.nhAJg6U1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126142427.nhAJg6U1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/vcpu.c: In function 'kvm_riscv_vcpu_enter_exit':
>> arch/riscv/kvm/vcpu.c:825:3: error: implicit declaration of function 'kvm_riscv_vector_restore'; did you mean 'kvm_riscv_vcpu_timer_restore'? [-Werror=implicit-function-declaration]
     825 |   kvm_riscv_vector_restore(gcntx);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
         |   kvm_riscv_vcpu_timer_restore
   cc1: some warnings being treated as errors


vim +825 arch/riscv/kvm/vcpu.c

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
