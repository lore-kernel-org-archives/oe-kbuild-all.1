Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC91DC19F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743113993; cv=none; b=dUUF5dVrXzxzIktDns+EOy4RsIsTn7EEzB4xJROECkmJ0Zoaq7hq6O0dS7aD3o1JwxSpHDRwKw/dWIvrVVadBZ/dHWioJGLuos91yFpic3Rz++ne0T7qU+JJ0XEJ250iwxr9X141d9NVwcJTfQiDZc1QaqXCJtLesvLwF3c3MEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743113993; c=relaxed/simple;
	bh=zXk2toNqNGDyVh4P2zPrDYV1rs62/YhM8YpP5x2moO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rahUS/1B1LVR0kwY0CpIFGgRGer2vUXB2Tz+6xyZkCIk/oDmqn/bBnXSyQTj4ZZlvII8+BUy2MEMRbOJ9NClEl6dYlJkWgExlkd3fdwMrkiE6DtZ0wJpnCNBGmJYPRzMUu32oYeFW5xLvJRJ/ksogw6o47CZUOBOyHjmuAfqq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hErGy+2i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hErGy+2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743113991; x=1774649991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXk2toNqNGDyVh4P2zPrDYV1rs62/YhM8YpP5x2moO8=;
  b=hErGy+2iA9jfYvcxcNxHDube+1fwMliaJpvzybHdjELJi/hbKmIcexTD
   WwLCxR29jWLCDBOmSkC3i7KxS6dEWGOrdAYCGyTIH+UZTAKnaYKaGZtbn
   FqhtGVbq8d6kj1UMNkD20elrwh0SJQLjM/Vn/LrQsLWLvuzj0s3G9d/qo
   6xmf4Y9blZVKzcwwwUhhMR5BWFJUDMG2k2lcQK7tcy9V6G+au/WF1z3y0
   oN163h4F7FG5eBn1SOUt+mpNOvmVpThd5iexWBN8OuI35N3g1xymtOPDP
   R9F/2mhl7D6E9lX7OIsAe1YtI1UATjPel1RiBHj+mKcRJRYBWEXIEUs3u
   w==;
X-CSE-ConnectionGUID: YuYcmhp8Svu1zwVApFH9eA==
X-CSE-MsgGUID: 9/q8MqOCSMCPF2KM/ojQTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43622700"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43622700"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 15:19:50 -0700
X-CSE-ConnectionGUID: cn6Gh7XzTumIKuZZ9vZOsA==
X-CSE-MsgGUID: h+kRVq7MSSuecoYuYEtt2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130475370"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2025 15:19:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txvZi-0006zH-2m;
	Thu, 27 Mar 2025 22:19:46 +0000
Date: Fri, 28 Mar 2025 06:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 drivers/virt/gunyah/vm_mgr.c:117:6: warning: no previous prototype for
 'gunyah_generic_vm_start_fail'
Message-ID: <202503280547.BUc2Fx2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b3a827e33d4118bd77fc2013f97b195130fb1a3c
commit: 67d7d75278b34154c001ddfb435beae6bf2cd315 [4/4] ANDROID: gunyah: vm_mgr: Use auth_mgr_ops for a generic VM setup
config: arm64-randconfig-004-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280547.BUc2Fx2q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280547.BUc2Fx2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280547.BUc2Fx2q-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


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
