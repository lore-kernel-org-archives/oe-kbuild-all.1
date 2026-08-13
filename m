Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A8523EAA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 06:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786600873; cv=none; b=do0DWh/WLkl/zicwVhUFELJjj5uicGqbdgNogVxiQoOyCwY4AGLogSzCPwICLrM6o0/Kw8ULSy4G8ApcctJcu32Ebgz1le+JkChro124xWpptxt19F0d97D3IVvXh3hR7F+zmZhYRmjDOWaipnjOPjbw30EE16Wf3A3Pq8kuTE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786600873; c=relaxed/simple;
	bh=UCuQFSNdWHWUL1jgQS1PK0Aq/k5jsFgLlY2/TRROJkw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KVdaBa7HuDc5ttYlR0+3fHFJI/zq5qYLyhEC2ID2baIyo19Nk1ly85cPI6rjTW8YwdDpp8sRwQZFYQb6R3jti/SBReizAn89bPaRbYNcXfbc+khK/YR2MWymKHxtfCgcINlcor+C0dlrixYxDc7c63S0F/LRm+Tcw8EOTPOiaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3b/AR/y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3b/AR/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786600872; x=1818136872;
  h=date:from:to:cc:subject:message-id;
  bh=UCuQFSNdWHWUL1jgQS1PK0Aq/k5jsFgLlY2/TRROJkw=;
  b=P3b/AR/yGH8XUgZprCx2t7uoxj7hWh+ZwVlw/mVRYoop2J6mOvD6FLjT
   qkEMAQsgfuSHk+P5ONF1swelgFg0rgPN+XZOJgwUAGobG0Sv/rwLj5TmF
   6JU+TFrJ67vlJpp9QcgdpnC6DnA2N1lIPjqXV2Cm91NwLCQbYNkrV3EEX
   aC7aTvxnPvkBsEULltdAKi2lA6QmtF2DAAxRjS9UmjJ0nQsuo5wNZr899
   mzUS3U8WjrpUAHd3l2bnEJS+eAZIEkGglpZfb5slbABsUoxsB6LTd6aKY
   IxxeZHj38S73xIrDe3ji/1MJEzqCWV7uTUy00UKl9j0429cGQ4dbVtQwo
   A==;
X-CSE-ConnectionGUID: d+qb1rz5Q6WKDkK2rdEB5g==
X-CSE-MsgGUID: TyGnmV7WR+mYMkYCIm816g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="74704340"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="74704340"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 23:01:11 -0700
X-CSE-ConnectionGUID: rWW4FCmXS5en7GvzVh1E+Q==
X-CSE-MsgGUID: W8PVU/BMR1WAAASoYo9UQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263885129"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 23:01:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOV1-00000000SzS-0d54;
	Thu, 13 Aug 2026 06:01:07 +0000
Date: Thu, 13 Aug 2026 14:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/x86/include/asm/kvm_pkvm.h:270:27: error: field has incomplete type
 'struct pkvm_domain_param'
Message-ID: <202608131309.Fmso5uUg-lkp@intel.com>
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
commit: f24cdadefceff37f8b2ffc66635ba5df50633b8c [1/1] ANDROID: pkvm: x86: Hypercalls for iommu domain management
config: i386-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131309.Fmso5uUg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131309.Fmso5uUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131309.Fmso5uUg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
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
   arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:269:32: error: field has incomplete type 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^
   arch/x86/include/asm/kvm_pkvm.h:269:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:270:27: error: field has incomplete type 'struct pkvm_domain_param'
     270 |         struct pkvm_domain_param domain_param;
         |                                  ^
   arch/x86/include/asm/kvm_pkvm.h:270:9: note: forward declaration of 'struct pkvm_domain_param'
     270 |         struct pkvm_domain_param domain_param;
         |                ^
   5 errors generated.

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


vim +270 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
   266		struct pkvm_lm_context_param lm_context_param;
   267		struct pkvm_clear_translation_param clear_translation_param;
   268		struct pkvm_sm_context_param sm_context_param;
   269		struct pkvm_pasid_table_param pasid_table_param;
 > 270		struct pkvm_domain_param domain_param;
   271	} __aligned(PAGE_SIZE);
   272	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
