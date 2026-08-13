Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74537881E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610473; cv=none; b=ZRmSKRwtn9qFtgyv91whuV1uYeRxWZBtd8uq3epgY/hWJd7m+FGWBf7VwDXiK/Wg3NPMn0HsxMO8wVpTtMgSJVAFconhlvB3ovyO9LbdiIh794pWbeXOTblQlC+uKCAnSEu4ZxL7slCGqicWuLBFN/cgjK6isO/jmnwGFMMcdoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610473; c=relaxed/simple;
	bh=W4v6c61Y4BODdgTjUBwOVb4uZPvG+3YcOgskYP3uKIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hr3fWYjnWZwP79g3RPpf3ndceHHsh1w6fCi721XvTPaQP+W6qR4QyJnPPi9hUt/lVUm/g6a016jsSq/ZDoKfwaiOvBwPlkQddtHBiX31VGpLam+mrYkxrMWBou5kgBAZDqYUGmUycDXA4bgfnI3knWopYfq1KoprMmrKHKsCP98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HipRus5Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HipRus5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786610472; x=1818146472;
  h=date:from:to:cc:subject:message-id;
  bh=W4v6c61Y4BODdgTjUBwOVb4uZPvG+3YcOgskYP3uKIY=;
  b=HipRus5QhfxhxExANeGapLzu8nNge7so/0vmvMTUL+gZ/9IGoPUxsoV4
   bCu85LU0MetUirshZYqyfQ00pg4v6Yzz0RS22MSnSaWwe02YQsvQwm5Ck
   TaJAEy0FwhRk3ayAHjQXjIdnzmHAkgI+M82K9G502jdrvzSP4BBZbytBS
   TVL/e6I2gEPJnBQ+4VTeIBIBV0NhZAPrlFkJqMj5yKIJoU+r6SbzoI4vc
   kycPw5v0Fjnev/cbfsnbPf3jFwK3FuOv0TDS5uMxUt2QnGlHxuMSIrvLz
   yVcX8Ab6pUEI4CFKUT8BE73fer3+yFvjX68by1/z05xAkLTOx4AQhzpUn
   A==;
X-CSE-ConnectionGUID: 5z6jKMsSSayr5FPFbs2nrw==
X-CSE-MsgGUID: NJJLR1VKSey1utyyDLw/Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87304102"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87304102"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 01:41:11 -0700
X-CSE-ConnectionGUID: VdQw+n+oS4OdMNA4ibR/mA==
X-CSE-MsgGUID: aaij9j24R8egab/Jye5Muw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="263420676"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Aug 2026 01:41:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuQzr-00000000TPk-3tzu;
	Thu, 13 Aug 2026 08:41:07 +0000
Date: Thu, 13 Aug 2026 16:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/x86/include/asm/kvm_pkvm.h:280:30: error: field has incomplete type
 'struct pkvm_iommu_map_param'
Message-ID: <202608131659.zrfvqf95-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: e3aff207324c14597db951ea892402226359276b [1/1] ANDROID: pkvm: x86: Hypercalls for domain pagetable management
config: i386-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131659.zrfvqf95-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131659.zrfvqf95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131659.zrfvqf95-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


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
