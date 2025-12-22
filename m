Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE75224AE0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766443217; cv=none; b=BJt1on+aX1aLf0XptmeBs6AI4gpfLnSujUbUwrv6m2NyjfR51UF4sJpIM1Titr5b/0f6HrWiHGS2gGkgaL2Sj5xeT0V71Ubm5lPex7NEM6lrJlHcIpwM5hVlMCuHnZ50BtZV6M/K94erEbwI+4UqhQCA8l4jbok4l7Gdk1afGnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766443217; c=relaxed/simple;
	bh=EDcV9Qq6u36SgaCI58BYeMjyeaXP1Z7tB8iumvznhK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FOrmY7QReHYXWChxLRERwijqvo9WiY/eEZ8mxoRyA/kb88ZSFBwmifucgmTrhxaBQQsXtpOZ6sqzTa3TF2CfRC2oRjuM5Hk/szL2tmHNpcCgQk6tHgdCYaS1+ND2Td4YnxOe9Z+JjwsZO28d7jlLGluiAuuqFq2gvdGRjoLXkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sq4UG9g9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq4UG9g9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766443215; x=1797979215;
  h=date:from:to:cc:subject:message-id;
  bh=EDcV9Qq6u36SgaCI58BYeMjyeaXP1Z7tB8iumvznhK0=;
  b=Sq4UG9g9OAr6PYIw8s517rxKSiRW3Z7ocR/MZ5XhIFoT5Ja34eCdbnJC
   GxLM7mDU1LXkhUA4CKhnoxTook/y9DCSwYD8GoNnkBIytyD5FnNfFhkDf
   GoZBH6DNTEL1nXddJbnEJoAhzpg3krSFM2zSBCWOD9lClSlmFJbplEPKt
   xt4nRndRe1kGQ97R9p6UFh8k3EZl0Vf50ZPKIzOTq8Dx+En1mr+7eqK9i
   ZIlFLUuO7ZGmZ73O0xkVp5WD074dxXBO2m8+F1R+jJ31aZjq0ssQutnYr
   RMQSdVsj1Ft/s9os+06LkNY+8T4yFrGi05IZF8ulcjtnhbzlqD9Ck8R15
   g==;
X-CSE-ConnectionGUID: QDFtgCBVR0WPPoEOFhsOiQ==
X-CSE-MsgGUID: bUS3zOvMTvCnZyhWbPfoxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78930711"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="78930711"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 14:40:13 -0800
X-CSE-ConnectionGUID: 9jOJDaIoRXKecZrORzKdHA==
X-CSE-MsgGUID: XvvBdadyQw6m1kwawVY6vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199281221"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 14:40:12 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXoZW-000000001BN-2a3u;
	Mon, 22 Dec 2025 22:40:10 +0000
Date: Tue, 23 Dec 2025 06:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 15/15]
 arch/x86/include/asm/kvm_pkvm.h:280:30: error: field has incomplete type
 'struct pkvm_iommu_map_param'
Message-ID: <202512230634.Hwmua2CW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4e640d57b9513962095028e1186dddf47814e50f
commit: e3aff207324c14597db951ea892402226359276b [15/15] ANDROID: pkvm: x86: Hypercalls for domain pagetable management
config: x86_64-randconfig-161-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230634.Hwmua2CW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230634.Hwmua2CW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230634.Hwmua2CW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:275:31: error: field has incomplete type 'struct pkvm_lm_context_param'
     275 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:275:9: note: forward declaration of 'struct pkvm_lm_context_param'
     275 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:276:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     276 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:276:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     276 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:277:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     277 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:277:9: note: forward declaration of 'struct pkvm_sm_context_param'
     277 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:278:32: error: field has incomplete type 'struct pkvm_pasid_table_param'
     278 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^
   arch/x86/include/asm/kvm_pkvm.h:278:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     278 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:279:27: error: field has incomplete type 'struct pkvm_domain_param'
     279 |         struct pkvm_domain_param domain_param;
         |                                  ^
   arch/x86/include/asm/kvm_pkvm.h:279:9: note: forward declaration of 'struct pkvm_domain_param'
     279 |         struct pkvm_domain_param domain_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:280:30: error: field has incomplete type 'struct pkvm_iommu_map_param'
     280 |         struct pkvm_iommu_map_param iommu_map_param;
         |                                     ^
   arch/x86/include/asm/kvm_pkvm.h:280:9: note: forward declaration of 'struct pkvm_iommu_map_param'
     280 |         struct pkvm_iommu_map_param iommu_map_param;
         |                ^
   6 errors generated.


vim +280 arch/x86/include/asm/kvm_pkvm.h

   267	
   268	union pkvm_pv_param {
   269		struct kvm_segment seg;
   270		struct msr_data msr;
   271		struct desc_ptr desc;
   272		struct eoi_exitmap eoi_exit_bitmap;
   273	
   274		/* IOMMU hypercall params */
   275		struct pkvm_lm_context_param lm_context_param;
   276		struct pkvm_clear_translation_param clear_translation_param;
   277		struct pkvm_sm_context_param sm_context_param;
   278		struct pkvm_pasid_table_param pasid_table_param;
   279		struct pkvm_domain_param domain_param;
 > 280		struct pkvm_iommu_map_param iommu_map_param;
   281	} __aligned(PAGE_SIZE);
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
