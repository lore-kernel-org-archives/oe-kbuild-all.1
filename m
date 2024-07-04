Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1125D1A3BDA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098570; cv=none; b=c1swjW7gNNaOGIZ7ujv2GEFALUk7oT/MI7XQRN9tJwxYlq33CC7JkZXJdZcZ22vvPdeeQp9lL744/leNlc4oViLcOXfTYNFWgHXze2/QI/4h3Txg5z0vuPiIgkAY3Y2dnQOb0eqjDlL8SIvrFDKnPUB7di6vcWzCLMEZjxCDiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098570; c=relaxed/simple;
	bh=Hggmi7ADMv97Y4cV/4WNpzH+MyfbmcbU8+cFjw0m47o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MGhlirWyhJLoL1dt8baFRs2Wj4gyFWIQvfxVikV0s2adDyto4ONEFCIysL4GZ/L0JlKP22Do4ILMTLt49tvWMPoupscNdpZFJnfiv+0X+lcJweE2DAgCALSQNcQ+F2nV5Si0VTtCwGzMAcYX2f/VKUeMPpeMnN+nt+hbIfza+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTj3wYnp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTj3wYnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720098568; x=1751634568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hggmi7ADMv97Y4cV/4WNpzH+MyfbmcbU8+cFjw0m47o=;
  b=kTj3wYnpNXTI0t1pLy6DBlJsWoQ0s2YeqsFf2YoAhHLyxlkkRPQF2QVv
   25uT9rpR8vV9ja0nq/mUEkXaS9hBbyUWPrklPhiISWMZP4wuCFGUni88L
   h//QWQMktEOM5zIYA/1nRAPT+PS8HqLb9PiF8ujjswASqTM0elEHr/uDM
   qYzUaMwu5EhvlWJ5tVPz6E1vldS4U+4CQn/Hc2s9NYy31+hufe8cnGdwS
   xQkzLwEse5Qu/lR/1YeNYCs/hh/mrFvOEJnbRX+SJOWraRePioD0W85aX
   fbRMLDUUb1M62OBtP36uJwkvsVjZgxs6tXzeHmrtYMdBPrrdqpL4ATp60
   Q==;
X-CSE-ConnectionGUID: m0INPT2+Tx2uDx3VrHHmNw==
X-CSE-MsgGUID: ySmOvobTRJ6EBo0aMM7PdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20282395"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="20282395"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 06:09:24 -0700
X-CSE-ConnectionGUID: V+Ko3c7KT7W7S29Up7smEg==
X-CSE-MsgGUID: zCTxQsAqRaun7zwQiTlUfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46729951"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2024 06:09:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPMDA-000R1I-20;
	Thu, 04 Jul 2024 13:09:20 +0000
Date: Thu, 4 Jul 2024 21:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 37/53]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3906:9: error: implicit
 declaration of function 'writeq_relaxed'; did you mean 'writel_relaxed'?
Message-ID: <202407042152.8oG2YSCc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 23dbb9b1e1ec4cc15b44eeb954b5045ed86daf78 [37/53] add COMPILE_TEST
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240704/202407042152.8oG2YSCc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042152.8oG2YSCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042152.8oG2YSCc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/mmu_context.h:5,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   include/asm-generic/mm_hooks.h:10:40: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      10 | static inline int arch_dup_mmap(struct mm_struct *oldmm,
         |                                        ^~~~~~~~~
   include/asm-generic/mm_hooks.h:16:42: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline void arch_exit_mmap(struct mm_struct *mm)
         |                                          ^~~~~~~~~
   include/asm-generic/mm_hooks.h:20:38: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      20 | static inline void arch_unmap(struct mm_struct *mm,
         |                                      ^~~~~~~~~
>> include/asm-generic/mm_hooks.h:25:15: error: unknown type name 'bool'
      25 | static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
         |               ^~~~
   include/asm-generic/mm_hooks.h:26:17: error: unknown type name 'bool'
      26 |                 bool write, bool execute, bool foreign)
         |                 ^~~~
   include/asm-generic/mm_hooks.h:1:1: note: 'bool' is defined in header '<stdbool.h>'; did you forget to '#include <stdbool.h>'?
     +++ |+#include <stdbool.h>
       1 | /* SPDX-License-Identifier: GPL-2.0 */
   include/asm-generic/mm_hooks.h:26:29: error: unknown type name 'bool'
      26 |                 bool write, bool execute, bool foreign)
         |                             ^~~~
   include/asm-generic/mm_hooks.h:26:29: note: 'bool' is defined in header '<stdbool.h>'; did you forget to '#include <stdbool.h>'?
   include/asm-generic/mm_hooks.h:26:43: error: unknown type name 'bool'
      26 |                 bool write, bool execute, bool foreign)
         |                                           ^~~~
   include/asm-generic/mm_hooks.h:26:43: note: 'bool' is defined in header '<stdbool.h>'; did you forget to '#include <stdbool.h>'?
