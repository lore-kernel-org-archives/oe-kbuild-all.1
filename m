Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16920F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 05:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679635173; x=1711171173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lh+wuWBQzxBsgAn/RD1Qur1QJ+JuVFaf6s3oaJoIkSQ=;
  b=gH+sdIc/ryKwGgsrY2qJDW+e1/JVtsdLn9IHC2d8cTDVD6AAhlELebnJ
   eSx4OVIquIj/MYgHAS1KpCE6cfWNEupbGwGu++wJZFGyetNlulIettrJn
   9kVkRzsEhiRizELz/66IHhNKVMO7ivetk3APFUCa7vz91GMS9JAkpuclV
   5zE5SyL+IAzuRXt1e/JLS65TTBe20p6QNsxg176/+Lkrsfgg43IYeMVXv
   kElX5IARkxb13pxltFnieZRl9Bq0d/z1ZvLy/lxIU9eEjWvtq7QRqAmE1
   6dzx45anD+t9JDK1I2z2yxzdBvvFUo2UZO5tRzVp7naG6PNRUqu/cQVoa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339728031"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="339728031"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 22:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="676005005"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="676005005"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2023 22:19:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfZpM-000F0W-0i;
	Fri, 24 Mar 2023 05:19:00 +0000
Date: Fri, 24 Mar 2023 13:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-arcvm 20/42]
 arch/arm64/kernel/kvm-uclamp.c:26:36: error: expected '=', ',', ';', 'asm'
 or '__attribute__' before '__ro_after_init'
Message-ID: <202303241318.9QN16LoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   7ff20e76d8b2c2bb8e7c210cb2644d34ce1cfe8b
commit: e6d9e3afd83522329ee34169e9169077a72ee97f [20/42] CHROMIUM: KVM: sched: Use KVM uclamp hypercall if available
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230324/202303241318.9QN16LoZ-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303241318.9QN16LoZ-lkp@intel.com/

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
