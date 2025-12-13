Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5720A72602
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765628201; cv=none; b=dVNMbZEgoN6RGQJ3MWavxBaBbEGKTiWoLrrTjchDUkeGRb6k/wuFOr+3XfL2z5s7a6Q0pWoV/7m2M3HCN+sONOiM0Fz11RtAy6pWYhyXzvDpBlrH1mECAHgB8L5Ha88WOSw+eQD07/KJ4e5TmhhlMhkndQEwjrnmBzgbbPqwptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765628201; c=relaxed/simple;
	bh=ekDKaNW9wl3NS+hjrtgXnhC7H1TW/5+yGQfm3TgAsHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1mS5RSmKnbAa2j/59ZFKg/he3GEBUsRuioulwCVCMZK+OSyaLp5GkE8e/eS+llRzxgdXPD/keqF6VpIOkeumuBI+6/NNMqkmeYvy6rM3L7D8GdRhJvDKqVx0AhajJ4rFAzY0T3KEWC2LRBD13l3qqXrjxfR9Kpx2ir+/A5Zky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEor93be; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEor93be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765628199; x=1797164199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekDKaNW9wl3NS+hjrtgXnhC7H1TW/5+yGQfm3TgAsHE=;
  b=jEor93be154rpUrODNGYPbiLN4estHMHO4yEk9PMPg3+qRNGG3ZQh5fj
   /A1p2LiXUz7cr2MDBpcSF6Y4BkX150e9TA/QYC3e4Uk4a5WBQZBLeHh4j
   XJhAQtM4dCuOul14WdbQf29ZzFsAT7reAtw/xj5IiVf+dt00NkoeYtJqu
   pKU9Bzja9KfiFfj7dyFTFf9iJ73JztRhL1oUC268Jjk7dVGnB5C1VkPDZ
   8vhhuXASgY3a2rIwSnZijlACZHc6o58RUfse6TFksKStd9jeaAMqbE4Qc
   5mjNKRa2rIxpKKEhEOEcte008KZF8zySKwNC0mbsHN7m8pmTKJ1hUeytF
   Q==;
X-CSE-ConnectionGUID: w00I3HOkRf6hMEhL8O223g==
X-CSE-MsgGUID: AvWmd58+RMyxSiZS6g3avg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78981082"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78981082"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:16:38 -0800
X-CSE-ConnectionGUID: lTXzClyIRzSUGIDn4jYnAQ==
X-CSE-MsgGUID: w5pIe8Z7SYq6iyvFBK77wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197063835"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 04:16:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOY7-000000007b7-1J3d;
	Sat, 13 Dec 2025 12:16:35 +0000
Date: Sat, 13 Dec 2025 20:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/iommu/intel/iommu.c:1475:18: error: 'struct pkvm_lm_context_param'
 has no member named 'ats_qdep'