--
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:32:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:41: error: field 'mmu_notifier' has incomplete type
     755 |         struct mmu_notifier             mmu_notifier;
         |                                         ^~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:566,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:12:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_get_ste_used':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:265:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     265 | #define STRTAB_STE_2_S2AA64             (1UL << 51)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1013:37: note: in expansion of macro 'STRTAB_STE_2_S2AA64'
    1013 |                                     STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:266:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     266 | #define STRTAB_STE_2_S2ENDI             (1UL << 52)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1013:59: note: in expansion of macro 'STRTAB_STE_2_S2ENDI'
    1013 |                                     STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
         |                                                           ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:267:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     267 | #define STRTAB_STE_2_S2PTW              (1UL << 54)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1014:37: note: in expansion of macro 'STRTAB_STE_2_S2PTW'
    1014 |                                     STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2R);
         |                                     ^~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:268:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     268 | #define STRTAB_STE_2_S2R                (1UL << 58)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1014:58: note: in expansion of macro 'STRTAB_STE_2_S2R'
    1014 |                                     STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2R);
         |                                                          ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:265:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     265 | #define STRTAB_STE_2_S2AA64             (1UL << 51)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1013:37: note: in expansion of macro 'STRTAB_STE_2_S2AA64'
    1013 |                                     STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:266:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     266 | #define STRTAB_STE_2_S2ENDI             (1UL << 52)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1013:59: note: in expansion of macro 'STRTAB_STE_2_S2ENDI'
    1013 |                                     STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
         |                                                           ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:267:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     267 | #define STRTAB_STE_2_S2PTW              (1UL << 54)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1014:37: note: in expansion of macro 'STRTAB_STE_2_S2PTW'
    1014 |                                     STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2R);
         |                                     ^~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:268:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     268 | #define STRTAB_STE_2_S2R                (1UL << 58)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1014:58: note: in expansion of macro 'STRTAB_STE_2_S2R'
    1014 |                                     STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2R);
         |                                                          ^~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_make_s1_cd':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:312:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     312 | #define CTXDESC_CD_0_AA64               (1UL << 41)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1344:17: note: in expansion of macro 'CTXDESC_CD_0_AA64'
    1344 |                 CTXDESC_CD_0_AA64 |
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:313:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     313 | #define CTXDESC_CD_0_S                  (1UL << 44)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1345:42: note: in expansion of macro 'CTXDESC_CD_0_S'
    1345 |                 (master->stall_enabled ? CTXDESC_CD_0_S : 0) |
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:314:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     314 | #define CTXDESC_CD_0_R                  (1UL << 45)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1346:17: note: in expansion of macro 'CTXDESC_CD_0_R'
    1346 |                 CTXDESC_CD_0_R |
         |                 ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:315:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     315 | #define CTXDESC_CD_0_A                  (1UL << 46)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1347:17: note: in expansion of macro 'CTXDESC_CD_0_A'
    1347 |                 CTXDESC_CD_0_A |
         |                 ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:316:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     316 | #define CTXDESC_CD_0_ASET               (1UL << 47)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1348:17: note: in expansion of macro 'CTXDESC_CD_0_ASET'
    1348 |                 CTXDESC_CD_0_ASET |
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:312:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     312 | #define CTXDESC_CD_0_AA64               (1UL << 41)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1344:17: note: in expansion of macro 'CTXDESC_CD_0_AA64'
    1344 |                 CTXDESC_CD_0_AA64 |
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:313:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     313 | #define CTXDESC_CD_0_S                  (1UL << 44)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1345:42: note: in expansion of macro 'CTXDESC_CD_0_S'
    1345 |                 (master->stall_enabled ? CTXDESC_CD_0_S : 0) |
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:314:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     314 | #define CTXDESC_CD_0_R                  (1UL << 45)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1346:17: note: in expansion of macro 'CTXDESC_CD_0_R'
    1346 |                 CTXDESC_CD_0_R |
         |                 ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:315:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     315 | #define CTXDESC_CD_0_A                  (1UL << 46)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1347:17: note: in expansion of macro 'CTXDESC_CD_0_A'
    1347 |                 CTXDESC_CD_0_A |
         |                 ^~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:316:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     316 | #define CTXDESC_CD_0_ASET               (1UL << 47)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1348:17: note: in expansion of macro 'CTXDESC_CD_0_ASET'
    1348 |                 CTXDESC_CD_0_ASET |
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_make_s2_domain_ste':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:265:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     265 | #define STRTAB_STE_2_S2AA64             (1UL << 51)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1630:17: note: in expansion of macro 'STRTAB_STE_2_S2AA64'
    1630 |                 STRTAB_STE_2_S2AA64 |
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:266:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     266 | #define STRTAB_STE_2_S2ENDI             (1UL << 52)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1632:17: note: in expansion of macro 'STRTAB_STE_2_S2ENDI'
    1632 |                 STRTAB_STE_2_S2ENDI |
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:267:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     267 | #define STRTAB_STE_2_S2PTW              (1UL << 54)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1634:17: note: in expansion of macro 'STRTAB_STE_2_S2PTW'
    1634 |                 STRTAB_STE_2_S2PTW |
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:268:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     268 | #define STRTAB_STE_2_S2R                (1UL << 58)
         |                                              ^~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1635:17: note: in expansion of macro 'STRTAB_STE_2_S2R'
    1635 |                 STRTAB_STE_2_S2R);
         |                 ^~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:265:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     265 | #define STRTAB_STE_2_S2AA64             (1UL << 51)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1630:17: note: in expansion of macro 'STRTAB_STE_2_S2AA64'
    1630 |                 STRTAB_STE_2_S2AA64 |
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:266:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     266 | #define STRTAB_STE_2_S2ENDI             (1UL << 52)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1632:17: note: in expansion of macro 'STRTAB_STE_2_S2ENDI'
    1632 |                 STRTAB_STE_2_S2ENDI |
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:267:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     267 | #define STRTAB_STE_2_S2PTW              (1UL << 54)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1634:17: note: in expansion of macro 'STRTAB_STE_2_S2PTW'
    1634 |                 STRTAB_STE_2_S2PTW |
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:268:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     268 | #define STRTAB_STE_2_S2R                (1UL << 58)
         |                                              ^~
   include/uapi/linux/swab.h:133:19: note: in definition of macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1635:17: note: in expansion of macro 'STRTAB_STE_2_S2R'
    1635 |                 STRTAB_STE_2_S2R);
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_handle_evt':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:417:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     417 | #define EVTQ_1_S2                       (1UL << 39)
         |                                              ^~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1763:22: note: in expansion of macro 'EVTQ_1_S2'
    1763 |         if (evt[1] & EVTQ_1_S2)
         |                      ^~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:416:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     416 | #define EVTQ_1_RnW                      (1UL << 35)
         |                                              ^~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1769:22: note: in expansion of macro 'EVTQ_1_RnW'
    1769 |         if (evt[1] & EVTQ_1_RnW)
         |                      ^~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:415:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     415 | #define EVTQ_1_InD                      (1UL << 34)
         |                                              ^~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1774:22: note: in expansion of macro 'EVTQ_1_InD'
    1774 |         if (evt[1] & EVTQ_1_InD)
         |                      ^~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:414:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     414 | #define EVTQ_1_PnU                      (1UL << 33)
         |                                              ^~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1777:22: note: in expansion of macro 'EVTQ_1_PnU'
    1777 |         if (evt[1] & EVTQ_1_PnU)
         |                      ^~~~~~~~~~
   In file included from <command-line>:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_handle_ppr':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:435:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     435 | #define PRIQ_0_SSID_V                   (1UL << 63)
         |                                              ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1852:15: note: in expansion of macro 'FIELD_GET'
    1852 |         ssv = FIELD_GET(PRIQ_0_SSID_V, evt[0]);
         |               ^~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1852:25: note: in expansion of macro 'PRIQ_0_SSID_V'
    1852 |         ssv = FIELD_GET(PRIQ_0_SSID_V, evt[0]);
         |                         ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:435:46: warning: left shift count >= width of type [-Wshift-count-overflow]
     435 | #define PRIQ_0_SSID_V                   (1UL << 63)
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [m]:
   - ARM_SMMU_V3 [=m] && IOMMU_SUPPORT [=y] && (ARM64 || COMPILE_TEST [=y])


