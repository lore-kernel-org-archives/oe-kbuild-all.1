Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C90138C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681279079; x=1712815079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+b25UeO4QG1PnXtrlU3O4nmm1Re9Dgia1Wku8hT/oQQ=;
  b=N6iKlx67/U2RHv1/5YTTY2RXCP08XwBYwSw+OnxaQFs6oMzxih6chwir
   0kqjI0rtkTrL3hiLIvRsyke84ueR6xVAyMNEaJSkoSLXUIVDQEcmcjcK9
   Xuo+ga1OxpM/YDQU4xwolexTLV8ukJBX/7zRdxPWZtKBwZW1HAl8Mf3m5
   UbZoBJLLAEBBlvNEOzuGULx2yy9qPTp52+59wKLupT0pmzHCYjP1QIZXv
   cb17Md0FScAfVLkQAiKwjCSBQ4wm1i+TWSoJ+p8B+RbrPJ5FUwp5vRpi3
   DLACM2nqsqX23rPbGWaxtiSP2rwGMpc7g+Gdv6RzqW55Xq3FPp/t6BGsc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327918022"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="327918022"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 22:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="800184663"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="800184663"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2023 22:57:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmTUS-000XM7-23;
	Wed, 12 Apr 2023 05:57:56 +0000
Date: Wed, 12 Apr 2023 13:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 32/32]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:13: error: no previous
 prototype for 'kvm_arch_mmu_clear_young_walk'
Message-ID: <202304121355.SCuOe8M7-lkp@intel.com>
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
config: i386-randconfig-a013-20230410 (https://download.01.org/0day-ci/archive/20230412/202304121355.SCuOe8M7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 902b2879dd3118da604138e10829d7d7b5cec89d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121355.SCuOe8M7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:13: error: no previous prototype for 'kvm_arch_mmu_clear_young_walk' [-Werror=missing-prototypes]
     651 | __weak void kvm_arch_mmu_clear_young_walk(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/x86/kvm/mmu/mmu.c:6183:6: error: no previous prototype for 'kvm_arch_mmu_clear_young_walk' [-Werror=missing-prototypes]
    6183 | void kvm_arch_mmu_clear_young_walk(struct kvm *kvm, struct mmu_notifier_walk *walk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
