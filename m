Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D21F78E6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781423365; cv=none; b=lJeW1mELO74pJrwFCmjkKQXOIIH0Cq5heAPF+OR5ZVCjtWJ9pqwHACnaWxfeMW1Gcrp5CG1mIbfM3/dc+WSnJbDV7KV0Ls15Z7MFYMFNovWj4Iss9muyMbtxsRCAi+AbRpTyDkDrKWJxORZ6ml1Nq0agg4xb8veYrafJAxL5Joc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781423365; c=relaxed/simple;
	bh=EdB613XweNTldTI4hdiskSdew06U9g+Zrk0tIFqIrz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f9v+AAKHBS/OD0CNN9c4DEkZt7mQGN75YPq92bzX0CeaPTy4QDmx2zSpkKC3FeAdX0nwH0i/668hnpzDgmVN8gu5AKJ2tiP0rF7HNGanuVKToTKCOKFHoHubGKRvqd7p25cdsqd/xhJLhLzaeUrzniaKtaxHNhpJ0N9iWZz2ISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0vLqDxe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0vLqDxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781423362; x=1812959362;
  h=date:from:to:cc:subject:message-id;
  bh=EdB613XweNTldTI4hdiskSdew06U9g+Zrk0tIFqIrz8=;
  b=K0vLqDxeXvavjTEZLofO/6cAyVoO9C27aZIFKGHNLT+wnq/5u6P8MS9r
   GJr7+EzgMXDG1CFx+RszZbzH/CRHERJ3xJ1L2xuB7NnVZ2hhKSGdpUMnh
   ty0mU5aMlWGPxg9AB0hZdLTZqBm6TNEsH/7bYSc/aFhbG5cC8kgVVfBGI
   oeaQAD9dgu43ADM6CbBnUCz6hMQZkJcOsPZDdtHsJykXjuFKW6TqCtFZ2
   NtAi0I31xloVcxxGvCjzwF4XNeXJyZGYEe/wSkJ39PQ2qlLdsdKsqX2YG
   zRrhuvIn6lWlQLOkO4NY+VleYaBz9UNxv2V7ei3hHFSGXkRpj3Vs/YGFz
   w==;
X-CSE-ConnectionGUID: 8ScXq6HnQbiacTZ4Admo8A==
X-CSE-MsgGUID: rCGLqURrRKCgBjH3f2o4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82301320"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82301320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 00:49:21 -0700
X-CSE-ConnectionGUID: sG4sTh1lTnKiUngFbqNrFA==
X-CSE-MsgGUID: v5ElzfwPQhKEbXT3uv1gvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="249083688"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jun 2026 00:49:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYfan-00000000Qfc-0m1T;
	Sun, 14 Jun 2026 07:49:17 +0000
Date: Sun, 14 Jun 2026 15:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Kalesh Singh <kaleshsingh@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:40:1: sparse: sparse:
 symbol '__pcpu_scope_pkvm_stacktrace' was not declared. Should it be static?
Message-ID: <202606141506.NrUXwjy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: 9019e82c7e46c03c37e8b108473d02b543222d9f KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC
date:   3 months ago
config: arm64-randconfig-r112-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141506.NrUXwjy5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141506.NrUXwjy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9019e82c7e46 ("KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141506.NrUXwjy5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/stacktrace.c:12:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/stacktrace.c:15:1: sparse: sparse: symbol '__pcpu_scope_kvm_stacktrace_info' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:40:1: sparse: sparse: symbol '__pcpu_scope_pkvm_stacktrace' was not declared. Should it be static?

vim +/__pcpu_scope_pkvm_stacktrace +40 arch/arm64/kvm/hyp/nvhe/stacktrace.c

871c5d931417d3 Kalesh Singh 2022-07-26  39  
6928bcc84bc4bd Kalesh Singh 2022-07-26 @40  DEFINE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)], pkvm_stacktrace);
871c5d931417d3 Kalesh Singh 2022-07-26  41  

:::::: The code at line 40 was first introduced by commit
:::::: 6928bcc84bc4bd9a24a1cb1986418c3de76e1d99 KVM: arm64: Allocate shared pKVM hyp stacktrace buffers

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
