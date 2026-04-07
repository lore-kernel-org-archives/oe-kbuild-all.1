Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844D3750B2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534009; cv=none; b=dvwxGEojPLBecPzcUYI1c3QgbqE124rSBS53RvL6Cgcw0HkCL+Rznh/1M2TE7EQd/9qW2C/tMifM6I6TyUT/nzUNLngG5Vk0g6XgrSiSvyQHkq+hxmoVf1X4TjLleJpGGnKdET+yUl27/zk7SIU9r6NM3aEQfQ2yK02983zWDP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534009; c=relaxed/simple;
	bh=GMn1nB4MyIgPwXf7kX54CWkoChVnPuDwhEcFuG7IGmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nyi7XlTwSQ56NQJ7SuHCm51XRJqp2a3Tq7JFsxY9A+5CbGe0x28uXOLSVUxNMY0rhLvHTzTwT2FS17+20yVpB3oHwm+q1P/EyrYjUHbBfv5ZyETBI0wsoEQx+9n0upzaKeK8pAd/6up7pX/1wUFbkoX5YtvnfYlrKL4+Ela4hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l06OrDGS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l06OrDGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534008; x=1807070008;
  h=date:from:to:cc:subject:message-id;
  bh=GMn1nB4MyIgPwXf7kX54CWkoChVnPuDwhEcFuG7IGmk=;
  b=l06OrDGS0XZnerESSsC7OFWGCvF6SXAi3SK9abI3uhVRV0GCzOeQ5dWl
   Q4i/qeyURAR0LFdqQRbqTRwubHJ/pWo9YGg0JsAJQktr4kWU7p+ftgZOF
   zof2YTNvfr3xlekYcJ3Iq5AXI2xmnnSzIM7vrHtARzVzyZuuKCTzUN1yI
   td22Auv9rk6RdGJodqxQRs3uvlNOLbPIV0G/2J2B07aRVE6lmMqU254bN
   DvpIo6kOo5IJFToppiMOxGLDR/RwfJ7tpc/7rkA9jaaForyAmFnyO6Kgu
   5tx4I/vEYQqnWdn7nOmwqRaAyKG/6USzD5YL53t5NPH3tUUFZZSdovGyd
   g==;
X-CSE-ConnectionGUID: dEgkfTK1TPqcB9Yi5dueVg==
X-CSE-MsgGUID: sbf6mRFASjC5NYG6+X/fag==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781619"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:26 -0700
X-CSE-ConnectionGUID: K18mjtqVSEulBlfBDc1yaA==
X-CSE-MsgGUID: 68YoSogWQTCTPEJ6IePMpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303581"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003F-2enS;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 38/38]
 drivers/iommu/intel/iommu.c:939:40: warning: 'struct pkvm_memcache' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202604041036.wn1Euf01-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   80789ec92e27cff976d5fc1f92a536be1bb3b14c
