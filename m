Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A992E361642
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176029; cv=none; b=BKdnYU/BeIILAz+kgIa70aghd0l3Xa5cviETmWZOrgsL8mpWN2vK0u8AW/6z+wBjL/0tazxAwmAVaX+ufyOtcxN0HINMJMHjU/kOu6pN03AsFSn/3QR84mwbueW/mhsXaBpY8uP7lPnfcLMQQY9o8p7lJGgqs9Wb1tUV1T9VgNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176029; c=relaxed/simple;
	bh=eo76Er6bTqLB7IMGiMkCD0Mi+UoBpNmB1Nv+A7XLlBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OtHoWqoKEi1miPg268Adhm5qsUmlit4ArxzaFt1JG4jE7IM1bXWTDH7IVlkeyqar22tywRI6GWHmCKAcxgPaRX3SQMkHQTSRaT34G3pX9TJ0Cw2zGqLX4H/UxOe6eSNpfyAK+t+koGozHY9GhDI54CYKRJQHyj1IVDNscg1XmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4aIEDQB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4aIEDQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772176029; x=1803712029;
  h=date:from:to:cc:subject:message-id;
  bh=eo76Er6bTqLB7IMGiMkCD0Mi+UoBpNmB1Nv+A7XLlBA=;
  b=h4aIEDQBAfwMGrAV04xc+ha704JtM9g6KdFcZAqNLN7xz76YYVQgomnw
   UQNQv3zK0rd2lhVht49x8obKDJfE5TMZioGPKKTovl4CVhC1U5kM6pdmG
   QUKVqnZFqaI0U9LHOEJ66Fm2gIhl4Kq5Wg7Z1zY3+Nqs3pkhDlYODpQUN
   ev0K25O5icghOI7Xq1IM4+nmsYn2OwtFby3In245bJtEVHt/CLZ+6e6sI
   KNlFuMW183YzYK75TeAAV51yCZZBlbZxC7+IpcSK2BV88SCw6PuA4UAyz
   JQB0F/cZKgXo3N5EhiUvR582NNI1/7w2/DTw7ebyfbp4uGFE0mAqr1sQE
   Q==;
X-CSE-ConnectionGUID: E9wTslWPT6SVw5kFrkNtSA==
X-CSE-MsgGUID: X4VlwaLWTQWRBP5L+NTNTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73163606"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73163606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:07:08 -0800
X-CSE-ConnectionGUID: VY7IzdOKTBm9am+C5z/d3Q==
X-CSE-MsgGUID: iqIqtRF4RVWt4GzbIy7Y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="244246792"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Feb 2026 23:07:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvrwG-00000000AIj-2Bbe;
	Fri, 27 Feb 2026 07:07:04 +0000
Date: Fri, 27 Feb 2026 15:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 24/31]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:52: warning: suggest parentheses around
 '-' in operand of '&'
Message-ID: <202602271511.xadT73iZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   79741e868a2dc4a5ae221be3b068c42f951cc9c8
commit: 60c23f3c74ec15a52f673e95f6654b7e21a6890f [24/31] KVM: arm64: Context switch SME state for guests
config: arm64-randconfig-002-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271511.xadT73iZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271511.xadT73iZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271511.xadT73iZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:416,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/arm64/include/asm/kvm_emulate.h:15,
                    from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13,
                    from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function '__hyp_sme_save_guest':
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:52: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
      77 |         sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, system_supports_fa64(),
   arch/arm64/include/asm/fpsimd.h:440:29: note: in definition of macro 'sme_cond_update_smcr'
     440 |                 u64 __new = vl & SMCR_ELx_LEN_MASK;             \
         |                             ^~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function '__hyp_sme_restore_host':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:97:77: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
      97 |         sme_cond_update_smcr(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SME]) - 1,
   arch/arm64/include/asm/fpsimd.h:440:29: note: in definition of macro 'sme_cond_update_smcr'
     440 |                 u64 __new = vl & SMCR_ELx_LEN_MASK;             \
         |                             ^~


vim +77 arch/arm64/kvm/hyp/nvhe/hyp-main.c

   > 7	#include <hyp/adjust_pc.h>
     8	#include <hyp/switch.h>
     9	
    10	#include <asm/pgtable-types.h>
    11	#include <asm/kvm_asm.h>
    12	#include <asm/kvm_emulate.h>
    13	#include <asm/kvm_host.h>
    14	#include <asm/kvm_hyp.h>
    15	#include <asm/kvm_mmu.h>
    16	
    17	#include <nvhe/ffa.h>
    18	#include <nvhe/mem_protect.h>
    19	#include <nvhe/mm.h>
    20	#include <nvhe/pkvm.h>
    21	#include <nvhe/trap_handler.h>
    22	
    23	DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
    24	
    25	void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
    26	
    27	static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
    28	{
    29		bool save_ffr = !vcpu_in_streaming_mode(vcpu) || vcpu_has_fa64(vcpu);
    30	
    31		__vcpu_assign_sys_reg(vcpu, ZCR_EL1, read_sysreg_el1(SYS_ZCR));
    32	
    33		/*
    34		 * On saving/restoring guest sve state, always use the maximum VL for
    35		 * the guest. The layout of the data when saving the sve state depends
    36		 * on the VL, so use a consistent (i.e., the maximum) guest VL.
    37		 */
    38		sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
    39		__sve_save_state(vcpu_sve_pffr(vcpu), &vcpu->arch.ctxt.fp_regs.fpsr, save_ffr);
    40		write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
    41	}
    42	
    43	static void __hyp_sve_restore_host(void)
    44	{
    45		struct cpu_sve_state *sve_state = *host_data_ptr(sve_state);
    46	
    47		/*
    48		 * On saving/restoring host sve state, always use the maximum VL for
    49		 * the host. The layout of the data when saving the sve state depends
    50		 * on the VL, so use a consistent (i.e., the maximum) host VL.
    51		 *
    52		 * Note that this constrains the PE to the maximum shared VL
    53		 * that was discovered, if we wish to use larger VLs this will
    54		 * need to be revisited.
    55		 */
    56		write_sysreg_s(sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1, SYS_ZCR_EL2);
    57		__sve_restore_state(sve_state->sve_regs + sve_ffr_offset(kvm_host_max_vl[ARM64_VEC_SVE]),
    58				    &sve_state->fpsr,
    59				    true);
    60		write_sysreg_el1(sve_state->zcr_el1, SYS_ZCR);
    61	}
    62	
    63	static void __hyp_sme_save_guest(struct kvm_vcpu *vcpu)
    64	{
    65		__vcpu_assign_sys_reg(vcpu, SMCR_EL1, read_sysreg_el1(SYS_SMCR));
    66		__vcpu_assign_sys_reg(vcpu, SVCR, read_sysreg_s(SYS_SVCR));
    67	
    68		/*
    69		 * On saving/restoring guest sve state, always use the maximum VL for
    70		 * the guest. The layout of the data when saving the sve state depends
    71		 * on the VL, so use a consistent (i.e., the maximum) guest VL.
    72		 *
    73		 * We restore the FA64 and SME2 enables for the host since we
    74		 * will always restore the host configuration so if host and
    75		 * guest VLs are the same we might suppress an update.
    76		 */
  > 77		sme_cond_update_smcr(vcpu_sme_max_vq(vcpu) - 1, system_supports_fa64(),
    78				     system_supports_sme2(), SYS_SMCR_EL2);
    79	
    80		if (vcpu_za_enabled(vcpu)) {
    81			isb();
    82			__sme_save_state(vcpu_sme_state(vcpu), vcpu_has_sme2(vcpu));
    83		}
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
