Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FA71D130E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768442202; cv=none; b=aMKtI98gXZdps1OMrtkm+diUFxbEp0EoCoUuAgfZvd+WXro38hPS8bVI64Ybna71JGj9O0AcjMaXZ82FtSrXd3MwaVDUbfcReJP6mIADyeBeNGzc703jQr7IGrWaCji+Qdk7vCqMsg+56pkPOwYOVYaALNRwoFiceVrf5/oW/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768442202; c=relaxed/simple;
	bh=TSkCElA9SkfMvuiB1Iz+6bSpNGoNovY9DN6PqyIzgI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qywik0GWZUk/7C0sjxlCmT8GqjUH8MCmcl8XlYi+P3iXaPdMSh9pYZ+G9I6F6rX3/Z/jxYx4xgNAqjhqNEhEDissyNRxu1WyA4wEIuM25FhGEboW+ikHufbKi31YlTvOSRdUs18ONnvA5Sa2I4zSwDn3f7YkNZav4e/Vy3NIxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQjXAOaX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQjXAOaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768442200; x=1799978200;
  h=date:from:to:cc:subject:message-id;
  bh=TSkCElA9SkfMvuiB1Iz+6bSpNGoNovY9DN6PqyIzgI8=;
  b=TQjXAOaXYW9S4/ocli1Kqhj7GBv9UgEVXoOodsqqgJ1Xy9d+4JzuwtOU
   saRnVN/w+2jsKlhgzWXmSvQNPGRVSsWgEj4VpBwk8OnjRaNVUW/f2RL5Q
   TTtVU644+LVF6pCxjpHYVo3gLH1gDfxuEX4uL6FAQcohr6FIgSLUwDiKG
   0SOPqaFbbPz2gfk0lpTMOGxC8ZZTNc0aXtlFJjLeKMoQhx0slZkh16wVi
   mcr0iJ4X84r0K9+OhZ7oRg2kMTuLbgZQcFHc+bYfrQn+E93YpJaP91VGt
   sRSj1ElzO3HcciE4ZyHEf3ulD+QkC88iKYwaef4b5Xk1Ecft/dR17PSpz
   Q==;
X-CSE-ConnectionGUID: VN8XyZ98RkSu0/zluRn9CQ==
X-CSE-MsgGUID: xIDbd/GlR56KxEsgao247w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69800952"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69800952"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 17:56:39 -0800
X-CSE-ConnectionGUID: HIRt6KxXRDK6uID30okOug==
X-CSE-MsgGUID: H6T47i+VSg60749FetNW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205250419"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 17:56:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgCbD-00000000HMm-2usk;
	Thu, 15 Jan 2026 01:56:35 +0000
Date: Thu, 15 Jan 2026 09:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_nested_v1 21/29]
 arch/riscv/kvm/vcpu_nested_insn.c:29:20: sparse: sparse: cast to restricted
 __le64
Message-ID: <202601150959.trPWK9L1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_kvm_nested_v1
head:   d4b2d5a14e336a12a75d613fa8c743557c44795b
commit: d311c14f9846d8cac2af2e5865e6d059dac43a51 [21/29] RISC-V: KVM: Trap-n-emulate SRET for Guest HS-mode
config: riscv-randconfig-r121-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150959.trPWK9L1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150959.trPWK9L1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150959.trPWK9L1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kvm/vcpu_nested_insn.c:29:20: sparse: sparse: cast to restricted __le64
   arch/riscv/kvm/vcpu_nested_insn.c:36:21: sparse: sparse: cast to restricted __le64
>> arch/riscv/kvm/vcpu_nested_insn.c:42:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/riscv/kvm/vcpu_nested_insn.c:42:9: sparse:     expected unsigned long
   arch/riscv/kvm/vcpu_nested_insn.c:42:9: sparse:     got restricted __le64 [usertype]

vim +29 arch/riscv/kvm/vcpu_nested_insn.c

     9	
    10	int kvm_riscv_vcpu_nested_insn_sret(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
    11	{
    12		unsigned long vsstatus, next_sepc, next_spp;
    13		bool next_virt;
    14	
    15		/*
    16		 * Trap from virtual-VS/VU modes should be forwarded to
    17		 * virtual-HS mode as a virtual instruction trap.
    18		 */
    19		if (kvm_riscv_vcpu_nested_virt(vcpu))
    20			return KVM_INSN_VIRTUAL_TRAP;
    21	
    22		/*
    23		 * Trap from virtual-U mode should be forwarded to
    24		 * virtual-HS mode as illegal instruction trap.
    25		 */
    26		if (!(vcpu->arch.guest_context.hstatus & HSTATUS_SPVP))
    27			return KVM_INSN_ILLEGAL_TRAP;
    28	
  > 29		vsstatus = ncsr_read(CSR_VSSTATUS);
    30	
    31		/*
    32		 * Find next nested virtualization mode, next privilege mode,
    33		 * and next sepc
    34		 */
    35		next_virt = (vcpu->arch.nested.csr.hstatus & HSTATUS_SPV) ? true : false;
    36		next_sepc = ncsr_read(CSR_VSEPC);
    37		next_spp = vsstatus & SR_SPP;
    38	
    39		/* Update Guest sstatus.sie */
    40		vsstatus &= ~SR_SIE;
    41		vsstatus |= (vsstatus & SR_SPIE) ? SR_SIE : 0;
  > 42		ncsr_write(CSR_VSSTATUS, vsstatus);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
