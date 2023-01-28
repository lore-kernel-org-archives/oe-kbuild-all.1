Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6F5CA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674911792; x=1706447792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyngPhYnO66Rg7DQotIMO1YTevGcBrNTT8wwIF8c0q0=;
  b=Il1nNaolMYDAArgnoCik46WhM1h6pItzBbMDJjPBhwGaMLvypksYaMNh
   qufNOhzQXiYDF0xmZ+uaIJFCydelhaSx6L7svTwJpydsNFwxrJWF9Z/Ds
   RmJ1hcLzYKe5/ophoKKa9bKOGsLBJSrsp1kzMdIfEGAAfke4OZUtYPTHm
   FK2EDzJdUC4vW+Pxo7rbddpYGLGxpXrKevOUaTC727dsinRnyeDn9DA6L
   nmajYrpj3st3efGHRzsHjwLxeMgMEKtCYGAQJ+EXI+w5U80hbIyV5CQ55
   Cj/R6Esb2akHyxW+G843f0YZ1vTLNRojUC90basDpLX0FAOj4Z+wrcnwJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="324983317"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="324983317"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 05:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="695857335"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="695857335"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2023 05:16:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLl4H-0000fh-2C;
	Sat, 28 Jan 2023 13:16:29 +0000
Date: Sat, 28 Jan 2023 21:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_v3 11/17] arch/riscv/kvm/vcpu_sbi_pmu.c:74:15:
 warning: no previous prototype for 'kvm_sbi_ext_pmu_probe'
Message-ID: <202301282157.72oHsWq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_v3
head:   2eec63451c917a6f806c432cc434e926b9314160
commit: 63a3885bcafd49eac3d844a4c51a50c722529bd2 [11/17] RISC-V: KVM: Add SBI PMU extension support
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230128/202301282157.72oHsWq1-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/63a3885bcafd49eac3d844a4c51a50c722529bd2
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_v3
        git checkout 63a3885bcafd49eac3d844a4c51a50c722529bd2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_sbi_pmu.c:74:15: warning: no previous prototype for 'kvm_sbi_ext_pmu_probe' [-Wmissing-prototypes]
      74 | unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
         |               ^~~~~~~~~~~~~~~~~~~~~


vim +/kvm_sbi_ext_pmu_probe +74 arch/riscv/kvm/vcpu_sbi_pmu.c

    73	
  > 74	unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
    75	{
    76		struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
    77	
    78		return kvpmu->init_done;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
