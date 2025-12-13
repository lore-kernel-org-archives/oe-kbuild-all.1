Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B621DDC1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765611138; cv=none; b=dVnaQ9/I6wmFsuBN0SESVVT6AwlJO2uMcg/+QPBVKJA+IfAaRXrc+LZN/r26FjRfaucQjAMVZ0+wxPkdqYhyr2atrS/jZIuNTxh/EtXnmJxc43BQGEx43mI+hFBMBs7vWFRk04zJuKt050U1J/lr5FF7R71fntH8sMgiaPLdU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765611138; c=relaxed/simple;
	bh=j6zHPF0ig55Le4nTmn7zPsH/S6hi3IdM1OnXPlaEb1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtDfnC6GgFi+fhZ2Vd5EyfuHo4zPCc0Q2Gy7sOsIoJ5CgaXGe6htZbN0DqDI9qTh2P6S6ma7cbrDDqz7skwL4JO1T9Op3J6/RdIRsD0paaXQ+KlUV1f4TcTNl/8XVY2LmK6iRCK4ptyrmGCdhx1gkmkcPagcJT0aGG8gQzL0Fuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faF2KdtA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faF2KdtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765611137; x=1797147137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6zHPF0ig55Le4nTmn7zPsH/S6hi3IdM1OnXPlaEb1Y=;
  b=faF2KdtAjmGK62kIs2692Rt3F61Da8mW25w0/SV6iuDQQssIMZW/qUza
   qWKE8N1zwbKeIhfS4PQd3twol3uUtvFbWHLekTa3TULFQTmvP3pNS1Sm6
   wxjwGopuCtsX5R3k9CxjjN1bcaqRyx89i+RFlXpzy8XCkmLt6bcKphxdC
   QP0Jh9BZuq6FDnqNluaaVjxtLXWZdg63n8PdtrlMu+EA6h4UFq7aXP6pA
   7dT1OPzyM21f6+if0E+dDRte71cDJ3iULeOGUeYa+KtbGlzwlL0nzSPgt
   aagkTQw3PLF+l7Ibpmppky3g+S0y8KJ9t9csxuDxPi00qKgxDqqCoc7dn
   Q==;
X-CSE-ConnectionGUID: hhH2GO30T9GCVtsnBDfzXg==
X-CSE-MsgGUID: fvt3JxqTTUeiNoQvB/wDQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85197482"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85197482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:32:14 -0800
X-CSE-ConnectionGUID: +0+GBhp2Tianys+0DzoW9g==
X-CSE-MsgGUID: Zr7fYk1nSfqPwQ/NC0gPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197171714"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 23:32:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUK6s-000000007ER-2dqq;
	Sat, 13 Dec 2025 07:32:10 +0000
Date: Sat, 13 Dec 2025 15:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/iommu/intel/iommu_pkvm.h:51:9: error: incomplete type 'struct
 pkvm_pasid_table_param' is not assignable
Message-ID: <202512131538.S1wFPwVT-lkp@intel.com>
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
commit: 40e05d87082111caf1fa83b9b288e93f3cd021df [18/18] ANDROID: iommu/vt-d: Paravirtualize PASID table updates
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131538.S1wFPwVT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131538.S1wFPwVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131538.S1wFPwVT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:24: note: expanded from macro 'put_this_pv_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
     513 |                 __struct_size(p), __member_size(p))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct pkvm_sm_context_param' is not assignable
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct pkvm_sm_context_param' is not assignable
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:41:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sm_context_param'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:24: note: expanded from macro 'put_this_pv_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
     513 |                 __struct_size(p), __member_size(p))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:46:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:46:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:46:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_clear_translation_param'
      46 |         return pkvm_iommu_hypercall(iommu_clear_pasid_entry, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:24: note: expanded from macro 'put_this_pv_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
     513 |                 __struct_size(p), __member_size(p))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:51:9: error: incomplete type 'struct pkvm_pasid_table_param' is not assignable
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:269:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:51:9: error: incomplete type 'struct pkvm_pasid_table_param' is not assignable
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:269:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:51:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_pasid_table_param'
      51 |         return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:315:24: note: expanded from macro 'put_this_pv_param'
     315 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
     513 |                 __struct_size(p), __member_size(p))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/kvm_pkvm.h:269:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +51 drivers/iommu/intel/iommu_pkvm.h

    48	
    49	static inline long pkvm_hc_iommu_set_pasid_fl(struct pkvm_pasid_table_param *param)
    50	{
  > 51		return pkvm_iommu_hypercall(iommu_set_pasid_fl, pasid_table_param, param);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
