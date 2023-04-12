Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6717EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 06:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681282748; x=1712818748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfNhjrZrBRnDc8FHmFLMGlvXBXnSCsOi6Lmk7arrCek=;
  b=mm6HbZMB6u27XRUx6u5u7aJC9IUE5yYxUdcn1HXEauXCChSe8o3Waemf
   lBVo/QNPrIzqzlbfwponhD0OVXow0Lst7D7v3LiT9tvnjzkYuv0igbrYL
   gxAfK7Eeow/WfvKwN6Kd267OhSmhhWIRjE6bhNtT5og4ATX24M3EmejWn
   4UdvzkbNleRX4uiEdo4JXk5d2Gki2eYc8qRE9cVh4PSDVrG+vDTehWm0m
   qHsvV1Wz9MHY/mjumrNq3z0vSP+qcbyujkd5hK2WNlnY50pjus1IovRNg
   L4PHRBdhK4jRNtYP2xdAovmj7jNxmeDwzQ5UyvDLOWDZ6bsLq+S4ChFE+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343825144"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="343825144"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 23:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666234851"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="666234851"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 23:59:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmURX-000XQT-04;
	Wed, 12 Apr 2023 06:58:59 +0000
Date: Wed, 12 Apr 2023 14:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 32/32]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:13: warning: no previous
 prototype for function 'kvm_arch_mmu_clear_young_walk'
Message-ID: <202304121402.Suteor0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   902b2879dd3118da604138e10829d7d7b5cec89d
commit: 902b2879dd3118da604138e10829d7d7b5cec89d [32/32] CHROMIUM: mm: multigenerational lru: scan kvm mmu pages
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230412/202304121402.Suteor0N-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 902b2879dd3118da604138e10829d7d7b5cec89d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/ virt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121402.Suteor0N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:13: warning: no previous prototype for function 'kvm_arch_mmu_clear_young_walk' [-Wmissing-prototypes]
   __weak void kvm_arch_mmu_clear_young_walk(struct kvm *kvm,
               ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak void kvm_arch_mmu_clear_young_walk(struct kvm *kvm,
          ^
          static 
   1 warning generated.
--
>> arch/x86/kvm/mmu/mmu.c:6183:6: warning: no previous prototype for function 'kvm_arch_mmu_clear_young_walk' [-Wmissing-prototypes]
   void kvm_arch_mmu_clear_young_walk(struct kvm *kvm, struct mmu_notifier_walk *walk)
        ^
   arch/x86/kvm/mmu/mmu.c:6183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_arch_mmu_clear_young_walk(struct kvm *kvm, struct mmu_notifier_walk *walk)
   ^
   static 
   1 warning generated.


vim +/kvm_arch_mmu_clear_young_walk +651 arch/x86/kvm/../../../virt/kvm/kvm_main.c

   650	
 > 651	__weak void kvm_arch_mmu_clear_young_walk(struct kvm *kvm,
   652						  struct mmu_notifier_walk *walk)
   653	{
   654	}
   655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
