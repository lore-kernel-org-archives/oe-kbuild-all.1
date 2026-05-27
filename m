Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4B2C0282
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860186; cv=none; b=tl+ET5UCj8FdVGCyL3qHQSgRTaUlWkLFfzIJmCRUb5Tc/81GAYH74dZOsBDHdZVprPQVVrcw1LcZGZAckNdPXvvs0QDQ60403oYkw07CY9yJlMaN45GmZgw0nP7x+M7Gk4ig4md2Q7ngldJJP+jPnGx/5cIUkSrJpY0Z0J2+t8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860186; c=relaxed/simple;
	bh=HnDT/dlsyNKAboRWZNoWFw21MTghFcqsaXTqATdim5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ucBbxFCYpy3abhe3/jHcP5XGsXZOR8ZDooThixaIqB3LbfADc3VWKhp/3QwHc6KtQ91TgkNqBEVqGQRaqSZ6VRVlV5x9zUdudLfqGMhEMkDMGUjWfSF5InTkp6Y1NeWR4JLqdaH+zciAJ+SQWcjs5AdoRxdOK6HkqB68w7EwSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmS8AxPg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmS8AxPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779860184; x=1811396184;
  h=date:from:to:cc:subject:message-id;
  bh=HnDT/dlsyNKAboRWZNoWFw21MTghFcqsaXTqATdim5E=;
  b=lmS8AxPgHjuRqR7KKHkS22cDknwJ1NiIa7rDX6Di4nOMdaVAE1orxq03
   YNu9bNzBTmzgkNZRWHp54vg1M/AqSLAnjunB8G+eR+DJXWoVajXuG7w3Y
   V5rp7Dopp8DeMilx17Hqef4zHhdLR8XXeeWeVN0NzbtJLQnpVJJHfCbVy
   anWs76MHC/9n2LvkZZhvOlLO9637p84jAd4lMFRjNAJIKguccnlpvt8Jo
   9GEcHq3eMA/59gFhZl3qYs/NdoSUegvkb6WM4UjQYtHniMOpKi7g9ih+S
   rhMtuuh909c2vMpqvnfzCsn3PSJJ+NG8Uav7jcbMIpatosLRvn3Dt0Aua
   g==;
X-CSE-ConnectionGUID: 0JLxNaatT6a82KadHVyp9w==
X-CSE-MsgGUID: +T/tpLJ4TDSMJBpZg+N9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91372935"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91372935"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 22:36:24 -0700
X-CSE-ConnectionGUID: KZkxCYDdR/yIF0eQTPAfPA==
X-CSE-MsgGUID: W4Ys5Ub/SSiQpue7LbpJGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="242296863"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2026 22:36:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS6wF-000000003Rm-0H3d;
	Wed, 27 May 2026 05:36:19 +0000
Date: Wed, 27 May 2026 13:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/28]
 drivers/iommu/intel/iommu.c:1464:18: error: 'struct pkvm_lm_context_param'
 has no member named 'ats_supported'
Message-ID: <202605271353.8yA1Tj4s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d82d1c962ed8d8ed693448d27aa42a88c54f438d
commit: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 [0/28] ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260527/202605271353.8yA1Tj4s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271353.8yA1Tj4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271353.8yA1Tj4s-lkp@intel.com/

