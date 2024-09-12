Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE2337703
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 04:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726115497; cv=none; b=V8z5rLfamikd16hxlA0SfNmrtxrNIqgPl4n4j22Vw6fEms8agnOJZ8p/QsHX2NpqIxjJOoNVePuGKWJYBziT7QU/9loLSVb1EJLQ9zsH6ShVJPFttBX2YmMNcvpK6bASqd4dmj5yjQvawv+5A01oFX+4ZafFLA1FuXdXcD4ucQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726115497; c=relaxed/simple;
	bh=Obl28i0WQgYiA2c9/Z6X4OBMIs3nZXwgJ13qaDt+Lj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B32l91Zs3VlRSWTLtl3PbRI8usWrmscSM5swSG4J03IigSqSukVSY9l9VcifeUMDvZBG6QUl4VVRLOF6PRXSI6OS+UX3y2SKmFE3buva9sHGU70NxYfOzQqBk71G/s+bPSAkfxLWckax6S257MofghBwu16jXA1R5z199pP1Rv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFPLVgXt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFPLVgXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726115495; x=1757651495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Obl28i0WQgYiA2c9/Z6X4OBMIs3nZXwgJ13qaDt+Lj4=;
  b=mFPLVgXtQv9pKQkDfg0PAvJtqihFN7jiXbWsrYmMr21a1gitlOtPKN5e
   6FlJHDaO8v3c8fvVUbUPVTHw1H5GYPumRDux6gDV3eCsop4gwsVJwmnOM
   mEdBgJ9ldftLaxeqB1KplMGkFIEqWXt1/z7vdyiIpjyZo+umlI0uylt8V
   5dB0twa5pKT2/zsRsCUZrUSGLHXys/643uEdKhDzlTZSSw/67v954Ihr3
   lW4a4QPvDd8V2BanT8Iu6X3bAxOYWVYcTy6Fd4TzucYksTYxNKHT6CZuJ
   WVTkp3/JEWULV5YMw19TRjAB9OWSSWtrLCsj4REiuO7VHHtvCfG4TF3r9
   Q==;
X-CSE-ConnectionGUID: M2KMfkI5STOG4d79zkv9mg==
X-CSE-MsgGUID: chdaAVHIRLyE79FC0QRhcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25079153"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="25079153"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 21:31:33 -0700
X-CSE-ConnectionGUID: /Jf/ZDCnRaqmlTP4ELw/XA==
X-CSE-MsgGUID: 6jbWNayiTNyfUuRGBMzpbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="67408426"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 21:31:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sobUQ-0004Ww-0n;
	Thu, 12 Sep 2024 04:31:30 +0000
Date: Thu, 12 Sep 2024 12:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26967/30000] arch/x86/kvm/x86.c:893:6: sparse:
 sparse: symbol 'kvm_post_set_cr0' was not declared. Should it be static?
Message-ID: <202409121221.f86WxXWu-lkp@intel.com>
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
head:   7c98201b2598a42ac2ce6a9036ee4e4349a406ac
commit: 1686d271f795f8756b49151978b95b095c0598ad [26967/30000] KVM: x86: Introduce kvm_post_set_cr0 to post handle the CR0 emulation
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409121221.f86WxXWu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121221.f86WxXWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121221.f86WxXWu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/x86.c:893:6: sparse: sparse: symbol 'kvm_post_set_cr0' was not declared. Should it be static?
   arch/x86/kvm/x86.c:3044:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got unsigned char [usertype] * @@
   arch/x86/kvm/x86.c:3044:38: sparse:     expected void const [noderef] __user *
   arch/x86/kvm/x86.c:3044:38: sparse:     got unsigned char [usertype] *
   arch/x86/kvm/x86.c:8608:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:8608:15: sparse:    struct kvm_apic_map [noderef] __rcu *
   arch/x86/kvm/x86.c:8608:15: sparse:    struct kvm_apic_map *
   arch/x86/kvm/x86.c:11008:32: sparse: sparse: Using plain integer as NULL pointer
   arch/x86/kvm/x86.c:11061:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:11061:16: sparse:    struct kvm_apic_map [noderef] __rcu *
   arch/x86/kvm/x86.c:11061:16: sparse:    struct kvm_apic_map *
   arch/x86/kvm/x86.c:11062:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:11062:15: sparse:    struct kvm_pmu_event_filter [noderef] __rcu *
   arch/x86/kvm/x86.c:11062:15: sparse:    struct kvm_pmu_event_filter *
   arch/x86/kvm/x86.c:4134:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:182:9: sparse: sparse: context imbalance in 'vcpu_enter_guest' - unexpected unlock

vim +/kvm_post_set_cr0 +893 arch/x86/kvm/x86.c

   892	
 > 893	void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
   894	{
   895		unsigned long update_bits = X86_CR0_PG | X86_CR0_WP;
   896	
   897		if ((cr0 ^ old_cr0) & X86_CR0_PG) {
   898			kvm_clear_async_pf_completion_queue(vcpu);
   899			kvm_async_pf_hash_reset(vcpu);
   900		}
   901	
   902		if ((cr0 ^ old_cr0) & update_bits)
   903			kvm_mmu_reset_context(vcpu);
   904	
   905		if (((cr0 ^ old_cr0) & X86_CR0_CD) &&
   906		    kvm_arch_has_noncoherent_dma(vcpu->kvm) &&
   907		    !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
   908			kvm_zap_gfn_range(vcpu->kvm, 0, ~0ULL);
   909	}
   910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
