Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A0153BED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878087; cv=none; b=F/KOTgZaUCiJoo7452je4w4/rVz9t7DOVBGl9WTYOVC6ce0VCRWE0Nf2+lZffNiIiomXJn0i7HS/aw4qYdMshnW6l4eehv1F5Z5RaTqUO3rng3QxkosFCB7SyjMgv0ic2kJUSrJ2rEqRgTrTsKlTjLuNtMfgfF9NUb7gtak0DNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878087; c=relaxed/simple;
	bh=Syx5PE/xmlizqhM9oZ/NJu5fD2tPRiyNG+OVj+NRFTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAZ/NXXEqDREiELXS6KuTu+F6+WgiPADp42chV71qhCrzNJb5MjMkWIZqpUHyzvRZZgCCaE9p/Tlyq94qQwHlb7/Yw9tBATq6ZiZl9cypfPG8qsNDaJD9fnPAkw7YBWbGlC8tdFaLQW203DZMWkc7KH4BLtuTjBvhYXRfuCmN94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKGSPH1m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKGSPH1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755878085; x=1787414085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Syx5PE/xmlizqhM9oZ/NJu5fD2tPRiyNG+OVj+NRFTk=;
  b=kKGSPH1mK13O8Jf8K0VXcA/Nkr29Fn1YWKG6GK6zHN+eqki86rIy93CV
   K4R8BQnbZPoRQ6pAYcKz48j0wl3+086jkrQl9hSMlHVF/Ys3/e/AbKwA4
   f2PdJn6JkaVfomsiG1l9EvjWoNgL1ALeNqhB8XGjurKz1nciLXeuLtZ4v
   dFaoAJez+fpkswpUKok2RV4X31VSqdF8YtNwrsrQ1cJq36QXiU1PEPM6v
   mA9e/w8xlEYNIbTRzPhEGngxmXDGPbWAuVEfnLyxPJXD9IR5cDySauSpp
   U5IA3HOFKcMTAf4vZSWjDKQb++0l6M+ipLRdzPmAaJKu8Hjk8anO1EU5M
   Q==;
X-CSE-ConnectionGUID: Yvj6oMaaSuKV0gPTjbTWqg==
X-CSE-MsgGUID: EyM4sDQ1SWe/XNlj17M8wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58284907"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58284907"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 08:54:45 -0700
X-CSE-ConnectionGUID: ecggh6oCQLKVQh85ZXrCTA==
X-CSE-MsgGUID: ifx3LmZZSfqmUJkwZauPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="174005844"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2025 08:54:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upU6D-000LUt-22;
	Fri, 22 Aug 2025 15:54:41 +0000
Date: Fri, 22 Aug 2025 23:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/iommu/intel/dmar.c:923:13: error: 'enable_pkvm' undeclared
Message-ID: <202508222305.Rgpt2kcu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3f8a5612f90e91c6acf0f22bb5fa67ad1ce1c1e4
commit: e1589c50414a0591b952c83d9ac4c07becafe0d3 [7/7] ANDROID: pkvm: x86: delay host iommu driver initialization after deprivilage
config: i386-buildonly-randconfig-004-20250822 (https://download.01.org/0day-ci/archive/20250822/202508222305.Rgpt2kcu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508222305.Rgpt2kcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508222305.Rgpt2kcu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/iommu/intel/dmar.c:19:
   drivers/iommu/intel/dmar.c: In function '__setup_iommu_init_hooks':
>> drivers/iommu/intel/dmar.c:923:13: error: 'enable_pkvm' undeclared (first use in this function)
     923 |         if (enable_pkvm) {
         |             ^~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/iommu/intel/dmar.c:923:9: note: in expansion of macro 'if'
     923 |         if (enable_pkvm) {
         |         ^~
   drivers/iommu/intel/dmar.c:923:13: note: each undeclared identifier is reported only once for each function it appears in
     923 |         if (enable_pkvm) {
         |             ^~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/iommu/intel/dmar.c:923:9: note: in expansion of macro 'if'
     923 |         if (enable_pkvm) {
         |         ^~
>> drivers/iommu/intel/dmar.c:924:37: error: variable 'kern_ops' has initializer but incomplete type
     924 |                 static const struct pkvm_iommu_driver kern_ops = {
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/dmar.c:925:26: error: 'const struct pkvm_iommu_driver' has no member named 'prepare_driver'
     925 |                         .prepare_driver = dmar_table_init,
         |                          ^~~~~~~~~~~~~~
>> drivers/iommu/intel/dmar.c:925:43: warning: excess elements in struct initializer
     925 |                         .prepare_driver = dmar_table_init,
         |                                           ^~~~~~~~~~~~~~~
   drivers/iommu/intel/dmar.c:925:43: note: (near initialization for 'kern_ops')
>> drivers/iommu/intel/dmar.c:926:26: error: 'const struct pkvm_iommu_driver' has no member named 'init_driver'
     926 |                         .init_driver = intel_iommu_init,
         |                          ^~~~~~~~~~~
   drivers/iommu/intel/dmar.c:926:40: warning: excess elements in struct initializer
     926 |                         .init_driver = intel_iommu_init,
         |                                        ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/dmar.c:926:40: note: (near initialization for 'kern_ops')
>> drivers/iommu/intel/dmar.c:924:55: error: storage size of 'kern_ops' isn't known
     924 |                 static const struct pkvm_iommu_driver kern_ops = {
         |                                                       ^~~~~~~~
>> drivers/iommu/intel/dmar.c:928:17: error: implicit declaration of function 'pkvm_iommu_register_driver'; did you mean 'pci_unregister_driver'? [-Werror=implicit-function-declaration]
     928 |                 pkvm_iommu_register_driver(&kern_ops);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pci_unregister_driver
>> drivers/iommu/intel/dmar.c:924:55: warning: unused variable 'kern_ops' [-Wunused-variable]
     924 |                 static const struct pkvm_iommu_driver kern_ops = {
         |                                                       ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/enable_pkvm +923 drivers/iommu/intel/dmar.c

   920	
   921	static inline void __setup_iommu_init_hooks(void)
   922	{
 > 923		if (enable_pkvm) {
 > 924			static const struct pkvm_iommu_driver kern_ops = {
 > 925				.prepare_driver = dmar_table_init,
 > 926				.init_driver = intel_iommu_init,
   927			};
 > 928			pkvm_iommu_register_driver(&kern_ops);
   929	
   930			/*
   931			 * iommu_init happens during pkvm initialization and hence
   932			 * this should be a nop here.
   933			 */
   934			x86_init.iommu.iommu_init = intel_iommu_init_nop;
   935		} else {
   936			x86_init.iommu.iommu_init = intel_iommu_init;
   937		}
   938		/*
   939		 * Set iommu_shutdown hook regardless of pkvm.
   940		 * pkvm won't get a chance to shutdown iommu cleanly
   941		 * on reboot as we don't reprivilege at reboot. So,
   942		 * let the host do it in its normal shutdown flow.
   943		 */
   944		x86_platform.iommu_shutdown = intel_iommu_shutdown;
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
