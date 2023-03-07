Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70B10792
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678227323; x=1709763323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HoB1BquRTxz7qtCH+HeuP9g44nWhKDWfkDQIGCJyl5A=;
  b=AYyV4Tp7PLQESsTh39OI1uMtqDyrgeij+4gomDsrMeykHIh+TXoc4GPD
   vvrsYexh5kTnCiieFFB3VO1wiDvMaf+tYlgSLojgUlzEe9MWwLKw4dk4y
   KZW/Q/sEvVX+Ky5RoJijyn6BfJ20VQqye6U2QhWP4zpkcV2We8mcIFeHq
   Vbw0DT6fNFOEJKVufOtphYmP367/oGWKmdECJTs+ORMdBKy+85ZgFJrjW
   EQlIh0w2Sc0WNFXhBr24pfLME78S7XWMTHvG8RHB6REQNDotbTFoBtXsu
   v8e9ih0XArcGSp4BGMj2zAIZlOKcpITg08Cq6VBhvyoYp5N3+rv6IO6jz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400815028"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="400815028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 14:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922539842"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="922539842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Mar 2023 14:15:22 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZfab-0001e3-1D;
	Tue, 07 Mar 2023 22:15:21 +0000
Date: Wed, 8 Mar 2023 06:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 20/25]
 arch/arm64/kernel/kvm-uclamp.c:26:36: error: expected '=', ',', ';', 'asm'
 or '__attribute__' before '__ro_after_init'
Message-ID: <202303080625.gRvjRHRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   99c1753ad97a333dd83681a9e5f299ce0c6a244c
commit: e6d9e3afd83522329ee34169e9169077a72ee97f [20/25] CHROMIUM: KVM: sched: Use KVM uclamp hypercall if available
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230308/202303080625.gRvjRHRN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-arcvm
        git checkout e6d9e3afd83522329ee34169e9169077a72ee97f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080625.gRvjRHRN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/kvm-uclamp.c:26:36: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ro_after_init'
      26 | static int kvm_arch_uclamp_support __ro_after_init;
         |                                    ^~~~~~~~~~~~~~~
   arch/arm64/kernel/kvm-uclamp.c: In function 'kvm_arch_uclamp_init':
>> arch/arm64/kernel/kvm-uclamp.c:37:17: error: 'kvm_arch_uclamp_support' undeclared (first use in this function); did you mean 'kvm_arch_uclamp_supported'?
      37 |                 kvm_arch_uclamp_support = KVM_UCLAMP_UNSUPPORTED;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_arch_uclamp_supported
   arch/arm64/kernel/kvm-uclamp.c:37:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kernel/kvm-uclamp.c: In function 'kvm_arch_uclamp_supported':
   arch/arm64/kernel/kvm-uclamp.c:47:16: error: 'kvm_arch_uclamp_support' undeclared (first use in this function); did you mean 'kvm_arch_uclamp_supported'?
      47 |         return kvm_arch_uclamp_support == KVM_UCLAMP_SUPPORTED;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                kvm_arch_uclamp_supported
   arch/arm64/kernel/kvm-uclamp.c:48:1: error: control reaches end of non-void function [-Werror=return-type]
      48 | }
         | ^
   cc1: some warnings being treated as errors


vim +26 arch/arm64/kernel/kvm-uclamp.c

    25	
  > 26	static int kvm_arch_uclamp_support __ro_after_init;
    27	/* Store per-vcpu current uclamp values */
    28	static DEFINE_PER_CPU(struct uclamp_value, current_uclamp);
    29	
    30	static int __init kvm_arch_uclamp_init(void)
    31	{
    32		int ret;
    33	
    34		/* Check whether the host supports this service at first. */
    35		ret = kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_UCLAMP);
    36		if (ret <= 0)
  > 37			kvm_arch_uclamp_support = KVM_UCLAMP_UNSUPPORTED;
    38		else
    39			kvm_arch_uclamp_support = KVM_UCLAMP_SUPPORTED;
    40	
    41		return 0;
    42	}
    43	late_initcall(kvm_arch_uclamp_init);
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
