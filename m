Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C667F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 03:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXIw+Pf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702092170; x=1733628170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8hn+sZc8V+iWner9B+uBn4Eh865Ah1MS1AV4rKq1FM=;
  b=LXIw+Pf53XHbIDl3oo1Jshz0dJczvvR6AnQkQpybfCtpH/hk7GPK70Yn
   0X45EDCcWl8UqMc9G8SezLCiYgbB0rPwBecnkyKZ6RltOZpf3ozVWZEC5
   P+lPuahjKeVeGUONUXIMzAywZIwrg4VjBNwqvT2atC5FBxQCU9MEZZHNj
   sMGrkIfr7XEr0wPp4a7Lp/lfYjGNcFIogBnSgJAC9hsFalmxS2u5lVzRF
   W8g0FUq5OdxqbT6zbkdzzVfpO3Eh92NIPCHsOjfas9E8MzaW0K2r1Kmyk
   bCnb5adnq+aNCnQ+i9qZsbc9CupWQi0ThpnNOFNC3tFDMxNVPYFic/5mK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1575699"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1575699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 19:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="20312515"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Dec 2023 19:22:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBnvQ-000El3-3C;
	Sat, 09 Dec 2023 03:22:45 +0000
Date: Sat, 9 Dec 2023 11:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 20/42]
 arch/arm64/kernel/kvm-uclamp.c:48:1: warning: control reaches end of
 non-void function
Message-ID: <202312091126.SwfAyx7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   b26894471e7a8f8d1dc4c3c233e3e606540bbdd3
commit: e6d9e3afd83522329ee34169e9169077a72ee97f [20/42] CHROMIUM: KVM: sched: Use KVM uclamp hypercall if available
config: arm64-randconfig-003-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091126.SwfAyx7V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091126.SwfAyx7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091126.SwfAyx7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/kvm-uclamp.c:26:36: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ro_after_init'
      26 | static int kvm_arch_uclamp_support __ro_after_init;
         |                                    ^~~~~~~~~~~~~~~
   arch/arm64/kernel/kvm-uclamp.c: In function 'kvm_arch_uclamp_init':
   arch/arm64/kernel/kvm-uclamp.c:37:17: error: 'kvm_arch_uclamp_support' undeclared (first use in this function); did you mean 'kvm_arch_uclamp_supported'?
      37 |                 kvm_arch_uclamp_support = KVM_UCLAMP_UNSUPPORTED;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_arch_uclamp_supported
   arch/arm64/kernel/kvm-uclamp.c:37:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kernel/kvm-uclamp.c: In function 'kvm_arch_uclamp_supported':
   arch/arm64/kernel/kvm-uclamp.c:47:16: error: 'kvm_arch_uclamp_support' undeclared (first use in this function); did you mean 'kvm_arch_uclamp_supported'?
      47 |         return kvm_arch_uclamp_support == KVM_UCLAMP_SUPPORTED;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                kvm_arch_uclamp_supported
>> arch/arm64/kernel/kvm-uclamp.c:48:1: warning: control reaches end of non-void function [-Wreturn-type]
      48 | }
         | ^


vim +48 arch/arm64/kernel/kvm-uclamp.c

    44	
    45	bool kvm_arch_uclamp_supported(void)
    46	{
    47		return kvm_arch_uclamp_support == KVM_UCLAMP_SUPPORTED;
  > 48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
