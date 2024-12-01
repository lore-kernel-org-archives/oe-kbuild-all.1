Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF933086
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733072857; cv=none; b=VX4jQ+1hBj/TBSAZUmWi+UVa2qwfNotlO+XuOIBqxNbeycPae/3du5eOPpOgzTx0f68VUcYmu/DvIUNp3EemLNtIQsp0BB6Y19PBk60S1X9h2QeDutKWVf03/7JqAgBUE4v1BB4Q9Q5pVKbT1jkwpfILwHa2XW8zevntplWYH8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733072857; c=relaxed/simple;
	bh=BemSYjRqS+PVZbtigHAhyQ6TuCZg/C3KQbe8jlS7S8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJVjCp+RsDUNnwrHTMDa3fEOWK6zFrw+zsJD/pm2LRFo8bKRd5qb0b5Fr8br0wzRywvktGYjGtfhieMuF48y4LsrPJsj/bYFxrq0fxijrC05Ht9CwDAT1UopSaRRH7SJgN7BLM8P6ugZ1YeBSr1HuLnI1Gl3RWEW6lVxUjiSZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuUaG0Cx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuUaG0Cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733072856; x=1764608856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BemSYjRqS+PVZbtigHAhyQ6TuCZg/C3KQbe8jlS7S8I=;
  b=fuUaG0CxbEVBqu8dKKAN7HU2JA77zP2LwAbrNW3Sx50v3w6AaiPhl8KR
   AU/FCF8J4tCGF+yul7oqt7x8xxnZP5746cI5B+tgwl5+6VLkNriGCXgnr
   8ICU5ltxfUCmz+z4PadpNDTeHHzRfp4B0U4iF3w5s1EsNbhdbRHcnHUBu
   Hh3gzIUX2o5Aw++YsB4QLyw/8wm0jxHMc3rZG1UXPMtlscLid34aqqL/d
   O777L8IHpVqRGKhJD9tVVW5voqtiaXE7eEshUcCkWJ9K9im90MaxLmJHc
   7IHD/dcs7puto8ey/hcKNMWaS3XeZKY1WqIoQrihd0saATGxNYkNrodQ9
   w==;
X-CSE-ConnectionGUID: SkzcKpntTSO/aQwnbJv/yg==
X-CSE-MsgGUID: kh5b2WMgToGdKqPUEePv/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33294419"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33294419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 09:07:35 -0800
X-CSE-ConnectionGUID: N3A9h+KnSA636bNUCaq1WQ==
X-CSE-MsgGUID: u7BqrT18SquXFD8XhUulTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93731058"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2024 09:07:33 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHnPv-0001hl-0A;
	Sun, 01 Dec 2024 17:07:31 +0000
Date: Mon, 2 Dec 2024 01:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1366/1491]
 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: touchscreen@5d:
 compatible: ['goodix,gt7986u', 'goodix,gt7375p'] is too long
Message-ID: <202412020024.FVGk7IWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: af086c85dc87fc014cd85c35e0698dae5e58e7ec [1366/1491] FROMGIT: dt-bindings: input: Goodix SPI HID Touchscreen
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241202/202412020024.FVGk7IWp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020024.FVGk7IWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020024.FVGk7IWp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:3914.26-3985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:3612.10-3622.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: touchscreen@5d: compatible: ['goodix,gt7986u', 'goodix,gt7375p'] is too long
   	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: touchscreen@5d: 'mainboard-vddio-supply', 'vdd-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: touchscreen@5d: 'goodix,hid-report-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: /soc@0/geniqup@ac0000/i2c@a98000/tpm@50: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: phy@1c0e000: clocks: [[44, 50], [44, 52], [44, 179], [44, 40]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'refgen'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: phy@1c0e000: '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: phy@1c0e000: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:3914.26-3985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:3612.10-3622.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: touchscreen@5d: compatible: ['goodix,gt7986u', 'goodix,gt7375p'] is too long
   	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: touchscreen@5d: 'mainboard-vddio-supply', 'vdd-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: touchscreen@5d: 'goodix,hid-report-addr' is a required property
   	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: /soc@0/geniqup@ac0000/i2c@a98000/tpm@50: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: phy@1c0e000: clocks: [[44, 50], [44, 52], [44, 179], [44, 40]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'refgen'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: phy@1c0e000: '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: phy@1c0e000: 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
