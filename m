Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A917C0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680932560; x=1712468560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6aiTNuOeWTPufPREoRt81/JgYSRZ45aDeWocvtnkG3c=;
  b=X+Edxjpv1JkAW3avZJiDGKaInN0GJdsN7q43K8zcu7EtiRDKCUr6+3Kh
   /+T+pz09rpcfIYEUm3iB6fLMXzbIFFhP0kr6YzBf5tLFgw57bS8lHIGHr
   qszgw35faHDwlemQYIn9x5H42Px2WhswvFk5g9A88gq4PVP1t3pJjzt93
   gO2/GRygLDFikBp2PVfbYMNzgeYpW/LIpaEpWSDRKr7Uc/z4UITZ5HM+3
   8SrTw14ZukfnvKs9I7NpQAeAZ9Qv7ld4Pmrieo6wYUZdoQC/DVQkJ2Uyg
   MrXi6BB8IEsQiyt+Igd0I82DJqQhUAD9IOVpDtxRIPGI65J1C0SNWNlib
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327207867"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="327207867"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 22:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690239376"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="690239376"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 22:42:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl1LN-000TNz-08;
	Sat, 08 Apr 2023 05:42:33 +0000
Date: Sat, 8 Apr 2023 13:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 7/11]
 arch/x86/include/asm/kvm_host.h:1964:34: error: section attribute cannot be
 specified for local variables
Message-ID: <202304081345.XT9kgmG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   8e114d01de2541e2ff88224962e90c8d9fea62f3
commit: 001bd6a2a006eb835b0e02a59afbca84c8cd9a9b [7/11] BACKPORT: FROMLIST: kvm/x86: add kvm_arch_test_clear_young()
config: i386-randconfig-a012-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081345.XT9kgmG0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 001bd6a2a006eb835b0e02a59afbca84c8cd9a9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081345.XT9kgmG0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:41,
                    from drivers/gpu/drm/i915/gvt/gvt.h:37,
                    from <command-line>:
   arch/x86/include/asm/kvm_host.h: In function 'kvm_arch_has_test_clear_young':
>> arch/x86/include/asm/kvm_host.h:1964:34: error: section attribute cannot be specified for local variables
    1964 |         extern u64 __read_mostly shadow_accessed_mask;
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +1964 arch/x86/include/asm/kvm_host.h

  1959	
  1960	/* see the comments on the generic kvm_arch_has_test_clear_young() */
  1961	#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
  1962	static inline bool kvm_arch_has_test_clear_young(void)
  1963	{
> 1964		extern u64 __read_mostly shadow_accessed_mask;
  1965	
  1966		return IS_ENABLED(CONFIG_KVM) && IS_ENABLED(CONFIG_X86_64) &&
  1967		       (!IS_REACHABLE(CONFIG_KVM) || (tdp_enabled && shadow_accessed_mask));
  1968	}
  1969	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
