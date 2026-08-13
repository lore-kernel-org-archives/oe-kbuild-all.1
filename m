Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460BA2D0292
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589740; cv=none; b=OaWMOGqkNRObhLl4seOWcAVdKZj5Op1NejWuIcd9zjgtY7HICtD7qo8s45seEdkG4tzysRoKa5v2OtGMm+KALzKJD5rCeoxWo584+nG8HNvs0HHW3/jNpiqQPe3Fi9zBZLs2jMR3RLlg0AhO0/BESuJXCMCbya5mLnuYRscBXYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589740; c=relaxed/simple;
	bh=vuWt7r+IB1zzHB0PgJ1E2gLS+q+y2lhvVorRHwsuVho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZGLdV2Gtn71cyEjhjf1NgfKDy4GEKC3inFhd0Lq7Dr/LXtj2Bd4UM4SWEhknlXs9b5oJnRqRCO0Rtk/GNR3dVzV5ysC7Op4h/Wkv2fC3eVRz7Pn0sVH1ANJcOKUvHPOVl/crJ/Ub5z38nbA4/MAm3EG8yE2kU7gXynKYC9p691k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIod5Y0Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIod5Y0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786589738; x=1818125738;
  h=date:from:to:cc:subject:message-id;
  bh=vuWt7r+IB1zzHB0PgJ1E2gLS+q+y2lhvVorRHwsuVho=;
  b=IIod5Y0Z2CTNYWIJw3nU0ZCKuGnhGIBCvRVz1iw7n67HLairYvcRQRwV
   0+H4vutVlRgG1Zv3JgKveXEyIvw4TQ8WdA0wu339SZDwKdrLaCgX/+JJ5
   q7uFXN/yUYhBPF1ni3rSu7wNzsQQSeVjdxizVkM9MDcYSxBlzJW4DnBQG
   zjJs+Gf+E883X++Ss+zEYMKzGJ3fKp8i75pnzWtjy2jXpkZpWvhl706cb
   HKDVRyZSIWxrrtOBGqouF2FjtLT3VqPw0OcToGTVmv0QLWJe0LGrbR8KH
   jzuT9W5Sj3DQw97McEStr6y39Ne71S2SVN3Oh/AkRauvfNLoDvBPpyRMz
   A==;
X-CSE-ConnectionGUID: ttDYbDbSTceMANQADoOseg==
X-CSE-MsgGUID: vkSEub15REKwo8coOj28Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87232700"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87232700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:55:36 -0700
X-CSE-ConnectionGUID: wrdVn46STMOYnDLhmFqH7g==
X-CSE-MsgGUID: e5+RPTOkQBSdkgmC4S95lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267666749"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2026 19:55:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuLbP-00000000SbN-3MK5;
	Thu, 13 Aug 2026 02:55:31 +0000
Date: Thu, 13 Aug 2026 10:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/x86/include/asm/kvm_pkvm.h:269:32: error: field has incomplete type
 'struct pkvm_pasid_table_param'
Message-ID: <202608131018.TXiMGmzr-lkp@intel.com>
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
commit: c3227e233875bf000ec6fc62cb11729cc3325c62 [1/1] ANDROID: pkvm: x86: PASID Table update hypercalls
config: i386-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131018.TXiMGmzr-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131018.TXiMGmzr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131018.TXiMGmzr-lkp@intel.com/

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
>> arch/x86/include/asm/kvm_pkvm.h:269:32: error: field has incomplete type 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^
   arch/x86/include/asm/kvm_pkvm.h:269:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   4 errors generated.

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


vim +269 arch/x86/include/asm/kvm_pkvm.h

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
 > 269		struct pkvm_pasid_table_param pasid_table_param;
   270	} __aligned(PAGE_SIZE);
   271	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
