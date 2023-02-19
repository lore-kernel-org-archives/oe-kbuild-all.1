Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B3D624
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 01:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676771544; x=1708307544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uiBQOGmrsOFLzXwFkKwPMxu2RTU+db19+JoPP5swL90=;
  b=mb22VOdUi3ZL77LdT7pxM7zOqIey2AN1k7+qHN44b+tB8mRLTYpkrDw0
   KW3G9tyj/1VRSI4uR5mL3aUULk7zarYiZd2PdSdgtzHOdj/A6jOtRxCp8
   r+Sv9ONB2fXWXwLiQESMsU8tsOmamUKfUdj84fICpyFqaJ/8bQRm4lGIc
   /UEOG9Z0+pMcUOc9SBiJ/jQPHkZv246szaEyAClEetb8Ta65Z3lveFWfZ
   Qncjc5n8wUFWQHNi0KD7naZ4szso5es9eCvuMs8Lgju1gjE7GGVIZb9hx
   lSRcQHLk46eR0dE+IaayRNv656Kd5uO1eNde9u5La9xd28cbQVhwqa2hW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="334417337"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="334417337"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 17:52:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="620789514"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="620789514"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Feb 2023 17:52:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTYsH-000Cvh-1z;
	Sun, 19 Feb 2023 01:52:21 +0000
Date: Sun, 19 Feb 2023 09:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_v2 53/81] arch/riscv/kvm/tee.c:75:5:
 warning: no previous prototype for 'kvm_riscv_tee_hfence'
Message-ID: <202302190959.nMDqWTq3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux dev/atishp/kvm_aptee_v2
head:   d197b8d11a62173ef947c17d84ea53f73edf538c
commit: d6270e4098693cffe639ffa54804f9c568383ab8 [53/81] RISC-V: KVM: Add a skeleton TEE implementation
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230219/202302190959.nMDqWTq3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/d6270e4098693cffe639ffa54804f9c568383ab8
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_v2
        git checkout d6270e4098693cffe639ffa54804f9c568383ab8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190959.nMDqWTq3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/tee.c:75:5: warning: no previous prototype for 'kvm_riscv_tee_hfence' [-Wmissing-prototypes]
      75 | int kvm_riscv_tee_hfence(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kvm/tee.c:17:
   arch/riscv/include/asm/kvm_mmu.h:19:22: warning: 'gstage_mode' defined but not used [-Wunused-variable]
      19 | static unsigned long gstage_mode = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
         |                      ^~~~~~~~~~~


vim +/kvm_riscv_tee_hfence +75 arch/riscv/kvm/tee.c

    74	
  > 75	int kvm_riscv_tee_hfence(void)
    76	{
    77		int rc = sbi_teeh_tsm_global_fence();
    78	
    79		if (rc > 0) {
    80			kvm_err("global fence for TSM failed %d\n", rc);
    81			return rc;
    82		}
    83	
    84		/* Initiate local fence on each online hart */
    85		on_each_cpu(kvm_tee_local_fence, NULL, 1);
    86	
    87		return rc;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
