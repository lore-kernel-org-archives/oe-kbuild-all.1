Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C4126F3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 05:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773379218; cv=none; b=u8WKGpNG/x8kgIAGx8Uezmkgk0UWtran3I6wveiX+LWkqhCYjMFrOolFAagctC0eN2PZqGlgOGv/Qn3C1K9TKjaRtBYafuJXbP7uWCrwv6qqq6wzcIeXG8lKeEDLjX9SpByo//NwKYfpjo2G//MC1xmuaF01AMjZ1lHVzxiLJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773379218; c=relaxed/simple;
	bh=wPBctW58pIBQMviuaiSmoggex8Hr4Zs6gRVIN+hkKzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jeLtmufFfCEv7ScyHGD9qAcGzXzgQ8AphqLJaTM/Th+w7x7e1NHsGIA3ZDbpt+ST6KiVyQ7PMjQxpuebeuXSCMgGJ7WQlGLg2R0vqshyhyz3NJYm9m92ahAM3NlfF21slAlxLB1vXxEtbKPYYh2/Rm6PLzYTGNscMxUfAH/6hZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9IX5xhr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9IX5xhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773379216; x=1804915216;
  h=date:from:to:cc:subject:message-id;
  bh=wPBctW58pIBQMviuaiSmoggex8Hr4Zs6gRVIN+hkKzg=;
  b=K9IX5xhr0DHNxX1WNaz90sIjHtHxOJACoxq4MAjV+Ljy9D07qL2f+PKh
   7IVKW5Z492F8oNL6CgYcRjY//TS9l1QyhgAK+2WAF/M8XPxp6pKg/iso4
   HIVX+9PQe7TQPNGK1CGhbdC/LxoZxf2mOipNOzVHfQNFNHPyXIATN44+m
   jrqLKk4W9bddAFAONcQYXQwINaTfLB32SeuwprLLENNhwTUCKiuqsBmg3
   JyLXb2imPLVXrQUNrry6mP0i2K7NaZn9WLhBLd+V0W7RCpa12hW1jmfqU
   lpSWmasxD/hnDWVldl+6pA0BNLE+21dgPkHngAaQf/pwcjyIRLVStsAUa
   g==;
X-CSE-ConnectionGUID: piRfDM5PSuyB4RKOwNNfRQ==
X-CSE-MsgGUID: 4cTqkCvFT46KIxfgjeyhIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85838250"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85838250"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 22:20:15 -0700
X-CSE-ConnectionGUID: kpp4xEC6QR6DlIB5oHP/Pw==
X-CSE-MsgGUID: yw71S4QsSUCey9qyds7kHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="251574097"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2026 22:20:13 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0uwU-000000003V5-22Pa;
	Fri, 13 Mar 2026 05:20:10 +0000
Date: Fri, 13 Mar 2026 13:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type
 'struct pkvm_iommu_map_param'
