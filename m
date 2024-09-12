Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B718BC32
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726130982; cv=none; b=JwDb7DCF5mY4Qal51yhYFAidMA+O64uMzdHCwTWLIopRvRd5VrVoP9NCYfx2YeOADfOjJ6QqmDBfZQxt7ciRudeKbg7e0cBRAtUZ0YnPbmIuewZTOU/qsdSBDZJBymj2rf89ja4CWH+pBvnU5zpf0vL7TOsfsYYxHsbPlumzHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726130982; c=relaxed/simple;
	bh=WIevPtwLTFg3fFdg0FO4NIlhyWXjdCxl6hG7CCILSS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRgsyApGYvWXjtUVcxJQnJfrgv/ofAaBYW1Ha5fHvBPU+79vTGHakjAz5nz01I1tkUJRzAEphK4Ad/IROBkQboKw1DXaEvBUTSpZ8BioWfMuewopakWWTiKdALMFiBZrxKJ5gvW4ZmE90lYhAyj0yKqTSXdt5R2CitY2mZt7Tmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lrz7RKpB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lrz7RKpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726130981; x=1757666981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WIevPtwLTFg3fFdg0FO4NIlhyWXjdCxl6hG7CCILSS4=;
  b=Lrz7RKpBKSe2OhuNOmQhxKkk5R+QXNVVAAjc1dJsQhA7G7MRa8Wbnw8K
   4SsMhZ9zZvDhQjBbM+VQO+4/jCv9Vesx6Kq5HtlaQ99Hfo+J8I9Jvva1l
   n/hRagF6oMSeRmK34qv3uW1DdeM6odtBe9ANyzC8MizPUx4aaU92j3Adk
   dxb24qMXjna855CUcT+T/qnDK5laKNVqfPjV5kDmMw09AuBIWFYFxVpHz
   YCSnFhngrrLS+GI4TUdLGc4hTvS7l3HJfvlHTKd7LudGQLm1i6yVwzGRG
   CPZeLMZic9JwjNH3ZIaZw7GkbCrog1d5l+ZMPN3QwbDmVf9IUNonkLlEf
   g==;
X-CSE-ConnectionGUID: P9O3SlHXRbOZG8Nawoy8vw==
X-CSE-MsgGUID: 0ci/67whQ2uu+VkjIx4QSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27886595"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="27886595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 01:49:41 -0700
X-CSE-ConnectionGUID: LovWdPPBTLq0Y/5Fhd6AHQ==
X-CSE-MsgGUID: uQDhCLWBTcKRplZQvFnF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="67566590"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2024 01:49:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sofWC-0004iV-2g;
	Thu, 12 Sep 2024 08:49:36 +0000
Date: Thu, 12 Sep 2024 16:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26966/30000] arch/x86/kvm/x86.c:1076:6: sparse:
 sparse: symbol 'kvm_post_set_cr4' was not declared. Should it be static?
Message-ID: <202409121652.VtoLzgNf-lkp@intel.com>
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
head:   edbc98270a614911e6064ff3675e6f8a0a6dde0b
commit: 8a7e6f51a756aa6e88ebd5da8a5f3b6744cd07b5 [26966/30000] KVM: x86: Introduce kvm_post_set_cr4 to post handle the CR4 emulation
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409121652.VtoLzgNf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121652.VtoLzgNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121652.VtoLzgNf-lkp@intel.com/

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
