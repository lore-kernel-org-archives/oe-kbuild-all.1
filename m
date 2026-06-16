Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825693D45CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633447; cv=none; b=oMazNgFw5h5UC2prc0WnK4sMfJ4Kq5n8XhXObm7jOFIVbHqrCSfoyJXD7/jG+rTM/OJY++zAzw1fnOdeJbAFDnOjBS75p6V4csKGcSt/eRmzV3UNWNUyCFLkaisljtu/MsWwT9pne1YpBQ0tD1PVOPdtVZPGQRgxD0Fx9SLIIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633447; c=relaxed/simple;
	bh=WLhylBI7iBEBoDXp5oXrIMNoYusbO2uqRdlItSpgQOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GHUZCx8u8BxVeKIcNgJwUP6uZ2I6MQR0bOUtVRBe991Q8mWFi8RmyXswsAxzLE3G9PhAklK/wAs9aDBoaM8DNyVdxpZ/R0OkrVsUC9hwDUpMMrTD0buc1OG22lC0GqdAjfuJFTNzNAISZTDfPaJshUmPo6EeCToLrRsL1yXhReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DugjDi9i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DugjDi9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781633444; x=1813169444;
  h=date:from:to:cc:subject:message-id;
  bh=WLhylBI7iBEBoDXp5oXrIMNoYusbO2uqRdlItSpgQOM=;
  b=DugjDi9iIenlP3xponhht3E0LibemZwqxRQ5ARnwd7KENN4L75y9Dxfy
   QaDs/CKcqBPFoNHebVXTapf1Bs8NPoaqPDXs0PZekqlo3y1Y53lgz4QJQ
   9SnxqPFpiVQVZw5oeqBfSZBVXtpleUKSUkCGnNz0YG+cbtQvuPSDJm/Vo
   jPTDHP21IsQW2FHEVP7z2p36OBHvkU91t7Hb02ceoaHCNzoywbbzRzrmp
   c5li8XnibHjuNvfIhNokd2vgi9KMdHGhF5az5VW5GqNcZdOAwkgAl2uH2
   J8BkYHYHSpCHF25Au53XY9cAZpuTd1kdqsDX45K+RKZ09mlQsxKyfTunl
   Q==;
X-CSE-ConnectionGUID: zOrNaKIjT9i4Bz9Ak91wzg==
X-CSE-MsgGUID: z4X2jUAmTkW/lYGpewC03Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="105082451"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="105082451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 11:10:44 -0700
X-CSE-ConnectionGUID: gYm2QiNTSD+jiSRuXtyyMA==
X-CSE-MsgGUID: rl4b4Gq+TRavo7zkesJLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="278050086"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2026 11:10:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZYFC-00000000Tbq-3f4B;
	Tue, 16 Jun 2026 18:10:38 +0000
Date: Wed, 17 Jun 2026 02:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv3 37/37]
 arch/arm64/kvm/sys_regs.c:222:50: error: expected ';' before ':' token
Message-ID: <202606170206.EV8DFnS1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv3
head:   aa9a6e84f564417704258a20210b95d18ebf5601
commit: aa9a6e84f564417704258a20210b95d18ebf5601 [37/37] WIP
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260617/202606170206.EV8DFnS1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170206.EV8DFnS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170206.EV8DFnS1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'locate_register':
>> arch/arm64/kvm/sys_regs.c:222:50: error: expected ';' before ':' token
     222 |                         loc->loc = SR_LOC_SPECIAL : SR_LOC_MEMORY;
         |                                                  ^~
         |                                                  ;


vim +222 arch/arm64/kvm/sys_regs.c

   168	
   169	#define MAPPED_EL2_SYSREG(r, m, t)					\
   170		case r:	{							\
   171			locate_mapped_el2_register(vcpu, r, m, t, loc);		\
   172			break;							\
   173		}
   174	
   175	static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
   176				    struct sr_loc *loc)
   177	{
   178		if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU)) {
   179			loc->loc = SR_LOC_MEMORY;
   180			return;
   181		}
   182	
   183		switch (reg) {
   184			MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
   185					  translate_sctlr_el2_to_sctlr_el1	     );
   186			MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
   187					  translate_ttbr0_el2_to_ttbr0_el1	     );
   188			MAPPED_EL2_SYSREG(TTBR1_EL2,   TTBR1_EL1,   NULL	     );
   189			MAPPED_EL2_SYSREG(TCR_EL2,     TCR_EL1,
   190					  translate_tcr_el2_to_tcr_el1		     );
   191			MAPPED_EL2_SYSREG(VBAR_EL2,    VBAR_EL1,    NULL	     );
   192			MAPPED_EL2_SYSREG(AFSR0_EL2,   AFSR0_EL1,   NULL	     );
   193			MAPPED_EL2_SYSREG(AFSR1_EL2,   AFSR1_EL1,   NULL	     );
   194			MAPPED_EL2_SYSREG(ESR_EL2,     ESR_EL1,     NULL	     );
   195			MAPPED_EL2_SYSREG(FAR_EL2,     FAR_EL1,     NULL	     );
   196			MAPPED_EL2_SYSREG(MAIR_EL2,    MAIR_EL1,    NULL	     );
   197			MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
   198			MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
   199			MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
   200			MAPPED_EL2_SYSREG(POR_EL2,     POR_EL1,     NULL	     );
   201			MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
   202			MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
   203			MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
   204			MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
   205			MAPPED_EL2_SYSREG(SCTLR2_EL2,  SCTLR2_EL1,  NULL	     );
   206		case CNTHCTL_EL2:
   207			/* CNTHCTL_EL2 is super special, unless we support NV2p1 */
   208			loc->loc = (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu) ?
   209				    SR_LOC_SPECIAL : SR_LOC_MEMORY);
   210			break;
   211		case CPTR_EL2:
   212			/*
   213			 * CPTR_EL2 is just as special, and needs a certain amount
   214			 * of handholding. It always lives in memory, due to being
   215			 * heavily trapped thanks to CPACR_EL1.TCPAC being RES0.
   216			 * FEAT_NV2p1 fixes this.
   217			 */
   218			locate_mapped_el2_register(vcpu, CPTR_EL2, CPACR_EL1,
   219						   translate_cptr_el2_to_cpacr_el1,
   220						   loc);
   221			if (is_hyp_ctxt(vcpu))
 > 222				loc->loc = SR_LOC_SPECIAL : SR_LOC_MEMORY;
   223			break;
   224		default:
   225			loc->loc = locate_direct_register(vcpu, reg);
   226		}
   227	}
   228	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
