Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A2643
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675075203; x=1706611203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KeznBxXhSJl4WKoIn5pVaZJP7P2atte3Imcj6Afm41k=;
  b=HpS1DzH4Bl+MjhpR2nQzWRhAwNYuWo7cIxhI/TBU4rlJKqAFayn+deB6
   YOXhzic60o2Q+LiR/+V6nEi7nu4+zD5Yonp2DXsO3DpJIoV1ysRs8ia1M
   1v1tmbLaxjsoXUrM1elMdMOj4vFANeqeY7S+v9hgP2sEY0Q++PR/DVrOL
   eaNXeGg/ffzWe5/yJsdoq2r8B8kK6eVRjYHCIGP8e5Is37NVFa4L6wRfj
   0vWeme7wi6cDVY9bHsTyzNMns4cyANhWAE3scil0dT/IgH79PGeVUTawZ
   nM5dthZxksWTIp9XBXdrGVtM4wdYHrDy581QcK2RnB28LdE7W79+D1lI7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327544501"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="327544501"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 02:40:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="666025899"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="666025899"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jan 2023 02:40:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMRZv-0003ZW-34;
	Mon, 30 Jan 2023 10:39:59 +0000
Date: Mon, 30 Jan 2023 18:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [linux-next:master 1434/9183] arch/arm64/kvm/arm.c:2211: warning:
 expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init()
 instead
Message-ID: <202301301801.y5O08tQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae0c77e1bc6963c67c6c09e8c72959fcb1ed8d5f
commit: 1dc0f02d53382a016e57fcd24a42f8f62bd02fd4 [1434/9183] KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
config: arm64-buildonly-randconfig-r005-20230130 (https://download.01.org/0day-ci/archive/20230130/202301301801.y5O08tQx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1dc0f02d53382a016e57fcd24a42f8f62bd02fd4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1dc0f02d53382a016e57fcd24a42f8f62bd02fd4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/arm.c:133: warning: Function parameter or member 'type' not described in 'kvm_arch_init_vm'
   arch/arm64/kvm/arm.c:1933: warning: expecting prototype for Inits Hyp(). Prototype was for init_hyp_mode() instead
>> arch/arm64/kvm/arm.c:2211: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead


vim +2211 arch/arm64/kvm/arm.c

2412405b3141cf virt/kvm/arm/arm.c   Eric Auger          2017-10-27  2206  
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2207  /**
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2208   * Initialize Hyp-mode and memory mappings on all CPUs.
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2209   */
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2210  int kvm_arm_init(void)
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20 @2211  {
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2212  	int err;
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2213  	bool in_hyp_mode;
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2214  
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2215  	if (!is_hyp_mode_available()) {
58d0d19a204604 virt/kvm/arm/arm.c   Ard Biesheuvel      2017-11-28  2216  		kvm_info("HYP mode not available\n");
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2217  		return -ENODEV;
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2218  	}
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2219  
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2220  	if (kvm_get_mode() == KVM_MODE_NONE) {
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2221  		kvm_info("KVM disabled from command line\n");
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2222  		return -ENODEV;
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2223  	}
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2224  
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2225  	err = kvm_sys_reg_table_init();
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2226  	if (err) {
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2227  		kvm_info("Error initializing system register tables");
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2228  		return err;
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2229  	}
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2230  
33e5f4e50917c2 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2231  	in_hyp_mode = is_kernel_in_hyp_mode();
33e5f4e50917c2 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2232  
96d389ca10110d arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2233  	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
96d389ca10110d arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2234  	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
abf532cceaca9c arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2235  		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
abf532cceaca9c arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2236  			 "Only trusted guests should be used on this system.\n");
abf532cceaca9c arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2237  
bf249d9e362f10 arch/arm64/kvm/arm.c Anshuman Khandual   2021-08-12  2238  	err = kvm_set_ipa_limit();
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2239  	if (err)
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2240  		return err;
8146875de7d47c arch/arm/kvm/arm.c   Srivatsa S. Bhat    2014-03-18  2241  
a3be836df7cb77 virt/kvm/arm/arm.c   Dave Martin         2019-04-12  2242  	err = kvm_arm_init_sve();
0f062bfe36b63c virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2243  	if (err)
0f062bfe36b63c virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2244  		return err;
0f062bfe36b63c virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2245  
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2246  	err = kvm_arm_vmid_alloc_init();
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2247  	if (err) {
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2248  		kvm_err("Failed to initialize VMID allocator.\n");
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2249  		return err;
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2250  	}
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2251  
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2252  	if (!in_hyp_mode) {
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2253  		err = init_hyp_mode();
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2254  		if (err)
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2255  			goto out_err;
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2256  	}
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2257  
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2258  	err = kvm_init_vector_slots();
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2259  	if (err) {
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2260  		kvm_err("Cannot initialise vector slots\n");
6baaeda878445d arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2261  		goto out_hyp;
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2262  	}
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2263  
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2264  	err = init_subsystems();
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2265  	if (err)
78b3bf485d5cb5 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2266  		goto out_hyp;
1fcf7ce0c60213 arch/arm/kvm/arm.c   Lorenzo Pieralisi   2013-08-05  2267  
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2268  	if (!in_hyp_mode) {
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2269  		err = finalize_hyp_mode();
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2270  		if (err) {
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2271  			kvm_err("Failed to finalize Hyp protection\n");
6baaeda878445d arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2272  			goto out_subs;
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2273  		}
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2274  	}
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2275  
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2276  	if (is_protected_kvm_enabled()) {
3eb681fba2bf8b arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2277  		kvm_info("Protected nVHE mode initialized successfully\n");
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2278  	} else if (in_hyp_mode) {
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2279  		kvm_info("VHE mode initialized successfully\n");
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2280  	} else {
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2281  		kvm_info("Hyp mode initialized successfully\n");
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2282  	}
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2283  
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2284  	/*
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2285  	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2286  	 * hypervisor protection is finalized.
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2287  	 */
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2288  	err = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2289  	if (err)
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2290  		goto out_subs;
1dc0f02d53382a arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2291  
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2292  	return 0;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2293  
6baaeda878445d arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2294  out_subs:
78b3bf485d5cb5 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2295  	teardown_subsystems();
6baaeda878445d arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2296  out_hyp:
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2297  	if (!in_hyp_mode)
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2298  		teardown_hyp_mode();
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2299  out_err:
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2300  	kvm_arm_vmid_alloc_free();
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2301  	return err;
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2302  }
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2303  

:::::: The code at line 2211 was first introduced by commit
:::::: 749cf76c5a363e1383108a914ea09530bfa0bd43 KVM: ARM: Initial skeleton to compile KVM support

:::::: TO: Christoffer Dall <c.dall@virtualopensystems.com>
:::::: CC: Christoffer Dall <c.dall@virtualopensystems.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