Message-ID: <202603131307.pWrNppVT-lkp@intel.com>
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
commit: a50249ddd81d8447488e9ad265fe0a99880dcea0 [17/17] ANDROID: iommu/vt-d: Paravirtualize domain pagetable management
config: x86_64-randconfig-073-20260311 (https://download.01.org/0day-ci/archive/20260313/202603131307.pWrNppVT-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131307.pWrNppVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131307.pWrNppVT-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
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
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_iommu_map_param'
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
>> arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_iommu_map_param'
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
--
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:56:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      56 |         return pkvm_iommu_hypercall(iommu_set_pasid_sl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_pasid_table_param'
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
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_iommu_map_param'
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
>> arch/x86/include/asm/kvm_pkvm.h:326:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_iommu_map_param'
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
   drivers/iommu/intel/iommu.c:939:40: warning: 'struct pkvm_memcache' declared inside parameter list will not be visible outside of this definition or declaration
     939 | static int fill_domain_memcache(struct pkvm_memcache *mc, unsigned long nr_pages,
         |                                        ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'fill_domain_memcache':
>> drivers/iommu/intel/iommu.c:947:16: error: implicit declaration of function '__topup_pkvm_memcache' [-Werror=implicit-function-declaration]
     947 |         return __topup_pkvm_memcache(mc, nr_pages, domain_mc_alloc_fn,
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: At top level:
   drivers/iommu/intel/iommu.c:951:41: warning: 'struct pkvm_memcache' declared inside parameter list will not be visible outside of this definition or declaration
     951 | static void free_domain_memcache(struct pkvm_memcache *mc)
         |                                         ^~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c: In function 'free_domain_memcache':
>> drivers/iommu/intel/iommu.c:953:9: error: implicit declaration of function '__free_pkvm_memcache' [-Werror=implicit-function-declaration]
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
   drivers/iommu/intel/iommu.c:1534:29: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1528:38: error: storage size of 'param' isn't known
    1528 |         struct pkvm_lm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/iommu.c:1528:38: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_domain_mapping':
   drivers/iommu/intel/iommu.c:1705:16: error: variable 'param' has initializer but incomplete type
    1705 |         struct pkvm_iommu_map_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/intel/iommu.c:1706:18: error: 'struct pkvm_iommu_map_param' has no member named 'pgd_gpa'
    1706 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1706:28: note: in expansion of macro 'virt_to_phys'
    1706 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1706:28: note: in expansion of macro 'virt_to_phys'
    1706 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
>> drivers/iommu/intel/iommu.c:1707:18: error: 'struct pkvm_iommu_map_param' has no member named 'iov_pfn'
    1707 |                 .iov_pfn = iov_pfn,
         |                  ^~~~~~~
   drivers/iommu/intel/iommu.c:1707:28: warning: excess elements in struct initializer
    1707 |                 .iov_pfn = iov_pfn,
         |                            ^~~~~~~
   drivers/iommu/intel/iommu.c:1707:28: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:1708:18: error: 'struct pkvm_iommu_map_param' has no member named 'phys_pfn'
    1708 |                 .phys_pfn = phys_pfn,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1708:29: warning: excess elements in struct initializer
    1708 |                 .phys_pfn = phys_pfn,
         |                             ^~~~~~~~
   drivers/iommu/intel/iommu.c:1708:29: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:1709:18: error: 'struct pkvm_iommu_map_param' has no member named 'nr_pages'
    1709 |                 .nr_pages = nr_pages,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1709:29: warning: excess elements in struct initializer
    1709 |                 .nr_pages = nr_pages,
         |                             ^~~~~~~~
   drivers/iommu/intel/iommu.c:1709:29: note: (near initialization for 'param')
>> drivers/iommu/intel/iommu.c:1710:18: error: 'struct pkvm_iommu_map_param' has no member named 'prot'
    1710 |                 .prot = prot,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1710:25: warning: excess elements in struct initializer
    1710 |                 .prot = prot,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1710:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1705:37: error: storage size of 'param' isn't known
    1705 |         struct pkvm_iommu_map_param param = {
         |                                     ^~~~~
>> drivers/iommu/intel/iommu.c:1716:55: error: implicit declaration of function '__pkvm_pgtable_max_pages' [-Werror=implicit-function-declaration]
    1716 |                 ret = fill_domain_memcache(&param.mc, __pkvm_pgtable_max_pages(nr_pages),
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1705:37: warning: unused variable 'param' [-Wunused-variable]
    1705 |         struct pkvm_iommu_map_param param = {
         |                                     ^~~~~
   drivers/iommu/intel/iommu.c: In function 'pv_context_clear':
   drivers/iommu/intel/iommu.c:1854:16: error: variable 'param' has initializer but incomplete type
    1854 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1855:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
    1855 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:1855:25: warning: excess elements in struct initializer
    1855 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:1855:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1856:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
    1856 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1856:24: note: in expansion of macro 'PCI_DEVID'
    1856 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:1856:24: note: in expansion of macro 'PCI_DEVID'
    1856 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1857:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
    1857 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/iommu.c:1857:29: warning: excess elements in struct initializer
    1857 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/iommu.c:1857:29: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:1854:45: error: storage size of 'param' isn't known
    1854 |         struct pkvm_clear_translation_param param = {
         |                                             ^~~~~
   drivers/iommu/intel/iommu.c:1854:45: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/iommu.c: In function 'pv_paging_domain_alloc':
   drivers/iommu/intel/iommu.c:3413:16: error: variable 'param' has initializer but incomplete type
    3413 |         struct pkvm_domain_param param = {
         |                ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3414:18: error: 'struct pkvm_domain_param' has no member named 'phys'
    3414 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/iommu.c:3414:25: warning: excess elements in struct initializer
    3414 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/iommu.c:3414:25: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:3415:18: error: 'struct pkvm_domain_param' has no member named 'bdf'
    3415 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:3415:24: note: in expansion of macro 'PCI_DEVID'
    3415 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/iommu.c:3415:24: note: in expansion of macro 'PCI_DEVID'
    3415 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/iommu.c:3416:18: error: 'struct pkvm_domain_param' has no member named 'use_first_level'
    3416 |                 .use_first_level = domain->use_first_level,
         |                  ^~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3416:36: warning: excess elements in struct initializer
    3416 |                 .use_first_level = domain->use_first_level,
         |                                    ^~~~~~
   drivers/iommu/intel/iommu.c:3416:36: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:3417:18: error: 'struct pkvm_domain_param' has no member named 'pgd_gpa'
    3417 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                  ^~~~~~~
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3417:28: note: in expansion of macro 'virt_to_phys'
    3417 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3417:28: note: in expansion of macro 'virt_to_phys'
    3417 |                 .pgd_gpa = virt_to_phys(domain->pgd),
         |                            ^~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:3418:18: error: 'struct pkvm_domain_param' has no member named 'gaw'
    3418 |                 .gaw = domain->gaw,
         |                  ^~~
   drivers/iommu/intel/iommu.c:3418:24: warning: excess elements in struct initializer
    3418 |                 .gaw = domain->gaw,
         |                        ^~~~~~
   drivers/iommu/intel/iommu.c:3418:24: note: (near initialization for 'param')
   drivers/iommu/intel/iommu.c:3419:18: error: 'struct pkvm_domain_param' has no member named 'agaw'
    3419 |                 .agaw = domain->agaw,
         |                  ^~~~
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

14d98d9e420328 Aashish Sharma 2025-11-06  10  
157ba06fef4bdb Vineeth Pillai 2025-10-12  11  #define pkvm_iommu_hypercall(hc, param_name, param)			\
157ba06fef4bdb Vineeth Pillai 2025-10-12  12  	({									\
157ba06fef4bdb Vineeth Pillai 2025-10-12  13  		unsigned long f;						\
157ba06fef4bdb Vineeth Pillai 2025-10-12  14  		struct pkvm_##param_name *p = get_this_pv_param(param_name, f);	\
157ba06fef4bdb Vineeth Pillai 2025-10-12  15  		int ret;							\
157ba06fef4bdb Vineeth Pillai 2025-10-12 @16  		*p = *(param);							\
157ba06fef4bdb Vineeth Pillai 2025-10-12  17  		ret = pkvm_hypercall(hc, (unsigned long)p);		\
157ba06fef4bdb Vineeth Pillai 2025-10-12  18  		*(param) = *p;							\
157ba06fef4bdb Vineeth Pillai 2025-10-12  19  		put_this_pv_param(p, f);					\
157ba06fef4bdb Vineeth Pillai 2025-10-12  20  		ret;								\
157ba06fef4bdb Vineeth Pillai 2025-10-12  21  	})
157ba06fef4bdb Vineeth Pillai 2025-10-12  22  

:::::: The code at line 16 was first introduced by commit
:::::: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates

:::::: TO: Vineeth Pillai <vineethrp@google.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
