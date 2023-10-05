Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8F34CD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWjMXqgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696522881; x=1728058881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Hr2RvmpM3eCRpz25LZwiBI1em2u3VwMyRTf2N5AccY=;
  b=HWjMXqguyT0PQO6sTPxj2lp+5vq+hekliCKIyQsYaCj/p6xNnyNN16qk
   vyarX5wjhEmBZfS3t/JD8Sslb9odzqEVFDdPR5hiV2KH3aan3YMOlKwEN
   myqkv7lD6WUL0MxfaCVAGMpDdJ64uHhEVClgt/OqOzWA2I+ushOAU5hgO
   XxO9+eTnKFpRy0bQWr7eodRWiXf7XBx9frGr2IGgyrU0VWqQ/q8z2ijAB
   0rhoSuD4R8JqZ60ZCPd3pltszJlhEpZgVMbxoJhFoIW0AtL85Z+py4Z5j
   M/x6Z5QuHqGFZk+W0xq2emsvHqaa2BUYbpQX/WOyyrmoZrryKumsBhpzB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414514469"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="414514469"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 09:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728503124"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="728503124"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 09:21:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoR6C-000LdA-2s;
	Thu, 05 Oct 2023 16:21:16 +0000
Date: Fri, 6 Oct 2023 00:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 9206/27774] io-pgtable-arm.c:undefined
 reference to `io_pgtable_alloc_pages'
Message-ID: <202310060053.lC4heF71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   91f702572a8042124eb6975b4f52d487845b3a99
commit: 5ab49e4b85a45bc4dab45785d90f1b9058289588 [9206/27774] ANDROID: iommu/io-pgtable: Allow IOMMU drivers to allocate/free page-table memory
config: arm64-randconfig-003-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060053.lC4heF71-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060053.lC4heF71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060053.lC4heF71-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/soc/qcom/rpmh-rsc.o: in function `rpmh_rsc_probe':
   rpmh-rsc.c:(.text+0x1a60): undefined reference to `cmd_db_ready'
   rpmh-rsc.c:(.text+0x1a60): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `cmd_db_ready'
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_alloc_pages':
>> io-pgtable-arm.c:(.text+0x4dc): undefined reference to `io_pgtable_alloc_pages'
   io-pgtable-arm.c:(.text+0x4dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_alloc_pages'
>> aarch64-linux-ld: io-pgtable-arm.c:(.text+0x6a0): undefined reference to `io_pgtable_free_pages'
   io-pgtable-arm.c:(.text+0x6a0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_free_pages'
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_free_pages':
>> io-pgtable-arm.c:(.text+0xedc): undefined reference to `io_pgtable_free_pages'
   io-pgtable-arm.c:(.text+0xedc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_free_pages'
   aarch64-linux-ld: drivers/i2c/algos/i2c-algo-bit.o: in function `i2c_bit_add_numbered_bus':
   i2c-algo-bit.c:(.text+0x12f0): undefined reference to `i2c_add_numbered_adapter'
   i2c-algo-bit.c:(.text+0x12f0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_add_numbered_adapter'
   aarch64-linux-ld: drivers/i2c/algos/i2c-algo-bit.o: in function `i2c_bit_add_bus':
   i2c-algo-bit.c:(.text+0x13dc): undefined reference to `i2c_add_adapter'
   i2c-algo-bit.c:(.text+0x13dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_add_adapter'
   aarch64-linux-ld: drivers/media/tuners/tda8290.o: in function `tda8290_probe':
   tda8290.c:(.text+0xb4): undefined reference to `i2c_transfer'
   tda8290.c:(.text+0xb4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_transfer'
   aarch64-linux-ld: drivers/media/tuners/tda8290.o: in function `tda8295_probe':
   tda8290.c:(.text+0x214): undefined reference to `i2c_transfer'
   tda8290.c:(.text+0x214): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_transfer'
   aarch64-linux-ld: drivers/media/tuners/tda8290.o: in function `tda829x_find_tuner':
   tda8290.c:(.text+0x3b0): undefined reference to `i2c_transfer'
   tda8290.c:(.text+0x3b0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_transfer'
   aarch64-linux-ld: tda8290.c:(.text+0x418): undefined reference to `i2c_transfer'
   tda8290.c:(.text+0x418): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `i2c_transfer'
   aarch64-linux-ld: tda8290.c:(.text+0x524): undefined reference to `i2c_transfer'
   tda8290.c:(.text+0x524): additional relocation overflows omitted from the output
   aarch64-linux-ld: drivers/media/tuners/tda8290.o:tda8290.c:(.text+0x8ac): more undefined references to `i2c_transfer' follow
   aarch64-linux-ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x410): undefined reference to `usb_put_phy'
   aarch64-linux-ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x958): undefined reference to `usb_get_phy'
   aarch64-linux-ld: pda_power.c:(.text+0xcf0): undefined reference to `usb_put_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
