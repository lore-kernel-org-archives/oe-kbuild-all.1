Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C91FA251
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709076; cv=none; b=i5eAZ7HJMGkQSwdp+9sheHrmOOMzaizOXYCxiYUblxWP4KchaAfzSrkqSNCVjT0sKKy1LSYN/W+XxVzwWqAHif3ccaalWLDLmfopEcF8lLQCLbpNKUpjTtRZkQT1+/kfwbl0fXpqYJ01WIlWb/wEVkHRY+9+dNEs4zZCEirA1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709076; c=relaxed/simple;
	bh=afV798ELj3cSYSRR3Q+Y+6kki8MliWwiZjxQkTTj08c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjtq4uvDOvkFPfTfDRo5J0MNc3+Pj8Yv5wSTRfahjYDpamcTLRPxR1KmzmwsLv6UUh1047bxeunoWTDgQ9O2az5hJdSv2XWXQ4mDG+OcqH8AVjgMPNeVclMsgtmdoACAOggw+KQtVgybk6oHLpEomQnyRqZcSWLnvgtkQxh9TsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQeFSK0S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQeFSK0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732709074; x=1764245074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afV798ELj3cSYSRR3Q+Y+6kki8MliWwiZjxQkTTj08c=;
  b=JQeFSK0SYP0iFvPOD2Nt484meSh914IvFIooDDcIi3G8eehsRmFmu6Yc
   dBQyGTshg5dOpI6aJceC3Zbfx0G0AhDtXWb2OoSDkDMwrSyPcAKHLJXod
   GCKJSUEmO5O3al9VWWhHxE0Ov0PipzWmoBCu/Ww9p2klweEgtzHGL+OsP
   bTpnkqe9egxW2MHZya4f+aWXaw8sPaHVn+Dq/EbrAidCYcQAoLsSeCCwD
   yJ8Uh7l9S+sp88LMYU5uLJzSFgtzfsmwWvNrro0M92+VzQxNKo/uCCYtG
   ab1xPMVxsh82Vq78alhz8ybRco9SlQZMsV/FPJe+ODLdMiYxDtlS6p6hp
   g==;
X-CSE-ConnectionGUID: vG4Pw9hbRPCwDWM2TiIF9A==
X-CSE-MsgGUID: R60rYZXURcWZ6mJVyT42CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36697929"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36697929"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 04:04:34 -0800
X-CSE-ConnectionGUID: ERTCreuDRz2nJCUrEThyjg==
X-CSE-MsgGUID: 5/Ux6ijRQu+zZeOoQWfZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92390503"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2024 04:04:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGGmU-0007y9-16;
	Wed, 27 Nov 2024 12:04:30 +0000
Date: Wed, 27 Nov 2024 20:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2470/2470] arch/x86/kvm/x86.c:1076:6: sparse:
 sparse: symbol 'kvm_post_set_cr4' was not declared. Should it be static?
Message-ID: <202411272219.tfXLJWB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   87fa1e0e0a64b6c3c41d4cd55da96b42234cbb2c
commit: 8a7e6f51a756aa6e88ebd5da8a5f3b6744cd07b5 [2470/2470] KVM: x86: Introduce kvm_post_set_cr4 to post handle the CR4 emulation
config: x86_64-randconfig-121-20241123 (https://download.01.org/0day-ci/archive/20241127/202411272219.tfXLJWB7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411272219.tfXLJWB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411272219.tfXLJWB7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/x86.c:893:6: sparse: sparse: symbol 'kvm_post_set_cr0' was not declared. Should it be static?
>> arch/x86/kvm/x86.c:1076:6: sparse: sparse: symbol 'kvm_post_set_cr4' was not declared. Should it be static?
   arch/x86/kvm/x86.c:3051:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got unsigned char [usertype] * @@
   arch/x86/kvm/x86.c:3051:38: sparse:     expected void const [noderef] __user *
   arch/x86/kvm/x86.c:3051:38: sparse:     got unsigned char [usertype] *
   arch/x86/kvm/x86.c:8615:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:8615:15: sparse:    struct kvm_apic_map [noderef] __rcu *
   arch/x86/kvm/x86.c:8615:15: sparse:    struct kvm_apic_map *
   arch/x86/kvm/x86.c:11015:32: sparse: sparse: Using plain integer as NULL pointer
   arch/x86/kvm/x86.c:11068:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:11068:16: sparse:    struct kvm_apic_map [noderef] __rcu *
   arch/x86/kvm/x86.c:11068:16: sparse:    struct kvm_apic_map *
   arch/x86/kvm/x86.c:11069:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:11069:15: sparse:    struct kvm_pmu_event_filter [noderef] __rcu *
   arch/x86/kvm/x86.c:11069:15: sparse:    struct kvm_pmu_event_filter *
   arch/x86/kvm/x86.c:4141:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:182:9: sparse: sparse: context imbalance in 'vcpu_enter_guest' - unexpected unlock

vim +/kvm_post_set_cr4 +1076 arch/x86/kvm/x86.c

  1075	
> 1076	void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
  1077	{
  1078		unsigned long mmu_role_bits = X86_CR4_PGE | X86_CR4_PSE | X86_CR4_PAE |
  1079					      X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_PKE;
  1080	
  1081		if (((cr4 ^ old_cr4) & mmu_role_bits) ||
  1082		    (!(cr4 & X86_CR4_PCIDE) && (old_cr4 & X86_CR4_PCIDE)))
  1083			kvm_mmu_reset_context(vcpu);
  1084	}
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
