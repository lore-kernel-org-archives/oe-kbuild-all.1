Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2345381D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0xYz6VJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700848270; x=1732384270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSCO0rXiu6vmrybMB0uzfyyqBEES+EI/93rB5z+Gal4=;
  b=W0xYz6VJhB5DzLgAy7PcqI6PXsAlQ0eTKsu9MDFTjsZxijXuTRk+YVPU
   KVhKn+jUEnnSN4GRKQQ5uQkYsVJpm5g9bxz0GDbYSFDk5rtT4+osI5i8I
   Ra030xt8Vrf0JhO6nf2DhLDCREhgOrogRVFKsuZq8qqoGQpHwTfO+pABQ
   cSrp3YoXj4sZz1jmO1cYz8WHlUCAAs693kQ5Y0AoGtJliaaqKqNjZeqLG
   lK3qKN29Yez6u8Fes8nV5vUd3f+DxWjNWOe8IP6RYkXlsx0VZzyWmxdp7
   bp5PemmfnfiTsck9Y1rXZ3oyHGNJ1nppiFGg0rrPaIAHcg2fMAAN/CSBB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11131022"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="11131022"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 09:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="885327347"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="885327347"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 09:51:07 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6aKX-000396-20;
	Fri, 24 Nov 2023 17:51:05 +0000
Date: Sat, 25 Nov 2023 01:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 198/533] arch/arm64/kvm/arm.c:2213:
 warning: expecting prototype for Initialize Hyp(). Prototype was for
 kvm_arm_init() instead
Message-ID: <202311250045.rZ0LzIF5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   5c22706462d999f1a36267fd01d98e50ecbccb77
commit: 3872ab282d857962e2a286d34942798e599a9e48 [198/533] UPSTREAM: KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231125/202311250045.rZ0LzIF5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250045.rZ0LzIF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250045.rZ0LzIF5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/arm.c:138: warning: Function parameter or member 'type' not described in 'kvm_arch_init_vm'
   arch/arm64/kvm/arm.c:1940: warning: expecting prototype for Inits Hyp(). Prototype was for init_hyp_mode() instead
>> arch/arm64/kvm/arm.c:2213: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead


vim +2213 arch/arm64/kvm/arm.c

2412405b3141cf virt/kvm/arm/arm.c   Eric Auger          2017-10-27  2208  
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2209  /**
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2210   * Initialize Hyp-mode and memory mappings on all CPUs.
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2211   */
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2212  int kvm_arm_init(void)
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20 @2213  {
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2214  	int err;
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2215  	bool in_hyp_mode;
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2216  
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2217  	if (!is_hyp_mode_available()) {
58d0d19a204604 virt/kvm/arm/arm.c   Ard Biesheuvel      2017-11-28  2218  		kvm_info("HYP mode not available\n");
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2219  		return -ENODEV;
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2220  	}
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2221  
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2222  	if (kvm_get_mode() == KVM_MODE_NONE) {
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2223  		kvm_info("KVM disabled from command line\n");
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2224  		return -ENODEV;
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2225  	}
b6a68b97af23cc arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2226  
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2227  	err = kvm_sys_reg_table_init();
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2228  	if (err) {
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2229  		kvm_info("Error initializing system register tables");
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2230  		return err;
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2231  	}
f1f0c0cfeaa7c1 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2232  
33e5f4e50917c2 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2233  	in_hyp_mode = is_kernel_in_hyp_mode();
33e5f4e50917c2 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2234  
96d389ca10110d arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2235  	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
96d389ca10110d arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2236  	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
abf532cceaca9c arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2237  		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
abf532cceaca9c arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2238  			 "Only trusted guests should be used on this system.\n");
abf532cceaca9c arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2239  
bf249d9e362f10 arch/arm64/kvm/arm.c Anshuman Khandual   2021-08-12  2240  	err = kvm_set_ipa_limit();
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2241  	if (err)
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2242  		return err;
8146875de7d47c arch/arm/kvm/arm.c   Srivatsa S. Bhat    2014-03-18  2243  
a3be836df7cb77 virt/kvm/arm/arm.c   Dave Martin         2019-04-12  2244  	err = kvm_arm_init_sve();
0f062bfe36b63c virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2245  	if (err)
0f062bfe36b63c virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2246  		return err;
0f062bfe36b63c virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2247  
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2248  	err = kvm_arm_vmid_alloc_init();
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2249  	if (err) {
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2250  		kvm_err("Failed to initialize VMID allocator.\n");
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2251  		return err;
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2252  	}
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2253  
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2254  	if (!in_hyp_mode) {
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2255  		err = init_hyp_mode();
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2256  		if (err)
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2257  			goto out_err;
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2258  	}
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2259  
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2260  	err = kvm_init_vector_slots();
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2261  	if (err) {
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2262  		kvm_err("Cannot initialise vector slots\n");
012ffdd5715728 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2263  		goto out_hyp;
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2264  	}
b881cdce77b48b arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2265  
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2266  	err = init_subsystems();
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2267  	if (err)
97402725774a47 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2268  		goto out_hyp;
1fcf7ce0c60213 arch/arm/kvm/arm.c   Lorenzo Pieralisi   2013-08-05  2269  
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2270  	if (!in_hyp_mode) {
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2271  		err = finalize_hyp_mode();
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2272  		if (err) {
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2273  			kvm_err("Failed to finalize Hyp protection\n");
012ffdd5715728 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2274  			goto out_subs;
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2275  		}
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2276  	}
bfa79a805454f7 arch/arm64/kvm/arm.c Quentin Perret      2021-03-19  2277  
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2278  	if (is_protected_kvm_enabled()) {
3eb681fba2bf8b arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2279  		kvm_info("Protected nVHE mode initialized successfully\n");
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2280  	} else if (in_hyp_mode) {
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2281  		kvm_info("VHE mode initialized successfully\n");
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2282  	} else {
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2283  		kvm_info("Hyp mode initialized successfully\n");
f19f6644a5433c arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2284  	}
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2285  
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2286  	/*
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2287  	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2288  	 * hypervisor protection is finalized.
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2289  	 */
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2290  	err = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2291  	if (err)
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2292  		goto out_subs;
3872ab282d8579 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2293  
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2294  	return 0;
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2295  
012ffdd5715728 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2296  out_subs:
97402725774a47 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2297  	teardown_subsystems();
012ffdd5715728 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2298  out_hyp:
fe7d7b03c61f6d virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2299  	if (!in_hyp_mode)
1e947bad0b63b3 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2300  		teardown_hyp_mode();
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2301  out_err:
3248136b3637e1 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2302  	kvm_arm_vmid_alloc_free();
342cd0ab0e6ca3 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2303  	return err;
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2304  }
749cf76c5a363e arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2305  

:::::: The code at line 2213 was first introduced by commit
:::::: 749cf76c5a363e1383108a914ea09530bfa0bd43 KVM: ARM: Initial skeleton to compile KVM support

:::::: TO: Christoffer Dall <c.dall@virtualopensystems.com>
:::::: CC: Christoffer Dall <c.dall@virtualopensystems.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
