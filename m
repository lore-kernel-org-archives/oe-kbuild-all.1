Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8912AF0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 02:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734749869; cv=none; b=Wmlx3arlhyr4pSBZcJRY2BxyOx/5ygH3d4gfbF5cGinip712J44PeTQU0+9B06q5rVeL9mhfOR/mp3e05Xegw/LWkoumLJUSJAns9DNfvfg9XhaGfZvmBRh+gzA5kYXIHki6iivex5wW/n0vg2CRWu+O/Zwp+2AiIQCqXfO7baU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734749869; c=relaxed/simple;
	bh=sVuRCphj9ji4Mz/c7Q+NoUZhyD7mAsqS1oaWLMnx3g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8te9R/El0eVkRN0ROdLXSRBK9HPjfehlFSPpL3S3CXeEqcB/eaDxnFpH+NBiN4t4fn1qoIJcIXLEtcsIbVnU6BdR1WN+DgLS+kzuhYt2siQfGs03v2TllZ3Hoj/uOI+W9NLT8Do8/CEdzskoHqdQ85wXbtp/5RhnFegisbo4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRA3NEb7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRA3NEb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734749867; x=1766285867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVuRCphj9ji4Mz/c7Q+NoUZhyD7mAsqS1oaWLMnx3g4=;
  b=XRA3NEb7LmqgmJtc80y620RIp2b6dj5n7cybN5CFAehroVq6NfKdix01
   23ZTpvJYwswWBcbmNw0igef6uSK9Kkw4opKFVQ48g77fXuuccmOf16opp
   J6wDLHukUZyiu9wiNyg3ztPoK5jSjbRm1qhDFHlAQK0HXtuf/7tH43pyT
   e15frqWtWBhlyUXc2nZ++cWSv1Gk1eJ+mkuUoB49bNjSSBOMc3AWrHZmB
   N5sS6+ckbQciXj1cX35/wCxX+J664yU4BXXyRYGZ0SKFAqLgdY/nQCuAq
   tSJA6Fak8GFyS7mnD6Df3lY+NaFpLZ1oC+FB6Yzc51bU4XAx22k6q+kBs
   w==;
X-CSE-ConnectionGUID: pY175EbeQIGiMu/L2HvLTA==
X-CSE-MsgGUID: iCIGffASRl+2z6IVZJQ26A==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39239324"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="39239324"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 18:57:46 -0800
X-CSE-ConnectionGUID: 8uVtnfrSSUq0uVoHqLriPw==
X-CSE-MsgGUID: GySgM2UBTi6me1n4/4PGKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103668516"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2024 18:57:45 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOpgU-0001sU-1j;
	Sat, 21 Dec 2024 02:57:42 +0000
Date: Sat, 21 Dec 2024 10:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2588/2588] arch/x86/kvm/x86.c:1076:6: sparse:
 sparse: symbol 'kvm_post_set_cr4' was not declared. Should it be static?
Message-ID: <202412211034.4bD5Ydra-lkp@intel.com>
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
commit: 8a7e6f51a756aa6e88ebd5da8a5f3b6744cd07b5 [2588/2588] KVM: x86: Introduce kvm_post_set_cr4 to post handle the CR4 emulation
config: x86_64-randconfig-121-20241218 (https://download.01.org/0day-ci/archive/20241221/202412211034.4bD5Ydra-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211034.4bD5Ydra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211034.4bD5Ydra-lkp@intel.com/

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
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
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
