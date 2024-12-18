Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF1413E3F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 05:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499212; cv=none; b=qOXGPca6Z7Eh4ay9M8gioY1jsfgUM3RAXdjkA32lfPmIsKaaSbA1XCwmiDTQvIJ/OFgPjDgPezj4Cq+XqXId/KMi8WijXKiEX/Vm5HSEqbU3CcBcj2kHriCO2+orBQ9DEd08wFrepWkTftGBGZFxW8zejRbciAYRTlrRDzMRpc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499212; c=relaxed/simple;
	bh=eH3NyD2tRCMq77lmNlxxrHudhIPb54N6MoLNx9JoY4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtYslquHzGcn/BBQ5rf7hpo5LLo5eBmc+nNO8kqPobAKix/x40hAxfDIWsbJtAUlFcgsOpCNb7ExhCUSWZczLlPVY4/WCbTmsyez1UXueTZlHZCvIoFE/EJO6S89BaO8VlPMr0P8n/MVhRw4dG8+QEjqZQqdBoTq6NDgNYtT1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkjNwJTG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkjNwJTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734499210; x=1766035210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eH3NyD2tRCMq77lmNlxxrHudhIPb54N6MoLNx9JoY4Y=;
  b=FkjNwJTG+ncyp0BMuG8fkNAg3iw0IIHtyPLDBgbdkiHdwDfgeSONcw9J
   rKNDeB6g4ZKK5hl5hm0UC8X+Cwna7QsbJJITYNfiMcEh4LTuEp/enukJJ
   XrV/hQtlxh45XMpvuUP+e+viSz+zlvxwLFv0RhB/HPSunOJwyjSMq9cCV
   Un0svKtA7KHhqGsJOi2DWP0uHrj09jZooKz6F6lz8wwthfsnPhey/MqxD
   mG/URZZFGcHvkiycTAYmQt6FembF5oU3fRaVal14WuMBTso0uDlGQz7dP
   zxfFq9IhHZ4gcnozjHR3cemP11uwEz4HLgIJaPFr94mpcQV8CvJApCIO0
   Q==;
X-CSE-ConnectionGUID: wkArNjmBSJWZkMPHHNqDLg==
X-CSE-MsgGUID: 38p1IL3QQSeGFJnVJkQXoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="57434042"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="57434042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 21:20:10 -0800
X-CSE-ConnectionGUID: DuosUPrwQ7KQMfF+CYu9hg==
X-CSE-MsgGUID: eGqYtGLqQxiZfvIL31S4iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="97807630"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2024 21:20:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNmTe-000G8A-11;
	Wed, 18 Dec 2024 05:20:06 +0000
Date: Wed, 18 Dec 2024 13:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 6566/30000]
 io-pgtable-arm.c:undefined reference to `io_pgtable_alloc_pages'
Message-ID: <202412181332.DKPawTXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   35ab7830a09d4539593e5485c2bd741a317be77c
commit: 5ab49e4b85a45bc4dab45785d90f1b9058289588 [6566/30000] ANDROID: iommu/io-pgtable: Allow IOMMU drivers to allocate/free page-table memory
config: arm64-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181332.DKPawTXi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181332.DKPawTXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181332.DKPawTXi-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_alloc_pages':
>> io-pgtable-arm.c:(.text+0x4dc): undefined reference to `io_pgtable_alloc_pages'
>> io-pgtable-arm.c:(.text+0x4dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_alloc_pages'
>> aarch64-linux-ld: io-pgtable-arm.c:(.text+0x55c): undefined reference to `io_pgtable_free_pages'
>> io-pgtable-arm.c:(.text+0x55c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_free_pages'
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_free_pages':
>> io-pgtable-arm.c:(.text+0xcb8): undefined reference to `io_pgtable_free_pages'
   io-pgtable-arm.c:(.text+0xcb8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_free_pages'
   aarch64-linux-ld: drivers/gpu/host1x/dev.o: in function `host1x_remove':
   dev.c:(.text+0x50): undefined reference to `put_iova_domain'
   dev.c:(.text+0x50): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `put_iova_domain'
   aarch64-linux-ld: dev.c:(.text+0x54): undefined reference to `iova_cache_put'
   dev.c:(.text+0x54): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `iova_cache_put'
   aarch64-linux-ld: drivers/gpu/host1x/dev.o: in function `host1x_probe':
   dev.c:(.text+0x49c): undefined reference to `iova_cache_put'
   dev.c:(.text+0x49c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `iova_cache_put'
   aarch64-linux-ld: dev.c:(.text+0x4a8): undefined reference to `put_iova_domain'
   dev.c:(.text+0x4a8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `put_iova_domain'
   aarch64-linux-ld: drivers/gpu/host1x/cdma.o: in function `host1x_cdma_init':
   cdma.c:(.text+0x6c0): undefined reference to `alloc_iova'
   cdma.c:(.text+0x6c0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `alloc_iova'
   aarch64-linux-ld: cdma.c:(.text+0x6ec): undefined reference to `__free_iova'
   cdma.c:(.text+0x6ec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__free_iova'
   aarch64-linux-ld: drivers/gpu/host1x/cdma.o: in function `host1x_cdma_deinit':
   cdma.c:(.text+0x7dc): undefined reference to `free_iova'
   cdma.c:(.text+0x7dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `free_iova'

Kconfig warnings: (for reference only)
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
