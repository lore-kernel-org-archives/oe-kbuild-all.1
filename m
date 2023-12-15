Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36D41856
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lg3BYpM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702662978; x=1734198978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvWrieDTMCdLIplUvEELQll1rjVPV1PTLEMOhNumt84=;
  b=Lg3BYpM7oucL+j+Hs6MT6/9SaZt3SDYC1bMLxZ08VHCDjaqQ/2MrWlXw
   Lc9m3LKKN3tGFwEpMxIWRyfaLGXsCoEZnzRAgqzNw7Jf3tce73YwPHI74
   0ykDdukd1u2YzgUU5lt0EqKWHumR54TTJ+G2UI34S5zZWzmyPRpdWRNMX
   agIznoFNoiftThvy+W0a/BEkmSfp7OxpNDEmhjaQqtkoPI/xnSU/+EHGd
   JdK3RMUhIB8W46yaW1mpBJTZwfNYISWKcm1gUXGcQwSASSCO82f50S6ii
   ZvZCiE7jJEKPQf9mGvWNKImVdNeHoIuBGfvplchYN/UKsNo+BaFgGJnCd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2397711"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2397711"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:56:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="898219349"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="898219349"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Dec 2023 09:56:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rECQ0-0000Zm-3A;
	Fri, 15 Dec 2023 17:56:12 +0000
Date: Sat, 16 Dec 2023 01:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:15:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_stacktrace_info' was not declared. Should it be static?
Message-ID: <202312160147.tv9kuUiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f7168591ebf7bbdb91797d02b1afaf00a4289b1
commit: 879e5ac7b2e4db05799a905b5a07fc9e5dedf651 KVM: arm64: Prepare non-protected nVHE hypervisor stacktrace
date:   1 year, 5 months ago
config: arm64-randconfig-r112-20231117 (https://download.01.org/0day-ci/archive/20231216/202312160147.tv9kuUiH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231216/202312160147.tv9kuUiH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160147.tv9kuUiH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/stacktrace.c:12:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:15:1: sparse: sparse: symbol '__pcpu_scope_kvm_stacktrace_info' was not declared. Should it be static?

vim +/__pcpu_scope_kvm_stacktrace_info +15 arch/arm64/kvm/hyp/nvhe/stacktrace.c

    11	
  > 12	DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
    13		__aligned(16);
    14	
  > 15	DEFINE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
