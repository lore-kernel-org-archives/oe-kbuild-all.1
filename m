Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA12117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676759780; x=1708295780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1spm4/EcyAZHsix/vZrsiv6OvbNGRFyzAEXxojx0U4s=;
  b=EscYI10cOlOmx/8A+pZ6EDDnNNmV4kNSJ3Agxs4VtzURnx0Z53kBhnDm
   sZsDYebcW4m8lc+kfwpZbRNYuEa/3gtvDVXhJyb4yTKNPlrvJFbb6D/F8
   UyX0pml9zmuPMWrBuwu5LQBGU62/D3a6UokRGxk1VKlwr+jVn+tDk8yuu
   aZqEUdWUD7bMxs+2QtfIXs+TlIG0SeAEd21I/3lRJXxdd/MmWEZ/vEjDM
   U5QI2VHXTCeM+bSgpO2W0YgXsu9WH+Vhsjm2q+X6gLVsLbT/UID1QYDKE
   ZI/6ZpxMhbf/T58/WnSJKRti5Hp57ImUIeHscAvYf4c58jzhv9O9K809U
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="312573486"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="312573486"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 14:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="664250593"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="664250593"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Feb 2023 14:36:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTVoW-000Cow-0O;
	Sat, 18 Feb 2023 22:36:16 +0000
Date: Sun, 19 Feb 2023 06:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_v2 74/81]
 arch/riscv/include/asm/kvm_tee.h:180:5: warning: no previous prototype for
 'kvm_riscv_tee_vcpu_imsic_rebind'
Message-ID: <202302190658.c6okw6Vd-lkp@intel.com>
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
commit: 605865f744d954076b8d6591ed15884839f61c99 [74/81] RISC-V: KVM: Add AIA support for TVMs
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230219/202302190658.c6okw6Vd-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/605865f744d954076b8d6591ed15884839f61c99
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_v2
        git checkout 605865f744d954076b8d6591ed15884839f61c99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190658.c6okw6Vd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kvm/main.c:16:
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vm_measure_pages':
   arch/riscv/include/asm/kvm_tee.h:171:118: error: expected ';' before '}' token
     171 | static inline int kvm_riscv_tee_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_tee_measure_region *mr) {return -1};
         |                                                                                                                      ^
         |                                                                                                                      ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_aia_init':
   arch/riscv/include/asm/kvm_tee.h:177:69: error: expected ';' before '}' token
     177 | static inline int kvm_riscv_tee_aia_init(struct kvm *kvm) {return -1};
         |                                                                     ^
         |                                                                     ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_inject_interrupt':
   arch/riscv/include/asm/kvm_tee.h:178:107: error: expected ';' before '}' token
     178 | static inline int kvm_riscv_tee_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid) {return -1};
         |                                                                                                           ^
         |                                                                                                           ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_unbind':
   arch/riscv/include/asm/kvm_tee.h:179:84: error: expected ';' before '}' token
     179 | static inline int kvm_riscv_tee_vcpu_imsic_unbind(struct kvm_vcpu *vcpu) {return -1};
         |                                                                                    ^
         |                                                                                    ;
   arch/riscv/include/asm/kvm_tee.h: At top level:
>> arch/riscv/include/asm/kvm_tee.h:180:5: warning: no previous prototype for 'kvm_riscv_tee_vcpu_imsic_rebind' [-Wmissing-prototypes]
     180 | int kvm_riscv_tee_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu) {return -1};
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_rebind':
   arch/riscv/include/asm/kvm_tee.h:180:84: error: expected ';' before '}' token
     180 | int kvm_riscv_tee_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu) {return -1};
         |                                                                                    ^
         |                                                                                    ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_bind':
   arch/riscv/include/asm/kvm_tee.h:181:108: error: expected ';' before '}' token
     181 | static inline int kvm_riscv_tee_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask) {return -1};
         |                                                                                                            ^
         |                                                                                                            ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_aia_claim_imsic':
   arch/riscv/include/asm/kvm_tee.h:183:10: error: expected ';' before '}' token
     183 | return -1};
         |          ^
         |          ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_aia_convert_imsic':
   arch/riscv/include/asm/kvm_tee.h:184:106: error: expected ';' before '}' token
     184 | static inline int kvm_riscv_tee_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa) {return -1};
         |                                                                                                          ^
         |                                                                                                          ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_addr':
   arch/riscv/include/asm/kvm_tee.h:185:82: error: expected ';' before '}' token
     185 | static inline int kvm_riscv_tee_vcpu_imsic_addr(struct kvm_vcpu *vcpu) {return -1};
         |                                                                                  ^
         |                                                                                  ;
