Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352763;
	b=lrJ73VI2HKRp7O9Q0i4/hgCDX12ser5tR/DafDqUvuK28h7u8VZ4Vf2K0qjUeloyaEPP
	 6wvZZG4BDZll9thYXdbMUEnIaexwxh0h4PJgF1psaehTTXUzfJGEegv/hfASvnbxgSQmw
	 /N73rQHkOqI7h1wl19bBgtErr3LqwVnZhY7t09x9uU74gxGVXiBaJFeRyZfTOpxmDTptD
	 sEEOsTkoO0gsJD72MBF8Yjo+NRD6HxtrTPvJZM7iZF9QtRa/1q6Y8b99wxHb/8mziBGti
	 OnZ7bT9kfqlprGOVfUeglWWy+HLr9BBtGO7jWERyZxma9tDNHyrO/rWTfnwkZNR3ZPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fwXLATlV4bZZixtR4g2mz5ZO9gGmMXUdmDFNc6FfywE=;
	b=25xSMYNKaImH5+IEmo1UvMaqT7GrvW0D+mVf5BZaS6Om7LpJftl7g68dnCkNqrtvBUvX
	 o6knVQ5ZH7PkWxYkqrVmF73KdvFN0fOCISTGnM6uu5z7/l10O1fwyRryzw73T9Pxk+vlM
	 aD8zvQEBH+Kwpfih7e0UaD8hCQBm788ok6WD6aPHtQLqNPwgf/yYUMmf1umAjNp1TDyxV
	 +PYGSxX5h7G05BFVcXp0AgmtVSrZNz3x3UGluIi4Enk381wsHolckYcZ5gNIHiEfWfdd9
	 7JZjG1eZdfsmS5shOG03kZqrKvX3gTuELwtFpUwAF2aeRZHXLj+dHQUKv8cyRr4aB6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTqkmJBZ;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 09:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4917D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iTqkmJBZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352763; x=1824888763;
  h=date:from:to:cc:subject:message-id;
  bh=boWsIwqM7qGZxFgnlCYAYdpfXpG58K4dw8uhAni1nng=;
  b=iTqkmJBZ4VizARLmkTWjAHsVTz0b1jCTOnoezjVT80B2IdggWcLm4xtP
   g1+sLkjeEq+qfEJkVaxt2C89DwgSN/G24hpXmvBeEzPqHjKfOPVLgUy5T
   am7KsIDHMt+ALgVwJ+oFaPXUdrsD7jF62TLRxUBKoPYfoyuhk9qDIDnLs
   B1K6wE7CtK7k4ZIrtCpAakecOeZ/QdI/j0PMX5B0r8QGhVzm05IP9xp94
   IkIw73xTlbqIHKLwC8gfZAbFL4wb7nVwUJsPKINVWuYwg6FO5VyHgOHOE
   CcAx1MjchafaBsXh6WUB8v8QpYFD/M8JtGXkmMjYkVuRuj9u/1VVZyRpI
   g==;
X-CSE-ConnectionGUID: E/KjqIH+Td6t8ezFCAk2Vw==
X-CSE-MsgGUID: VXcKnoqcRJGBnnvfRZhkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2139597"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2139597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:32:43 -0700
X-CSE-ConnectionGUID: DOSdqMq0Qve7UGAxVBB8sQ==
X-CSE-MsgGUID: 3Lg+EPEGQj6wey2hukITCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5473171"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2026 02:31:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMixR-000000005XM-0kx5;
	Fri, 30 Oct 2026 09:31:33 +0000
Date: Fri, 30 Oct 2026 10:31:13 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for
 'gunyah_generic_vm_start_fail'
Message-ID: <202610301033.W8L2ZWcG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Prakruthi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bc537c78955c9e22326fa13e2982b9e06a3d9f23
commit: 67d7d75278b34154c001ddfb435beae6bf2cd315 [3/3] ANDROID: gunyah: vm_mgr: Use auth_mgr_ops for a generic VM setup
config: arm64-randconfig-r2102-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301033.W8L2ZWcG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301033.W8L2ZWcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301033.W8L2ZWcG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for 'gunyah_generic_vm_start_fail' [-Wmissing-prototypes]
     117 | void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:24,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from drivers/virt/gunyah/vm_mgr.c:9:
   drivers/virt/gunyah/vm_mgr.c: In function 'gunyah_vm_function_unregister':
   drivers/virt/gunyah/vm_mgr.c:286:28: error: implicit declaration of function 'module_refcount' [-Wimplicit-function-declaration]
     286 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


vim +/gunyah_generic_vm_start_fail +117 drivers/virt/gunyah/vm_mgr.c

   116	
 > 117	void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
   118	{
   119		/**
   120		 * need to rollback parcel_to_paged because RM is still
   121		 * tracking the parcel
   122		 */
   123		gunyah_vm_mm_erase_range(ghvm,
   124			ghvm->config_image.parcel.start,
   125			ghvm->config_image.parcel.pages);
   126	}
   127	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