Message-ID: <202512132021.KA2uz3AF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: da2da0badf05a4631edf06f9a37e822b20875663 [18/18] ANDROID: iommu/vt-d: Adapt to pkvm handling of cache flushing.
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512132021.KA2uz3AF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132021.KA2uz3AF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132021.KA2uz3AF-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_domain_alloc':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_domain_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_domain_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_domain_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_domain_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_domain_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'pv_context_mapping':
   drivers/iommu/intel/iommu.c:1469:16: error: variable 'param' has initializer but incomplete type
    1469 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1470:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    1470 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1470:25: warning: excess elements in struct initializer
    1470 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:1470:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1471:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    1471 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:20:
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1471:24: note: in expansion of macro 'PCI_DEVID'
    1471 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1471:24: note: in expansion of macro 'PCI_DEVID'
    1471 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1472:18: error: 'struct pkvm_lm_context_param' has no member named 'domain_pgd_gpa'
    1472 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/kexec.h:20,
                    from include/linux/crash_dump.h:5,
                    from drivers/iommu/intel/iommu.c:16:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1472:35: note: in expansion of macro 'virt_to_phys'
    1472 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1472:35: note: in expansion of macro 'virt_to_phys'
    1472 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1473:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    1473 |                 .did = domain_id_iommu(domain, iommu),
         |                  ^~~
   drivers/iommu/intel/iommu.c:1473:24: warning: excess elements in struct initializer
    1473 |                 .did = domain_id_iommu(domain, iommu),
         |                        ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1473:24: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1474:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_supported'
    1474 |                 .ats_supported = info ? info->ats_supported : 0,
         |                  ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1474:34: warning: excess elements in struct initializer
    1474 |                 .ats_supported = info ? info->ats_supported : 0,
         |                                  ^~~~
   drivers/iommu/intel/iommu.c:1474:34: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:1475:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_qdep'
    1475 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1475:29: warning: excess elements in struct initializer
    1475 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/iommu.c:1475:29: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1469:38: error: storage size of 'param' isn't known
    1469 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:1469:38: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_clear':
   drivers/iommu/intel/iommu.c:1754:16: error: variable 'param' has initializer but incomplete type
    1754 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1755:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
    1755 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1755:25: warning: excess elements in struct initializer
    1755 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1755:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1756:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
    1756 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1756:24: note: in expansion of macro 'PCI_DEVID'
    1756 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1756:24: note: in expansion of macro 'PCI_DEVID'
    1756 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1757:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
    1757 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1757:29: warning: excess elements in struct initializer
    1757 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/iommu.c:1757:29: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1754:45: error: storage size of 'param' isn't known
    1754 |         struct pkvm_clear_translation_param param = {
         |                                             ^~~~~
   drivers/iommu/intel/iommu.c:1754:45: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_paging_domain_alloc':
   drivers/iommu/intel/iommu.c:3313:16: error: variable 'param' has initializer but incomplete type
    3313 |         struct pkvm_domain_param param = {
         |                ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3314:18: error: 'struct pkvm_domain_param' has no member named 'phys'
    3314 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:3314:25: warning: excess elements in struct initializer
    3314 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:3314:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:3315:18: error: 'struct pkvm_domain_param' has no member named 'bdf'
    3315 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:3315:24: note: in expansion of macro 'PCI_DEVID'
    3315 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:3315:24: note: in expansion of macro 'PCI_DEVID'
    3315 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:3316:18: error: 'struct pkvm_domain_param' has no member named 'use_first_level'
    3316 |                 .use_first_level = domain->use_first_level,
         |                  ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3316:36: warning: excess elements in struct initializer
    3316 |                 .use_first_level = domain->use_first_level,
         |                                    ^~~~~~
   drivers/iommu/intel/iommu.c:3316:36: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:3317:18: error: 'struct pkvm_domain_param' has no member named 'pgd_gpa'
    3317 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3317:28: note: in expansion of macro 'virt_to_phys'
    3317 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3317:28: note: in expansion of macro 'virt_to_phys'
    3317 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3318:18: error: 'struct pkvm_domain_param' has no member named 'gaw'
    3318 |                 .gaw = domain->gaw,
         |                  ^~~
   drivers/iommu/intel/iommu.c:3318:24: warning: excess elements in struct initializer
    3318 |                 .gaw = domain->gaw,
--
   drivers/iommu/intel/pasid.c:246:18: error: 'struct pkvm_clear_translation_param' has no member named 'pasid'
     246 |                 .pasid = pasid,
         |                  ^~~~~
   drivers/iommu/intel/pasid.c:246:26: warning: excess elements in struct initializer
     246 |                 .pasid = pasid,
         |                          ^~~~~
   drivers/iommu/intel/pasid.c:246:26: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:247:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
     247 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/pasid.c:247:29: warning: excess elements in struct initializer
     247 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/pasid.c:247:29: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:243:45: error: storage size of 'param' isn't known
     243 |         struct pkvm_clear_translation_param param = {
         |                                             ^~~~~
   drivers/iommu/intel/pasid.c:243:45: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/pasid.c: In function 'pv_pasid_setup_first_level':
   drivers/iommu/intel/pasid.c:316:16: error: variable 'param' has initializer but incomplete type
     316 |         struct pkvm_pasid_table_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:317:18: error: 'struct pkvm_pasid_table_param' has no member named 'phys'
     317 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/pasid.c:317:25: warning: excess elements in struct initializer
     317 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/pasid.c:317:25: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:318:18: error: 'struct pkvm_pasid_table_param' has no member named 'bdf'
     318 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:318:24: note: in expansion of macro 'PCI_DEVID'
     318 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:318:24: note: in expansion of macro 'PCI_DEVID'
     318 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/pasid.c:319:18: error: 'struct pkvm_pasid_table_param' has no member named 'pasid'
     319 |                 .pasid = pasid,
         |                  ^~~~~
   drivers/iommu/intel/pasid.c:319:26: warning: excess elements in struct initializer
     319 |                 .pasid = pasid,
         |                          ^~~~~
   drivers/iommu/intel/pasid.c:319:26: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:320:18: error: 'struct pkvm_pasid_table_param' has no member named 'did'
     320 |                 .did = did,
         |                  ^~~
   drivers/iommu/intel/pasid.c:320:24: warning: excess elements in struct initializer
     320 |                 .did = did,
         |                        ^~~
   drivers/iommu/intel/pasid.c:320:24: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:321:18: error: 'struct pkvm_pasid_table_param' has no member named 'domain_pgd_gpa'
     321 |                 .domain_pgd_gpa = virt_to_phys(pgd),
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/io.h:14,
                    from include/acpi/acpi_io.h:5,
                    from include/linux/acpi.h:39,
                    from include/linux/dmar.h:12,
                    from drivers/iommu/intel/pasid.c:14:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:321:35: note: in expansion of macro 'virt_to_phys'
     321 |                 .domain_pgd_gpa = virt_to_phys(pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:321:35: note: in expansion of macro 'virt_to_phys'
     321 |                 .domain_pgd_gpa = virt_to_phys(pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:322:18: error: 'struct pkvm_pasid_table_param' has no member named 'pasid_dir_gpa'
     322 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                  ^~~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:322:34: note: in expansion of macro 'virt_to_phys'
     322 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                                  ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:322:34: note: in expansion of macro 'virt_to_phys'
     322 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                                  ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:323:18: error: 'struct pkvm_pasid_table_param' has no member named 'max_pasid'
     323 |                 .max_pasid = info->pasid_table->max_pasid,
         |                  ^~~~~~~~~
   drivers/iommu/intel/pasid.c:323:30: warning: excess elements in struct initializer
     323 |                 .max_pasid = info->pasid_table->max_pasid,
         |                              ^~~~
   drivers/iommu/intel/pasid.c:323:30: note: (near initialization for 'param')
>> drivers/iommu/intel/pasid.c:324:18: error: 'struct pkvm_pasid_table_param' has no member named 'ats_qdep'
     324 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/pasid.c:324:29: warning: excess elements in struct initializer
     324 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/pasid.c:324:29: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:316:39: error: storage size of 'param' isn't known
     316 |         struct pkvm_pasid_table_param param = {
         |                                       ^~~~~
   drivers/iommu/intel/pasid.c:316:39: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/pasid.c: In function 'pv_pasid_setup_second_level':
   drivers/iommu/intel/pasid.c:416:16: error: variable 'param' has initializer but incomplete type
     416 |         struct pkvm_pasid_table_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:417:18: error: 'struct pkvm_pasid_table_param' has no member named 'phys'
     417 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/pasid.c:417:25: warning: excess elements in struct initializer
     417 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/pasid.c:417:25: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:418:18: error: 'struct pkvm_pasid_table_param' has no member named 'bdf'
     418 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:418:24: note: in expansion of macro 'PCI_DEVID'
     418 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:418:24: note: in expansion of macro 'PCI_DEVID'
     418 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/pasid.c:419:18: error: 'struct pkvm_pasid_table_param' has no member named 'pasid'
     419 |                 .pasid = pasid,
         |                  ^~~~~
   drivers/iommu/intel/pasid.c:419:26: warning: excess elements in struct initializer
     419 |                 .pasid = pasid,
         |                          ^~~~~
   drivers/iommu/intel/pasid.c:419:26: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:420:18: error: 'struct pkvm_pasid_table_param' has no member named 'did'
     420 |                 .did = domain_id_iommu(domain, iommu),
         |                  ^~~
   drivers/iommu/intel/pasid.c:420:24: warning: excess elements in struct initializer
     420 |                 .did = domain_id_iommu(domain, iommu),
         |                        ^~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:420:24: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:421:18: error: 'struct pkvm_pasid_table_param' has no member named 'domain_pgd_gpa'
     421 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:421:35: note: in expansion of macro 'virt_to_phys'
     421 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:421:35: note: in expansion of macro 'virt_to_phys'
     421 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:422:18: error: 'struct pkvm_pasid_table_param' has no member named 'pasid_dir_gpa'
     422 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                  ^~~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:422:34: note: in expansion of macro 'virt_to_phys'
     422 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                                  ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:422:34: note: in expansion of macro 'virt_to_phys'
     422 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                                  ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:423:18: error: 'struct pkvm_pasid_table_param' has no member named 'max_pasid'
     423 |                 .max_pasid = info->pasid_table->max_pasid,
         |                  ^~~~~~~~~
   drivers/iommu/intel/pasid.c:423:30: warning: excess elements in struct initializer
     423 |                 .max_pasid = info->pasid_table->max_pasid,
         |                              ^~~~
   drivers/iommu/intel/pasid.c:423:30: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:424:18: error: 'struct pkvm_pasid_table_param' has no member named 'dirty_tracking'
     424 |                 .dirty_tracking = domain->dirty_tracking,
         |                  ^~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:424:35: warning: excess elements in struct initializer
     424 |                 .dirty_tracking = domain->dirty_tracking,
         |                                   ^~~~~~
   drivers/iommu/intel/pasid.c:424:35: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:425:18: error: 'struct pkvm_pasid_table_param' has no member named 'ats_qdep'
     425 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/pasid.c:425:29: warning: excess elements in struct initializer
     425 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~


vim +1475 drivers/iommu/intel/iommu.c

  1465	
  1466	static int pv_context_mapping(struct dmar_domain *domain, struct intel_iommu *iommu,
  1467				      struct device_domain_info *info, u8 bus, u8 devfn)
  1468	{
  1469		struct pkvm_lm_context_param param = {
  1470			.phys = iommu->reg_phys,
  1471			.bdf = PCI_DEVID(bus, devfn),
  1472			.domain_pgd_gpa = virt_to_phys(domain->pgd),
  1473			.did = domain_id_iommu(domain, iommu),
  1474			.ats_supported = info ? info->ats_supported : 0,
> 1475			.ats_qdep = info->ats_qdep,
  1476		};
  1477		int ret;
  1478	
  1479		spin_lock(&iommu->lock);
  1480		ret = pkvm_hc_iommu_set_lm_ce(&param);
  1481		if (ret == -ENOMEM) {
  1482			void *context = iommu_alloc_page_node(iommu->node, GFP_ATOMIC);
  1483	
  1484			if (!context) {
  1485				spin_unlock(&iommu->lock);
  1486				pr_err("%s: failed to allocate context page for iommu: %d\n",
  1487				       __func__, iommu->seq_id);
  1488				return -ENOMEM;
  1489			}
  1490			param.context_gpa = virt_to_phys(context);
  1491			ret = pkvm_hc_iommu_set_lm_ce(&param);
  1492	
  1493			/* Free the page if pkvm did not use it. */
  1494			if (param.context_gpa)
  1495				iommu_free_page(context);
  1496		}
  1497		spin_unlock(&iommu->lock);
  1498	
  1499		return ret;
  1500	}
  1501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
