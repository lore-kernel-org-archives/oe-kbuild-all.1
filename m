Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F96FB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604553; cv=none; b=iKBinQzTRZwGuYvDBuRY+vQhaBgy8xYHnTib0vea4AbhlVLnH9/8F2O3W7irwEJf2nJw1hleicjVoNiSPYOnSY7xn6SsyJQkMdiZSYpFFj0CLp1s0tVUcqn1qDhZBiprhAAGHCLQBRNPl0nUaKc/x6UUafXp/nM0CX2KQLbz5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604553; c=relaxed/simple;
	bh=wGqEokqBvuqyejZXWHh+ZEF9Mwb2A/RJmLvQeyM1rTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWUG/yA/N0xKWnVatnQeuUJflj6PjEVDGKHDrLvYKl4mOk/nFQ84Siv3Pbs51ZKVF+HQRf+7ocOnCXEST+RVU2rrRvmI3f8BFezeEyevfVbPjEl6zoZ7hIcbxgPrTFZmZQGP1lTvKmTBP4GTK6WOOwJyQpXYPQZ1rwAsIUbMsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCrUrcy4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCrUrcy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748604552; x=1780140552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGqEokqBvuqyejZXWHh+ZEF9Mwb2A/RJmLvQeyM1rTo=;
  b=KCrUrcy4PJCTlaNeRRj4Ce55Nn/gR1RoM69++een8RP1B1gIKahQlJ5R
   5ZlxgTOuS9qtlEMZAzTM38cbDyFitPzpJzx2mOkFk3v8NdCk/+Swc1OPX
   utmQ7rntIqq7Mf+CWbazuTrzkAIsDa47Gh9IpreHdCkylOw1DmFzxQo/X
   zRJbWNKD14HqWtwEox7G/l867RzJGi7EAMu59vghI1Yrl0vzJN2/Xn3iZ
   a2ba9gpf0ijV85pa38WO+jtKlhPTR5ZWenxMBAGAm9qE7jLxDoYHUfEag
   ujU6mYJOqKvjulS56YP/95yfMxpyvvqv58OYrGO8CbDyaQMPkYMJYj2Bw
   g==;
X-CSE-ConnectionGUID: u4508+C2QIG0+LxSsM7ZSA==
X-CSE-MsgGUID: 76nUPtuHRD6Y/qUUYTykcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="73228504"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="73228504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 04:29:11 -0700
X-CSE-ConnectionGUID: 23ZGD7QCRHqwtJbIuMdBlw==
X-CSE-MsgGUID: nhT+MS7fS8W981bTPASKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148883180"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 May 2025 04:29:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKxv9-000Xb2-2e;
	Fri, 30 May 2025 11:29:07 +0000
Date: Fri, 30 May 2025 19:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 138/138] mtk_dvo.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202505301902.6Z1hbS1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c76c68baa3b1801d81033deae4c36dd8dfe350f5
commit: 7614ce4cc66748a10c0ab90d9cdcb96e158c0f05 [138/138] CHROMIUM: drm/mediatek: eDP: Add dvo golden setting
config: arm-randconfig-r121-20250529 (https://download.01.org/0day-ci/archive/20250530/202505301902.6Z1hbS1H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505301902.6Z1hbS1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301902.6Z1hbS1H-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.o: in function `apusys_apummu_resume':
   apummu_drv.c:(.text+0x360): undefined reference to `slbc_request'
   arm-linux-gnueabi-ld: drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_drv.o: in function `apusys_apummu_suspend':
   apummu_drv.c:(.text+0x3ee): undefined reference to `slbc_release'
   arm-linux-gnueabi-ld: drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_import.o: in function `apummu_alloc_slb':
   apummu_import.c:(.text+0x54): undefined reference to `slbc_request'
   arm-linux-gnueabi-ld: drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_import.o: in function `apummu_free_slb':
   apummu_import.c:(.text+0xf8): undefined reference to `slbc_release'
   arm-linux-gnueabi-ld: drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_import.o: in function `apummu_check_slb_status':
   apummu_import.c:(.text+0x18a): undefined reference to `slbc_status'
   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/mtk_dvo.o: in function `mtk_dvo_sodi_setting':
>> mtk_dvo.c:(.text+0x860): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: mtk_dvo.c:(.text+0x892): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: mtk_dvo.c:(.text+0x8d6): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: mtk_dvo.c:(.text+0x90e): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: mtk_dvo.c:(.text+0x934): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/gpu/drm/mediatek/mtk_dvo.o:mtk_dvo.c:(.text+0x958): more undefined references to `__aeabi_uldivmod' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MTK_SCP
   Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=n] || COMPILE_TEST [=y])
   Selected by [y]:
   - MTK_APUSYS_SUPPORT [=y] && (ARCH_MEDIATEK [=n] || COMPILE_TEST [=y]) && (ARM [=y] || ARM64)

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_dvo.c:275:6: sparse: sparse: symbol 'mtk_dvo_mutex_vsync_set' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
