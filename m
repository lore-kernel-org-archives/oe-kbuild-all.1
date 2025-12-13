Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB4823D28C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765605609; cv=none; b=r3jjUubtMfhoiMUNW8uaq4FX5nEfAzJJlPH61dF1NrdoszXI3fbcldF54+/9SluXPbJFjXZtnSxUbgXECpoxAShEJq+m2KXqrHNlsWciQ2V+JNBOQeJroInJzz/+2Il3Eob00jgDzWz8yymOA51aPsKV9GOwG/Y2j4OfW2l+yW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765605609; c=relaxed/simple;
	bh=TOjcU9kJU5WhastDd2a2yGc9SNN9zCO5UQMr8zmaesU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0TD74waKs19m+hOvbwhXJGA2Wwh8UiuIkQwMCft6X2p8IP6SZcjW/RSs8nFnDmA6H39bM3q1i+vEYh2kGr37FZrNmFU0eM2ocZtGb2mKMJsWzPpBbRe49odOkuCOsawmLwRYLgNkQk+yrHVDqW67RB4Fkba13m1Zvd2R2zb/2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipIvLseX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipIvLseX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765605608; x=1797141608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TOjcU9kJU5WhastDd2a2yGc9SNN9zCO5UQMr8zmaesU=;
  b=ipIvLseXoUq3n0VFfm0xCnzRR1EqvikPQWacXFCeOCB8RvmfZdSEFR4E
   078ZoF+NFNrrNfqcNkhCmalowcsXppxEVcjvXGE0TaKZ+ZYnTPzkh9YNB
   vZ8UTv/N//VS9paNuNvuZxtTyooRfRZO5L4qjx2MRxnruhNAK2FI4GUI5
   fD9ZFGwZHgEwMoW1qvMc7yTRndcx81OwEYQ6XtQxgWcD66p0wcD+QEjI2
   GT1+pphJFVaV4iiUlqo4oNjHQxXnY1Q67cnKAYhAfrso+vF+Uwh6rlYmR
   twZG6aY83l/jrvs1Pcs8C3psTLZ6ZXdBJz0w707IGuGcDC8sw11jfSQqa
   Q==;
X-CSE-ConnectionGUID: WbubnKNiTvuJlwX9X/pgcg==
X-CSE-MsgGUID: hpDhzrT0TrSynno0rySMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67479171"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67479171"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:00:07 -0800
X-CSE-ConnectionGUID: Cd9ME9vvQ3+RjH2NhGUgCQ==
X-CSE-MsgGUID: YCHrlCcASN+olfF49p8gGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201749911"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 22:00:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIfj-0000000078W-1v1x;
	Sat, 13 Dec 2025 06:00:03 +0000
Date: Sat, 13 Dec 2025 13:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct
 pkvm_sm_context_param' is not assignable
Message-ID: <202512131310.upEpag20-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131310.upEpag20-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131310.upEpag20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131310.upEpag20-lkp@intel.com/

All errors (new ones prefixed by >>):

     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:267:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:31:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_clear_translation_param'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:24: note: expanded from macro 'put_this_pv_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
   drivers/iommu/intel/iommu_pkvm.h:36:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_lm_context_param'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:24: note: expanded from macro 'put_this_pv_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
>> drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct pkvm_sm_context_param' is not assignable
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct pkvm_sm_context_param' is not assignable
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:41:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sm_context_param'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:24: note: expanded from macro 'put_this_pv_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   12 errors generated.
--
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:267:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
   drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
   drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
   drivers/iommu/intel/iommu_pkvm.h:31:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_clear_translation_param'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:24: note: expanded from macro 'put_this_pv_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   In file included from drivers/iommu/intel/iommu.c:32:
   drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
   drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
   drivers/iommu/intel/iommu_pkvm.h:36:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_lm_context_param'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:24: note: expanded from macro 'put_this_pv_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct pkvm_sm_context_param' is not assignable
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:41:9: error: incomplete type 'struct pkvm_sm_context_param' is not assignable
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:41:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sm_context_param'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:24: note: expanded from macro 'put_this_pv_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   drivers/iommu/intel/iommu.c:1459:31: error: variable has incomplete type 'struct pkvm_lm_context_param'
    1459 |         struct pkvm_lm_context_param param = {
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   drivers/iommu/intel/iommu.c:1743:38: error: variable has incomplete type 'struct pkvm_clear_translation_param'
    1743 |         struct pkvm_clear_translation_param param = {
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   drivers/iommu/intel/iommu.c:4336:31: error: variable has incomplete type 'struct pkvm_lm_context_param'
    4336 |         struct pkvm_lm_context_param param = {
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   15 errors generated.
..


vim +41 drivers/iommu/intel/iommu_pkvm.h

    38	
    39	static inline long pkvm_hc_iommu_set_sm_ce(struct pkvm_sm_context_param *param)
    40	{
  > 41		return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
