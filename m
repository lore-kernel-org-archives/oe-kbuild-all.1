Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12A7477
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaahBbGe"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696502587; x=1728038587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gxCdqFafkSPBSnhfgqETt5yx4cHftxr2Se7AgHnXQ30=;
  b=SaahBbGejHI7QK0GDPT8P9HTCesyJhyFoSrfyifQwLDz+gDQZyHHxZZ9
   t1zNY6m/HTGYqDn72oqHq3HINlqkIUR/suyefmOdBy7pMSv4vlt7YSdCy
   PjH+VoiBVNBKQl49oA9xdvxnUtPH7Rrp4qzYGIuz8ijGxExFdyMPoaK5+
   bNTlRB72YFoflMuU7qnHgHCeCyIDOP/yyulSEiBj3iNpX23W2JlcD3PqI
   NfkSEN0KiswKZsBunArMgqWBrpQAhItTnlhH8afOaGDVFCMvMTDiSTcTj
   qMohgi+iGUrSiJ7FWIwXfUx00Hibn0RXNz3Jg0JKwZy1N9tnzd12ro+58
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380743611"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="380743611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786921898"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="786921898"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 03:42:54 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoLoi-000LJQ-2D;
	Thu, 05 Oct 2023 10:42:52 +0000
Date: Thu, 5 Oct 2023 18:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 8783/27774] rpmh-rsc.c:undefined
 reference to `cmd_db_ready'
Message-ID: <202310051826.aVCDFipm-lkp@intel.com>
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
commit: bec9314fb33012c8908bb209e8d0c694f46d665e [8783/27774] ANDROID: soc: qcom: cmd-db: Allow COMMAND_DB driver to be loaded as a module
config: arm64-randconfig-003-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051826.aVCDFipm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051826.aVCDFipm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051826.aVCDFipm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/soc/qcom/rpmh-rsc.o: in function `rpmh_rsc_probe':
>> rpmh-rsc.c:(.text+0x1a60): undefined reference to `cmd_db_ready'
   rpmh-rsc.c:(.text+0x1a60): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `cmd_db_ready'
   aarch64-linux-ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x410): undefined reference to `usb_put_phy'
   pda_power.c:(.text+0x410): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_put_phy'
   aarch64-linux-ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x958): undefined reference to `usb_get_phy'
   pda_power.c:(.text+0x958): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_get_phy'
   aarch64-linux-ld: pda_power.c:(.text+0xcf0): undefined reference to `usb_put_phy'
   pda_power.c:(.text+0xcf0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_put_phy'

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