vim +3906 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3817  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3818  static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3819  {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3820  	u64 reg;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3821  	int ret;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3822  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3823  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3824  		ret = arm_smmu_init_strtab_2lvl(smmu);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3825  	else
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3826  		ret = arm_smmu_init_strtab_linear(smmu);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3827  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3828  	if (ret)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3829  		return ret;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3830  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3831  	/* Set the strtab base address */
1cf9e54e91aac6 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2018-03-26  3832  	reg  = smmu->strtab_cfg.strtab_dma & STRTAB_BASE_ADDR_MASK;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27 @3833  	reg |= STRTAB_BASE_RA;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3834  	smmu->strtab_cfg.strtab_base = reg;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3835  
1672730cffaf56 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Dawei Li              2023-07-16  3836  	ida_init(&smmu->vmid_map);
82d9f27371cb3a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jason Gunthorpe       2023-10-03  3837  	xa_init_flags(&smmu->asid_map, XA_FLAGS_ALLOC1);
82d9f27371cb3a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jason Gunthorpe       2023-10-03  3838  	mutex_init(&smmu->asid_lock);
1672730cffaf56 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Dawei Li              2023-07-16  3839  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3840  	return 0;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3841  }
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3842  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3843  static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3844  {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3845  	int ret;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3846  
cdf315f907d46a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-04-01  3847  	mutex_init(&smmu->streams_mutex);
cdf315f907d46a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-04-01  3848  	smmu->streams = RB_ROOT;
cdf315f907d46a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-04-01  3849  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3850  	ret = arm_smmu_init_queues(smmu);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3851  	if (ret)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3852  		return ret;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3853  
04fa26c71be5d7 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-10-30  3854  	return arm_smmu_init_strtab(smmu);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3855  }
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3856  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3857  static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3858  				   unsigned int reg_off, unsigned int ack_off)
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3859  {
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3860  	u32 reg;
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3861  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3862  	writel_relaxed(val, smmu->base + reg_off);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3863  	return readl_relaxed_poll_timeout(smmu->base + ack_off, reg, reg == val,
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3864  					  1, ARM_SMMU_POLL_TIMEOUT_US);
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3865  }
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  3866  
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3867  /* GBPA is "special" */
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3868  static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3869  {
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3870  	int ret;
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3871  	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3872  
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3873  	ret = readl_relaxed_poll_timeout(gbpa, reg, !(reg & GBPA_UPDATE),
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3874  					 1, ARM_SMMU_POLL_TIMEOUT_US);
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3875  	if (ret)
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3876  		return ret;
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3877  
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3878  	reg &= ~clr;
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3879  	reg |= set;
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3880  	writel_relaxed(reg | GBPA_UPDATE, gbpa);
b63b3439b85609 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2018-07-25  3881  	ret = readl_relaxed_poll_timeout(gbpa, reg, !(reg & GBPA_UPDATE),
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3882  					 1, ARM_SMMU_POLL_TIMEOUT_US);
b63b3439b85609 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2018-07-25  3883  
b63b3439b85609 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2018-07-25  3884  	if (ret)
b63b3439b85609 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2018-07-25  3885  		dev_err(smmu->dev, "GBPA not responding to update\n");
b63b3439b85609 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2018-07-25  3886  	return ret;
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3887  }
dc87a98db751a9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2016-09-12  3888  
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3889  static void arm_smmu_free_msis(void *data)
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3890  {
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3891  	struct device *dev = data;
14fd06c776b528 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Thomas Gleixner       2024-01-27  3892  
14fd06c776b528 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Thomas Gleixner       2024-01-27  3893  	platform_device_msi_free_irqs_all(dev);
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3894  }
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3895  
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3896  static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3897  {
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3898  	phys_addr_t doorbell;
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3899  	struct device *dev = msi_desc_to_dev(desc);
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3900  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
dba27c7fa36f46 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Thomas Gleixner       2021-12-10  3901  	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3902  
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3903  	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
1cf9e54e91aac6 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2018-03-26  3904  	doorbell &= MSI_CFG0_ADDR_MASK;
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3905  
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13 @3906  	writeq_relaxed(doorbell, smmu->base + cfg[0]);
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3907  	writel_relaxed(msg->data, smmu->base + cfg[1]);
cbcee19ac4a2c9 drivers/iommu/arm-smmu-v3.c                 Robin Murphy          2018-03-26  3908  	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3909  }
166bdbd2316116 drivers/iommu/arm-smmu-v3.c                 Marc Zyngier          2015-10-13  3910  

:::::: The code at line 3906 was first introduced by commit
:::::: 166bdbd23161160f2abcea70621adba179050bee iommu/arm-smmu: Add support for MSI on SMMUv3

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
