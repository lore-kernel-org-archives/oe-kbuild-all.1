Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A943364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681281558; x=1712817558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQP2oXk5Sm8p4VcE0sUCBP7KZT5JGvMOFH7kyy0v1HM=;
  b=BBNt8ycKGrcsi1Ta2Sllea5Y2TKq9oAiLAF5i6h2DN+hVadw5u/6tJTx
   Bs03s01IWUOVYka7P+heqUOh76IHR8dm7I7TMN6bhHZSNUvhg0geR0xl0
   qIV7Qfpomr42ooI5ej4hn3qV5E9tfl2OHIXZE3H2R0+gbMBu+H63sy8eO
   YYChg+kStyxJa0QYUdgwFVJtkPXldeVUAp8agPneHkPLjGjZiQIAsfWuM
   WkDxsgi8D8qGyWpkyx5BfW7Aj33H/bKhDPI8mBU3linmawL+uaWdArrkx
   5v+x0idKBKX1HYLMyXMFF/lbF38Zh2+vEyVTRVXEwKlyjSkdor3NxJ2yy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406645543"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="406645543"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 23:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018629311"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="1018629311"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 23:38:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmU89-000XOH-2S;
	Wed, 12 Apr 2023 06:38:57 +0000
Date: Wed, 12 Apr 2023 14:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 32/32]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:13: warning: no previous
 prototype for 'kvm_arch_mmu_clear_young_walk'
Message-ID: <202304121442.kBJearXk-lkp@intel.com>
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
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230412/202304121442.kBJearXk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 902b2879dd3118da604138e10829d7d7b5cec89d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/ virt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121442.kBJearXk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:651:13: warning: no previous prototype for 'kvm_arch_mmu_clear_young_walk' [-Wmissing-prototypes]
     651 | __weak void kvm_arch_mmu_clear_young_walk(struct kvm *kvm,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/x86/kvm/mmu/mmu.c:6183:6: warning: no previous prototype for 'kvm_arch_mmu_clear_young_walk' [-Wmissing-prototypes]
    6183 | void kvm_arch_mmu_clear_young_walk(struct kvm *kvm, struct mmu_notifier_walk *walk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
