Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE636C9D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 05:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783834072; cv=none; b=d+VAodviOq79nIyOBgtdCvsRTq26htNYJBqPp4fGKI5olSSJVZ5lQhyEsTxj6s84f3JlGbcBf5Z+3FP38/7pLeGYa9cMVSzcW3fi8iG4W6kzldpIzsoHARxbQ5mavLDdt5EgxETvFgMkHUiKJgKx3G05E2RxApwFxDD970kVm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783834072; c=relaxed/simple;
	bh=HXsRW8cSy0s5zb3aGwEIpHunZYc8j2CgNlxssqxllNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MdQc26v0snUGnqoaz85l/yo+96JDx+5+GvZuhlzbvpClicsBX1JWnU+JhTWbimkLWuc1tQlAfD+4UtyRBVYAvmh5VPNzGnoHFbr60/SBds98NWYaODHF2kq9DMNJsxrqum01jV/h65wIqCcNXMlYiOujwSqnwvw9vB8s8mggjis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+12p+CO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+12p+CO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783834071; x=1815370071;
  h=date:from:to:cc:subject:message-id;
  bh=HXsRW8cSy0s5zb3aGwEIpHunZYc8j2CgNlxssqxllNc=;
  b=g+12p+COIXEeX4Oda64sZ6wo+nOI+6yPSJYLO++v8lEmwdnKOB6ZoH/J
   wqcVtJRmRCBgpjig19Ww/IYfsTv2xzyVIjlfis2oRRwour8GX7kM53Lrc
   kNscvsY8q/WG4S/xIwwDzubKX54hrhgzeKQwAc27OzF0dCtvAv8OJgG7r
   d9kW/snrsR9bPzLBrqLfI5sDJFuktjNQk7+FwhK5SMYYegK1NlFaKAcxM
   Jgo6mDexGuOAmPNnsOvQ8+xYuOue5QpJZSCsFNSKytiN6DpDK0sX3h014
   qncH3FNQEG0GrR3mmMqZU9lSJLdoVadGkTDMb4JDYLuLnpz+AShFz5hPU
   A==;
X-CSE-ConnectionGUID: 8zUwThXjQ8uKZ+QgzraCPw==
X-CSE-MsgGUID: VhEULYOqTOSzrQJt0sOyEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84337418"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84337418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 22:27:50 -0700
X-CSE-ConnectionGUID: Qe312X2/RfiK3qzC4vk6bA==
X-CSE-MsgGUID: 9zhgZapaTUCvJiGzXx6aEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278496283"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jul 2026 22:27:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wimjA-00000000KiU-12bm;
	Sun, 12 Jul 2026 05:27:44 +0000
Date: Sun, 12 Jul 2026 13:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 6/6]
 drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for
 'gunyah_generic_vm_start_fail'
Message-ID: <202607121344.m6gmv9Tl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Prakruthi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   5c5f2fea42dd4cc5ae1002945d86e305c09d3262
commit: 67d7d75278b34154c001ddfb435beae6bf2cd315 [6/6] ANDROID: gunyah: vm_mgr: Use auth_mgr_ops for a generic VM setup
config: arm64-randconfig-002-20260712 (https://download.01.org/0day-ci/archive/20260712/202607121344.m6gmv9Tl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121344.m6gmv9Tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607121344.m6gmv9Tl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for 'gunyah_generic_vm_start_fail' [-Wmissing-prototypes]
    void gunyah_generic_vm_start_fail(struct gunyah_vm *ghvm)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/virt/gunyah/vm_mgr.c:286:21: error: implicit declaration of function 'module_refcount'; did you mean 'folio_ref_count'? [-Werror=implicit-function-declaration]
     WARN_ON(fn->mod && module_refcount(fn->mod));
                        ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y] && 64BIT [=y]
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
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
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