--
   In file included from arch/riscv/kvm/aia.c:18:
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vm_measure_pages':
   arch/riscv/include/asm/kvm_tee.h:171:118: error: expected ';' before '}' token
     171 | static inline int kvm_riscv_tee_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_tee_measure_region *mr) {return -1};
         |                                                                                                                      ^
         |                                                                                                                      ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_aia_init':
   arch/riscv/include/asm/kvm_tee.h:177:69: error: expected ';' before '}' token
     177 | static inline int kvm_riscv_tee_aia_init(struct kvm *kvm) {return -1};
         |                                                                     ^
         |                                                                     ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_inject_interrupt':
   arch/riscv/include/asm/kvm_tee.h:178:107: error: expected ';' before '}' token
     178 | static inline int kvm_riscv_tee_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid) {return -1};
         |                                                                                                           ^
         |                                                                                                           ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_unbind':
   arch/riscv/include/asm/kvm_tee.h:179:84: error: expected ';' before '}' token
     179 | static inline int kvm_riscv_tee_vcpu_imsic_unbind(struct kvm_vcpu *vcpu) {return -1};
         |                                                                                    ^
         |                                                                                    ;
   arch/riscv/include/asm/kvm_tee.h: At top level:
>> arch/riscv/include/asm/kvm_tee.h:180:5: warning: no previous prototype for 'kvm_riscv_tee_vcpu_imsic_rebind' [-Wmissing-prototypes]
     180 | int kvm_riscv_tee_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu) {return -1};
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_rebind':
   arch/riscv/include/asm/kvm_tee.h:180:84: error: expected ';' before '}' token
     180 | int kvm_riscv_tee_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu) {return -1};
         |                                                                                    ^
         |                                                                                    ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_bind':
   arch/riscv/include/asm/kvm_tee.h:181:108: error: expected ';' before '}' token
     181 | static inline int kvm_riscv_tee_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask) {return -1};
         |                                                                                                            ^
         |                                                                                                            ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_aia_claim_imsic':
   arch/riscv/include/asm/kvm_tee.h:183:10: error: expected ';' before '}' token
     183 | return -1};
         |          ^
         |          ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_aia_convert_imsic':
   arch/riscv/include/asm/kvm_tee.h:184:106: error: expected ';' before '}' token
     184 | static inline int kvm_riscv_tee_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa) {return -1};
         |                                                                                                          ^
         |                                                                                                          ;
   arch/riscv/include/asm/kvm_tee.h: In function 'kvm_riscv_tee_vcpu_imsic_addr':
   arch/riscv/include/asm/kvm_tee.h:185:82: error: expected ';' before '}' token
     185 | static inline int kvm_riscv_tee_vcpu_imsic_addr(struct kvm_vcpu *vcpu) {return -1};
         |                                                                                  ^
         |                                                                                  ;
   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from arch/riscv/kvm/aia.c:11:
   arch/riscv/kvm/aia.c: In function 'kvm_riscv_aia_free_hgei':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:500:9: note: in expansion of macro 'printk'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:500:16: note: in expansion of macro 'KERN_ERR'
     500 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   include/linux/kvm_host.h:811:9: note: in expansion of macro 'pr_err'
     811 |         pr_err("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |         ^~~~~~
   arch/riscv/kvm/aia.c:472:25: note: in expansion of macro 'kvm_err'
     472 |                         kvm_err("Reclaim of imsic pa [%llx] failed for vcpu %d pcpu %d ret %d\n",
         |                         ^~~~~~~


vim +/kvm_riscv_tee_vcpu_imsic_rebind +180 arch/riscv/include/asm/kvm_tee.h

   164	
   165	/* TVM VCPU related functions */
   166	static inline void kvm_riscv_tee_vcpu_destroy(struct kvm_vcpu *vcpu) {}
   167	static inline int kvm_riscv_tee_vcpu_init(struct kvm_vcpu *vcpu) {return -1;}
   168	static inline void kvm_riscv_tee_vcpu_load(struct kvm_vcpu *vcpu) {}
   169	static inline void kvm_riscv_tee_vcpu_put(struct kvm_vcpu *vcpu) {}
   170	static inline void kvm_riscv_tee_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
   171	static inline int kvm_riscv_tee_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_tee_measure_region *mr) {return -1};
   172	static inline int kvm_riscv_tee_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size) {return -1;};
   173	static inline int kvm_riscv_tee_gstage_map(struct kvm_vcpu *vcpu,
   174						   gpa_t gpa, unsigned long hva) {return -1;}
   175	
   176	/* AIA related TEE functions */
   177	static inline int kvm_riscv_tee_aia_init(struct kvm *kvm) {return -1};
   178	static inline int kvm_riscv_tee_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid) {return -1};
 > 179	static inline int kvm_riscv_tee_vcpu_imsic_unbind(struct kvm_vcpu *vcpu) {return -1};
 > 180	int kvm_riscv_tee_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu) {return -1};
   181	static inline int kvm_riscv_tee_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask) {return -1};
   182	static inline int kvm_riscv_tee_aia_claim_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa) {
   183	return -1};
   184	static inline int kvm_riscv_tee_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa) {return -1};
   185	static inline int kvm_riscv_tee_vcpu_imsic_addr(struct kvm_vcpu *vcpu) {return -1};
   186	#endif /* CONFIG_RISCV_TEE_VM */
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
