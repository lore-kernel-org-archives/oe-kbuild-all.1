Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154825785C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786581015; cv=none; b=RBp9sdOM5kso68xvLE0WStK/kjp5tvmhgbNHIxo0WBzXvHMoPFCh6voieVI+g/QmpT82ditNhiywO1KVV1HaEXhHadln3YHkiEOADMPbGtKRzZiPwSTsak+xZtgL1AyYxgAfvXFrcOlAD4c662njcgXueDM3mYDWx0Ajv3pGoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786581015; c=relaxed/simple;
	bh=xwd91bDeGU9J3p5aqugWQeaxrecNhRadkfgInGFnrAg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IxWg4ZlXiYlv32/17zKvzlh2rt07Xa0K3kqJu0VOqUrZppl/5JqG0f178/GB6fdlUn0VhN5mg5cHv81MqsZMNY7/IH4XMz57L/E4nE3WtuxRIdprA58G4tAq43ZtC/GrF5gZbIfkO28U0O1fZFjUP4mD7YtzqBOT6UAp2aeao/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goV5sD+I; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goV5sD+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786581013; x=1818117013;
  h=date:from:to:cc:subject:message-id;
  bh=xwd91bDeGU9J3p5aqugWQeaxrecNhRadkfgInGFnrAg=;
  b=goV5sD+IAgaW2VqqGMD8PiKqWRdudgDbetFp1Xv3UrrHPyhrFoOHEp5g
   6iRko+i9R/qd3EWwGs53MkDX/jWzigTexudZlM9OThEQJV4YCQgRXpROH
   fbaJbhjAm2VY77PweJobah4X2VwAFBKHySSNWcsCvnDvP8KlwnQuXQkDD
   Zyb78OjKFmKArcDqsJV/qwhGbZB+KWZrZ6kggMo3nnEVfyyCEqO6e6/3S
   UNx8Eal7RLlU8Cf1itQz7lX3re+FCF80Zu0RfI3edmOEIKf/jCRgjjyMY
   eHJIyUCpoD/p3yVGxSckX86CBxl1AG2g2nbafu21Cbgc0yC+hRgnlJcTF
   Q==;
X-CSE-ConnectionGUID: OlteWXXnQ5++wrc0ya4WBw==
X-CSE-MsgGUID: HWZrMBvaR8e93uzrVpbPFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86916382"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86916382"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 17:30:13 -0700
X-CSE-ConnectionGUID: W9tpuHWBRK++rQ6qAnDmJQ==
X-CSE-MsgGUID: Bc/o412mS6+XkQe3RmSWeA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2026 17:30:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJKi-00000000SHy-13pd;
	Thu, 13 Aug 2026 00:30:08 +0000
Date: Thu, 13 Aug 2026 08:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type
 'struct pkvm_sm_context_param'
Message-ID: <202608130845.GvVCBZ7N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aashish,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: f8ecd866e541b10a412882b8e0b0d02c1a17df8d [1/1] ANDROID: pkvm: x86: Hypercalls for scalable mode context update.
config: i386-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130845.GvVCBZ7N-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130845.GvVCBZ7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130845.GvVCBZ7N-lkp@intel.com/

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
>> arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   3 errors generated.

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


vim +268 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
 > 266		struct pkvm_lm_context_param lm_context_param;
   267		struct pkvm_clear_translation_param clear_translation_param;
 > 268		struct pkvm_sm_context_param sm_context_param;
   269	} __aligned(PAGE_SIZE);
   270	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
