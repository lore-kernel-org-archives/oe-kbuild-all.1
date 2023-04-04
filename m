Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9FC964
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680637434; x=1712173434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkBrlhLNUEn9VSmqzsjPakm7w1hg7dYvtd/+QtcOd04=;
  b=SWLoQQFFo0Cc6pHFtnwSb1oQEc1VC4W9zp/QIqMej0rQfSvwZtoLc//j
   HCE6N4OtXs4R4QeaW3HmiXpXMpZbfN8GWQgyV0ROqGAyFLnhPvF/nFUhp
   pjOLNaC+QQVhaCNYGaLm39VNHW3MJEZDppzensZCf1wii4kkp6+znRnv8
   Otzn5vcl+cBQbelho8S74xmcgB47DsRtn5+Avvztfjx0cd+3L1fE0zqUY
   tYyeJCmkE9F8nf1CmOOGi4/3JkK4xfedIcmmO02tVo589M5K+JpA4Gixt
   vacH+RLmTdA9JAaoo9616cOWXHDBib6PRBn5RkIJvXN1ln71fogqCnryI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343997840"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="343997840"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 12:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775768598"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="775768598"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 12:43:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjmZ9-000Pzm-2i;
	Tue, 04 Apr 2023 19:43:39 +0000
Date: Wed, 5 Apr 2023 03:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_aia_csr_v4 18/19] arch/riscv/kvm/aia.c:66:75:
 error: expected ')' before 'return'
Message-ID: <202304050359.Y9W2RtDx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_csr_v4
head:   88896407b9a3a032b2901bb856db409752cd68fc
commit: 13640395e0a8b6d2acfc177c4bdcb69ba09b6eef [18/19] RISC-V: KVM: Virtualize per-HART AIA CSRs
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230405/202304050359.Y9W2RtDx-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/13640395e0a8b6d2acfc177c4bdcb69ba09b6eef
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_csr_v4
        git checkout 13640395e0a8b6d2acfc177c4bdcb69ba09b6eef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050359.Y9W2RtDx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/aia.c: In function 'kvm_riscv_vcpu_aia_has_interrupts':
>> arch/riscv/kvm/aia.c:66:75: error: expected ')' before 'return'
      66 |             (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask))
         |                                                                           ^
         |                                                                           )
      67 |                 return true;
         |                 ~~~~~~                                                     
   arch/riscv/kvm/aia.c:65:12: note: to match this '('
      65 |         if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
         |            ^
>> arch/riscv/kvm/aia.c:78:1: error: expected expression before '}' token
      78 | }
         | ^
   arch/riscv/kvm/aia.c:59:23: warning: unused variable 'seip' [-Wunused-variable]
      59 |         unsigned long seip;
         |                       ^~~~
   arch/riscv/kvm/aia.c:78:1: error: control reaches end of non-void function [-Werror=return-type]
      78 | }
         | ^
   cc1: some warnings being treated as errors


vim +66 arch/riscv/kvm/aia.c

    56	
    57	bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
    58	{
    59		unsigned long seip;
    60	
    61		if (!kvm_riscv_aia_available())
    62			return false;
    63	
    64	#ifdef CONFIG_32BIT
    65		if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
  > 66		    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask))
    67			return true;
    68	#endif
    69	
    70		seip = vcpu->arch.guest_csr.vsie;
    71		seip &= (unsigned long)mask;
    72		seip &= BIT(IRQ_S_EXT);
    73	
    74		if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
    75			return false;
    76	
    77		return false;
  > 78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