All errors (new ones prefixed by >>):

      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:313:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     313 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_lm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:313:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     313 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'pv_context_mapping':
   drivers/iommu/intel/iommu.c:1459:16: error: variable 'param' has initializer but incomplete type
    1459 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1460:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    1460 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1460:25: warning: excess elements in struct initializer
    1460 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:1460:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1461:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:20:
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1461:24: note: in expansion of macro 'PCI_DEVID'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1461:24: note: in expansion of macro 'PCI_DEVID'
    1461 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:18: error: 'struct pkvm_lm_context_param' has no member named 'domain_pgd_gpa'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/kexec.h:20,
                    from include/linux/crash_dump.h:5,
                    from drivers/iommu/intel/iommu.c:16:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:35: note: in expansion of macro 'virt_to_phys'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1462:35: note: in expansion of macro 'virt_to_phys'
    1462 |                 .domain_pgd_gpa = virt_to_phys(domain->pgd),
         |                                   ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1463:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    1463 |                 .did = domain_id_iommu(domain, iommu),
         |                  ^~~
   drivers/iommu/intel/iommu.c:1463:24: warning: excess elements in struct initializer
    1463 |                 .did = domain_id_iommu(domain, iommu),
         |                        ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1463:24: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:1464:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_supported'
    1464 |                 .ats_supported = info ? info->ats_supported : 0,
         |                  ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1464:34: warning: excess elements in struct initializer
    1464 |                 .ats_supported = info ? info->ats_supported : 0,
         |                                  ^~~~
   drivers/iommu/intel/iommu.c:1464:34: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1459:38: error: storage size of 'param' isn't known
    1459 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:1459:38: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_clear':
   drivers/iommu/intel/iommu.c:1743:16: error: variable 'param' has initializer but incomplete type
    1743 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1744:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
    1744 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1744:25: warning: excess elements in struct initializer
    1744 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1744:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1745:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1745:24: note: in expansion of macro 'PCI_DEVID'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1745:24: note: in expansion of macro 'PCI_DEVID'
    1745 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1746:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
    1746 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1746:29: warning: excess elements in struct initializer
    1746 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/iommu.c:1746:29: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1743:45: error: storage size of 'param' isn't known
    1743 |         struct pkvm_clear_translation_param param = {
         |                                             ^~~~~
   drivers/iommu/intel/iommu.c:1743:45: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_setup_pass_through':
   drivers/iommu/intel/iommu.c:4336:16: error: variable 'param' has initializer but incomplete type
    4336 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:4337:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    4337 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:4337:25: warning: excess elements in struct initializer
    4337 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:4337:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:4338:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    4338 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:4338:24: note: in expansion of macro 'PCI_DEVID'
    4338 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:4338:24: note: in expansion of macro 'PCI_DEVID'
    4338 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:4339:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    4339 |                 .did = FLPT_DEFAULT_DID,
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:31:
   drivers/iommu/intel/pasid.h:29:41: warning: excess elements in struct initializer
      29 | #define FLPT_DEFAULT_DID                1
         |                                         ^
   drivers/iommu/intel/iommu.c:4339:24: note: in expansion of macro 'FLPT_DEFAULT_DID'
    4339 |                 .did = FLPT_DEFAULT_DID,
         |                        ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:29:41: note: (near initialization for 'param')
      29 | #define FLPT_DEFAULT_DID                1
         |                                         ^
   drivers/iommu/intel/iommu.c:4339:24: note: in expansion of macro 'FLPT_DEFAULT_DID'
    4339 |                 .did = FLPT_DEFAULT_DID,
         |                        ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:4336:38: error: storage size of 'param' isn't known
    4336 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:4336:38: warning: unused variable 'param' [-Wunused-variable]


vim +1464 drivers/iommu/intel/iommu.c

  1455	
  1456	static int pv_context_mapping(struct dmar_domain *domain, struct intel_iommu *iommu,
  1457				      struct device_domain_info *info, u8 bus, u8 devfn)
  1458	{
  1459		struct pkvm_lm_context_param param = {
  1460			.phys = iommu->reg_phys,
  1461			.bdf = PCI_DEVID(bus, devfn),
  1462			.domain_pgd_gpa = virt_to_phys(domain->pgd),
  1463			.did = domain_id_iommu(domain, iommu),
> 1464			.ats_supported = info ? info->ats_supported : 0,
  1465		};
  1466		int ret;
  1467	
  1468		spin_lock(&iommu->lock);
  1469		ret = pkvm_hc_iommu_set_lm_ce(&param);
  1470		if (ret == -ENOMEM) {
  1471			void *context = iommu_alloc_page_node(iommu->node, GFP_ATOMIC);
  1472	
  1473			if (!context) {
  1474				spin_unlock(&iommu->lock);
  1475				pr_err("%s: failed to allocate context page for iommu: %d\n",
  1476				       __func__, iommu->seq_id);
  1477				return -ENOMEM;
  1478			}
  1479			param.context_gpa = virt_to_phys(context);
  1480			ret = pkvm_hc_iommu_set_lm_ce(&param);
  1481	
  1482			/* Free the page if pkvm did not use it. */
  1483			if (param.context_gpa)
  1484				iommu_free_page(context);
  1485		}
  1486		spin_unlock(&iommu->lock);
  1487	
  1488		return ret;
  1489	}
  1490	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
