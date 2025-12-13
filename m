Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE9B1DED49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765599666; cv=none; b=GNKHK1jlNj6BCOgPsKnB18DPGr1Q1gJ9W7KzEIVqjoA8DFCVfDjowvwGBozvZB7nyj5ONajP+aK6FgkaoEJmY0+6oAHhHttvxUvckh0KoEXy6qaEDHZ05Y9rMBtA1mr3CfSTkzOXmFOrYxK/VXFBnWIy7RRR7ZvGe6dk5d8U4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765599666; c=relaxed/simple;
	bh=9vKBj/EGNEpgIrQa0AR7HExEhFidSMTIJGC6ZeDx3lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VT3tn1e+16O+lKMcr+WyA9q59SAUNq3XHC+oKYizDvueOtkTdRFRS/Y+Wu8JMUfevXRKYNMZanNMLCzooCk0Kw+rzfqFv98sZSur3F4j0jTGtuUj4xpuIjp7lo4uKzmgg0nKHXuDoyQWZ1VFTferSAImDZg82pqj2q0wCbTWNys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dyr6g/hs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dyr6g/hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765599662; x=1797135662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9vKBj/EGNEpgIrQa0AR7HExEhFidSMTIJGC6ZeDx3lI=;
  b=Dyr6g/hsH4Kp000PCVoyGVr6I6C9aQ8uNwhG/XXeIamlrvAtygpjqjwr
   jCLomPa5MCcV9TAOTDmk5wh8oHAEwTT0EzqmGVUz/gUsFBPVFRDXCofNn
   x9I0v0gicGaXawgez/7QjnSlrohvUKsW1y17lq+lS7YWGrBxM5Wxn0jLU
   TN9lWxHpo/bOHel1sjzf+YyII0DmiCrfVoPqRTQ4IaixBs13BLnAblwjD
   LrD18h1lct1Kz1/AJY4LBSExK9I0d+T5nuhH6ZcNx1+ToWevt42bMj66h
   CjELBsHCmXIzaOpXnm7uHDP5maicRhl+ZDyuH7RhV3u7fxKMQkoigHKGE
   Q==;
X-CSE-ConnectionGUID: HJDW95m9RCmI6rDH7h+FWg==
X-CSE-MsgGUID: R9PjnDCeQtKySeIC5lkkfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78969454"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78969454"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:20:59 -0800
X-CSE-ConnectionGUID: tLdwhOl7S/OQaeWX9d4M6Q==
X-CSE-MsgGUID: FZ90UuloQB2EEZP5aXW7Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="228308096"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 20:20:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUH7o-0000000072P-0oyZ;
	Sat, 13 Dec 2025 04:20:56 +0000
Date: Sat, 13 Dec 2025 12:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct
 pkvm_clear_translation_param' is not assignable
Message-ID: <202512131220.ednmCjbL-lkp@intel.com>
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
commit: 157ba06fef4bdb68af268f6a0e53695c0e4ad373 [18/18] ANDROID: iommu/vt-d: Paravirtualize legacy context entry updates
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131220.ednmCjbL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131220.ednmCjbL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131220.ednmCjbL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/intel/dmar.c:34:
   In file included from drivers/iommu/intel/iommu_pkvm.h:9:
   arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type 'struct pkvm_lm_context_param'
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
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:31:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_clear_translation_param'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:313:24: note: expanded from macro 'put_this_pv_param'
     313 |                 memset(ptr, 0, sizeof(*ptr));   \
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
>> drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/dmar.c:34:
>> drivers/iommu/intel/iommu_pkvm.h:36:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_lm_context_param'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:313:24: note: expanded from macro 'put_this_pv_param'
     313 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   8 errors generated.
--
   In file included from drivers/iommu/intel/iommu.c:32:
   In file included from drivers/iommu/intel/iommu_pkvm.h:9:
   arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type 'struct pkvm_lm_context_param'
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
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:31:9: error: incomplete type 'struct pkvm_clear_translation_param' is not assignable
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:31:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_clear_translation_param'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:313:24: note: expanded from macro 'put_this_pv_param'
     313 |                 memset(ptr, 0, sizeof(*ptr));   \
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
>> drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:6: note: expanded from macro 'pkvm_iommu_hypercall'
      16 |                 *p = *(param);                                                  \
         |                 ~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:36:9: error: incomplete type 'struct pkvm_lm_context_param' is not assignable
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:12: note: expanded from macro 'pkvm_iommu_hypercall'
      18 |                 *(param) = *p;                                                  \
         |                 ~~~~~~~~ ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   In file included from drivers/iommu/intel/iommu.c:32:
>> drivers/iommu/intel/iommu_pkvm.h:36:9: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_lm_context_param'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:19:3: note: expanded from macro 'pkvm_iommu_hypercall'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:313:24: note: expanded from macro 'put_this_pv_param'
     313 |                 memset(ptr, 0, sizeof(*ptr));   \
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
   11 errors generated.


vim +31 drivers/iommu/intel/iommu_pkvm.h

    10	
    11	#define pkvm_iommu_hypercall(hc, param_name, param)			\
    12		({									\
    13			unsigned long f;						\
    14			struct pkvm_##param_name *p = get_this_pv_param(param_name, f);	\
    15			int ret;							\
    16			*p = *(param);							\
    17			ret = pkvm_hypercall(hc, (unsigned long)p);		\
  > 18			*(param) = *p;							\
    19			put_this_pv_param(p, f);					\
    20			ret;								\
    21		})
    22	
    23	static inline int pkvm_hc_qi_iec_flush(unsigned long reg_phys, bool global, unsigned long index,
    24			unsigned int mask)
    25	{
    26		return pkvm_hypercall(iommu_iec_flush, reg_phys, global, index, mask);
    27	}
    28	
    29	static inline long pkvm_hc_iommu_clear_ce(struct pkvm_clear_translation_param *param)
    30	{
  > 31		return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
    32	}
    33	
    34	static inline long pkvm_hc_iommu_set_lm_ce(struct pkvm_lm_context_param *param)
    35	{
  > 36		return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
