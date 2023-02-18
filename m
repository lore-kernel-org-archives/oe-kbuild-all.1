Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D552A4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676751615; x=1708287615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iNlJJlNm52gMEcw1mV9RaSu2wN1RaiBreXDW0D6KyCw=;
  b=B0zYNYFJJOOL5xrWL+2klXQz2aMvJ//4eCf23ZKWlgusMgTUDVkjsdEc
   iZrakZEQef260E/H8IdQbseYv7fNTkZxfiXmJbeiiOfW9JfCME1tg2qRx
   EfhAc+pzGSOlqLi2Pxi9HEyahgono13ayO0mKFR4oa1efY58gZxreCkQP
   Gc07DZN/JcUL/oMyQ9e8yTWqCC29MaRofNrF5RqDcbZpx5/moJ1eTrXWo
   vm6cQnLZSD5rPYqxR7FREy2rBxZvq1OHelJ7XRs0iwm6tgrwJB2BjF8oM
   EeiiCN/ZL5ujyJzHfAMe5NWPfefKHP+afnV0gsTSN/kPfrBBnSOsbnoZk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="311830872"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="311830872"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 12:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="794779145"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="794779145"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Feb 2023 12:20:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTTgq-000Chf-0C;
	Sat, 18 Feb 2023 20:20:12 +0000
Date: Sun, 19 Feb 2023 04:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_v2 57/81]
 arch/riscv/include/asm/kvm_tee.h:153:118: error: expected ';' before '}'
 token
Message-ID: <202302190445.FrwcuzG4-lkp@intel.com>
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
commit: 9c415dca740f4390418f4877731dfc7dfef874fa [57/81] RISC-V: KVM: Use the new VM IOCTL for measuring pages
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230219/202302190445.FrwcuzG4-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/9c415dca740f4390418f4877731dfc7dfef874fa
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_v2
        git checkout 9c415dca740f4390418f4877731dfc7dfef874fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190445.FrwcuzG4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/vm.c:14:
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vm_measure_pages':
>> arch/riscv/include/asm/kvm_tee.h:153:118: error: expected ';' before '}' token
     153 | static inline int kvm_riscv_tee_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_tee_measure_region *mr) {return -1};
         |                                                                                                                      ^
         |                                                                                                                      ;


vim +153 arch/riscv/include/asm/kvm_tee.h

d6270e4098693c Atish Patra 2022-12-22  146  
d6270e4098693c Atish Patra 2022-12-22  147  /* TVM VCPU related functions */
d6270e4098693c Atish Patra 2022-12-22  148  static inline void kvm_riscv_tee_vcpu_destroy(struct kvm_vcpu *vcpu) {}
d6270e4098693c Atish Patra 2022-12-22  149  static inline int kvm_riscv_tee_vcpu_init(struct kvm_vcpu *vcpu) {return -1;}
d6270e4098693c Atish Patra 2022-12-22  150  static inline void kvm_riscv_tee_vcpu_load(struct kvm_vcpu *vcpu) {}
d6270e4098693c Atish Patra 2022-12-22  151  static inline void kvm_riscv_tee_vcpu_put(struct kvm_vcpu *vcpu) {}
d6270e4098693c Atish Patra 2022-12-22  152  static inline void kvm_riscv_tee_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
36bdc0e747e23a Atish Patra 2023-01-18 @153  static inline int kvm_riscv_tee_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_tee_measure_region *mr) {return -1};
d6270e4098693c Atish Patra 2022-12-22  154  static inline int kvm_riscv_tee_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size) {return -1;};
d6270e4098693c Atish Patra 2022-12-22  155  static inline int kvm_riscv_tee_gstage_map(struct kvm_vcpu *vcpu,
d6270e4098693c Atish Patra 2022-12-22  156  					   gpa_t gpa, unsigned long hva) {return -1;}
d6270e4098693c Atish Patra 2022-12-22  157  #endif /* CONFIG_RISCV_TEE_VM */
d6270e4098693c Atish Patra 2022-12-22  158  

:::::: The code at line 153 was first introduced by commit
:::::: 36bdc0e747e23ad5d82761385ccc1bc930ed0067 RISC-V: KVM: Implement static memory region measurement

:::::: TO: Atish Patra <atishp@rivosinc.com>
:::::: CC: Atish Patra <atishp@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
