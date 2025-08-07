Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD34227BA4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 20:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754599781; cv=none; b=ZJliV4R8jASc1Zg+FzEq1nrtBFmvFJDPT6TyeDnl0Svb63q5L+UjMQzP6n8J9/qaBmD1jHcJMYQMEbtVzMpAF0urlFsyyuzlVagHlpxhXdzF1Hqiq2Xa1hukYwvDu5Hv+/aIS8PUypUnFJHFukazJ95pfy/jA0cEjUZZ49+zkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754599781; c=relaxed/simple;
	bh=MlNFlkFMAxsFkVeETtQ5wuXvwsPMRC77fT0Sd4EL72I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crMwovFPYyfW+36xY83+AeVd4fIoYKr32MCzRttm/50sr2BIHpYp2rx4BKXLPoOtddfAp6gq1VgG0iCKSUWTD0wSMxTqv6Us8ALrqi6wDGxsbv8ZBG4NH6tZFwNENiBNupp5USYO/i8LGmveI3koZ+lAqC6uNlwjMe4sW4wWrns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdBO8b1c; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdBO8b1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754599779; x=1786135779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlNFlkFMAxsFkVeETtQ5wuXvwsPMRC77fT0Sd4EL72I=;
  b=HdBO8b1cEj4cG0IEKX0qm0Hhyqd2CY1rBkXbzzb3gIMIcBDjp9UPSrKW
   onmNfGZudAjAkCvBjtDFExH39qOTf3nyhDvOrxu2t8MPQ/L5vDOME4UQa
   nHynubRy4i5SN3Iu5dDIh/dBqNgSkC5LsMjIMKXOKXJvL4yalfpk+00+k
   05CNiD0PPiID2IItvhS0WUreyQuRVbyF3kI2j6aIiO5XKIX01ehIWkAmo
   GNV/Zk5qAzDbLC5VBQ9F3k5VMrrrFddECvsue31ivjkOMwIlo0fvSJ+x4
   D655fMuG1ud9pXg8d1CD3wGvl4fep7K4/WzEjmeNnmeZkCfBmzn6NsXeU
   Q==;
X-CSE-ConnectionGUID: Nj+P04TMTaO22sokZwGmoQ==
X-CSE-MsgGUID: nkizqQbhSbWuvAzrfgA2eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57026032"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="57026032"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 13:49:37 -0700
X-CSE-ConnectionGUID: 9z+F+qHoQ72TKEgKa+myYA==
X-CSE-MsgGUID: CowZukt2TFmWhXTF2Mf9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169617626"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 13:49:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk7YL-0003De-1f;
	Thu, 07 Aug 2025 20:49:33 +0000
Date: Fri, 8 Aug 2025 04:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: usb@fe900000
 (rockchip,rk3399-dwc3): usb@fe900000: Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'hub@1', 'hub@2', 'phy_type' were
 unexpected)
Message-ID: <202508080458.lmp31fZ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   209015b548fb36223e01bbeb84c88f375ddd2829
commit: 3f4adfc5870059a5912fa9a87d83064895f05037 [1/1] arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250808/202508080458.lmp31fZ5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080458.lmp31fZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080458.lmp31fZ5-lkp@intel.com/

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
