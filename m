Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9016B19258A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613440; cv=none; b=pHwCB+cIyNy1XRb8XTeApdjXs9/h2y5ksk7MVMpwRJZQq1CL6v3aP9I4Hzl/kIatEfv9CP9TPKUfVaVYgnglcFnB/wsoe3Pf5lSFb8FA1T0Olx+oYrzRvV7f44KUgeCx+gkI7vr6Vi0O0oEZ5axTjdNJifvQo0fxYRefIgZHgc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613440; c=relaxed/simple;
	bh=djTs4z5sohFJ5c4Mt+yPIezf+waKU7/MufUHC+36FPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=phSIDxXjqSMEdyYkiRI3x3uTmEruC3Mprc4hVKFtQbqIdNyNfO/vBvr/G1cYxcISvRVGIbgeKfAE8LFOFPOi8S1GddxzpMzGsVQqet1lkttdMnkobhfoz9G5HnkCt6wD8TErE5O/395uYUk8AXYRJ96K9EsM+XNPotBeYs7UET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9QZVsZd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9QZVsZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732613438; x=1764149438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djTs4z5sohFJ5c4Mt+yPIezf+waKU7/MufUHC+36FPE=;
  b=P9QZVsZd+IP682QkAQaMYNIUmAJkTsXMSa+EWaRQcISosYb7R8UxtKGe
   M6wBUbEc0bBtPgI7rQemklzB+wegE9uA7KN/GrTtPoIXVOQLZRIAMZODU
   ZqMtFF+kHSnqlGKv3zxpeb9rN9Jp4NhE6cuTUI9gUQHXKjMO6jYjsTZf2
   XSsfppgy4xmEvbnyyHRi0pIquOda0nkp3tH7h60kNPXr86PRhbc3FX3za
   3jIoo22GRQ5LwE2d9QXRL9glMSWBxpQ9toMhrFd0mtCVm1XIZIYgzwWRv
   dhqcIHhyKxFSraPYcfgvE2umYrwrlGnUDbdWHp8Lp+eSo78QzUoipDXnX
   A==;
X-CSE-ConnectionGUID: anEjEi9mQnOjLzh3Zwaoaw==
X-CSE-MsgGUID: iNquGmQhRu2bLl9y3gxY+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32917268"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="32917268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 01:30:18 -0800
X-CSE-ConnectionGUID: MS3nS1RKSsOoX1+wLJMfTQ==
X-CSE-MsgGUID: 3Lnscmx4SnqkhGsNyq1nSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="122412105"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 01:30:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFrta-0007CP-2r;
	Tue, 26 Nov 2024 09:30:10 +0000
Date: Tue, 26 Nov 2024 17:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guest_cpufeatures 56/60] arch/x86/kvm/cpuid.c:691:37:
 error: 'X86_FEATURE_7' undeclared; did you mean 'X86_FEATURE_DS'?
Message-ID: <202411261732.uuP4WL5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guest_cpufeatures
head:   1bc43ac6e3ebb05bb7cf78e0da5ea9009c9d963f
commit: 5a0b230804678a2841b6ce4a072651976a7b7c7f [56/60] KVM: x86: Explicitly track feature flags that require vendor enabling
config: i386-buildonly-randconfig-001-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261732.uuP4WL5V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261732.uuP4WL5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261732.uuP4WL5V-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/cpuid.c: In function 'kvm_set_cpu_caps':
>> arch/x86/kvm/cpuid.c:691:37: error: 'X86_FEATURE_7' undeclared (first use in this function); did you mean 'X86_FEATURE_DS'?
     691 |         u32 __leaf = __feature_leaf(X86_FEATURE_##name);                \
         |                                     ^~~~~~~~~~~~
   arch/x86/kvm/cpuid.c:673:31: note: in definition of macro 'kvm_cpu_cap_init'
     673 |         kvm_cpu_caps[leaf] = (mask);                                    \
         |                               ^~~~
   arch/x86/kvm/cpuid.c:767:9: note: in expansion of macro 'KVM_VALIDATE_CPU_CAP_USAGE'
     767 |         KVM_VALIDATE_CPU_CAP_USAGE(name);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/cpuid.c:842:17: note: in expansion of macro 'VENDOR_F'
     842 |                 VENDOR_F(DS) |
         |                 ^~~~~~~~
   arch/x86/kvm/cpuid.c:691:37: note: each undeclared identifier is reported only once for each function it appears in
     691 |         u32 __leaf = __feature_leaf(X86_FEATURE_##name);                \
         |                                     ^~~~~~~~~~~~
   arch/x86/kvm/cpuid.c:673:31: note: in definition of macro 'kvm_cpu_cap_init'
     673 |         kvm_cpu_caps[leaf] = (mask);                                    \
         |                               ^~~~
   arch/x86/kvm/cpuid.c:767:9: note: in expansion of macro 'KVM_VALIDATE_CPU_CAP_USAGE'
     767 |         KVM_VALIDATE_CPU_CAP_USAGE(name);                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/cpuid.c:842:17: note: in expansion of macro 'VENDOR_F'
     842 |                 VENDOR_F(DS) |
         |                 ^~~~~~~~


vim +691 arch/x86/kvm/cpuid.c

4e66c0cb79b732 Sean Christopherson 2021-04-12  683  
380fc54656b523 Sean Christopherson 2024-05-06  684  /*
380fc54656b523 Sean Christopherson 2024-05-06  685   * Assert that the feature bit being declared, e.g. via F(), is in the CPUID
380fc54656b523 Sean Christopherson 2024-05-06  686   * word that's being initialized.  Exempt 0x8000_0001.EDX usage of 0x1.EDX
380fc54656b523 Sean Christopherson 2024-05-06  687   * features, as AMD duplicated many 0x1.EDX features into 0x8000_0001.EDX.
380fc54656b523 Sean Christopherson 2024-05-06  688   */
380fc54656b523 Sean Christopherson 2024-05-06  689  #define KVM_VALIDATE_CPU_CAP_USAGE(name)				\
380fc54656b523 Sean Christopherson 2024-05-06  690  do {									\
380fc54656b523 Sean Christopherson 2024-05-06 @691  	u32 __leaf = __feature_leaf(X86_FEATURE_##name);		\
380fc54656b523 Sean Christopherson 2024-05-06  692  									\
380fc54656b523 Sean Christopherson 2024-05-06  693  	BUILD_BUG_ON(__leaf != kvm_cpu_cap_init_in_progress);		\
380fc54656b523 Sean Christopherson 2024-05-06  694  } while (0)
380fc54656b523 Sean Christopherson 2024-05-06  695  

:::::: The code at line 691 was first introduced by commit
:::::: 380fc54656b5232e6a2b05add94203968d1eec88 KVM: x86: Harden CPU capabilities processing against out-of-scope features

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
