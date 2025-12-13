Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90E2BD013
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613910; cv=none; b=mjka8ec/s/dNTv3ov/jHuCbPR1McfltaNFoUt46GgnArpnIeOCDEb2EGu3dy1eWtkYDQpqG8xmBHnLgBj0SpD3aHqskHy77NCrIWnqZ5yTj69FbQrmYBFBhB1r6eA/axi1t9dEKZYX81EL7JpiFrQMsV9hX2XmkLyTX4ckPUl7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613910; c=relaxed/simple;
	bh=xINsIaOT4Kw6+6Dw+KWqbNvOJhLf92uGz3jVmrvROtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLZSxLc47HybHZwzKqa5N0IjbheT9SPtrhitc/PkROgh7DCBLIcTS6U2tHnhPmf7X4wy3qvbjrdPfGZu6/He3gVd9Hogn/prVBlS+AmKS1mgSxGUFBXKdwSbKf/fpTFYBj7NpcOMtmK98RiIn9RyI8kHK96sC+/zj8gqZy6Br+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do1IDEk6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do1IDEk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613908; x=1797149908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xINsIaOT4Kw6+6Dw+KWqbNvOJhLf92uGz3jVmrvROtM=;
  b=do1IDEk6jSZQ9ZGTfV4v6cdzz4N3iR5GWcOtR20gJqo7xsh7aSPs5F41
   0nez1Cd+tzhLWzrmC0ljHIs07sEiiyrWDNnBO8u93MhGNfLNJ14P2tzt0
   DlVbK40CBmqlfcReoGcEQeCK4pBDSI18knlGM6y9O4PBxn1jiu8zHOLo/
   dbrlDGh3CNRua8a+hMEdTcO6wJ3tnxRFmuq5xaKZZOMywRo+lNHkWM1GC
   Mvy3+v9/RGtZ0khH1xBiV776OQGRb+bY9UU7ihGPMr2JHC2/8EcrGZ6jC
   1HQ/2FbGKQYdyfliL5pcYDabzb+rv6Qs/V+YUob7OTfBVEOYMb5U6eOGJ
   g==;
X-CSE-ConnectionGUID: tWmMmkwJTqyWiK7/E658cg==
X-CSE-MsgGUID: D9NcjKBxR7G51NdWWerFHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90255752"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90255752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:18:18 -0800
X-CSE-ConnectionGUID: jGVHzPqZQfCb65jhoW4ptA==
X-CSE-MsgGUID: EtWnCBs8Qd+R835KUnl+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202201987"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 00:18:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKpS-000000007II-0mR6;
	Sat, 13 Dec 2025 08:18:14 +0000
Date: Sat, 13 Dec 2025 16:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type
 'struct pkvm_sm_context_param'
Message-ID: <202512131628.KjGVZY62-lkp@intel.com>
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
commit: 4c2bcf42320837fc0b98fbce77c764de4d905644 [18/18] ANDROID: iommu/vt-d: Paravirtualize scalable mode context updates
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131628.KjGVZY62-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131628.KjGVZY62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131628.KjGVZY62-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/intel/iommu_pkvm.h:9,
                    from drivers/iommu/intel/dmar.c:34:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_clear_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/iommu/intel/iommu_pkvm.h:9,
                    from drivers/iommu/intel/iommu.c:32:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_clear_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
>> drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
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
   drivers/iommu/intel/iommu.c:1464:18: error: 'struct pkvm_lm_context_param' has no member named 'ats_supported'
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
..


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
157ba06fef4bdb Vineeth Pillai 2025-10-12 @19  		put_this_pv_param(p, f);					\
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
