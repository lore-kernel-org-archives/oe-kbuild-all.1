Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC25EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 05:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680930092; x=1712466092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3JTS/dtIwUc3LuRF8KYEe9XJQHT36l4ZqMClo6M3Ok=;
  b=V3MCkAvaNeGcWwK6vq0A9/eXqinVHjJjphNhBZuNSEN2J6JZRNuuwmDH
   x1uHQVue6uheLyduk/hbJGYyiVpCodSBk9zA6kzUY1ijDg0DsXLRbTa4v
   9Qwdb++ywEuig7qxXB1RcJJMj4yj0D1vjFvJVLKP/+qfeAwvC80W+N+e8
   rMaFD74Tfdz9B4LDXCmI+r4S6M7KzQlTQbk0rcm7oEXDPNOUcS+eOBa8u
   6D5ZP6rBiS5CPF14QEI889IC9Q45/2qY1Sm33Hc29iLsYe0pEulQ0axsM
   pMBvBMam1OBCvjgmUlcGDIf+CDo02P0q8YJvt3TAP5WhNiIDvbbTYan3F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327205606"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="327205606"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 22:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690234980"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="690234980"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 22:01:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl0he-000TLL-0y;
	Sat, 08 Apr 2023 05:01:30 +0000
Date: Sat, 8 Apr 2023 13:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 9/11] include/linux/kvm_host.h:2042:56:
 warning: 'struct kvm_gfn_range' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202304081228.MkSHYgdi-lkp@intel.com>
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
commit: 8fd22779d56182773a2eb013900642630b4631e2 [9/11] BACKPORT: FROMLIST: mm/kvm: add mmu_notifier_test_clear_young()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304081228.MkSHYgdi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 8fd22779d56182773a2eb013900642630b4631e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081228.MkSHYgdi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
>> include/linux/kvm_host.h:2042:56: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
    2042 | bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range,
         |                                                        ^~~~~~~~~~~~~
--
   In file included from arch/s390/kernel/asm-offsets.c:11:
>> include/linux/kvm_host.h:2042:56: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
    2042 | bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range,
         |                                                        ^~~~~~~~~~~~~


vim +2042 include/linux/kvm_host.h

  2041	
> 2042	bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range,
  2043				       gfn_t lsb_gfn, unsigned long *bitmap);
  2044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
