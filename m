Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69CB200136
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741984103; cv=none; b=OPP7tviRXcxgdHsVow8fFY+Gblqzty+uDJtoHXkEglNV2rCp9qIGk9Bv51Ukzz04mqYHzI/TNd/F36cU+zevlqEPtSXJZDzzNCISbABAtQ0M4PthaWfIQCccTX4IZP2kOLfrCSAyBn/2hdC1kJ5qhkBOQBUt3EEBgRtf/ObhdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741984103; c=relaxed/simple;
	bh=9wqttRK+UVqGsiVMbmtxWsvGAfsId6R0MAJ9uE/WaZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JEug6VJAJ5uoVQ4g8lQADszfAgFhZA1G4LUrZq5aqw3lH5EFXr5K74ycNhDIH8icrBxGLKuDleWnZCDqOQVLlQJMr1MBjhO0SdWNBcxXjNghgiaiWTCUm4RJXnxa+K0eicUw0FKeRihKTn5TlA7bhhM9nMrXYczu00D6zPqFNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LThSl4qY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LThSl4qY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741984102; x=1773520102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9wqttRK+UVqGsiVMbmtxWsvGAfsId6R0MAJ9uE/WaZI=;
  b=LThSl4qYPjlzW5JIgASUPexsOCmFLodtzq5MJs5ZWGQbTcphwtkdPnGp
   vB2Zxh44RnOLW/Y8cOQ6EC4GhEJ69lvBvaSPfgJua0d67DGZxQqn5Yb1H
   5BTU+L5r20anvrOR/QIKzH/LuuluCZdFHXY+T7DV8yEFzRs0fsFjlNct3
   rJjVyK9X3ZUzeWCFE/lvFQeeCg+SriFSQT/O86+JWH/UlBTZZoZ/CmHX3
   bEUmpK1ZKMUZx9qUMfM91mzkTn4kwAG2Ivqx8xsaFR4oO1IQq0eQQB1dI
   gU7hgx+8PG2ReQ0SBi6LpH1Of0GpMXt931t0z/IWC5ca3FaRgGYlt0GFl
   A==;
X-CSE-ConnectionGUID: HOjxA0KDQded8CRUwtMpLw==
X-CSE-MsgGUID: 18uyiKsjSQS588kjXoh7IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43056405"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43056405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 13:28:22 -0700
X-CSE-ConnectionGUID: v6Re0nNrSGuIGdsmPN2qeQ==
X-CSE-MsgGUID: 4ADcEUHlT62R1Ffbnnzl1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121333370"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Mar 2025 13:28:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttBdi-000Aoi-0N;
	Fri, 14 Mar 2025 20:28:18 +0000
Date: Sat, 15 Mar 2025 04:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb:
 /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with
 compatible: ['mediatek,mt6397-regulator']
Message-ID: <202503150445.L6cyGRVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5c68dbf977c4aebedda2aeb928d2e519b38c10ba
commit: ac8ab6287a3b8769241d32a2ef0859c2a54aacbf [1/1] arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-052-20250310 (https://download.01.org/0day-ci/archive/20250315/202503150445.L6cyGRVQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150445.L6cyGRVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150445.L6cyGRVQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000: 'disp_pwm0_pins', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt8173-pwrap']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/mt6397: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8173-thermal']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
