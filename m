Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A558C0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730403827; cv=none; b=TqI/CQbCeLVpjHJElE15lK2luDMDaNgv8vTOoAocVr3rtQJhs2JwgPB+gNrkdT0zs5j4NPbvAW5aNsJ7SQLr6CQYDWe7Gvhu11+J8rDPF9DFwjAM08fqhLNKY9+TGdTmAKLeAHzDVU4yiIH5u4Rf6OPLnHxjwHJx4ypxD6mqMhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730403827; c=relaxed/simple;
	bh=+3mSoMzfVi2y98KSxgzsLoRhr6VsDypVB2YlPCWxgls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kX2cE1kgNugnHDcfebT6AHhQ7ESmc94d7poQLJOHc5HEhZ9pFZS6XB2sc60wj8bN3PKFtcw8qQoqaT/auOxasMivftJs4dbB+ikcUvJySpALpUL3Bm38As2dfMg3t31KqcdhI0Rk/2bsziQRXCCFD+U53ojm+CvWelgi9BRVFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JevaYG6I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JevaYG6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730403825; x=1761939825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+3mSoMzfVi2y98KSxgzsLoRhr6VsDypVB2YlPCWxgls=;
  b=JevaYG6IEp2gQcqOQfoiD3ZnqR8n7Gd9quXp+2tXgWLPSm9kVC+RD7YB
   pnYzEkfW3m5Y0OMdNxTgkAB/eYpx4/XBkPNQS6jzrD51ADPINShGYxN7g
   w76IH+5726vHgXZnR/qhO65l/iEFC0STI2O2iU9ucW9Fw/sB4eM5pEPRZ
   EjXMpZuSz2SnwBDAa6DOBE0V5q6gwmh50AqNsqnVNypQblpEE0NpIy1xl
   WmgUPbffKhQ9y4A8Mc+ubohTWOyca5WKTwqaWTOMAraC3cG/VOAaJDSK/
   SE18V2nHHulrDL5OUHUCKLutP800+2IwNmscr8LhHDe/BrRHBulErBt3w
   Q==;
X-CSE-ConnectionGUID: M/9BgQh/QXyu1Xrt7ZUOKw==
X-CSE-MsgGUID: yQefJtn6SW2Y4croj/wB5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17802594"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="17802594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:43:44 -0700
X-CSE-ConnectionGUID: o1KK1HRqShuiSPd18ikhdg==
X-CSE-MsgGUID: 3/mNY7L6S1WLXmonFBT2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82835578"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2024 12:43:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6b53-000gee-1J;
	Thu, 31 Oct 2024 19:43:41 +0000
Date: Fri, 1 Nov 2024 03:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1366/1491]
 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: touchscreen@5d:
 compatible: ['goodix,gt7986u', 'goodix,gt7375p'] is too long
Message-ID: <202411010346.UvuayFC5-lkp@intel.com>
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
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241101/202411010346.UvuayFC5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010346.UvuayFC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010346.UvuayFC5-lkp@intel.com/

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
