Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102F1A5AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739369943; cv=none; b=Srt5ztMaVf0++StZ32vgD3CGzrutZ4ahiwXUbzq2U6DNdX1vbM5dFArqK+wgt68dPxUuetDKobkyFYJBwHOGFfN89jOVpI+KiAm3D7stMdT9Ixlexq5Agw9deoOTOhlB1+4bY9E7Igu+1VXD+vaExXQcDHJY6+Jbul31659x0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739369943; c=relaxed/simple;
	bh=jx+GEUGhXo/mEKzoomMZKgJ7cFGNbcWTUASbtxgciQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAUx3yo2B6vdIeiS5ktmhTmnFr/5HkLDyK/OpV2fXfawHKSqA9JtxMr54Ab9LO3qlqfgSa4FlEfXF8l9SNJaJpRWr7tR9hOx+TY7k+iwpXPU5AWyxdb/nIlZvpGJURFx5YiattgDdhtOClSPSdq8XkB2KjbGdPD49IMGu58Isqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc/eGzDk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc/eGzDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739369941; x=1770905941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jx+GEUGhXo/mEKzoomMZKgJ7cFGNbcWTUASbtxgciQ0=;
  b=Xc/eGzDkl6qg2uFsHFUghXtjYdUCYIvDbVRrdZdARvDuvrgwlKFDj+9R
   h+f8OU59BbeEGXSsIEne7qMxuYJGmv+OgOMLbWM96gQskM+LQEHi3Ewg9
   pad461hMvDRDVI/17EeCYavW8m6DCc1Hwo4cdu6o1RUo8OHl4wUBwR676
   GyL57aBPtHMxqCXtTCn0IzthK4cr6UNcPKHtQspgYCUDxnwd5/oT9VQUY
   D8Y5milLgIa8HogytznDtPiVO3o08ID6Eo2M+LLyleg11EU2odG2NPULh
   w4I3GDwOXJ8h3BXsnqrUF1J4vVRMzt32Aa9F1+flgx0SL9xBBWs4OvW9M
   w==;
X-CSE-ConnectionGUID: qA3omzuATXeyAbvweUI+ZQ==
X-CSE-MsgGUID: to/EGFVLRUu/9BTRVPfndQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40148264"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40148264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 06:19:01 -0800
X-CSE-ConnectionGUID: VpLr2d//TZGmXG4XjrYA7A==
X-CSE-MsgGUID: FJ0L1DJqTA6sSq/HWxZvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117760824"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Feb 2025 06:19:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiDZp-0015hz-2v;
	Wed, 12 Feb 2025 14:18:57 +0000
Date: Wed, 12 Feb 2025 22:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 5/5]
 arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: wifi@0: 'vddrfa1p8-supply' does not
 match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502122220.PMAzGNER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   7b6df7ad6ccb2c1f0d82abb3ea088c9684cc7545
commit: fe79fbce6efd25414e626036c9382a8019184064 [5/5] arm64: dts: qcom: sm8450-hdk: model the PMU of the on-board wcn6855
config: arm64-randconfig-051-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122220.PMAzGNER-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502122220.PMAzGNER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122220.PMAzGNER-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3252.27-3323.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3344.27-3396.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: wcn6855-pmu: 'vddpmucx-supply', 'vddpmumx-supply', 'xo-clk-gpios' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
