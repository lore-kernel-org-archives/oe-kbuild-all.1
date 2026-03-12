Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FDC296BCF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346758; cv=none; b=uyFONwpfsT99e+1afyRKbyC/acpTWkRn7rMlIM43FgeVjCMsvFI6ZgLlx6XapCaewnwBO+DuPPFvvLnBSMEmSBzKl62T3E4X7158G5PzMckeY324i05KON7rYgEGzOF+NkH5eDchwPl9hRbIxL8+3CsBmfRomFCI08PFn163L50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346758; c=relaxed/simple;
	bh=4k26/8U3cj8ElkhUExRAClPBsl+GSzpn/rjf93NVE0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eSAT87vx1QcZRQt6OPPm7raH9wLTAwjchouXKJufwZxOVY6SiJM5glD2HNwfNnagGJmPrIKH1qw0lvgpTq2C0bOvd/H68pz4cELVJa8nSAAyhyu9aYvEkPsslZwVTPBcB1SMCJW3nySx1Ig/e2bqopTuW+m97PVJm8zH/Y9uFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3N7ofmU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3N7ofmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773346756; x=1804882756;
  h=date:from:to:cc:subject:message-id;
  bh=4k26/8U3cj8ElkhUExRAClPBsl+GSzpn/rjf93NVE0c=;
  b=L3N7ofmU4KcP8nFLf14LgB8aoDiS560RS2xBiT2US9VWnkWl6V9sLgis
   Am5r/1/vMDy+LzoVJpSBZ5EZyno0xQbeBhA4zxj6NpuQ2ius2QJDB8oXv
   3iR0x3m5uPBev6EhHR43EWTBbLV2ZBtrHJknyBXdgX61cFeWtaoBe7Q6T
   19JXz7mlzF+AAOjOJLO5aKV4iVdv3DsDULD0R2457e4GPuPDv0QFz6APu
   33KD9Cuq1t5Y7Eg1ZjwP/6TmaMmc3MKDr5pMETdk6HNpCRFHkL1hgYhW3
   1SL9N8I87vbz97w9uq6MtZ8Q5RJ7qJHT4xNZavKzHrt5IHg8vhYwABw+B
   g==;
X-CSE-ConnectionGUID: XEJSQPGwQ76OZOCcpfRPrw==
X-CSE-MsgGUID: UAFMD0cJTrOl3Zode++SOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74335534"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74335534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:19:15 -0700
X-CSE-ConnectionGUID: sqJNztNUS+KGhvtaIO7IKg==
X-CSE-MsgGUID: PIMf9YiESa2QD4XbZrXhaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220027903"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2026 13:19:13 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0mUw-000000002wz-3b76;
	Thu, 12 Mar 2026 20:19:10 +0000
Date: Fri, 13 Mar 2026 04:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type
 'struct pkvm_domain_param'
