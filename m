Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC1333720
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768634498; cv=none; b=JJxlJvuq9cMLh6iTvXpmfMq3ZqlpbqvaHSxTuv5cSUNbBRiPDVBD0UICqVfwDVDEvrdZi3IfnWKd99VtYAtXbuN7KXFznwUaypM5r3C+4f8eqeO4ge+IUleuUgTJIbrB0Il+vWEpPu7UgRBsZl/stXIGa0rGBHcGssrqhkVFJ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768634498; c=relaxed/simple;
	bh=4otF2yTNvzzLnahs5sYCDJdeucDHK7RjefmJnOTaE6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fGP52XYX3pgZE9XCIJBUhscqCTzohaMDnFMCdJE1VAXN0mj5pMx/5VZrHscpVmsXKY+9cUmyJtJCGt4vGfJ1yQFI+X5hz4JxGpCMWX13uk4XAF15W5vlyDC8uPHOSSPWT+PmF83lu6FUfQ16oQ5PQx6byLM8TVhaXgcf2Apf9zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPaeMOgv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPaeMOgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768634487; x=1800170487;
  h=date:from:to:cc:subject:message-id;
  bh=4otF2yTNvzzLnahs5sYCDJdeucDHK7RjefmJnOTaE6M=;
  b=kPaeMOgvkI59GUImgWL+wvEhbZ6Z1yGcN8tel4LBhDl+ogxBnGD8ZAMR
   5u63tpnTajXE3kk+rp9f0quRpsoyzYk9JpWJhtQlcsGtJK1huKcNp4T8l
   5RVo9wiVHUjlGUB1UVspLMLWSLXCE2G/Wt32j3B6PoY2dyPzcWi7zYS+u
   AaIJBV6kNmRyMd4NtROoxKkP+YCz8KlKhQH/79P2/dIz/S+actT/mx/c5
   HmMWJcIzdwZ5PgXbm5O9iVrPZTwUluJ1wSM0g4M8zBDiTfErWB9iy1fWE
   NX/2c26q6/j/Qqrer3KvUBIgzW/Tti8bb9amVnlZmlmYWXkKXwdY+x6Xc
   w==;
X-CSE-ConnectionGUID: HM0LbmeNSG2dw8LcrCTqyQ==
X-CSE-MsgGUID: eU+HiLxJS2i+t64YF2/QIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57491774"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="57491774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 23:21:22 -0800
X-CSE-ConnectionGUID: 6Qwjx+//QKKYF6hi3Y0paA==
X-CSE-MsgGUID: M7sYY0Q4QP6LFp9eJQV7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205326583"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jan 2026 23:21:21 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh0cY-000000001wX-3fad;
	Sat, 17 Jan 2026 07:21:18 +0000
Date: Sat, 17 Jan 2026 08:21:18 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 4883/6849]
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: audio-codec@1a
 (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202601170847.3I2UoMQW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 35bffbe49dfd3395c65d76f14d773a1225f3489f [4883/6849] ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
config: arm64-randconfig-2055-20260115 (https://download.01.org/0day-ci/archive/20260117/202601170847.3I2UoMQW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170847.3I2UoMQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170847.3I2UoMQW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7: Warning (unit_address_vs_reg): /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:906.7-913.4: Warning (graph_child_address): /usb@fe800000/usb@fe800000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: audio-codec@1a (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5651.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: typec-portc@22 (fcs,fusb302): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: rt5651@1a (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5651.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
