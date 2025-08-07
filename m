Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EB23208
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587243; cv=none; b=bBt2V6Cftu3Qf4qWCHj5WWlI/Bink6wU1JbDeGif8LbVTTUD5qyyvGyh5m3EMTDJRpYkuDrds8O/Ja9kQlfX/B9n3ITnmwRzTSzCTnzoC9YojjSc83iLx+VZJCPXwu+ONb1I5S5CYMuQYyfuGfRs7/0OV1Kh9EWUW8efha2YDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587243; c=relaxed/simple;
	bh=psXkNncZ8GbQscvWRMv/2yobRDA+ugLPtYnFKwAV4GM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAF73yM+EU1WzZsFkcNfyhqRguDUo8KQ/jpMNYMFhbDedCztMAxRWuhdBNpp0X9oNQgMHPjE0ou8lxu5X7yVUJLvQ7hbEMcxYMf6GHR4EmSDAYI3ATVR5HGTXM6qLGIgNLVehX2GkP14XYTehyy7wrnSzTzHAOSqnI8avYTuIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIGMCWB4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIGMCWB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754587242; x=1786123242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psXkNncZ8GbQscvWRMv/2yobRDA+ugLPtYnFKwAV4GM=;
  b=hIGMCWB4V+9DzEMwThksaeqZEI26uGoK9ydVUs7AN3pPHsR8d3JvAW6W
   DxM/yfBFDw1yezPL3HzFOgxfgsZ+RJpju0xRPPq1r+sKjpkMAHEQsTMeJ
   GJYmDp5VoRtewSaVkGuHguEOz857WuuAM6fd8oYk7ZIHyxl9wQIebP+ve
   z5LvSc6e2w1nTLrOfXVgVE/BrzqoaHfi87EZQb0x7J0M3tLJNVYPhTrqc
   PYsKQ0Wf2rIRe5FCutj8o3OU1hYRANG3OPBxcyj7pjggponsJoRSyi44U
   aDpRSYgL4TA9/O4EUGVHVPwxois5MjQgw3YC/X7NKeEH4NLMTCtu7rF2r
   Q==;
X-CSE-ConnectionGUID: ZKIqtdgrR8yxm2ECc0mu6w==
X-CSE-MsgGUID: iepMLHMhTCi3PkUh/hFXiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56649185"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56649185"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:20:41 -0700
X-CSE-ConnectionGUID: +lr00vT6QA+mIKqQ/trJbA==
X-CSE-MsgGUID: ghMrgPO/Tj6ecqn5WqKT8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="196118143"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2025 10:20:40 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4IA-0002V5-14;
	Thu, 07 Aug 2025 17:20:38 +0000
Date: Thu, 7 Aug 2025 19:20:32 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000
 (rockchip,rk3399-dwc3): usb@fe900000: Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'hub@1', 'hub@2', 'phy_type' were
 unexpected)
Message-ID: <202508071913.sV4juk5c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e5a17398e40d988ce7e9c79259eb8b08b5377b43
commit: 3f4adfc5870059a5912fa9a87d83064895f05037 [1/1] arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma
config: arm64-randconfig-2051-20250806 (https://download.01.org/0day-ci/archive/20250807/202508071913.sV4juk5c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071913.sV4juk5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071913.sV4juk5c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000 (rockchip,rk3399-dwc3): usb@fe900000:hub@1:compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000 (rockchip,rk3399-dwc3): usb@fe900000:hub@2:compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000 (rockchip,rk3399-dwc3): usb@fe900000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'hub@1', 'hub@2', 'phy_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000 (snps,dwc3): hub@1:compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000 (snps,dwc3): hub@2:compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000 (snps,dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'hub@1', 'hub@2', 'phy_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1 (usb4b4,6502): compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2 (usb4b4,6500): compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: fan@18 (ti,amc6821): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