Message-ID: <202603130411.hFdjzP91-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6e8e96179140c3b15e8cec8ee8510e05991fc932
commit: c701adab89c53f2fbc294869da57762ba969558f [17/17] ANDROID: iommu/vt-d: Paravirtualize iommu domain management
config: x86_64-randconfig-073-20260311 (https://download.01.org/0day-ci/archive/20260313/202603130411.hFdjzP91-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130411.hFdjzP91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130411.hFdjzP91-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_fl':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_sl':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_domain_alloc':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_domain_param'
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
>> arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_domain_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:61:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      61 |         return pkvm_iommu_hypercall(iommu_domain_alloc, domain_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
--
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:46:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_fl':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:51:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_pasid_sl':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_pasid_table_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_domain_alloc':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_domain_param'
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
>> arch/x86/include/asm/kvm_pkvm.h:316:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_domain_param'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:316:17: note: in expansion of macro 'memset'
     316 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ^~~~~~
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
   In file included from include/linux/kexec.h:20:
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
   drivers/iommu/intel/iommu.c:1469:38: error: storage size of 'param' isn't known
    1469 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:1469:38: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_clear':
   drivers/iommu/intel/iommu.c:1753:16: error: variable 'param' has initializer but incomplete type
    1753 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1754:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
    1754 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1754:25: warning: excess elements in struct initializer
    1754 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1754:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1755:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
    1755 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1755:24: note: in expansion of macro 'PCI_DEVID'
    1755 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1755:24: note: in expansion of macro 'PCI_DEVID'
    1755 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1756:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
    1756 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1756:29: warning: excess elements in struct initializer
    1756 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/iommu.c:1756:29: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1753:45: error: storage size of 'param' isn't known
    1753 |         struct pkvm_clear_translation_param param = {
         |                                             ^~~~~
   drivers/iommu/intel/iommu.c:1753:45: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_paging_domain_alloc':
   drivers/iommu/intel/iommu.c:3312:16: error: variable 'param' has initializer but incomplete type
    3312 |         struct pkvm_domain_param param = {
         |                ^~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/iommu.c:3313:18: error: 'struct pkvm_domain_param' has no member named 'phys'
    3313 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:3313:25: warning: excess elements in struct initializer
    3313 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:3313:25: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:3314:18: error: 'struct pkvm_domain_param' has no member named 'bdf'
    3314 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:3314:24: note: in expansion of macro 'PCI_DEVID'
    3314 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:3314:24: note: in expansion of macro 'PCI_DEVID'
    3314 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
>> drivers/iommu/intel/iommu.c:3315:18: error: 'struct pkvm_domain_param' has no member named 'use_first_level'
    3315 |                 .use_first_level = domain->use_first_level,
         |                  ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3315:36: warning: excess elements in struct initializer
    3315 |                 .use_first_level = domain->use_first_level,
         |                                    ^~~~~~
   drivers/iommu/intel/iommu.c:3315:36: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:3316:18: error: 'struct pkvm_domain_param' has no member named 'pgd_gpa'
    3316 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3316:28: note: in expansion of macro 'virt_to_phys'
    3316 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3316:28: note: in expansion of macro 'virt_to_phys'
    3316 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
>> drivers/iommu/intel/iommu.c:3317:18: error: 'struct pkvm_domain_param' has no member named 'gaw'
    3317 |                 .gaw = domain->gaw,
         |                  ^~~
   drivers/iommu/intel/iommu.c:3317:24: warning: excess elements in struct initializer
    3317 |                 .gaw = domain->gaw,
         |                        ^~~~~~
   drivers/iommu/intel/iommu.c:3317:24: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:3318:18: error: 'struct pkvm_domain_param' has no member named 'agaw'
    3318 |                 .agaw = domain->agaw,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:3318:25: warning: excess elements in struct initializer
    3318 |                 .agaw = domain->agaw,
         |                         ^~~~~~
   drivers/iommu/intel/iommu.c:3318:25: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:3319:18: error: 'struct pkvm_domain_param' has no member named 'max_addr'
    3319 |                 .max_addr = domain->max_addr,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:3319:29: warning: excess elements in struct initializer
    3319 |                 .max_addr = domain->max_addr,
         |                             ^~~~~~
   drivers/iommu/intel/iommu.c:3319:29: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:3320:18: error: 'struct pkvm_domain_param' has no member named 'iommu_coherency'
    3320 |                 .iommu_coherency = domain->iommu_coherency,
         |                  ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3320:36: warning: excess elements in struct initializer
    3320 |                 .iommu_coherency = domain->iommu_coherency,
         |                                    ^~~~~~
   drivers/iommu/intel/iommu.c:3320:36: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:3321:18: error: 'struct pkvm_domain_param' has no member named 'iommu_superpage'
    3321 |                 .iommu_superpage = domain->iommu_superpage,
         |                  ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3321:36: warning: excess elements in struct initializer
    3321 |                 .iommu_superpage = domain->iommu_superpage,
         |                                    ^~~~~~
   drivers/iommu/intel/iommu.c:3321:36: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:3312:34: error: storage size of 'param' isn't known
    3312 |         struct pkvm_domain_param param = {
         |                                  ^~~~~
   drivers/iommu/intel/iommu.c:3312:34: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_context_setup_pass_through':
   drivers/iommu/intel/iommu.c:4379:16: error: variable 'param' has initializer but incomplete type
    4379 |         struct pkvm_lm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:4380:18: error: 'struct pkvm_lm_context_param' has no member named 'phys'
    4380 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:4380:25: warning: excess elements in struct initializer
    4380 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/iommu.c:4380:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:4381:18: error: 'struct pkvm_lm_context_param' has no member named 'bdf'
    4381 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:4381:24: note: in expansion of macro 'PCI_DEVID'
    4381 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:4381:24: note: in expansion of macro 'PCI_DEVID'
    4381 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:4382:18: error: 'struct pkvm_lm_context_param' has no member named 'did'
    4382 |                 .did = FLPT_DEFAULT_DID,
         |                  ^~~
   In file included from drivers/iommu/intel/iommu.c:31:
   drivers/iommu/intel/pasid.h:29:41: warning: excess elements in struct initializer
      29 | #define FLPT_DEFAULT_DID                1
         |                                         ^
   drivers/iommu/intel/iommu.c:4382:24: note: in expansion of macro 'FLPT_DEFAULT_DID'
    4382 |                 .did = FLPT_DEFAULT_DID,
         |                        ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:29:41: note: (near initialization for 'param')
      29 | #define FLPT_DEFAULT_DID                1
         |                                         ^
   drivers/iommu/intel/iommu.c:4382:24: note: in expansion of macro 'FLPT_DEFAULT_DID'
    4382 |                 .did = FLPT_DEFAULT_DID,
         |                        ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:4379:38: error: storage size of 'param' isn't known
    4379 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:4379:38: warning: unused variable 'param' [-Wunused-variable]
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +16 drivers/iommu/intel/iommu_pkvm.h

14d98d9e4203286 Aashish Sharma 2025-11-06  10  
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  11  #define pkvm_iommu_hypercall(hc, param_name, param)			\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  12  	({									\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  13  		unsigned long f;						\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  14  		struct pkvm_##param_name *p = get_this_pv_param(param_name, f);	\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  15  		int ret;							\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12 @16  		*p = *(param);							\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  17  		ret = pkvm_hypercall(hc, (unsigned long)p);		\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  18  		*(param) = *p;							\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  19  		put_this_pv_param(p, f);					\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  20  		ret;								\
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  21  	})
157ba06fef4bdb6 Vineeth Pillai 2025-10-12  22  

:::::: The code at line 16 was first introduced by commit
:::::: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates

:::::: TO: Vineeth Pillai <vineethrp@google.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
