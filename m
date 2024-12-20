Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847751BBBE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738933; cv=none; b=cCkaPUhowbzz1ehV2e4FbYpOzzgjmGe7lx1UDy1gazpmh1nnA3Q2IXNrh974zJeHACk5KdzO5fOR2FoM9XIs9AE0xlkA+ete83v7vOS/3lvNt7E0/Gi0WiL9PVbL4h4VOhbXRwOoptuUa3+mcpLNbYnLemjK5ZuuuPlelAXl5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738933; c=relaxed/simple;
	bh=cgM28OycoStpvCN4S4nHtP5k+fAQ5w9FOjCCcTU8aPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHeyejVyffPT+FGDrbziSkwYv9d6dLmJDdX98+XWD6TbS5NpTTvjiFaknWdwI4GK5fhbfHPULcKvMmImMCTkt07tNsn67ESYmyQ/bBvZr1TRcOJvDaFu/rJvYdjLQTGPFKGJArmQ0W3soypq9m6bFgzlDs3HkcdzEIypaEc6pZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bY1pe+iu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bY1pe+iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734738931; x=1766274931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgM28OycoStpvCN4S4nHtP5k+fAQ5w9FOjCCcTU8aPo=;
  b=bY1pe+iuuo/AuBvDrFbwcMhFpR9YYUAgGi2/BFXUN5rWAQ/Gpopw9LqI
   8CqcpVsDd09E2NBlHNZZibCqeBN2TywedAZvmQ9y7u24l7/qyCve/VjwZ
   0P6X99NiDrhHF1ATwlJvdeh6294LWYSVigyrB80Z2cRGIxLnGgtdy842g
   So+zvPOT7QIb5/Zwn5e8Z/WjJ6+52mdmYxBbhbVbjU55Jj/UMlKsaKVOC
   a5zHX4t5nQtoVyv1mCJHtLL5zGiKUZJiNKOcLuvRNSWmeVLTfqsoJJjG8
   RxSgzWppk9g9mlVbmlA4gUC5FLsYHoXawbsVlJ0I8o14VtP6QtR7z9HCT
   g==;
X-CSE-ConnectionGUID: nx2/GjH5QFmK/dKSm6KEIQ==
X-CSE-MsgGUID: TcetKyhITS6m2mJCZ6kEYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35459984"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35459984"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 15:55:31 -0800
X-CSE-ConnectionGUID: mOs9AMyOTMiKpwLhSYRlkQ==
X-CSE-MsgGUID: QgfTL93vSGuYvmLVxmsrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121931081"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2024 15:55:29 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOmq7-0001mx-1r;
	Fri, 20 Dec 2024 23:55:27 +0000
Date: Sat, 21 Dec 2024 07:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2588/2588] arch/x86/kvm/x86.c:893:6: sparse:
 sparse: symbol 'kvm_post_set_cr0' was not declared. Should it be static?
Message-ID: <202412210743.TVhBJ1oK-lkp@intel.com>
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
head:   e804413fbbd504bc7b5b84dc7b86307f2b127a83
commit: 1686d271f795f8756b49151978b95b095c0598ad [2588/2588] KVM: x86: Introduce kvm_post_set_cr0 to post handle the CR0 emulation
config: x86_64-randconfig-121-20241218 (https://download.01.org/0day-ci/archive/20241221/202412210743.TVhBJ1oK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210743.TVhBJ1oK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210743.TVhBJ1oK-lkp@intel.com/

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
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
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