commit: a50249ddd81d8447488e9ad265fe0a99880dcea0 [38/38] ANDROID: iommu/vt-d: Paravirtualize domain pagetable management
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260404/202604041036.wn1Euf01-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041036.wn1Euf01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041036.wn1Euf01-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_domain_param'
     326 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:326:17: note: in expansion of macro 'memset'
     326 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_domain_free':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_domain_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:66:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      66 |         return pkvm_iommu_hypercall(iommu_domain_free, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_domain_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:66:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      66 |         return pkvm_iommu_hypercall(iommu_domain_free, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_domain_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:66:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      66 |         return pkvm_iommu_hypercall(iommu_domain_free, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_domain_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:66:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      66 |         return pkvm_iommu_hypercall(iommu_domain_free, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_domain_param'
     326 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:326:17: note: in expansion of macro 'memset'
     326 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:66:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      66 |         return pkvm_iommu_hypercall(iommu_domain_free, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_map_pages':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_iommu_map_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:72:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      72 |         return pkvm_iommu_hypercall(iommu_map_pages, iommu_map_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_iommu_map_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:72:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      72 |         return pkvm_iommu_hypercall(iommu_map_pages, iommu_map_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_iommu_map_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:72:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      72 |         return pkvm_iommu_hypercall(iommu_map_pages, iommu_map_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_iommu_map_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:72:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      72 |         return pkvm_iommu_hypercall(iommu_map_pages, iommu_map_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_iommu_map_param'
     326 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:326:17: note: in expansion of macro 'memset'
     326 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:72:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      72 |         return pkvm_iommu_hypercall(iommu_map_pages, iommu_map_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: At top level:
>> drivers/iommu/intel/iommu.c:939:40: warning: 'struct pkvm_memcache' declared inside parameter list will not be visible outside of this definition or declaration
     939 | static int fill_domain_memcache(struct pkvm_memcache *mc, unsigned long nr_pages,
         |                                        ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'fill_domain_memcache':
   drivers/iommu/intel/iommu.c:947:16: error: implicit declaration of function '__topup_pkvm_memcache' [-Wimplicit-function-declaration]
     947 |         return __topup_pkvm_memcache(mc, nr_pages, domain_mc_alloc_fn,
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: At top level:
   drivers/iommu/intel/iommu.c:951:41: warning: 'struct pkvm_memcache' declared inside parameter list will not be visible outside of this definition or declaration
     951 | static void free_domain_memcache(struct pkvm_memcache *mc)
         |                                         ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'free_domain_memcache':
   drivers/iommu/intel/iommu.c:953:9: error: implicit declaration of function '__free_pkvm_memcache' [-Wimplicit-function-declaration]
     953 |         __free_pkvm_memcache(mc, domain_mc_free_fn, host_va, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'pv_domain_free':
   drivers/iommu/intel/iommu.c:1436:16: error: variable 'param' has initializer but incomplete type
    1436 |         struct pkvm_domain_param param = {
         |                ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1437:18: error: 'struct pkvm_domain_param' has no member named 'pgd_gpa'
    1437 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~
   In file included from include/linux/kexec.h:20:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1437:28: note: in expansion of macro 'virt_to_phys'
    1437 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1437:28: note: in expansion of macro 'virt_to_phys'
    1437 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1436:34: error: storage size of 'param' isn't known
    1436 |         struct pkvm_domain_param param = {
         |                                  ^~~~~
   drivers/iommu/intel/iommu.c:1436:34: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_mapping':
   drivers/iommu/intel/iommu.c:1528:16: error: variable 'param' has initializer but incomplete type
    1528 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1529:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    1529 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1529:25: warning: excess elements in struct initializer
    1529 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:1529:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1530:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    1530 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:20:
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1530:24: note: in expansion of macro 'PCI_DEVID'
    1530 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1530:24: note: in expansion of macro 'PCI_DEVID'
    1530 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1531:18: error: 'struct pkvm_lm_context_param' has no member named 'domain_pgd_gpa'
    1531 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1531:35: note: in expansion of macro 'virt_to_phys'
    1531 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1531:35: note: in expansion of macro 'virt_to_phys'
    1531 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1532:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    1532 |                 .did = domain_id_iommu(domain, iommu),
         |                  ^~~
   drivers/iommu/intel/iommu.c:1532:24: warning: excess elements in struct initializer
    1532 |                 .did = domain_id_iommu(domain, iommu),
         |                        ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1532:24: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1533:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_supported'
    1533 |                 .ats_supported = info ? info->ats_supported : 0,
         |                  ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1533:34: warning: excess elements in struct initializer
    1533 |                 .ats_supported = info ? info->ats_supported : 0,
         |                                  ^~~~
   drivers/iommu/intel/iommu.c:1533:34: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1534:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_qdep'
    1534 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1534:29: warning: excess elements in struct initializer
    1534 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~


vim +939 drivers/iommu/intel/iommu.c

   938	
 > 939	static int fill_domain_memcache(struct pkvm_memcache *mc, unsigned long nr_pages,
   940					int nid, gfp_t gfp)
   941	{
   942		struct mc_alloc_arg arg = {
   943			.nid = nid,
   944			.gfp = gfp
   945		};
   946	
   947		return __topup_pkvm_memcache(mc, nr_pages, domain_mc_alloc_fn,
   948					     host_pa, &arg);
   949	}
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
