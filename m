Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC431B83B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229894; cv=none; b=lKemQ7KexlWIgIBXu0fcd96wshJy5mKoWBt5jughesfsdwdvbyQjhi76vbyZPm4uxS70Fe4rEnGsvZn4E2wY1HFO3uXj4LmXIFaCBlZ8JnD/d45ZP6mcHL4sm1FukWocisqR3pI0uh74MZkNRIpOnkMpiLF9dwHC7+29V2xTwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229894; c=relaxed/simple;
	bh=bvrNUfhfDSfZSjhjetWKxYyzV5wgEcsKfwLT38SX7Co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l8CCRu3Wp8gpOS/ZPbGT4LDPCYAx+dQMYoY+If2k5bixexi6XEQS9q/cuCj74nP/+O9IfjHrFLLyFSZJdF2NVSYM2KlJ3lMmqOsn1cs8k/ipq2EZQe8nU6rcDF/i1PQRQal8ExMUC8JasDklKzOXs2DrDenmsMAWpJAdEeallKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkgcC2Sh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkgcC2Sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770229894; x=1801765894;
  h=date:from:to:cc:subject:message-id;
  bh=bvrNUfhfDSfZSjhjetWKxYyzV5wgEcsKfwLT38SX7Co=;
  b=GkgcC2ShUKRuZQJ45pxwxyk294ZEaOxfErTr+t3VG0J2/6IWvPtGmKsR
   ppBy5LJlZAxFTZedmHHSGNJOvR2QNi2gaqPQ6dZUbjVFG+DHUBk6qA2U0
   NQ9Pzrenffbw+FQKnU0CIWdGx9BZ6BjISbyZiwW6uqYWJ8p5eNIQnamm8
   8Bj5uVb40BUehYjW9Nze7AnOn14BViUIO6lfYi9JJLHiZseGUhwNsPRAy
   q1nFzrNtKUDcFQYHfzKFQFzj4CcamgpkJbl5pDecocIEY/HnwD3HtQVv6
   oRszyoa4c567Q7qdu2z3fdd+LMiVUDfzoSaXc9GD5VyNc5KceRnk2ueid
   g==;
X-CSE-ConnectionGUID: krUskgbjRSO+0NK7/McxMQ==
X-CSE-MsgGUID: w+LacDQTSk+krDTGviGoXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71593226"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71593226"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 10:31:34 -0800
X-CSE-ConnectionGUID: HcEJWpWKQQSUnTe+zLSNTQ==
X-CSE-MsgGUID: fsLQHQWaSJecAE21nhapgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209530849"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Feb 2026 10:31:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnhez-00000000j5k-2t2k;
	Wed, 04 Feb 2026 18:31:29 +0000
Date: Thu, 05 Feb 2026 02:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for
 'gunyah_generic_vm_start_fail'
Message-ID: <202602050222.DNrUykIK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Prakruthi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   cd803aca7466b8a9b15f4c9191a05177d7e73098
commit: 67d7d75278b34154c001ddfb435beae6bf2cd315 [4/4] ANDROID: gunyah: vm_mgr: Use auth_mgr_ops for a generic VM setup
config: arm64-randconfig-002-20260205 (https://download.01.org/0day-ci/archive/20260205/202602050222.DNrUykIK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050222.DNrUykIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050222.DNrUykIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for 'gunyah_generic_vm_start_fail' [-Wmissing-prototypes]
     117 | void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:280,
                    from include/linux/static_key.h:1,
                    from include/linux/kasan-enabled.h:5,
                    from arch/arm64/include/asm/cache.h:41,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from drivers/virt/gunyah/vm_mgr.c:9:
   drivers/virt/gunyah/vm_mgr.c: In function 'gunyah_vm_function_unregister':
   drivers/virt/gunyah/vm_mgr.c:286:21: error: implicit declaration of function 'module_refcount' [-Werror=implicit-function-declaration]
     286 |  WARN_ON(fn->mod && module_refcount(fn->mod));
         |                     ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:25: note: in definition of macro 'WARN_ON'
     171 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
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
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
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
